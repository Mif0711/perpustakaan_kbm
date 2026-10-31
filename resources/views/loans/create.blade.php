@extends('layouts.app')

@section('title', 'Buat Peminjaman')
@section('header_title', 'Form Peminjaman Buku')

@section('content')
    <div class="max-w-4xl">
        @if ($errors->any())
            <div class="bg-red-50 border border-red-100 text-red-500 text-xs p-3 rounded-md mb-4">
                <p class="font-medium mb-1">Terjadi kesalahan:</p>
                <ul>@foreach ($errors->all() as $error) <li>- {{ $error }}</li> @endforeach</ul>
            </div>
        @endif

        @if(session('error'))
            <div class="bg-red-50 border border-red-100 text-red-500 text-xs p-3 rounded-md mb-4">{{ session('error') }}</div>
        @endif

        <form id="loanForm" action="{{ route('loans.store') }}" method="POST" class="space-y-6">
            @csrf

            <!-- Pencarian Anggota -->
            <div class="bg-white border border-slate-100 rounded-2xl shadow-sm p-6">
                <h3 class="text-sm font-medium text-gray-800 mb-4 pb-3 border-b border-gray-100">1. Cari Data Anggota</h3>
                <div class="flex space-x-3">
                    <input type="text" id="searchMemberInput" placeholder="Masukkan Kode Member atau Nama..." class="flex-1 px-3 py-2.5 border border-gray-200 rounded-md text-sm focus:outline-none focus:ring-1 focus:ring-gray-800 focus:border-gray-800" onkeypress="if(event.key==='Enter'){event.preventDefault();searchMember();}">
                    <button type="button" id="btnSearchMember" onclick="searchMember()" class="bg-gray-100 text-gray-700 px-4 py-2 rounded-md text-xs font-medium hover:bg-gray-200">Cari</button>
                </div>
                
                <div id="memberInfo" class="mt-4 hidden p-4 border border-gray-100 rounded-md bg-gray-50">
                    <input type="hidden" name="member_id" id="memberIdInput">
                    <div class="flex justify-between items-center">
                        <div>
                            <p class="text-sm font-medium text-gray-900" id="memberName"></p>
                            <p class="text-xs text-gray-500" id="memberCode"></p>
                        </div>
                        <div id="memberStatus"></div>
                    </div>
                </div>
            </div>

            <!-- Pencarian Buku -->
            <div class="bg-white border border-slate-100 rounded-2xl shadow-sm p-6">
                <h3 class="text-sm font-medium text-gray-800 mb-4 pb-3 border-b border-gray-100">2. Tambahkan Buku</h3>
                <div class="flex space-x-3">
                    <input type="text" id="searchBookInput" placeholder="Cari judul atau kode buku..." class="flex-1 px-3 py-2.5 border border-gray-200 rounded-md text-sm focus:outline-none focus:ring-1 focus:ring-gray-800 focus:border-gray-800" onkeypress="if(event.key==='Enter'){event.preventDefault();searchBook();}">
                    <button type="button" id="btnSearchBook" onclick="searchBook()" class="bg-gray-100 text-gray-700 px-4 py-2 rounded-md text-xs font-medium hover:bg-gray-200">Cari</button>
                </div>

                <div id="bookResults" class="mt-3 space-y-2 max-h-40 overflow-y-auto border border-gray-100 rounded-md p-3 hidden bg-white"></div>

                <!-- Keranjang Buku -->
                <div class="mt-4">
                    <p class="text-xs font-medium text-gray-500 mb-2">Buku yang dipinjam:</p>
                    <div id="cart" class="space-y-2">
                        <p id="emptyCart" class="text-xs text-gray-400 text-center py-4 border border-dashed border-gray-200 rounded-md">Belum ada buku dipilih</p>
                    </div>
                </div>
            </div>

            <div class="flex justify-end">
                <button type="submit" id="btnSubmit" class="bg-gradient-to-r from-amber-600 to-orange-500 text-white px-6 py-2 rounded-xl text-xs font-bold shadow-md shadow-amber-600/25 hover:from-amber-700 hover:to-orange-600 transition active:scale-[.98] disabled:opacity-50 disabled:cursor-not-allowed" disabled>Simpan Transaksi</button>
            </div>
        </form>
    </div>

    <script>
        var cart = [];
        var bookData = {};

        function searchMember() {
            var keyword = document.getElementById('searchMemberInput').value;
            if(!keyword) {
                alert('Masukkan kode member atau nama terlebih dahulu!');
                return;
            }
            
            var btn = document.getElementById('btnSearchMember');
            var originalText = btn.textContent;
            btn.textContent = 'Mencari...';
            btn.disabled = true;

            fetch('/ajax/search-member?q=' + encodeURIComponent(keyword))
                .then(function(res) { return res.json(); })
                .then(function(data) {
                    btn.textContent = originalText;
                    btn.disabled = false;
                    
                    if(data.status === 'success') {
                        var m = data.data;
                        document.getElementById('memberInfo').classList.remove('hidden');
                        document.getElementById('memberIdInput').value = m.id;
                        document.getElementById('memberName').textContent = m.nama;
                        document.getElementById('memberCode').textContent = m.kode;
                        
                        var statusHtml = '';
                        if(m.status !== 'aktif') {
                            statusHtml = '<span class="text-xs text-red-500">Anggota Nonaktif</span>';
                        } else if(m.is_blocked) {
                            statusHtml = '<span class="text-xs text-red-500">Punya Denda Belum Lunas</span>';
                        } else if(!m.can_borrow) {
                            statusHtml = '<span class="text-xs text-red-500">Limit Pinjam Penuh</span>';
                        } else {
                            statusHtml = '<span class="text-xs text-green-500">Bisa pinjam ' + (m.max_books - m.active_loans) + ' buku lagi</span>';
                        }
                        document.getElementById('memberStatus').innerHTML = statusHtml;
                    } else {
                        alert(data.message || 'Anggota tidak ditemukan!');
                    }
                })
                .catch(function(err) {
                    btn.textContent = originalText;
                    btn.disabled = false;
                    alert('Terjadi kesalahan sistem saat mencari anggota. Cek console untuk detail.');
                    console.error('Error:', err);
                });
        }

        function searchBook() {
            var keyword = document.getElementById('searchBookInput').value;
            if(!keyword) {
                alert('Masukkan judul atau kode buku terlebih dahulu!');
                return;
            }
            
            var btn = document.getElementById('btnSearchBook');
            var originalText = btn.textContent;
            btn.textContent = 'Mencari...';
            btn.disabled = true;

            fetch('/ajax/search-book?q=' + encodeURIComponent(keyword))
                .then(function(res) { return res.json(); })
                .then(function(data) {
                    btn.textContent = originalText;
                    btn.disabled = false;
                    
                    if(data.status === 'success') {
                        var resultsDiv = document.getElementById('bookResults');
                        resultsDiv.innerHTML = '';
                        resultsDiv.classList.remove('hidden');
                        
                        data.data.forEach(function(book) {
                            bookData[book.id] = book;
                            
                            if(!cart.includes(book.id)) {
                                var itemDiv = document.createElement('div');
                                itemDiv.className = 'flex justify-between items-center py-2 px-3 hover:bg-gray-50 rounded';
                                
                                var infoDiv = document.createElement('div');
                                var titleP = document.createElement('p');
                                titleP.className = 'text-sm text-gray-800';
                                titleP.textContent = book.judul;
                                var codeP = document.createElement('p');
                                codeP.className = 'text-xs text-gray-400';
                                codeP.textContent = book.kode_buku + ' (Stok: ' + book.tersedia + ')';
                                infoDiv.appendChild(titleP);
                                infoDiv.appendChild(codeP);
                                
                                var btnAdd = document.createElement('button');
                                btnAdd.type = 'button';
                                btnAdd.className = 'text-xs text-gray-600 border border-gray-200 px-2 py-1 rounded hover:bg-gray-100';
                                btnAdd.textContent = 'Tambah';
                                var bookId = book.id;
                                btnAdd.onclick = function() { addBook(bookId); };
                                
                                itemDiv.appendChild(infoDiv);
                                itemDiv.appendChild(btnAdd);
                                resultsDiv.appendChild(itemDiv);
                            }
                        });
                    } else {
                        alert(data.message || 'Buku tidak ditemukan!');
                    }
                })
                .catch(function(err) {
                    btn.textContent = originalText;
                    btn.disabled = false;
                    alert('Terjadi kesalahan sistem saat mencari buku. Cek console untuk detail.');
                    console.error('Error:', err);
                });
        }

        function addBook(id) {
            if(!cart.includes(id)) {
                cart.push(id);
                renderCart();
            }
        }

        function removeBook(id) {
            cart = cart.filter(function(bookId) { return bookId !== id; });
            renderCart();
        }

        function renderCart() {
            var cartDiv = document.getElementById('cart');
            var submitBtn = document.getElementById('btnSubmit');
            
            if(cart.length === 0) {
                cartDiv.innerHTML = '<p id="emptyCart" class="text-xs text-gray-400 text-center py-4 border border-dashed border-gray-200 rounded-md">Belum ada buku dipilih</p>';
                submitBtn.disabled = true;
            } else {
                cartDiv.innerHTML = '';
                cart.forEach(function(id) {
                    var book = bookData[id];
                    var title = book ? book.judul : 'Buku ID: ' + id;
                    
                    var itemDiv = document.createElement('div');
                    itemDiv.className = 'flex justify-between items-center py-2 px-3 bg-gray-50 border border-gray-100 rounded-md';
                    
                    var hiddenInput = document.createElement('input');
                    hiddenInput.type = 'hidden';
                    hiddenInput.name = 'book_ids[]';
                    hiddenInput.value = id;
                    
                    var titleP = document.createElement('p');
                    titleP.className = 'text-sm text-gray-800';
                    titleP.textContent = title;
                    
                    var btnRemove = document.createElement('button');
                    btnRemove.type = 'button';
                    btnRemove.className = 'text-xs text-red-400 hover:text-red-600';
                    btnRemove.textContent = 'Hapus';
                    var bookId = id;
                    btnRemove.onclick = function() { removeBook(bookId); };
                    
                    itemDiv.appendChild(hiddenInput);
                    itemDiv.appendChild(titleP);
                    itemDiv.appendChild(btnRemove);
                    cartDiv.appendChild(itemDiv);
                });
                submitBtn.disabled = false;
            }
        }
    </script>
@endsection