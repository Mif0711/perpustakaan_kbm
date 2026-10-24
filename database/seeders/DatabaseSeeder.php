<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Faker\Factory as Faker;
use Carbon\Carbon;

class DatabaseSeeder extends Seeder
{
    public function run(): void
    {
        $faker = Faker::create('id_ID');

        // Kosongkan tabel
        DB::statement('SET FOREIGN_KEY_CHECKS=0;');
        $tables = ['users', 'categories', 'publishers', 'authors', 'shelves', 'members', 'books', 'loans', 'loan_details', 'returns', 'fines', 'fine_histories', 'settings'];
        foreach ($tables as $table) {
            DB::table($table)->truncate();
        }
        DB::statement('SET FOREIGN_KEY_CHECKS=1;');

        // 1. Users
        DB::table('users')->insert([
            ['name' => 'Administrator', 'email' => 'admin@perpus.com', 'username' => 'admin', 'password' => Hash::make('password'), 'role' => 'admin', 'created_at' => now(), 'updated_at' => now()],
            ['name' => 'Petugas Perpustakaan', 'email' => 'petugas@perpus.com', 'username' => 'petugas', 'password' => Hash::make('password'), 'role' => 'petugas', 'created_at' => now(), 'updated_at' => now()],
        ]);

        // 2. Settings
        DB::table('settings')->insert([
            ['key' => 'nama_perpustakaan', 'value' => 'Perpustakaan KBM', 'created_at' => now(), 'updated_at' => now()],
            ['key' => 'denda_per_hari', 'value' => '2000', 'created_at' => now(), 'updated_at' => now()],
            ['key' => 'maksimal_hari_pinjam', 'value' => '7', 'created_at' => now(), 'updated_at' => now()],
            ['key' => 'maksimal_jumlah_buku', 'value' => '3', 'created_at' => now(), 'updated_at' => now()],
        ]);

        // 3. Master Data - Realistic
        $categories = [
            ['kode_kategori' => 'KAT-01', 'nama_kategori' => 'Fiksi', 'deskripsi' => 'Novel, Cerpen, dan Karya Sastra Fiksi'],
            ['kode_kategori' => 'KAT-02', 'nama_kategori' => 'Pendidikan', 'deskripsi' => 'Buku Pelajaran dan Referensi Pendidikan'],
            ['kode_kategori' => 'KAT-03', 'nama_kategori' => 'Sejarah', 'deskripsi' => 'Sejarah Indonesia dan Dunia'],
            ['kode_kategori' => 'KAT-04', 'nama_kategori' => 'Teknologi', 'deskripsi' => 'Komputer, Internet, dan Teknologi Informasi'],
            ['kode_kategori' => 'KAT-05', 'nama_kategori' => 'Agama', 'deskripsi' => 'Buku Keagamaan dan Spiritual'],
            ['kode_kategori' => 'KAT-06', 'nama_kategori' => 'Anak-Anak', 'deskripsi' => 'Buku Cerita dan Pendidikan untuk Anak'],
            ['kode_kategori' => 'KAT-07', 'nama_kategori' => 'Bisnis & Ekonomi', 'deskripsi' => 'Manajemen, Keuangan, dan Kewirausahaan'],
            ['kode_kategori' => 'KAT-08', 'nama_kategori' => 'Psikologi', 'deskripsi' => 'Pengembangan Diri dan Psikologi'],
        ];
        foreach ($categories as $cat) {
            DB::table('categories')->insert(array_merge($cat, ['created_at' => now(), 'updated_at' => now()]));
        }

        $publishers = [
            ['kode_penerbit' => 'PEN-01', 'nama_penerbit' => 'Gramedia Pustaka Utama'],
            ['kode_penerbit' => 'PEN-02', 'nama_penerbit' => 'Erlangga'],
            ['kode_penerbit' => 'PEN-03', 'nama_penerbit' => 'Mizan'],
            ['kode_penerbit' => 'PEN-04', 'nama_penerbit' => 'Republika Penerbit'],
            ['kode_penerbit' => 'PEN-05', 'nama_penerbit' => 'Andi Offset'],
            ['kode_penerbit' => 'PEN-06', 'nama_penerbit' => 'Bentang Pustaka'],
        ];
        foreach ($publishers as $pub) {
            DB::table('publishers')->insert(array_merge($pub, ['created_at' => now(), 'updated_at' => now()]));
        }

        $authors = [
            ['kode_penulis' => 'AUT-01', 'nama_penulis' => 'Andrea Hirata', 'biografi' => 'Penulis novel Laskar Pelangi'],
            ['kode_penulis' => 'AUT-02', 'nama_penulis' => 'Pramoedya Ananta Toer', 'biografi' => 'Sastrawan Indonesia'],
            ['kode_penulis' => 'AUT-03', 'nama_penulis' => 'Tere Liye', 'biografi' => 'Penulis novel populer Indonesia'],
            ['kode_penulis' => 'AUT-04', 'nama_penulis' => 'Habiburrahman El Shirazy', 'biografi' => 'Penulis novel religi'],
            ['kode_penulis' => 'AUT-05', 'nama_penulis' => 'Dewi Lestari', 'biografi' => 'Penulis Supernova dan karya lain'],
            ['kode_penulis' => 'AUT-06', 'nama_penulis' => 'Raditya Dika', 'biografi' => 'Penulis komedi dan konten kreator'],
            ['kode_penulis' => 'AUT-07', 'nama_penulis' => 'Eka Kurniawan', 'biografi' => 'Sastrawan kontemporer Indonesia'],
        ];
        foreach ($authors as $author) {
            DB::table('authors')->insert(array_merge($author, ['created_at' => now(), 'updated_at' => now()]));
        }

        $shelves = [
            ['kode_rak' => 'RAK-01', 'nama_rak' => 'Rak A - Fiksi', 'tipe' => 'rak', 'kapasitas' => 80],
            ['kode_rak' => 'RAK-02', 'nama_rak' => 'Rak B - Pendidikan', 'tipe' => 'rak', 'kapasitas' => 80],
            ['kode_rak' => 'RAK-03', 'nama_rak' => 'Rak C - Sejarah', 'tipe' => 'rak', 'kapasitas' => 60],
            ['kode_rak' => 'RAK-04', 'nama_rak' => 'Rak D - Teknologi', 'tipe' => 'rak', 'kapasitas' => 70],
            ['kode_rak' => 'RAK-05', 'nama_rak' => 'Rak E - Agama', 'tipe' => 'rak', 'kapasitas' => 60],
        ];
        foreach ($shelves as $shelf) {
            DB::table('shelves')->insert(array_merge($shelf, ['created_at' => now(), 'updated_at' => now()]));
        }

        // 4. Members
        $names = ['Ahmad Rizki', 'Siti Nurhaliza', 'Budi Santoso', 'Dewi Sartika', 'Rizky Pratama', 'Ani Yudhoyono', 'Agus Setiawan', 'Maya Indah', 'Fajar Nugroho', 'Linda Permata', 'Hadi Wijaya', 'Ratna Sari', 'Dimas Anggara', 'Fitri Handayani', 'Andi Firmansyah', 'Nina Aulia', 'Reza Rahadian', 'Putri Maharani', 'Eko Prasetyo', 'Yuni Kartika', 'Bayu Aji', 'Lestari Wulandari', 'Arif Budiman', 'Citra Dewi', 'Indra Gunawan'];
        for ($i=1; $i <= count($names); $i++) {
            DB::table('members')->insert([
                'kode_member' => 'MEM-' . str_pad($i, 4, '0', STR_PAD_LEFT),
                'nama' => $names[$i-1],
                'nis_nip' => $faker->unique()->numerify('NIS#######'),
                'jenis_kelamin' => $i % 3 == 0 ? 'P' : 'L',
                'alamat' => $faker->streetAddress . ', ' . $faker->city,
                'telepon' => '08' . $faker->numerify('##########'),
                'email' => strtolower(str_replace(' ', '.', $names[$i-1])) . '@gmail.com',
                'tanggal_daftar' => $faker->dateTimeBetween('-2 years', '-1 month')->format('Y-m-d'),
                'status' => $faker->randomElement(['aktif', 'aktif', 'aktif', 'nonaktif']),
                'created_at' => now(), 'updated_at' => now()
            ]);
        }

        // 5. Books - Realistic titles
        $books = [
            ['judul' => 'Laskar Pelangi', 'isbn' => '9789793062792', 'category_id' => 1, 'author_id' => 1, 'publisher_id' => 1, 'shelf_id' => 1],
            ['judul' => 'Bumi Manusia', 'isbn' => '9789799731235', 'category_id' => 1, 'author_id' => 2, 'publisher_id' => 2, 'shelf_id' => 1],
            ['judul' => 'Hujan', 'isbn' => '9786020324786', 'category_id' => 1, 'author_id' => 3, 'publisher_id' => 3, 'shelf_id' => 1],
            ['judul' => 'Ayat-Ayat Cinta', 'isbn' => '9789793604189', 'category_id' => 5, 'author_id' => 4, 'publisher_id' => 4, 'shelf_id' => 5],
            ['judul' => 'Supernova: Ksatria, Puteri dan Bintang Jatuh', 'isbn' => '9789792236229', 'category_id' => 1, 'author_id' => 5, 'publisher_id' => 3, 'shelf_id' => 1],
            ['judul' => 'Kambing Jantan: Sebuah Catatan Harian Pelajar Bodoh', 'isbn' => '9789799106987', 'category_id' => 1, 'author_id' => 6, 'publisher_id' => 1, 'shelf_id' => 1],
            ['judul' => 'Cantik Itu Luka', 'isbn' => '9786022915836', 'category_id' => 1, 'author_id' => 7, 'publisher_id' => 6, 'shelf_id' => 1],
            ['judul' => 'Matematika untuk SMA Kelas X', 'isbn' => '9786024342345', 'category_id' => 2, 'author_id' => 1, 'publisher_id' => 2, 'shelf_id' => 2],
            ['judul' => 'Fisika Dasar', 'isbn' => '9789790156789', 'category_id' => 2, 'author_id' => 2, 'publisher_id' => 2, 'shelf_id' => 2],
            ['judul' => 'Bahasa Indonesia untuk SMA/MA', 'isbn' => '9786022981234', 'category_id' => 2, 'author_id' => 3, 'publisher_id' => 2, 'shelf_id' => 2],
            ['judul' => 'Sejarah Indonesia Modern 1200-2004', 'isbn' => '9789797095411', 'category_id' => 3, 'author_id' => 2, 'publisher_id' => 1, 'shelf_id' => 3],
            ['judul' => 'Perang Diponegoro', 'isbn' => '9789794615678', 'category_id' => 3, 'author_id' => 4, 'publisher_id' => 4, 'shelf_id' => 3],
            ['judul' => 'Pemrograman Web dengan PHP dan MySQL', 'isbn' => '9789792931445', 'category_id' => 4, 'author_id' => 5, 'publisher_id' => 5, 'shelf_id' => 4],
            ['judul' => 'Belajar Laravel untuk Pemula', 'isbn' => '9786026232345', 'category_id' => 4, 'author_id' => 6, 'publisher_id' => 5, 'shelf_id' => 4],
            ['judul' => 'Jaringan Komputer Dasar', 'isbn' => '9789792945567', 'category_id' => 4, 'author_id' => 7, 'publisher_id' => 5, 'shelf_id' => 4],
            ['judul' => 'Al-Quran dan Terjemahnya', 'isbn' => '9786023851234', 'category_id' => 5, 'author_id' => 4, 'publisher_id' => 4, 'shelf_id' => 5],
            ['judul' => 'Hadis Shahih Bukhari', 'isbn' => '9789796012345', 'category_id' => 5, 'author_id' => 1, 'publisher_id' => 4, 'shelf_id' => 5],
            ['judul' => 'Dongeng Anak Nusantara', 'isbn' => '9786020301234', 'category_id' => 6, 'author_id' => 3, 'publisher_id' => 3, 'shelf_id' => 1],
            ['judul' => 'Si Kancil dan Buaya', 'isbn' => '9786020312345', 'category_id' => 6, 'author_id' => 6, 'publisher_id' => 3, 'shelf_id' => 1],
            ['judul' => 'Kewirausahaan untuk Pelajar', 'isbn' => '9789792923456', 'category_id' => 7, 'author_id' => 5, 'publisher_id' => 5, 'shelf_id' => 2],
            ['judul' => 'Manajemen Keuangan', 'isbn' => '9789792934567', 'category_id' => 7, 'author_id' => 7, 'publisher_id' => 5, 'shelf_id' => 2],
            ['judul' => 'Psikologi Remaja', 'isbn' => '9786022945678', 'category_id' => 8, 'author_id' => 2, 'publisher_id' => 3, 'shelf_id' => 2],
            ['judul' => 'Berani Tidak Disukai', 'isbn' => '9786020654321', 'category_id' => 8, 'author_id' => 4, 'publisher_id' => 6, 'shelf_id' => 2],
            ['judul' => 'Negeri 5 Menara', 'isbn' => '9789794336129', 'category_id' => 1, 'author_id' => 4, 'publisher_id' => 4, 'shelf_id' => 1],
            ['judul' => 'Ronggeng Dukuh Paruk', 'isbn' => '9789799730115', 'category_id' => 1, 'author_id' => 2, 'publisher_id' => 2, 'shelf_id' => 1],
            ['judul' => 'Sang Pemimpi', 'isbn' => '9789793062808', 'category_id' => 1, 'author_id' => 1, 'publisher_id' => 1, 'shelf_id' => 1],
            ['judul' => 'Edensor', 'isbn' => '9789793062815', 'category_id' => 1, 'author_id' => 1, 'publisher_id' => 1, 'shelf_id' => 1],
            ['judul' => 'Pulang', 'isbn' => '9786020324793', 'category_id' => 1, 'author_id' => 3, 'publisher_id' => 3, 'shelf_id' => 1],
            ['judul' => 'Selamat Tinggal', 'isbn' => '9786020324809', 'category_id' => 1, 'author_id' => 3, 'publisher_id' => 3, 'shelf_id' => 1],
            ['judul' => 'Atomic Habits (Terjemahan)', 'isbn' => '9786020869246', 'category_id' => 8, 'author_id' => 5, 'publisher_id' => 6, 'shelf_id' => 2],
        ];

        foreach ($books as $i => $book) {
            $jumlah = $faker->numberBetween(2, 5);
            DB::table('books')->insert([
                'kode_buku' => 'BK-' . str_pad($i+1, 4, '0', STR_PAD_LEFT),
                'judul' => $book['judul'],
                'isbn' => $book['isbn'],
                'category_id' => $book['category_id'],
                'author_id' => $book['author_id'],
                'publisher_id' => $book['publisher_id'],
                'shelf_id' => $book['shelf_id'],
                'tahun_terbit' => $faker->numberBetween(2015, 2023),
                'jumlah' => $jumlah,
                'tersedia' => $jumlah,
                'deskripsi' => 'Buku ' . $book['judul'] . ' - Karya ' . DB::table('authors')->where('id', $book['author_id'])->value('nama_penulis'),
                'created_at' => now(), 'updated_at' => now()
            ]);
        }

        // 6. Transaksi Peminjaman
        $activeMembers = DB::table('members')->where('status', 'aktif')->pluck('id')->toArray();
        $allBooks = DB::table('books')->get();

        for ($i=1; $i <= 20; $i++) {
            $memberId = $faker->randomElement($activeMembers);
            $tanggalPinjam = Carbon::instance($faker->dateTimeBetween('-2 months', '-1 day'));
            $tanggalKembali = (clone $tanggalPinjam)->addDays(7);
            
            // 60% sudah dikembalikan, 40% masih dipinjam
            $isReturned = $faker->boolean(60);
            $status = $isReturned ? 'dikembalikan' : 'dipinjam';
            $tanggalDikembalikan = null;
            
            if ($isReturned) {
                // Sebagian tepat waktu, sebagian terlambat
                if ($faker->boolean(70)) {
                    $tanggalDikembalikan = (clone $tanggalPinjam)->addDays($faker->numberBetween(1, 6));
                } else {
                    $tanggalDikembalikan = (clone $tanggalKembali)->addDays($faker->numberBetween(1, 5));
                }
            }

            $loanId = DB::table('loans')->insertGetId([
                'kode_pinjam' => 'PJN-' . str_pad($i, 5, '0', STR_PAD_LEFT),
                'member_id' => $memberId,
                'user_id' => 2, // Petugas
                'tanggal_pinjam' => $tanggalPinjam->format('Y-m-d'),
                'tanggal_kembali' => $tanggalKembali->format('Y-m-d'),
                'tanggal_dikembalikan' => $tanggalDikembalikan ? $tanggalDikembalikan->format('Y-m-d H:i:s') : null,
                'status' => $status,
                'created_at' => $tanggalPinjam,
                'updated_at' => now()
            ]);

            $numBooks = $faker->numberBetween(1, 2);
            $randomBooks = $allBooks->random($numBooks);

            foreach ($randomBooks as $book) {
                DB::table('loan_details')->insert([
                    'loan_id' => $loanId,
                    'book_id' => $book->id,
                    'jumlah' => 1,
                    'kondisi' => 'baik',
                    'created_at' => $tanggalPinjam,
                    'updated_at' => $tanggalPinjam
                ]);

                if (!$isReturned) {
                    DB::table('books')->where('id', $book->id)->decrement('tersedia');
                }
            }

            if ($isReturned && $tanggalDikembalikan) {
                $terlambatHari = 0;
                $denda = 0;
                if ($tanggalDikembalikan > $tanggalKembali) {
                    $terlambatHari = $tanggalKembali->diffInDays($tanggalDikembalikan);
                    $denda = $terlambatHari * 2000;
                }

                DB::table('returns')->insert([
                    'kode_kembali' => 'KBL-' . str_pad($i, 5, '0', STR_PAD_LEFT),
                    'loan_id' => $loanId,
                    'user_id' => 2,
                    'tanggal_kembali' => $tanggalDikembalikan,
                    'terlambat_hari' => $terlambatHari,
                    'denda' => $denda,
                    'catatan' => $terlambatHari > 0 ? 'Dikembalikan terlambat' : 'Dikembalikan tepat waktu',
                    'created_at' => $tanggalDikembalikan,
                    'updated_at' => $tanggalDikembalikan
                ]);

                if ($denda > 0) {
                    DB::table('fines')->insert([
                        'kode_denda' => 'DND-' . str_pad($i, 5, '0', STR_PAD_LEFT),
                        'member_id' => $memberId,
                        'loan_id' => $loanId,
                        'jumlah' => $denda,
                        'keterangan' => "Denda keterlambatan pengembalian {$terlambatHari} hari",
                        'status' => $faker->randomElement(['belum_bayar', 'lunas']),
                        'created_at' => $tanggalDikembalikan,
                        'updated_at' => $tanggalDikembalikan
                    ]);
                }
            }
        }
    }
}
