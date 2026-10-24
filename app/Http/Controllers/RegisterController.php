<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;

class RegisterController extends Controller
{
    public function showRegister()
    {
        return view('auth.register');
    }

    public function register(Request $request)
    {
        $request->validate([
            'name' => 'required|string|max:255',
            'username' => 'required|string|max:255|unique:users',
            // Email & password OPSIONAL: pendaftar akan menjadi anggota.
            // Jika diisi, tetap harus valid dan belum terdaftar.
            'email' => 'nullable|email|max:255|unique:users',
            'telepon' => 'nullable|string|max:20',
            'password' => 'nullable|string|min:8|confirmed',
        ], [
            'username.unique' => 'Username sudah terdaftar, silakan gunakan yang lain.',
            'email.unique' => 'Email sudah terdaftar pada akun lain.',
            'email.email' => 'Format email tidak valid.',
            'password.confirmed' => 'Konfirmasi password tidak sama dengan password.',
            'password.min' => 'Password minimal :min karakter.',
        ]);

        User::create([
            'name' => $request->name,
            'username' => $request->username,
            'email' => $request->email,
            'telepon' => $request->telepon,
            'password' => $request->password ? Hash::make($request->password) : null,
            // Role sementara; role akhir ditentukan Admin saat validasi.
            'role' => 'anggota',
            'status' => 'pending',
        ]);

        $pesan = $request->password
            ? 'Pendaftaran berhasil dikirim. Akun Anda sedang menunggu pemeriksaan dan persetujuan Admin. Anda dapat login setelah akun disetujui.'
            : 'Pendaftaran berhasil dikirim. Akun Anda sedang menunggu pemeriksaan dan persetujuan Admin. Karena tidak mengisi password, silakan hubungi petugas perpustakaan setelah akun disetujui untuk penetapan password pertama.';

        return redirect()->route('login')->with('success', $pesan);
    }
}