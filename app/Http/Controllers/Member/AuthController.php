<?php

namespace App\Http\Controllers\Member;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class AuthController extends Controller
{
    public function showLogin()
    {
        if (Auth::guard('member')->check()) {
            return redirect()->route('anggota.katalog.index');
        }

        return view('anggota.auth.login');
    }

    public function login(Request $request)
    {
        $credentials = $request->validate([
            'login' => 'required|string',
            'password' => 'required|string',
        ], [
            'login.required' => 'Kode anggota atau email wajib diisi.',
            'password.required' => 'Password wajib diisi.',
        ]);

        // Bisa masuk memakai kode member (MEM-xxxx) atau email.
        $field = filter_var($credentials['login'], FILTER_VALIDATE_EMAIL) ? 'email' : 'kode_member';

        $attempt = [
            $field => $credentials['login'],
            'password' => $credentials['password'],
        ];

        if (Auth::guard('member')->attempt($attempt, $request->boolean('remember'))) {
            $member = Auth::guard('member')->user();

            if ($member->status !== 'aktif') {
                Auth::guard('member')->logout();

                return back()
                    ->withErrors(['login' => 'Akun anggota sedang tidak aktif. Silakan hubungi petugas perpustakaan.'])
                    ->onlyInput('login');
            }

            $request->session()->regenerate();

            return redirect()->intended(route('anggota.katalog.index'));
        }

        return back()
            ->withErrors(['login' => 'Kode anggota/email atau password tidak cocok.'])
            ->onlyInput('login');
    }

    public function logout(Request $request)
    {
        Auth::guard('member')->logout();

        $request->session()->invalidate();
        $request->session()->regenerateToken();

        return redirect()->route('anggota.login')->with('success', 'Kamu berhasil keluar.');
    }
}
