@extends('layouts.app')

@section('title', 'Keranjang Saya')
@section('header_title', 'Keranjang Buku')

@section('content')
    <div class="mb-6">
        <h2 class="text-lg font-medium text-gray-800 mb-1">Keranjang Saya</h2>
        <p class="text-sm text-gray-500">Daftar buku yang ingin Anda pinjam</p>
    </div>

    @if(session('success'))
        <div class="bg-green-50 border border-green-100 text-green-600 text-xs p-3 rounded-md mb-4">{{ session('success') }}</div>
    @endif
    @if(session('error'))
        <div class="bg-red-50 border border-red-100 text-red-500 text-xs p-3 rounded-md mb-4">{{ session('error') }}</div>
    @endif

    @if($cart->items->count() > 0)
        <!-- Info Status -->
        <div class="bg-blue-50 border border-blue-100 rounded-md p-4 mb-4">
            <div class="text-xs text-blue-700">
                <p class="font-medium mb-1">Status Peminjaman Anda:</p>
                <ul class="list-disc list-inside space-y-0.5">
                    <li>Total di keranjang: <strong>{{ $totalItems }} buku</strong></li>
                    <li>Buku sedang dipinjam: <strong>{{ $activeLoans }} buku</strong></li>
                    <li>Batas maksimal peminjaman: <strong>{{ $maxBooks }} buku</strong></li>
                </ul>
            </div>
        </div>

        <!-- List Cart (TIDAK ADA FORM DI SINI) -->
        <div class="bg-white border border-gray-100 rounded-lg overflow-hidden mb-4">
            <table class="w-full text-sm text-left">
                <thead class="bg-gray-50 text-gray-400 uppercase text-xs border-b border-gray-100">
                    <tr>
                        <th class="py-3 px-5 font-medium">Buku</th>
                        <th class="py-3 px-5 font-medium text-center w-32">Stok</th>
                        <th class="py-3 px-5 font-medium text-center w-32">Jumlah</th>
                        <th class="py-3 px-5 font-medium text-right w-32">Aksi</th>
                    </tr>
                </thead>
                <tbody class="divide-y divide-gray-50">
                    @foreach($cart->items as $item)
                    <tr class="hover:bg-gray-50 transition-colors">
                        <td class="py-4 px-5">
                            <div class="flex items-center space-x-3">
                                <div>
                                    <a href="{{ route('anggota.books.show', $item->book) }}" class="text-gray-800 font-medium hover:text-gray-900">{{ $item->book->judul }}</a>
                                    <p class="text-xs text-gray-400 mt-0.5">{{ $item->book->kode_buku }}</p>
                                </div>
                            </div>
                        </td>
                        <td class="py-4 px-5 text-center">{{ $item->book->tersedia }}</td>
                        <td class="py-4 px-5 text-center">{{ $item->jumlah }}</td>
                        <td class="py-4 px-5 text-right">
                            <form action="{{ route('anggota.cart.remove', $item) }}" method="POST" onsubmit="return confirm('Hapus buku ini?')">
                                @csrf
                                @method('DELETE')
                                <button type="submit" class="text-red-400 hover:text-red-600 text-xs">Hapus</button>
                            </form>
                        </td>
                    </tr>
                    @endforeach
                </tbody>
            </table>
        </div>

        <!-- FORM CHECKOUT (POST - Terpisah) -->
        <div class="bg-white border border-gray-100 rounded-lg p-4 mb-4">
            <form action="{{ route('anggota.checkout') }}" method="POST">
                @csrf
                <label class="block text-xs font-medium text-gray-500 mb-1">Catatan untuk Petugas (Opsional)</label>
                <textarea name="catatan" rows="2" class="w-full px-3 py-2 border border-gray-200 rounded-md text-sm mb-4" placeholder="Catatan..."></textarea>
                
                <div class="flex justify-end">
                    @if($canCheckout)
                        <button type="submit" class="bg-gray-900 text-white px-6 py-2 rounded-md text-xs font-medium hover:bg-gray-800">
                            Ajukan Peminjaman
                        </button>
                    @else
                        <button disabled class="bg-gray-300 text-gray-500 px-6 py-2 rounded-md text-xs font-medium cursor-not-allowed">
                            Ajukan Peminjaman
                        </button>
                    @endif
                </div>
            </form>
        </div>

        <!-- FORM CLEAR CART (DELETE - Terpisah di paling bawah) -->
        <div class="text-center">
            <form action="{{ route('anggota.cart.clear') }}" method="POST" onsubmit="return confirm('Kosongkan keranjang?')">
                @csrf
                @method('DELETE')
                <button type="submit" class="border border-gray-200 text-gray-600 px-4 py-2 rounded-md text-xs font-medium hover:bg-gray-50">
                    Kosongkan Keranjang
                </button>
            </form>
        </div>

    @else
        <!-- Empty Cart -->
        <div class="bg-white border border-gray-100 rounded-lg p-12 text-center">
            <p class="text-sm text-gray-400 mb-4">Keranjang Anda kosong</p>
            <a href="{{ route('anggota.catalog') }}" class="text-xs text-gray-700 font-medium hover:text-gray-900">
                Jelajahi Katalog Buku
            </a>
        </div>
    @endif
@endsection