<?php

namespace App\Http\Controllers;

use App\Models\Member;
use App\Models\Loan;
use App\Models\BookReturn;
use App\Models\Fine;

class PetugasController extends Controller
{
    public function dashboard()
    {
        $anggotaAktif = Member::where('status', 'aktif')->count();
        $transaksiHariIni = Loan::whereDate('tanggal_pinjam', today())->count();
        $pengembalianHariIni = BookReturn::whereDate('tanggal_kembali', today())->count();
        $dendaBelumLunas = Fine::where('status', 'belum_bayar')->count();

        $activities = Loan::with(['member', 'details'])
            ->where('user_id', auth()->id())
            ->latest()
            ->take(5)
            ->get();

        return view('petugas.dashboard', compact('anggotaAktif', 'transaksiHariIni', 'pengembalianHariIni', 'dendaBelumLunas', 'activities'));
    }
}