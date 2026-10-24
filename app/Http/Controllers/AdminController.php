<?php

namespace App\Http\Controllers;

use App\Models\Book;
use App\Models\Member;
use App\Models\Loan;
use App\Models\Fine;
use App\Models\User;

class AdminController extends Controller
{
    public function dashboard()
{
    $totalBuku = \App\Models\Book::sum('jumlah');
    $totalAnggota = \App\Models\Member::count();
    $bukuDipinjam = \App\Models\Loan::where('status', 'dipinjam')->count();
    $dendaBelumLunas = \App\Models\Fine::where('status', 'belum_bayar')->sum('jumlah');
    $aktivitasTerbaru = \App\Models\Loan::with('member')->latest()->take(5)->get();
    $menungguPersetujuan = User::where('status', 'pending')->count();

    return view('admin.dashboard', compact('totalBuku', 'totalAnggota', 'bukuDipinjam', 'dendaBelumLunas', 'aktivitasTerbaru', 'menungguPersetujuan'));
}

public function petugasDashboard()
{
    $bukuDipinjam = \App\Models\Loan::where('status', 'dipinjam')->count();
    $totalAnggota = \App\Models\Member::where('status', 'aktif')->count();
    $dendaBelumLunas = \App\Models\Fine::where('status', 'belum_bayar')->sum('jumlah');
    $aktivitasTerbaru = \App\Models\Loan::with('member')->latest()->take(5)->get();

    return view('petugas.dashboard', compact('bukuDipinjam', 'totalAnggota', 'dendaBelumLunas', 'aktivitasTerbaru'));
}
}