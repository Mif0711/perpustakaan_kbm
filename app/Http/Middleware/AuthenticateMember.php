<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Symfony\Component\HttpFoundation\Response;

/**
 * Pastikan hanya anggota (guard "member") yang bisa mengakses area anggota.
 * Admin/petugas yang login lewat guard "web" tetap tidak punya akses ke sini.
 */
class AuthenticateMember
{
    public function handle(Request $request, Closure $next): Response
    {
        if (! Auth::guard('member')->check()) {
            return redirect()
                ->route('anggota.login')
                ->with('error', 'Silakan masuk sebagai anggota untuk membuka halaman tersebut.');
        }

        return $next($request);
    }
}
