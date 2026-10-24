<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\User;
use App\Models\Member;
use App\Models\AccountValidationLog;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Str;

class UserController extends Controller
{
    public function index()
    {
        $users = User::with('approver')->latest()->paginate(10);
        return view('admin.users.index', compact('users'));
    }

    public function pending()
    {
        $query = User::query()->latest();

        $status = request('status', 'pending');
        if (!in_array($status, ['pending', 'approved', 'rejected', 'all'])) {
            $status = 'pending';
        }
        if ($status !== 'all') {
            $query->where('status', $status);
        }

        if ($search = request('q')) {
            $query->where(function ($q) use ($search) {
                $q->where('name', 'like', "%{$search}%")
                  ->orWhere('username', 'like', "%{$search}%")
                  ->orWhere('email', 'like', "%{$search}%");
            });
        }

        $pendingUsers = $query->paginate(10)->withQueryString();
        $pendingCount = User::where('status', 'pending')->count();

        return view('admin.users.pending', compact('pendingUsers', 'pendingCount', 'status'));
    }

    public function create()
    {
        return view('admin.users.create');
    }

    public function store(Request $request)
    {
        // Admin & Petugas: email + password WAJIB.
        // Anggota: keduanya OPSIONAL.
        $isPegawai = in_array($request->input('role'), ['admin', 'petugas'], true);

        $request->validate([
            'name' => 'required|string|max:255',
            'username' => 'required|string|max:255|unique:users',
            'email' => ($isPegawai ? 'required' : 'nullable') . '|email|max:255|unique:users',
            'telepon' => 'nullable|string|max:20',
            'password' => ($isPegawai ? 'required' : 'nullable') . '|string|min:6|confirmed',
            'role' => 'required|in:admin,petugas,anggota',
            'foto' => 'nullable|image|mimes:jpeg,png,jpg|max:2048',
        ], [
            'email.required' => 'Email wajib diisi untuk role Admin/Petugas.',
            'password.required' => 'Password wajib diisi untuk role Admin/Petugas.',
        ]);

        $fotoPath = null;
        if ($request->hasFile('foto')) {
            $fotoPath = $request->file('foto')->store('users', 'public');
        }

        $userData = [
            'name' => $request->name,
            'username' => $request->username,
            'email' => $request->email,
            'telepon' => $request->telepon,
            'password' => $request->password ? Hash::make($request->password) : null,
            'role' => $request->role,
            'foto' => $fotoPath,
            'status' => 'approved',
            'approved_by' => auth()->id(),
            'approved_at' => now(),
        ];

        if ($request->role === 'anggota') {
            $member = $this->createMemberFromUser($request->name, $request->email);
            $userData['member_id'] = $member->id;
        }

        User::create($userData);

        return redirect()->route('admin.users.index')->with('success', 'User baru berhasil ditambahkan.');
    }

    public function edit(User $user)
    {
        return view('admin.users.edit', compact('user'));
    }

    public function update(Request $request, User $user)
    {
        // Admin & Petugas: email WAJIB. Anggota: email OPSIONAL.
        $isPegawai = in_array($request->input('role'), ['admin', 'petugas'], true);

        $request->validate([
            'name' => 'required|string|max:255',
            'username' => 'required|string|max:255|unique:users,username,' . $user->id,
            'email' => ($isPegawai ? 'required' : 'nullable') . '|email|max:255|unique:users,email,' . $user->id,
            'telepon' => 'nullable|string|max:20',
            'password' => 'nullable|string|min:6|confirmed',
            'role' => 'required|in:admin,petugas,anggota',
            'foto' => 'nullable|image|mimes:jpeg,png,jpg|max:2048',
        ], [
            'email.required' => 'Email wajib diisi untuk role Admin/Petugas.',
        ]);

        $fotoPath = $user->foto;
        if ($request->hasFile('foto')) {
            if ($user->foto) Storage::disk('public')->delete($user->foto);
            $fotoPath = $request->file('foto')->store('users', 'public');
        }

        $newRole = $request->input('role');

        // Role naik ke Admin/Petugas: akun nilainya wajib memiliki password
        if ($isPegawai && !$user->password && !$request->password) {
            return redirect()->route('admin.users.edit', $user)
                ->with('error', "Password wajib diisi untuk memberi role {$newRole} (akun ini belum memiliki password).")
                ->withInput();
        }

        $oldRole = $user->role;

        // Cegah sistem kehilangan seluruh akses administratif:
        // tidak boleh menurunkan (demote) admin aktif terakhir.
        if ($oldRole === 'admin' && $newRole !== 'admin' && $user->status === 'approved') {
            $otherActiveAdmins = User::where('role', 'admin')
                ->where('status', 'approved')
                ->where('id', '!=', $user->id)
                ->count();
            if ($otherActiveAdmins < 1) {
                return redirect()->route('admin.users.index')
                    ->with('error', 'Role akun ini tidak bisa diubah. Ini adalah Admin aktif terakhir; setujui atau fungsikan Admin lain terlebih dahulu.');
            }
        }

        $updateData = [
            'name' => $request->name,
            'username' => $request->username,
            'email' => $request->email,
            'telepon' => $request->telepon,
            'role' => $newRole,
            'foto' => $fotoPath,
            'password' => $request->password ? Hash::make($request->password) : $user->password,
        ];

        if ($oldRole !== 'anggota' && $newRole === 'anggota') {
            if (!$user->member_id) {
                $member = $this->createMemberFromUser($request->name, $request->email);
                $updateData['member_id'] = $member->id;
            }
        } elseif ($oldRole === 'anggota' && $newRole !== 'anggota') {
            $updateData['member_id'] = null;
        }

        $user->update($updateData);

        if ($oldRole !== $newRole) {
            $this->logValidation($user, 'role_changed', $oldRole, $newRole);
        }

        return redirect()->route('admin.users.index')->with('success', 'Data user berhasil diperbarui.');
    }

