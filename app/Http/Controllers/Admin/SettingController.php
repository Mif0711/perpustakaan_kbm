<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Setting;
use Illuminate\Http\Request;

class SettingController extends Controller
{
    public function index()
    {
        // Ambil semua pengaturan dan ubah formatnya menjadi [key => value]
        $settings = Setting::pluck('value', 'key')->toArray();
        return view('admin.settings.index', compact('settings'));
    }

    public function update(Request $request)
    {
        $request->validate([
            'nama_perpustakaan' => 'required|string|max:255',
            'email_perpustakaan' => 'nullable|email|max:255',
            'telepon_perpustakaan' => 'nullable|string|max:20',
            'alamat_perpustakaan' => 'nullable|string',
            'denda_per_hari' => 'required|numeric|min:0',
            'maksimal_hari_pinjam' => 'required|integer|min:1',
            'maksimal_jumlah_buku' => 'required|integer|min:1',
        ]);

        // Looping semua input kecuali token dan method, lalu simpan/update ke database
        foreach ($request->except(['_token', '_method']) as $key => $value) {
            Setting::updateOrCreate(
                ['key' => $key],
                ['value' => $value]
            );
        }

        return redirect()->route('admin.settings.index')->with('success', 'Pengaturan sistem berhasil disimpan.');
    }
}