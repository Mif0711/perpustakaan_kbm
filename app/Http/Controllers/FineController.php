<?php

namespace App\Http\Controllers;

use App\Models\Fine;
use App\Models\FineHistory;
use Illuminate\Http\Request;

class FineController extends Controller
{
    public function index()
    {
        $fines = Fine::with(['member', 'loan'])->latest()->paginate(10);
        return view('fines.index', compact('fines'));
    }

    public function edit(Fine $fine)
    {
        return view('fines.edit', compact('fine'));
    }

    public function update(Request $request, Fine $fine)
    {
        $request->validate([
            'jumlah' => 'required|numeric|min:0',
            'keterangan' => 'nullable|string',
            'alasan_perubahan' => 'required|string|max:255',
        ]);

        $jumlahSebelum = $fine->jumlah;
        $statusSebelum = $fine->status;
        $jumlahBaru = $request->jumlah;

        // Tentukan status baru otomatis jika jumlah diubah jadi 0
        $statusBaru = $statusSebelum;
        if ($jumlahBaru == 0) {
            $statusBaru = 'lunas';
        } elseif ($statusSebelum == 'lunas' && $jumlahBaru > 0) {
            $statusBaru = 'belum_bayar';
        }

        // Update data denda
        $fine->update([
            'jumlah' => $jumlahBaru,
            'keterangan' => $request->keterangan,
            'status' => $statusBaru,
            'tanggal_bayar' => $statusBaru == 'lunas' ? now() : null,
        ]);

        // Catat ke history
        FineHistory::create([
            'fine_id' => $fine->id,
            'user_id' => auth()->id(),
            'jumlah_sebelum' => $jumlahSebelum,
            'jumlah_sesudah' => $jumlahBaru,
            'status_sebelum' => $statusSebelum,
            'status_sesudah' => $statusBaru,
            'catatan' => $request->alasan_perubahan,
        ]);

        return redirect()->route('fines.index')->with('success', 'Denda berhasil diperbarui.');
    }

    public function pay(Fine $fine)
    {
        if ($fine->status == 'belum_bayar') {
            $jumlahSebelum = $fine->jumlah;
            $statusSebelum = $fine->status;

            $fine->update([
                'status' => 'lunas',
                'tanggal_bayar' => now(),
            ]);

            // Catat ke history
            FineHistory::create([
                'fine_id' => $fine->id,
                'user_id' => auth()->id(),
                'jumlah_sebelum' => $jumlahSebelum,
                'jumlah_sesudah' => $jumlahSebelum,
                'status_sebelum' => $statusSebelum,
                'status_sesudah' => 'lunas',
                'catatan' => 'Pembayaran denda dilunasi oleh petugas.',
            ]);

            return redirect()->route('fines.index')->with('success', 'Denda berhasil dilunasi.');
        }
        
        return redirect()->route('fines.index')->with('error', 'Denda ini sudah lunas sebelumnya.');
    }

    public function history(Fine $fine)
    {
        $fine->load(['histories.user', 'member', 'loan']);
        return view('fines.history', compact('fine'));
    }
}