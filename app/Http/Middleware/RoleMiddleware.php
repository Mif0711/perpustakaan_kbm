<?php

namespace App\Http\Middleware;

use App\Models\User;
use Closure;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Symfony\Component\HttpFoundation\Response;

class RoleMiddleware
{
    public function handle(Request $request, Closure $next, ...$roles): Response
    {
        if (!auth()->check()) {
            return redirect()->route('login');
        }

        $user = auth()->user();

        // Lapisan kedua di backend: sesi hanya valid untuk akun yang sudah disetujui.
        if ($user->status !== 'approved') {
            Auth::logout();
            $request->session()->invalidate();
            $request->session()->regenerateToken();

            $message = $user->status === 'rejected'
                ? 'Pendaftaran akun Anda belum disetujui. Silakan hubungi Admin untuk informasi lebih lanjut.'
                : 'Akun Anda masih menunggu persetujuan Admin. Silakan coba kembali setelah proses validasi selesai.';

            return redirect()->route('login')->with('error', $message);
        }

        if (!in_array($user->role, $roles)) {
            abort(403, 'Akses Ditolak. Anda tidak memiliki izin.');
        }

        return $next($request);
    }
}