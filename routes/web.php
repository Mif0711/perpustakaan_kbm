<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\RegisterController;
use App\Http\Controllers\AdminController;
use App\Http\Controllers\MemberController;
use App\Http\Controllers\LoanController;
use App\Http\Controllers\FineController;
use App\Http\Controllers\AnggotaController;
use App\Http\Controllers\CartController;
use App\Http\Controllers\Admin\CategoryController;
use App\Http\Controllers\Admin\AuthorController;
use App\Http\Controllers\Admin\PublisherController;
use App\Http\Controllers\Admin\ShelveController;
use App\Http\Controllers\Admin\BookController;
use App\Http\Controllers\Admin\UserController;
use App\Http\Controllers\Admin\SettingController;
use App\Http\Controllers\Admin\ReportController;

/* (Fitur Jadwal Jaga dihapus dari aplikasi) */

/*
|--------------------------------------------------------------------------
| Root & Auth Routes
|--------------------------------------------------------------------------
*/
Route::get('/', function () {
    if (auth()->check()) {
        if (auth()->user()->role === 'admin') return redirect()->route('admin.dashboard');
        if (auth()->user()->role === 'petugas') return redirect()->route('petugas.dashboard');
        if (auth()->user()->role === 'anggota') return redirect()->route('anggota.dashboard');
    }
    return redirect()->route('login');
});

// Route Panduan (Publik, bisa diakses siapa saja tanpa login)
Route::get('/panduan', [\App\Http\Controllers\PanduanController::class, 'index'])->name('panduan');

// ... route lainnya

Route::get('/login', [AuthController::class, 'showLogin'])->name('login')->middleware('guest');
Route::post('/login', [AuthController::class, 'login'])->name('login.post')->middleware('guest', 'throttle:10,1');
Route::post('/logout', [AuthController::class, 'logout'])->name('logout')->middleware('auth');

Route::get('/register', [RegisterController::class, 'showRegister'])->name('register')->middleware('guest');
Route::post('/register', [RegisterController::class, 'register'])->name('register.post')->middleware('guest', 'throttle:10,1');

/*
|--------------------------------------------------------------------------
| Admin Routes
|--------------------------------------------------------------------------
*/
Route::middleware(['auth', 'role:admin'])->prefix('admin')->name('admin.')->group(function () {
    Route::get('/dashboard', [AdminController::class, 'dashboard'])->name('dashboard');
    
    Route::resource('categories', CategoryController::class);
    Route::resource('authors', AuthorController::class);
    Route::resource('publishers', PublisherController::class);
    Route::resource('shelves', ShelveController::class);
    Route::resource('books', BookController::class);
    
    Route::get('/users/pending', [UserController::class, 'pending'])->name('users.pending');
    Route::post('/users/{user}/approve', [UserController::class, 'approve'])->name('users.approve');
    Route::post('/users/{user}/reject', [UserController::class, 'reject'])->name('users.reject');
    Route::resource('users', UserController::class);

    
    Route::get('/reports/books', [ReportController::class, 'books'])->name('reports.books');
    Route::get('/reports/transactions', [ReportController::class, 'transactions'])->name('reports.transactions');
    Route::get('/reports/fines', [ReportController::class, 'fines'])->name('reports.fines');
    
    Route::get('/settings', [SettingController::class, 'index'])->name('settings.index');
    Route::put('/settings', [SettingController::class, 'update'])->name('settings.update');
});

/*
|--------------------------------------------------------------------------
| Petugas Routes
|--------------------------------------------------------------------------
*/
Route::middleware(['auth', 'role:petugas'])->prefix('petugas')->name('petugas.')->group(function () {
    Route::get('/dashboard', [AdminController::class, 'petugasDashboard'])->name('dashboard');
});

Route::middleware(['auth', 'role:petugas'])->group(function () {
    Route::resource('members', MemberController::class);
    
    Route::get('/loans', [LoanController::class, 'index'])->name('loans.index');
    Route::get('/loans/create', [LoanController::class, 'create'])->name('loans.create');
    Route::post('/loans', [LoanController::class, 'store'])->name('loans.store');
    
    // APPROVAL PENGAJUAN ANGGOTA
    Route::get('/loans/requests', [LoanController::class, 'requests'])->name('loans.requests');
    Route::post('/loans/{loan}/approve', [LoanController::class, 'approveRequest'])->name('loans.approve');
    Route::post('/loans/{loan}/reject', [LoanController::class, 'rejectRequest'])->name('loans.reject');
    
    Route::get('/returns', [LoanController::class, 'returnsIndex'])->name('returns.index');
    Route::get('/returns/{loan}/process', [LoanController::class, 'processReturn'])->name('returns.process');
    Route::post('/returns/{loan}', [LoanController::class, 'storeReturn'])->name('returns.store');
    
    Route::get('/fines', [FineController::class, 'index'])->name('fines.index');
    Route::get('/fines/{fine}/edit', [FineController::class, 'edit'])->name('fines.edit');
    Route::put('/fines/{fine}', [FineController::class, 'update'])->name('fines.update');
    Route::patch('/fines/{fine}/pay', [FineController::class, 'pay'])->name('fines.pay');
    Route::get('/fines/{fine}/history', [FineController::class, 'history'])->name('fines.history');
    
    Route::get('/ajax/search-member', [LoanController::class, 'searchMember'])->name('ajax.search.member');
    Route::get('/ajax/search-book', [LoanController::class, 'searchBook'])->name('ajax.search.book');
});

/*
|--------------------------------------------------------------------------
| Anggota Routes
|--------------------------------------------------------------------------
*/
Route::middleware(['auth', 'role:anggota'])->prefix('anggota')->name('anggota.')->group(function () {
    Route::get('/dashboard', [AnggotaController::class, 'dashboard'])->name('dashboard');
    Route::get('/catalog', [AnggotaController::class, 'catalog'])->name('catalog');
    Route::get('/books/{book}', [AnggotaController::class, 'bookDetail'])->name('books.show');
    
    // Cart Routes
    Route::get('/cart', [CartController::class, 'index'])->name('cart.index');
    Route::post('/cart/{book}', [CartController::class, 'add'])->name('cart.add');
    Route::patch('/cart/{item}', [CartController::class, 'update'])->name('cart.update');
    Route::delete('/cart/{item}', [CartController::class, 'remove'])->name('cart.remove');
    Route::delete('/cart', [CartController::class, 'clear'])->name('cart.clear');
    
    // Checkout (Pengajuan Peminjaman)
    Route::post('/checkout', [CartController::class, 'checkout'])->name('checkout');
    
    // Loans Routes (Status Pengajuan & Riwayat)
    Route::get('/loans', [AnggotaController::class, 'loans'])->name('loans.index');
    Route::get('/loans/history', [AnggotaController::class, 'loanHistory'])->name('loans.history');
});