    public function approve(Request $request, User $user)
    {
        $request->validate([
            'role' => 'required|in:admin,petugas,anggota',
        ]);

        // Persetujuan hanya berlaku untuk akun yang masih pending.
        if ($user->status !== 'pending') {
            return redirect()->route('admin.users.pending')
                ->with('error', "Akun {$user->name} sudah diproses sebelumnya (status: {$user->status}).");
        }

        $newRole = $request->role;

        // Admin/Petugas wajib memiliki email & password.
        // Pendaftar yang tidak mengisinya harus diarahkan ke menu Edit User dulu.
        if (in_array($newRole, ['admin', 'petugas'], true) && (!$user->email || !$user->password)) {
            return redirect()->route('admin.users.pending')
                ->with('error', "Akun {$user->name} tidak dapat disetujui sebagai {$newRole}: Admin/Petugas wajib memiliki email & password. Lengkapi terlebih dahulu lewat menu Edit User.");
        }

        DB::transaction(function () use ($user, $newRole) {
            $updateData = [
                'status' => 'approved',
                'role' => $newRole,
                'approved_by' => auth()->id(),
                'approved_at' => now(),
                'rejected_at' => null,
                'rejected_reason' => null,
            ];

            if ($newRole === 'anggota' && !$user->member_id) {
                $member = $this->createMemberFromUser($user->name, $user->email, $user->telepon);
                $updateData['member_id'] = $member->id;
            }

            $user->update($updateData);

            $this->logValidation($user, 'approved', $user->getOriginal('role'), $newRole);
        });

        $roleText = ['admin' => 'Admin', 'petugas' => 'Petugas', 'anggota' => 'Anggota'][$newRole];
        $extraMsg = $newRole === 'anggota'
            ? ' Data anggota otomatis dibuat, silakan lengkapi data di menu Data Anggota.'
            : '';

        return redirect()->route('admin.users.pending')
            ->with('success', "Akun {$user->name} berhasil disetujui. Role yang diberikan: {$roleText}.{$extraMsg}");
    }

    public function reject(Request $request, User $user)
    {
        $request->validate([
            'rejected_reason' => 'required|string|max:255',
        ]);

        // Penolakan hanya berlaku untuk akun yang masih pending.
        if ($user->status !== 'pending') {
            return redirect()->route('admin.users.pending')
                ->with('error', "Akun {$user->name} sudah diproses sebelumnya (status: {$user->status}).");
        }

        DB::transaction(function () use ($user, $request) {
            $user->update([
                'status' => 'rejected',
                'rejected_reason' => $request->rejected_reason,
                'rejected_at' => now(),
            ]);

            $this->logValidation($user, 'rejected', $user->getOriginal('role'), null, $request->rejected_reason);
        });

        return redirect()->route('admin.users.pending')
            ->with('success', "Pendaftaran akun {$user->name} telah ditolak.");
    }

    public function destroy(User $user)
    {
        if ($user->id === auth()->id()) {
            return redirect()->route('admin.users.index')->with('error', 'Anda tidak bisa menghapus akun sendiri.');
        }

        if ($user->role === 'admin' && $user->status === 'approved') {
            $activeAdmins = User::where('role', 'admin')->where('status', 'approved')->count();
            if ($activeAdmins <= 1) {
                return redirect()->route('admin.users.index')->with('error', 'Tidak bisa menghapus admin terakhir yang aktif.');
            }
        }

        if ($user->foto) Storage::disk('public')->delete($user->foto);
        $user->delete();
        return redirect()->route('admin.users.index')->with('success', 'User berhasil dihapus.');
    }

    /**
     * Helper: Catat aktivitas validasi/penentuan role ke audit log.
     */
    private function logValidation(User $user, string $action, ?string $oldRole = null, ?string $newRole = null, ?string $reason = null): void
    {
        AccountValidationLog::create([
            'user_id' => $user->id,
            'acted_by' => auth()->id(),
            'action' => $action,
            'old_role' => $oldRole,
            'new_role' => $newRole ?? $oldRole,
            'reason' => $reason,
        ]);
    }

    /**
     * Helper: Auto-create member record from user data
     */
    private function createMemberFromUser($name, $email, $telepon = null)
    {
        return Member::create([
            'kode_member' => 'MBR-' . strtoupper(Str::random(6)),
            'nama' => $name,
            'jenis_kelamin' => 'L', // Default, bisa diubah nanti
            'alamat' => 'Belum dilengkapi',
            'telepon' => $telepon,
            'email' => $email,
            'tanggal_daftar' => now(),
            'status' => 'aktif',
        ]);
    }
}