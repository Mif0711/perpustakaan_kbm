<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Book;
use App\Models\Loan;
use App\Models\Fine;
use Illuminate\Http\Request;

class ReportController extends Controller
{
    public function books()
    {
        $books = Book::with(['category', 'author', 'publisher'])->latest()->get();
        return view('admin.reports.books', compact('books'));
    }

    public function transactions(Request $request)
    {
        $query = Loan::with(['member', 'user'])
            ->where('status', '!=', 'diajukan');
        
        // Filter berdasarkan rentang tanggal
        if ($request->filled('start_date') && $request->filled('end_date')) {
            $query->whereBetween('tanggal_pinjam', [$request->start_date, $request->end_date]);
        }
        
        $loans = $query->latest()->get();
        return view('admin.reports.transactions', compact('loans'));
    }

    public function fines(Request $request)
    {
        $query = Fine::with(['member', 'loan']);
        
        // Filter berdasarkan rentang tanggal pembayaran
        if ($request->filled('start_date') && $request->filled('end_date')) {
            $query->whereBetween('tanggal_bayar', [$request->start_date, $request->end_date]);
        }
        
        $fines = $query->latest()->get();
        return view('admin.reports.fines', compact('fines'));
    }
}