<?php

namespace App\Http\Controllers;

use App\Models\Book;
use App\Models\Member;
use App\Models\Loan;
use App\Models\Fine;

class DashboardController extends Controller
{
    public function index()
    {
        if (auth()->user()->role === 'admin') {
            return $this->adminDashboard();
        }

        return $this->petugasDashboard();
    }

    private function adminDashboard()
    {
        $totalBuku = Book::sum('jumlah');
        $totalAnggota = Member::count();
        $bukuDipinjam = Loan::where('status', 'dipinjam')->count();
        $dendaBelumLunas = Fine::where('status', 'belum_bayar')->sum('jumlah');
        
        $aktivitasTerbaru = Loan::with('member')->where('status', '!=', 'diajukan')->latest()->take(5)->get();

        return view('admin.dashboard', compact(
            'totalBuku', 
            'totalAnggota', 
            'bukuDipinjam', 
            'dendaBelumLunas', 
            'aktivitasTerbaru'
        ));
    }

    private function petugasDashboard()
    {
        $bukuDipinjam = Loan::where('status', 'dipinjam')->count();
        $totalAnggota = Member::where('status', 'aktif')->count();
        $dendaBelumLunas = Fine::where('status', 'belum_bayar')->sum('jumlah');
        
        $aktivitasTerbaru = Loan::with('member')->where('status', '!=', 'diajukan')->latest()->take(5)->get();

        return view('petugas.dashboard', compact(
            'bukuDipinjam', 
            'totalAnggota', 
            'dendaBelumLunas', 
            'aktivitasTerbaru'
        ));
    }
}