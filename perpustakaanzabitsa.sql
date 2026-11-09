-- phpMyAdmin SQL Dump
-- version 5.2.1deb3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 09, 2026 at 12:57 AM
-- Server version: 10.11.14-MariaDB-0ubuntu0.24.04.1
-- PHP Version: 8.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `perpustakaanzabitsa`
--

-- --------------------------------------------------------

--
-- Table structure for table `account_validation_logs`
--

CREATE TABLE `account_validation_logs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `acted_by` bigint(20) UNSIGNED DEFAULT NULL,
  `action` enum('approved','rejected','role_changed') NOT NULL,
  `old_role` varchar(20) DEFAULT NULL,
  `new_role` varchar(20) DEFAULT NULL,
  `reason` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `authors`
--

CREATE TABLE `authors` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `kode_penulis` varchar(255) NOT NULL,
  `nama_penulis` varchar(255) NOT NULL,
  `biografi` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `authors`
--

INSERT INTO `authors` (`id`, `kode_penulis`, `nama_penulis`, `biografi`, `created_at`, `updated_at`) VALUES
(1, 'PSN-LEGACY', 'Penulis Tidak Tercatat', NULL, '2026-10-23 09:42:57', '2026-10-23 09:42:57'),
(2, 'PNL-001', 'Andrea Hirata', NULL, '2026-07-26 23:03:15', '2026-07-26 23:03:15'),
(3, 'PNL-002', 'Pramoedya Ananta Toer', NULL, '2026-07-26 23:03:15', '2026-07-26 23:03:15'),
(4, 'PNL-003', 'Henry Manampiring', NULL, '2026-07-26 23:03:15', '2026-07-26 23:03:15'),
(5, 'PNL-004', 'Yuval Noah Harari', NULL, '2026-07-26 23:03:15', '2026-07-26 23:03:15');

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE `books` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `kode_buku` varchar(255) NOT NULL,
  `judul` varchar(255) NOT NULL,
  `isbn` varchar(255) DEFAULT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `publisher_id` bigint(20) UNSIGNED NOT NULL,
  `author_id` bigint(20) UNSIGNED NOT NULL,
  `shelf_id` bigint(20) UNSIGNED DEFAULT NULL,
  `tahun_terbit` year(4) DEFAULT NULL,
  `jumlah` int(11) NOT NULL DEFAULT 0,
  `tersedia` int(11) NOT NULL DEFAULT 0,
  `cover` varchar(255) DEFAULT NULL,
  `deskripsi` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`id`, `kode_buku`, `judul`, `isbn`, `category_id`, `publisher_id`, `author_id`, `shelf_id`, `tahun_terbit`, `jumlah`, `tersedia`, `cover`, `deskripsi`, `created_at`, `updated_at`) VALUES
(1, 'A001', 'Sirah Nabi', NULL, 2, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(2, 'A002', 'Ringkasan Hadis Shohih Muslim', NULL, 2, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(3, 'A003', 'Tafsir Jalalain 1', NULL, 2, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(4, 'A004', 'Tafsir Jalalain 2', NULL, 2, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(5, 'A005', 'Al Hikam 1', NULL, 2, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(6, 'A006', 'Al Hikam 2', NULL, 2, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(7, 'A007', 'Nu Menjawab Problematika Umat', NULL, 2, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(8, 'A008', 'Lebih Dekat Kepada Allah', NULL, 2, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(9, 'A009', 'Sebab Turunnya Al-Qur\'An', NULL, 2, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(10, 'A010', 'Pondok Sebagai Potret Cinta Tanah Air', NULL, 2, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(11, 'A011', 'Kajian Sullamut Taufiq', NULL, 2, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(12, 'A012', 'Kang Santri 1', NULL, 2, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(13, 'A013', 'Kang Santri 2', NULL, 2, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(14, 'A014', 'Aqidah Kaum Sarungan', NULL, 2, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(15, 'A015', 'Membuka Kedok Tokoh-Tokoh Liberal', NULL, 2, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(16, 'A016', 'Gerbang Pesantren', NULL, 2, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(17, 'A017', 'Al-Fadho-Il', NULL, 2, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(18, 'A018', 'Fihi Ma Fihi(71 Ceramah Rumi Untuk Pendidikan Ruhani)', NULL, 2, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(19, 'A019', 'Fihi Ma Fihi(Mengarungi Samudera Kebijaksanaan)', NULL, 2, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(20, 'A020', 'Menggagas Nu Masa Depan', NULL, 2, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(21, 'A021', 'Terjemah Tarikh Al-Tasiri\'', NULL, 2, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(22, 'A022', 'Tradisi Intelektual Santri', NULL, 2, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(23, 'A023', 'Pendidikan Karakter Pesantren', NULL, 2, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(24, 'A024', 'Nu Hammadiah Bicara Nasionalisme', NULL, 2, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(25, 'A025', 'Kepesantren Berwawasan Lingkungan', NULL, 2, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(26, 'A026', 'Pola Penyelenggaraan Pesantren Kilat', NULL, 2, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(27, 'A027', 'Metodologi Ilmu Tafsir', NULL, 2, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(28, 'A028', 'Fiqih Solutif', NULL, 2, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(29, 'A029', 'Living Qur\'An Dan Hadist', NULL, 2, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(30, 'A030', 'Babak Baru Pendidikan Usia Dini', NULL, 2, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(31, 'A031', 'Fiqih Muamalah', NULL, 2, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(32, 'A032', 'Ilmu Falak', NULL, 2, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(33, 'A033', 'Usul Fiqih', NULL, 2, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(34, 'A034', 'Ikhtisar Tajwid Praktis', NULL, 2, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(35, 'A035', 'Ilmu Sharaf', NULL, 2, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(36, 'A036', 'Kh. Moh. Romzi Al-Amiri Mannan, Sh., Mhi', NULL, 2, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(37, 'A037', 'Mereka Memasukkan Kitab-Kitab Karya Ulama Klasik', NULL, 2, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(38, 'A038', 'Tradisi Intelektual Nu', NULL, 2, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(39, 'A039', 'Hujjah Nu', NULL, 2, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(40, 'A040', 'Fikih Curhat', NULL, 2, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(41, 'A041', 'Etika Bergaul', NULL, 2, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(42, 'A042', 'Tafsir Surat Al-Fatihah', NULL, 2, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(43, 'A043', 'Hasyiyah', NULL, 2, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(44, 'A044', 'Menggerakkan Tradisi', NULL, 2, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(45, 'A045', 'Studi Ilmu-Ilmu Al-Qur`an', NULL, 2, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(46, 'A046', 'Terjemah Syu\'Abul Iman', NULL, 2, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(47, 'A047', 'Pendidikan Karakter Berbasis Pesantren', NULL, 2, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(48, 'A048', 'Hadis-Hadis Populer Shohih Bukhari Muslim', NULL, 2, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(49, 'A049', 'Al-Qur\'An Tarjamah Madhura', NULL, 2, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(50, 'A050', 'Tafsir Al-Asyr Al-Akhir', NULL, 2, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(51, 'A051', 'Ringkasan Al-I\'Tisham', NULL, 2, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(52, 'A052', 'Bilik-Bilik Cinta Muhammad', NULL, 2, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(53, 'A053', 'Tarikh Tasyri\'', NULL, 2, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(54, 'A054', 'Aku,Buku Dan Peradaban', NULL, 2, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(55, 'A055', 'Ta\'Lim Muta\'Allim', NULL, 2, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(56, 'A056', 'Ta\'Lim Muta\'Allim 2', NULL, 2, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(57, 'A057', 'Fiqih Viral (Fathul Mu`in) 1', NULL, 2, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(58, 'A058', 'Fiqih Viral (Fathul Mu`in) 2', NULL, 2, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(59, 'A059', 'Fiqih Viral (Fathul Mu`in) 3', NULL, 2, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(60, 'A060', 'Fiqih Viral (Fathul Mu`in) 4', NULL, 2, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(61, 'A061', 'Fiqih Viral (Fathul Mu`in) 5', NULL, 2, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(62, 'A062', 'Fiqh Sunnah E.4', NULL, 2, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(63, 'A063', 'Kependudukan Perspektif Islam', NULL, 2, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(64, 'A064', 'Fiqh Sesat', NULL, 2, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(65, 'A065', 'Nasionalisme Dan Islam Nusantara', NULL, 2, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(66, 'A066', 'Keajaiban Al-Qur\'An & Rahasia Kalimat Tauhid', NULL, 2, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(67, 'A067', 'Juz Amma 3 Bahasa', NULL, 2, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(68, 'A068', 'Ngaji Hati', NULL, 2, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(69, 'A069', 'Syarah Hadits 40', NULL, 2, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(70, 'A070', 'Ngaji Qur\'An Di Zaman Edan', NULL, 2, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(71, 'A071', 'Mari Memenuhi Panggilan Allah', NULL, 2, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(72, 'A072', 'Nashaihul \'Ibad', NULL, 2, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(73, 'A073', 'Maraqi Al-Ubudiyah', NULL, 2, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(74, 'A074', 'Kyai Pejuang', NULL, 2, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(75, 'A075', 'Peradaban Sarung', NULL, 2, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(76, 'A076', 'Implementasi Metode Amtsilati', NULL, 2, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(77, 'A077', 'Ath-Thibbu An-Nawawi', NULL, 2, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(78, 'A078', 'Terjemah Fath Al-Qorib', NULL, 2, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(79, 'A079', 'Ngaji Diri', NULL, 2, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(80, 'A080', 'Ensiklopedia Hadratus Syaikh K.H Hasyim A', NULL, 2, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(81, 'A081', 'Terjemah & Syarah Nazham Imriti', NULL, 2, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(82, 'A082', 'Penjelasan Nadhom Aqidatul Awam', NULL, 2, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(83, 'A083', 'Selayang Pandang Pondok Pesantren Nurul Jadid', NULL, 2, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(84, 'A084', 'Riyadhus Shalihin', NULL, 2, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(85, 'A085', 'Terjemah Matan Alfiah', NULL, 2, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(86, 'A086', 'Mempertajam Mata Batin', NULL, 2, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(87, 'A087', 'Tradisi Pesantren', NULL, 2, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(88, 'A088', 'Terjemah Lengkap Bulughul Maram', NULL, 2, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(89, 'A089', 'Fiqih Ibadah', NULL, 2, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(90, 'A090', 'Kitab At-Tibyan', NULL, 2, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(91, 'A091', 'Buah Buahan Yang Menjulai', NULL, 2, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(92, 'A092', 'Hukum Zakat Dan Wakaf', NULL, 2, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(93, 'A093', 'The Story Of Dajjal', NULL, 2, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(94, 'B001', 'Manusia Dan Makhluk Ghaib Di Sekelilingnya', NULL, 10, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(95, 'B002', 'Kamus Do\'A', NULL, 10, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(96, 'B003', 'Berdzikir Cara Nabi', NULL, 10, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(97, 'B004', 'Logika Agama', NULL, 10, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(98, 'B005', 'Studi Agama', NULL, 10, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(99, 'B006', 'Orang Gila Jadi Wali', NULL, 10, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(100, 'B007', 'Memahami Hubungan Antar Agama', NULL, 10, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(101, 'B008', 'Hidup Susah Tak Lupa Bersedekah', NULL, 10, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(102, 'B009', 'Hadis Versus Sains', NULL, 10, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(103, 'B010', 'Materi Kultum Penyejuk Hati', NULL, 10, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(104, 'B011', 'Sunah-Sunah Kecil Berpahalabesar', NULL, 10, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(105, 'B012', 'Greendeen', NULL, 10, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(106, 'B013', 'Perempuan Tertindas ?', NULL, 10, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(107, 'B014', 'Terapi Qur\'Ani', NULL, 10, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(108, 'B015', 'Khusyuk Sholat', NULL, 10, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(109, 'B016', 'Islam Liberal & Fundamental', NULL, 10, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(110, 'B017', 'Semiotika Al-Qur\'An', NULL, 10, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(111, 'B018', 'Taubat', NULL, 10, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(112, 'B019', 'Berakhlak & Beradab Mulia', NULL, 10, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(113, 'B020', 'Ibrahim Pernah Atheis', NULL, 10, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(114, 'B021', 'Fiqih Sosial', NULL, 10, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(115, 'B022', '1001 Cara Berdakwah', NULL, 10, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(116, 'B023', 'Misteri Energi Istigfar', NULL, 10, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(117, 'B024', 'Misteri Dibalik Perintah Sholat', NULL, 10, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(118, 'B025', 'Studi Al-Qur\'An Kontemporer', NULL, 10, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(119, 'B026', 'Akibat-Akibat Fatal Meremehkan Sholat Tah', NULL, 10, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(120, 'B027', 'Dari Mana Masuknya Setan', NULL, 10, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(121, 'B028', 'Orang Kota Mencari Allah', NULL, 10, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(122, 'B029', 'Ternyata Allah Menyuruh Pada Pesugihan', NULL, 10, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(123, 'B030', '7 Malam Pertama Di Alam Kubur', NULL, 10, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(124, 'B031', 'Bersama Do\'A-Do\'A Ini, Taklukkan Wanita Idamanmu ?', NULL, 10, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(125, 'B032', '10 Amal Sholeh Yang Membuat Tubuh Selalu Sehat', NULL, 10, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(126, 'B033', 'Bacalah Yasin Dijamin Hidupmu Kaya Dan Penuh Berkah!', NULL, 10, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(127, 'B034', 'Kesalahan-Kesalahan Istighfar', NULL, 10, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(128, 'B035', 'Musuh Besar Umat Islam', NULL, 10, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(129, 'B036', 'Do\'A Dan Dzikir Hebat Bisa Mendapatkan Pekerjaan Idaman', NULL, 10, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(130, 'B037', 'Panduan Lengkap Perawat Jenaza', NULL, 10, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(131, 'B038', 'Membangunan Keshalehan Sosial', NULL, 10, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(132, 'B039', 'Kajaiban Kitab Suci Al-Qur\'An', NULL, 10, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(133, 'B040', 'Meniggalkan Takabbur Menuju Sy', NULL, 10, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(134, 'B041', 'Ensiklopedi Halal Haram Makanan', NULL, 10, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(135, 'B042', 'Kontroversi Nabi Perempuan Dalam Islam', NULL, 10, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(136, 'B043', 'Hermeneutika Al-Qur\'An', NULL, 10, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(137, 'B044', 'Al-Qur\'An Mengungkap Tentang Y', NULL, 10, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(138, 'B045', 'Fadilah Tahajjud Untuk Mencapai Keluarga Sakinah', NULL, 10, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(139, 'B046', 'Kesalahan Dalam Solat Paling Sering Terjadi', NULL, 10, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(140, 'B047', 'Buku Pintar Halal Haram Sehari-Ha', NULL, 10, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(141, 'B048', 'Nasehat Iblis', NULL, 10, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(142, 'B049', 'Fadhilah-Fadhilah Ajaib Solat Raw', NULL, 10, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(143, 'B050', 'Kenal Baik Dengan Syetan', NULL, 10, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(144, 'B051', 'Innalillahi Wa Innailaihi Raji\'Uun', NULL, 10, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(145, 'B052', 'Shaleh Ritual Saleh Sosial', NULL, 10, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(146, 'B053', 'Obati Kankermu Dengan Mukjizat', NULL, 10, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(147, 'B054', 'Aktivitas Ilmu Laduni', NULL, 10, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(148, 'B055', 'Raih 5 Mukjizat Setiap Hari', NULL, 10, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(149, 'B056', 'Buku Pintar Ahli Ibadah', NULL, 10, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(150, 'B057', 'Puasa Bersama Rosulullah S.A.W', NULL, 10, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(151, 'B058', 'Cara Rosulullah Memperlakukan Wanita', NULL, 10, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(152, 'B059', 'Haji & Umrah', NULL, 10, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(153, 'B060', 'Panduan Ibadah Musafir', NULL, 10, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(154, 'B061', 'Larangan Berjilbab', NULL, 10, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(155, 'B062', 'Slamic Green Living', NULL, 10, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(156, 'B063', 'Bertangga Dan Bermasyarakat Dalam Islam', NULL, 10, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(157, 'B064', 'Surat Kepada Penguasa', NULL, 10, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(158, 'B065', 'Kearifan Al-Qur\'An', NULL, 10, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(159, 'B066', 'Dialog Islam Kristen', NULL, 10, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(160, 'B067', 'Syamsul Ma\'Arif', NULL, 10, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(161, 'B068', 'Fadhilah Amal', NULL, 10, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(162, 'B069', 'Menuju Negeri Keabadian', NULL, 10, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(163, 'B070', 'Islam Tanpa Ekstrimisme', NULL, 10, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(164, 'B071', 'Tasawuf Islam & Akhlak', NULL, 10, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(165, 'B072', 'Syiah Agama Kedustaan', NULL, 10, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(166, 'B073', 'Menggapai Lailatul Qadr', NULL, 10, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(167, 'B074', 'Ridha', NULL, 10, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(168, 'B075', 'Akibat-Akibat Fatal Meremehkan Sholat Taubat', NULL, 10, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(169, 'B076', 'Misteri Banjir Perahu Nuh', NULL, 10, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(170, 'B077', 'Fiqih Perempuan', NULL, 10, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(171, 'B078', 'Islam Yang Produktif', NULL, 10, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(172, 'B079', 'Keajaiban Bangun Pagi', NULL, 10, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(173, 'B080', 'Religious Studies', NULL, 10, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(174, 'B081', 'Mukjizat Doa & Air Mata Ibu', NULL, 10, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(175, 'B082', 'Fikih Muamalah Kontemporer', NULL, 10, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(176, 'B083', 'Bid\'Ah Hasanah', NULL, 10, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(177, 'B084', '400 Kebiasaan Keliru Dalam Hidup Muslim', NULL, 10, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(178, 'B085', 'Agama Cinta', NULL, 10, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(179, 'B086', 'Sihir', NULL, 10, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(180, 'B087', 'Tangan Diatas Lebih Baik Dari Tangan Dibawah', NULL, 10, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(181, 'B088', 'Rahasia Kedahsyatan Asmaul Husna', NULL, 10, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(182, 'B089', 'Memenuhi Hak Sang Kekasih', NULL, 10, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(183, 'B090', 'Islam Bukan Hanya Teriak \"Allahu Akbar\"', NULL, 10, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(184, 'B091', 'Mukjizat 7 Sunah Nabiyangsuper Dahsyat', NULL, 10, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(185, 'B092', 'Tafsir Mimpi', NULL, 10, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(186, 'B093', 'Kumpulan Dalil Dalil Quran Dan Hadits', NULL, 10, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(187, 'B094', 'Daqaiqul Akhbar', NULL, 10, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(188, 'B095', 'Ngaji Diri', NULL, 10, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(189, 'B096', 'Tuhan Maha Asyik', NULL, 10, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(190, 'B097', 'Tuhan Maha Asyik 2', NULL, 10, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(191, 'B098', 'Pahami Sebelum Sesali', NULL, 10, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(192, 'B099', 'Seni Merayu Tuhan', NULL, 10, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(193, 'B100', 'Membumikan Hukum Islam Melalui Maqosid Syariah', NULL, 10, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(194, 'B101', 'Semua Ada Saatnya', NULL, 10, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(195, 'B102', 'Qiroah Mubadalah', NULL, 10, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(196, 'B103', 'The Amazing Shalawat', NULL, 10, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(197, 'B104', 'One Day One Juz', NULL, 10, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(198, 'B105', 'Menuju Keluarga Hafidzul Qur\'An', NULL, 10, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(199, 'B106', 'Rahasia Pnciptaan Alam Semesta & Makhluk Hidup', NULL, 10, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(200, 'B107', 'Tasawuf Dan Perkembangannya Dalam Islam', NULL, 10, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(201, 'B108', 'Islam & Kebhinekaan', NULL, 10, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(202, 'B109', 'Menyelami Seluk Beluk Makrifat', NULL, 10, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(203, 'B110', 'Ushul Fiqh', NULL, 10, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(204, 'B111', 'Terjemah Hadist Mengenai Pribadi & Budi Pekerti', NULL, 10, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(205, 'B112', 'Buku Pedoman Shalat Wajib & Sunnah', NULL, 10, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(206, 'B113', 'Ahlusunnah Waljamaah Fiqih & Landasan Amaliyah', NULL, 10, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(207, 'B114', 'Ahlusunnah Waljamaah Islam Wasathiyah,Tasamuh,Cinta Damai', NULL, 10, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(208, 'B115', 'Asy-Syamail Al-Muhammadiyah', NULL, 10, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(209, 'B116', 'Pengantar Ushul Fiqh & Qowaidul Fiqhiyyah', NULL, 10, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(210, 'B117', 'Kaidah Ushul Fiqh', NULL, 10, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(211, 'B118', 'Belajar Cepat & Mudah Terjemah Al-Quran Metode An-Nashr', NULL, 10, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(212, 'B119', 'Panduan Lengkap Do\'A Untuk Muslimah', NULL, 10, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(213, 'B120', 'Buku Saku Iman Dan Islam', NULL, 10, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(214, 'B121', 'Sunni & Wahhabi', NULL, 10, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(215, 'B122', 'Dalil Dalil Amaliyah', NULL, 10, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(216, 'B123', 'Psikologi Islam', NULL, 10, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(217, 'B124', 'Tuhan Ada Dihatimu', NULL, 10, 1, 1, NULL, NULL, 1, 2, NULL, NULL, NULL, '2026-11-03 08:26:10'),
(218, 'B125', 'Jantu Cinta Kepada-Nya', NULL, 10, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(219, 'B126', 'Mati Sebelum Mati,Buka Kesadaran Hakiki', NULL, 10, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(220, 'C001', 'Paket-Paket Soal Psikotes Untuk CPNS Dan Siswa', NULL, 12, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(221, 'C002', 'Top Peringkat Satu UN SMP/MTs', NULL, 12, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(222, 'C003', 'Rpul Global Indonesia Dan Dunia', NULL, 12, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(223, 'C004', 'Filsafat Umum Akal Dan Hati', NULL, 12, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(224, 'C005', 'Ilmu Pendidikan Dalam Perspektif Islam', NULL, 12, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(225, 'C006', 'Perencanaan Pembelajaran', NULL, 12, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(226, 'C007', 'Filsafat Ilmu', NULL, 12, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(227, 'C008', 'Perancangan Sistem Informasi Dan Aplikasinya', NULL, 12, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(228, 'C009', 'Dasar-Dasar Logika', NULL, 12, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, '2026-11-03 08:18:50'),
(229, 'C010', 'Manajemen Sumber Daya Manusia', NULL, 12, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(230, 'C011', 'Pengantar Manajemen', NULL, 12, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(231, 'C012', 'Abc (Aneka Berhitung Cepat)', NULL, 12, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(232, 'C013', 'Filsafat Hukum Islam', NULL, 12, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(233, 'C014', 'Filsafat Dan Strategi Pendidikan M.Sjafei', NULL, 12, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(234, 'C015', 'Filsafat Ilmu Sebuah Pengantar Populer', NULL, 12, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(235, 'C016', 'Manajemen Pembelajaran', NULL, 12, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(236, 'C017', 'Analisis Kebijakan', NULL, 12, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(237, 'C018', 'Bimbingan Konseling', NULL, 12, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(238, 'C019', 'Filsafat Umum', NULL, 12, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(239, 'C020', 'Kiat Tembus Usm Dan Stan CPNS Depkeu', NULL, 12, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(240, 'C021', 'Panduan Lengkap Jarimatika', NULL, 12, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(241, 'C022', 'Filsafat Pendidikan Islam', NULL, 12, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(242, 'C023', 'Metodologi Hukum Islam', NULL, 12, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(243, 'C024', 'Sains Seru Seri 4 : Lingkungan', NULL, 12, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(244, 'C025', 'Sains Seru Seri 1 : Manusia', NULL, 12, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(245, 'C026', 'Manajemen Play Group & Taman Kanak-Kanak', NULL, 12, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(246, 'C027', 'Bank Soal Tbs & Tpa', NULL, 12, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(247, 'C028', '7 Tips Aplikasi Pakem', NULL, 12, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(248, 'C029', 'Pemikiran Islam Metodologis', NULL, 12, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(249, 'C030', 'Cara Mudah Belajar Filsafat', NULL, 12, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(250, 'C031', 'Bimbingan Menguasai TKU Dan TPA', NULL, 12, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(251, 'C032', 'Kalkulus', NULL, 12, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(252, 'C033', 'Percakapan Bahasa Inggris Bergambar', NULL, 12, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(253, 'C034', 'Cara Praktis Jago Matematika', NULL, 12, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(254, 'C035', 'Idola Matematika', NULL, 12, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(255, 'C036', 'Ekonomi Islam', NULL, 12, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(256, 'C037', 'Sains Seru  Seri : 5 Alam Semesta', NULL, 12, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(257, 'C038', 'Filsafat Pendidikan', NULL, 12, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(258, 'C039', 'Metode Penelitian Ekonomi Islam Muamalah', NULL, 12, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(259, 'C040', 'M.Y.O.B. Accounting Versi 8', NULL, 12, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(260, 'C041', 'Memahami Dasar-Dasar Ekonomi Islam', NULL, 12, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(261, 'C042', 'Prinsip-Prinsip Ekonomi', NULL, 12, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(262, 'C043', 'Pelatihan Tpa Dan Psikotes', NULL, 12, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(263, 'C044', 'Psikologi Umum', NULL, 12, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(264, 'C045', 'Sejarah Pendidikan Ekonomi Islam', NULL, 12, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(265, 'C046', 'Pengantar Ilmu Hukum', NULL, 12, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(266, 'C047', 'Manajemen Keuangan', NULL, 12, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(267, 'C048', 'Pendidikan Karakter Berbasis Nilai & Etika Di Sekolah', NULL, 12, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(268, 'C049', 'Keandalan Dan Sukses Sekretaris Perusahaan', NULL, 12, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(269, 'C050', 'Intisari Bahasa Indonesia', NULL, 12, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(270, 'C051', 'Step Up', NULL, 12, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(271, 'C052', 'Desain Pembelajaran', NULL, 12, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(272, 'C053', 'Soal -Soal Tes AKBID & AKPER', NULL, 12, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(273, 'C054', 'Hukum Cyberspace', NULL, 12, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(274, 'C055', 'Hukum Investasi Di Era Otonomi Daerah', NULL, 12, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(275, 'C056', 'Bank Soal Terkini', NULL, 12, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(276, 'C057', 'Pengantar Filsafat', NULL, 12, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(277, 'C058', 'Mengefektifkan Peran Birokrasi Untuk', NULL, 12, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(278, 'C059', 'Pedoman & Petunjuk Praktis Karya Tulis', NULL, 12, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(279, 'C060', 'Terpenjara Luka Lama', NULL, 12, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(280, 'C061', 'Mendidik Anak Seperti Rasul', NULL, 12, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(281, 'C062', 'Aplikasi ISO', NULL, 12, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(282, 'C063', 'Strategi Belajar Mengajar Praktis', NULL, 12, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(283, 'C064', 'Brainware Management', NULL, 12, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(284, 'C065', 'Hukum Sistem Ekonomi Islam', NULL, 12, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(285, 'C066', 'Psikologi Umum Dalam Lintasan Sejarah', NULL, 12, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(286, 'C067', 'Pembelajaran Bahasa Arab', NULL, 12, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(287, 'C068', 'Filsafat Pendidikan Islam', NULL, 12, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(288, 'C069', 'Dasar-Dasar Pendidikan Sosial', NULL, 12, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(289, 'C070', 'Buku Ajar Pendidikan Pancasila', NULL, 12, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(290, 'C071', '36 Jam Belajar Komputer Microsoft Office 2021', NULL, 12, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(291, 'C072', 'Buku Ajar Pendidikan Kewarganegaraan', NULL, 12, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(292, 'C073', 'Dasar-Dasar Hukum Acara Pidana', NULL, 12, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(293, 'C074', 'Evaluasi Pembelajaran Bahasa Arab', NULL, 12, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(294, 'C075', 'Buku Ajar Pendidikan Agama Islam', NULL, 12, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(295, 'C076', 'The Magic Of Big Thinking', NULL, 12, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(296, 'C077', 'English Time', NULL, 12, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(297, 'C078', 'Asas Asas Hukum Pidana Di Indonesia', NULL, 12, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(298, 'C079', 'Pengantar Akuntansi', NULL, 12, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(299, 'C080', 'Dunia Menurut Fisika', NULL, 12, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(300, 'C081', 'Digital Marketing Di Era 6.0', NULL, 12, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(301, 'C082', 'Perintis Bukan Pewaris', NULL, 12, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(302, 'C083', 'Secret Life Of Money', NULL, 12, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(303, 'C084', 'From Zero To Survive', NULL, 12, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(304, 'D001', 'La Tahzan', NULL, 7, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(305, 'D002', 'Semua Bisa Jadi Pengusaha', NULL, 7, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(306, 'D003', 'Boleh Gak Sih Ngarep ?', NULL, 7, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(307, 'D004', 'Undang Saja Allah', NULL, 7, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(308, 'D005', 'Sungguh Allah Menyapa Kita', NULL, 7, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(309, 'D006', 'Hanya 2 Menit', NULL, 7, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(310, 'D007', '3 Magic Memory For Musllim', NULL, 7, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(311, 'D008', '17 Strategi Jitu Sukses Kuliah Di Perguruan Tinggi', NULL, 7, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(312, 'D009', 'Ketika Guru Dan Siswa Saling Becermin', NULL, 7, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(313, 'D010', 'Matematika Ketidakpastian', NULL, 7, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(314, 'D011', 'Panduan Menjadi Remaja Percaya Diri', NULL, 7, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(315, 'D012', 'Kiat Mengatasi Gangguan Belajar', NULL, 7, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(316, 'D013', 'Kreatif Atau Mati', NULL, 7, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(317, 'D014', 'Hagakure The Wisdom Of Samurai', NULL, 7, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(318, 'D015', 'Selagi Nyawa Menyatu Di Raga', NULL, 7, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(319, 'D016', 'Ini Dia Dosa-Dosa Yang Buatmu Sulit Kerja', NULL, 7, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(320, 'D017', '25 Hari Menciptakan Pikiran Yang Lebih Kreatif Dan Kuat', NULL, 7, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(321, 'D018', 'Humor Guru Sufi', NULL, 7, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(322, 'D019', 'The Route Of Happiness', NULL, 7, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(323, 'D020', 'Think Rich You Will Get It Comes True', NULL, 7, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(324, 'D021', 'Change Your Life ! Charge Your Self !', NULL, 7, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(325, 'D022', 'Membangkitkan Energi Dari Self-Power', NULL, 7, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(326, 'D023', 'Kaya Duit Kaya Hati', NULL, 7, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(327, 'D024', 'Dicintai Allah Dirindukan Rosulullah', NULL, 7, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(328, 'D025', '4 Langkah Meraih Sukses', NULL, 7, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(329, 'D026', 'Jangan Lupa Bahagia', NULL, 7, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(330, 'D027', 'Free Your Life', NULL, 7, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(331, 'D028', 'The Mirror', NULL, 7, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(332, 'D029', 'Menumbuhkan Semangat Dan Rasa Percaya Diri', NULL, 7, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(333, 'D030', 'Si Penyebar Fitnah', NULL, 7, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(334, 'D031', 'Cara Mudah Memainkan Beragam Alat Musik', NULL, 7, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(335, 'D032', 'Right Brain', NULL, 7, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(336, 'D033', 'Open Your Heart Follow Your Prophet', NULL, 7, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(337, 'D034', 'Mutiara Hikmah', NULL, 7, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(338, 'D035', 'Asmaul Husna Untuk Nutrisi Otak Kanan Otak Kiri', NULL, 7, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(339, 'D036', 'Matematika Diri', NULL, 7, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(340, 'D037', 'Rahasia Melesitkan Daya Ingat', NULL, 7, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(341, 'D038', 'Propetich Learning', NULL, 7, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(342, 'D039', 'Tips & Trik Otak Tengah', NULL, 7, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(343, 'D040', 'Muda-Mudi Yang Dicintai Nabi', NULL, 7, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(344, 'D041', 'Lihatlah Aku!', NULL, 7, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(345, 'D042', 'Hari-Hari Paling Menyebalkan Dalam Hidupku', NULL, 7, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(346, 'D043', 'Allah Itu Nyata', NULL, 7, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(347, 'D044', 'Personality Plus', NULL, 7, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(348, 'D045', 'Komunikasi Ala Punakawan & Abu Nawas', NULL, 7, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(349, 'D046', 'How To Influence People', NULL, 7, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(350, 'D047', 'The Magic Of Picture', NULL, 7, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(351, 'D048', 'The Magic Of Connection', NULL, 7, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(352, 'D049', 'The Magic Of Love', NULL, 7, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(353, 'D050', 'What Got You Here', NULL, 7, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(354, 'D051', 'Always On Top', NULL, 7, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(355, 'D052', 'Puncak Rindu', NULL, 7, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(356, 'D053', 'Agar Hidup Lebih Baik', NULL, 7, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(357, 'D054', 'Menempuh Jalan Ke Surga', NULL, 7, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(358, 'D055', 'Menipu Setan', NULL, 7, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(359, 'D056', 'Trik Jitu Jual Diri', NULL, 7, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(360, 'D057', 'Ibadah Tanpa Beban', NULL, 7, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(361, 'D058', 'Find Your Diamond Here', NULL, 7, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(362, 'D059', 'Petaka Membawa Hikmah', NULL, 7, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(363, 'D060', 'Kisah Keajaiban Pengamal Tahajud, Duha & Puasa', NULL, 7, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(364, 'D061', 'Petuah Bijak 2', NULL, 7, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(365, 'D062', 'The Achiever', NULL, 7, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(366, 'D063', 'The Power Of Akhlak', NULL, 7, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(367, 'D064', 'The Best Advices Of Sayyidina Ali For Leader', NULL, 7, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(368, 'D065', 'Meet & Grow Rich', NULL, 7, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(369, 'D066', 'The Paradox Of Excellence', NULL, 7, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(370, 'D067', 'Mindset', NULL, 7, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(371, 'D068', 'Entrepreneur Ship', NULL, 7, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(372, 'D069', 'The Power Of Planning', NULL, 7, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(373, 'D070', 'Kiat Praktis Public Speaking', NULL, 7, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(374, 'D071', 'Pesan Cinta Mbah Moen', NULL, 7, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, '2026-11-04 08:11:08'),
(375, 'D072', 'The Meaningful Life With Rumi', NULL, 7, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(376, 'D073', 'Atomic Habits', NULL, 7, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(377, 'D074', 'Malas Tapi Sukses', NULL, 7, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(378, 'D075', 'Guru Muslim Abad 21', NULL, 7, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(379, 'D076', 'Menyelami Bacaan Sholat', NULL, 7, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(380, 'D077', 'Pejuang Gelar', NULL, 7, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(381, 'D078', 'Gendeng Ways 212', NULL, 7, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(382, 'D079', 'Berjuta Jalan Menggapai Pertolongan Allah', NULL, 7, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(383, 'D080', 'Baper', NULL, 7, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(384, 'D081', 'Bersama Cahaya', NULL, 7, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(385, 'D082', 'Jarrib!', NULL, 7, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(386, 'D083', 'Awas!! Bahagia', NULL, 7, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(387, 'D084', 'Spiritual Enlightenment', NULL, 7, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(388, 'D085', 'Rosulullah', NULL, 7, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(389, 'D086', 'Motivasi Pengubah Gaya Berpikirmu', NULL, 7, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(390, 'D087', 'Munajat Ramadan', NULL, 7, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(391, 'D088', 'Bingkai Kasih Khazanah Jiwa', NULL, 7, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(392, 'D089', 'Super Wife Super Mom Super Woman', NULL, 7, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(393, 'D090', 'Karena Hidup Hanyalah Sebuah Persinggahan', NULL, 7, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(394, 'D091', 'Manusia Mulia', NULL, 7, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(395, 'D092', 'Lulus Kuliah Dengan Bismilllah', NULL, 7, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(396, 'D093', 'Kaukah Takdir Jodohku', NULL, 7, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(397, 'D094', 'Mess', NULL, 7, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(398, 'D095', 'Aku Jomblo Super', NULL, 7, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(399, 'D096', 'Hari Gini Masih Galau?!', NULL, 7, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(400, 'D097', 'I Want & Can', NULL, 7, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(401, 'D098', 'Naluri Bejo Ada Dalam Dirimu', NULL, 7, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(402, 'D099', 'Menihkahlah Agar Engkau Kaya', NULL, 7, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(403, 'D100', 'Belajarlah Kepada Lalat Dan Lebah', NULL, 7, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(404, 'D101', 'Cara Gila Membangun Kerajaan Bisnis', NULL, 7, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(405, 'D102', 'Pembangunan Masyarakat', NULL, 7, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(406, 'D103', 'Superhandbook', NULL, 7, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(407, 'D104', 'Spirit Of Life', NULL, 7, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(408, 'D105', 'Belajar Keagungan Tuhan Dari Alam', NULL, 7, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(409, 'D106', 'Jangan Berhenti Mencoba', NULL, 7, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(410, 'D107', 'Innallaaha Ma\'Anaa', NULL, 7, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(411, 'D108', 'Tharatul Qulub', NULL, 7, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(412, 'D109', 'Ada Yang Salah Dengan Hidupku', NULL, 7, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(413, 'D110', 'Muslim 4.0', NULL, 7, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(414, 'D111', 'Adabud Dunya Wad Din', NULL, 7, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(415, 'D112', 'Semesta Matsnawi', NULL, 7, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(416, 'D113', 'Berjuang Di Tengah Pandemi', NULL, 7, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(417, 'D114', 'Art Of Dakwah', NULL, 7, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(418, 'D115', 'Udah Putusin Aja', NULL, 7, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(419, 'D116', 'Beyond The Inspiration', NULL, 7, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(420, 'D117', 'Berani Tidak Disukai', NULL, 7, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(421, 'D118', 'Belajar Dengan Otak Kanan', NULL, 7, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(422, 'D119', 'Untuk Indonesia', NULL, 7, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(423, 'D120', 'Dari Biasamenjadi Luar Biasa', NULL, 7, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(424, 'D121', 'Hidup Bahagia Tanpa Keluh Kesah', NULL, 7, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(425, 'D122', 'Bisakah Aku Yang Pelupa Memili Ingatan Super', NULL, 7, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(426, 'D123', 'Self Healing', NULL, 7, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(427, 'D124', 'Passage Into Silence', NULL, 7, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(428, 'D125', 'Samudra Rubaiyat Menyelami Pesona Magis Dan Rindu', NULL, 7, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(429, 'D126', 'Matahari Diwan Syams Tabrizi', NULL, 7, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(430, 'D127', 'Bisnis Modal 10 Jutaan', NULL, 7, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(431, 'D128', 'General Psykologi', NULL, 7, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(432, 'D129', 'Filosofi Teras', NULL, 7, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(433, 'D130', 'Kalau Bisa Sekarang', NULL, 7, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(434, 'D131', 'Barasyik Asik Dahulu', NULL, 7, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(435, 'D132', 'Maaf Tuhan Aku Hampir', NULL, 7, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(436, 'D133', '100+1 Cara Bahagia', NULL, 7, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(437, 'D134', 'Semua Orang Sedang Berjuang Dengan Ujiannya Masing-Masing', NULL, 7, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(438, 'D135', 'Kita Hidup Hanya 3 Hari', NULL, 7, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(439, 'D136', 'Nanti Juga Terbiasa', NULL, 7, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(440, 'D137', 'Karena Tuhan Sesayang Itu', NULL, 7, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(441, 'D138', 'Kamu Itu Hebat', NULL, 7, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(442, 'D139', 'Think And Grow Rich', NULL, 7, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(443, 'D140', 'Pasir Buih', NULL, 7, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(444, 'D141', 'Dna Sukses Mulia', NULL, 7, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(445, 'D142', 'Sebuah Seni Berserah Diri', NULL, 7, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(446, 'D143', 'Trauma & Expectation', NULL, 7, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(447, 'D144', 'Your Life', NULL, 7, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(448, 'D145', 'Ini Cuma Dunia', NULL, 7, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(449, 'D146', 'Take Your Time Change Your Life', NULL, 7, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(450, 'D147', 'Idiot Brain', NULL, 7, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(451, 'D148', 'Temukan Dirimu Di Sisi Lain Dunia', NULL, 7, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(452, 'D149', 'Jika Kita Tak Pernah Jatuh Cinta', NULL, 7, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(453, 'D150', 'Kita Perlu Jeda Untuk Sembuh Dari Luka', NULL, 7, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(454, 'D151', 'Nanti Juga Sembuh Sendiri', NULL, 7, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(455, 'D152', 'Santai Saja Ini Hanyalah Dunia', NULL, 7, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(456, 'D153', 'Pamit Ini Untukmu', NULL, 7, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(457, 'D154', 'Terapi Menguasai Rasa Marah', NULL, 7, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(458, 'D155', 'Beresin Dulu Hidupmu', NULL, 7, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(459, 'D156', 'Rahasia Keberhasilan Bisnis Ala Khadijah', NULL, 7, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(460, 'D157', 'Seni Bahagia Menjadi Introver', NULL, 7, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(461, 'D158', 'Seribu Teman Kurang Satu Musuh Kebanyakan', NULL, 7, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(462, 'D159', 'Kaya & Bahagia Sepanjang Masa', NULL, 7, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(463, 'D160', 'Sukses Sebelum Usia 30', NULL, 7, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(464, 'D161', 'Komunikasi Itu Ada Seninya', NULL, 7, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(465, 'D162', 'Pilih Untuk Pulih', NULL, 7, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(466, 'D163', 'Belajar Merelakan', NULL, 7, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(467, 'D164', 'Untuk Kamu Yg Berani Menjadi Lebih Baik', NULL, 7, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(468, 'D165', 'Tenang', NULL, 7, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(469, 'D166', 'Power Robert Greene', NULL, 7, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(470, 'D167', 'Filosofi Teras', NULL, 7, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(471, 'D168', 'Makanya,Mikir', NULL, 7, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(472, 'D169', 'Tak Ada Masalah Berat', NULL, 7, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(473, 'D170', 'Pendosa Yang Merindukan Tuhan', NULL, 7, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(474, 'E001', 'Kamus Pintar Obat Herbal', NULL, 5, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(475, 'E002', 'Buku Pintar Adat Perkawinan Nusantara', NULL, 5, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(476, 'E003', 'Pilihan-Pilihan Kreasi Ruang Tamu & Ruang Keluarga', NULL, 5, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(477, 'E004', 'Aneka Kreasi Desain Internet Khusus Rumah Bebas Gebyok', NULL, 5, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(478, 'E005', 'Women Indonesia Society', NULL, 5, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(479, 'E006', 'Ensiklopedi Keajaiban Manusia Alam Semesta', NULL, 5, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(480, 'E008', 'Manufacturing Hope Bisa', NULL, 5, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(481, 'E009', 'Strategi Belajar Mengajar', NULL, 5, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(482, 'E010', 'Gagasan Bagi Pembangunan Berkelanjutan Di Indonesia', NULL, 5, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(483, 'E011', 'Benarkah Bumi Itu Datar ?', NULL, 5, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(484, 'E012', 'Imagologi', NULL, 5, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(485, 'E013', 'Perjalanan Panjang Tnanaman Indonesia', NULL, 5, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(486, 'E014', 'Robot Vision', NULL, 5, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(487, 'E015', 'Aipac', NULL, 5, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(488, 'E016', 'Etika', NULL, 5, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(489, 'E017', 'Virus Liberalisme Di Perguruan Tinggi Islam', NULL, 5, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(490, 'E018', 'Tips Membuat Anak Rajin, Suka, Dan Pintar Mengerjakan Pr', NULL, 5, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(491, 'E019', 'Kaya & Bahagia Sepanjang Masa', NULL, 5, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(492, 'E020', 'Membuka Pintu Langit', NULL, 5, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(493, 'E021', 'Rahasia Sehat Bersama Madu Lebah', NULL, 5, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(494, 'E022', 'Teologi Kerukunan Mencari Titik Temu Dalam Keragaman', NULL, 5, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(495, 'E023', 'Dasar-Dasar Advertiasing', NULL, 5, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(496, 'E024', 'Menyiapkan Kecerdasan Matematika Anak Sejak Dalam Kandungan', NULL, 5, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(497, 'E025', 'The Mafia\'S Greatest Hits', NULL, 5, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(498, 'E026', 'Hal-Hal Jorok Dan Menjijikkan Disekitarmu!', NULL, 5, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(499, 'E027', 'Tertawalah Biar Sehat', NULL, 5, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(500, 'E028', 'Kiat-Kiat Menegur Orang Lain', NULL, 5, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(501, 'E029', 'Fun Outbond', NULL, 5, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL);
INSERT INTO `books` (`id`, `kode_buku`, `judul`, `isbn`, `category_id`, `publisher_id`, `author_id`, `shelf_id`, `tahun_terbit`, `jumlah`, `tersedia`, `cover`, `deskripsi`, `created_at`, `updated_at`) VALUES
(502, 'E030', 'Ragam Menu Sehat Ubtuk Penderita Penyakit Ginjal', NULL, 5, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(503, 'E031', 'Buku Pintar Anak Band', NULL, 5, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(504, 'E032', 'Mengungkap Gizi-Gizi Sehat Internet', NULL, 5, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(505, 'E033', 'Mengapa Ya Anakku Suka Berbohong', NULL, 5, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(506, 'E034', 'Mengapa Anakku Malas Belajar Ya...?', NULL, 5, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(507, 'E035', 'Cara Pintar Mengelola Uang Pesangon Agar Sukses Dan Kaya', NULL, 5, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(508, 'E036', 'Duit Ngalir Bak Banjir Dengan Internet', NULL, 5, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(509, 'E037', 'Imperialisme Baru', NULL, 5, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(510, 'E038', 'Wajah Baru Perang Salib', NULL, 5, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(511, 'E039', 'Miliaran Keluarbiasaan Otak Kita', NULL, 5, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(512, 'E040', 'Konspirasi Yahudi', NULL, 5, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(513, 'E041', 'Petuah-Petuah Bijak Para Leluhur Nusantara Seputar Perkawinan', NULL, 5, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(514, 'E042', 'Total Quality Management In Education', NULL, 5, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(515, 'E043', 'Pengetahuan Praktis Ragam Penyakit Mamatikan Yang Paling Sering Menyerang Kita', NULL, 5, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(516, 'E044', 'Pintar Tanpa Payah', NULL, 5, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(517, 'E045', 'Peta Lengkap Wisata Kuliner Di Semarang', NULL, 5, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(518, 'E046', 'Cara Gila Membeli Properti Dengan Modal Seminim-Minimnya', NULL, 5, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(519, 'E047', 'Dampak Hebat Emosi Bagi Kesehatan', NULL, 5, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(520, 'E048', 'Jangan Suka Marah', NULL, 5, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(521, 'E049', 'Kesalahan-Kesalahan Pola Makan Pemicu Seabrek Penyakit', NULL, 5, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(522, 'E050', 'Jam Piket Organ Tubuh Manusia', NULL, 5, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(523, 'E051', 'Jejak-Jejak Nyata Ameerika Mengobok-Obok Wajah Dunia', NULL, 5, 1, 1, NULL, NULL, 1, 2, NULL, NULL, NULL, '2026-10-28 09:32:29'),
(524, 'E052', 'Membuat Anak Cinta Matematika Dan Eksak Lainnya', NULL, 5, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(525, 'E054', '9 Strategi Jitu Menjadi Pembicara Dadakan', NULL, 5, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(526, 'E055', 'Bisa Banget Kok Hidup Sehat Tanpa Obat', NULL, 5, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(527, 'E056', 'Segitiga Tragedi Tanah Palestina', NULL, 5, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(528, 'E057', 'Komunitas-Komunitas Ekstrem Di Dunia', NULL, 5, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(529, 'E058', 'Buku Pintar Bahasa Tubuh Untuk Guru', NULL, 5, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(530, 'E059', 'Lebih Dalam Tentang Indra Keenam Manusia', NULL, 5, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(531, 'E060', 'Khasiat Selangit Air Putih, Air Kelapa, Manggis & Sirsak', NULL, 5, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(532, 'E061', 'Kekerasan Negara Menular Ke Masyarakat', NULL, 5, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(533, 'E062', 'Jurus-Jurus Sakti Memperbaiki Dan Memodifikasi Hp', NULL, 5, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(534, 'E063', '101+ Fakta Unik Dam Momem Terheboh Piala Dunia', NULL, 5, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(535, 'E064', 'Demokrasi Keintiman', NULL, 5, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(536, 'E065', 'Model Kepemimpinan Kepala Madrasah', NULL, 5, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(537, 'E066', 'Top Bak Artis Beken Dengan Facebook', NULL, 5, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(538, 'E067', 'Aplikasi Teori Pembelajaran Motorik', NULL, 5, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(539, 'E068', 'Berdo\'A Ataukah Menyuruh Tuhan', NULL, 5, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(540, 'E069', 'Segenggam Iman Anak Kita', NULL, 5, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(541, 'E070', 'Kenali Calon Pasanganmu', NULL, 5, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(542, 'E071', 'Konflik Nelayan', NULL, 5, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(543, 'E072', 'Penemuan-Penemuan Spektakuler', NULL, 5, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(544, 'E073', 'Membungkam Kicauan Liberal', NULL, 5, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(545, 'E074', 'Tempat Wisata Anak', NULL, 5, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(546, 'E075', 'Jago Shortcut Presentasi Powerpoint 2007', NULL, 5, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(547, 'E076', 'Met Ultah Sayang', NULL, 5, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(548, 'E077', 'Peta Lengkap Wisata Kuliner Di Surabaya', NULL, 5, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(549, 'E078', 'Berbagai Tujuan Wisata Alam Pilihan Eksotis Nusantara', NULL, 5, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(550, 'E079', 'Kiat Sukses Mencari Kerja', NULL, 5, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(551, 'E080', 'Cara Cerdas Menjawab Job Interview', NULL, 5, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(552, 'E081', 'Master Mentalis Teknik-Teknik Permainan Mentalis Terpopuler', NULL, 5, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(553, 'E083', 'Wisata Masjid Tua Di Jakarta', NULL, 5, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(554, 'E084', 'Terimakasih Tuhan Aku Melahirkan Normal', NULL, 5, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(555, 'E085', 'Bapak Tionghoa Nusantara', NULL, 5, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(556, 'E086', '77 Kesalahan', NULL, 5, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(557, 'E088', 'Blockcoin', NULL, 5, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(558, 'E089', 'Bitcoin Mining', NULL, 5, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(559, 'E090', 'Bitcoin Trading For 2 Generation', NULL, 5, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(560, 'E091', 'Misteri Otak Kanan Manusia', NULL, 5, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(561, 'E092', '200 Rekor Menakjubkan', NULL, 5, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(562, 'E093', 'Global Chaser', NULL, 5, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(563, 'E094', 'Soul Traders', NULL, 5, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(564, 'E095', 'The End Of The World', NULL, 5, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(565, 'E096', 'Kerja, Kerja, Kerja', NULL, 5, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(566, 'E097', 'The Nokia Revolution', NULL, 5, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(567, 'E098', 'The Sony Way', NULL, 5, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(568, 'E099', 'Execution Premium', NULL, 5, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(569, 'E100', 'From One Dollar To Brillion', NULL, 5, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(570, 'E101', 'Garam Kekerasan Dan Aduan Sapi', NULL, 5, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(571, 'E102', '1 Menit Belajar Bikin Web/Blog', NULL, 5, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(572, 'E103', '3 Menit Belajar Chatting', NULL, 5, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(573, 'E104', 'Goes To Pesantren', NULL, 5, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(574, 'E105', 'Padi', NULL, 5, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(575, 'E106', 'Wanita & Media Massa', NULL, 5, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(576, 'E107', 'Panduan Lengkap Windows 8', NULL, 5, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(577, 'E108', 'Perpustakaan & Buku', NULL, 5, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(578, 'E109', 'Rahasia Penjualan Zen', NULL, 5, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(579, 'E110', 'Membincangkan Televisi', NULL, 5, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(580, 'E111', 'Kontroversi Bisnis', NULL, 5, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(581, 'E112', 'Mengapa Kita (Belum) Cinta Laut?', NULL, 5, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(582, 'E113', 'Sukses Keluarga Mendidik Balita', NULL, 5, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(583, 'E114', 'Belajar Cepat Office 2010', NULL, 5, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(584, 'E115', 'Blogspot', NULL, 5, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(585, 'E116', 'Mengolah Dokumen Perkantoran', NULL, 5, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(586, 'E117', 'Panduan Internet Untuk Pemula', NULL, 5, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(587, 'E118', 'Certified Ethical Hacker', NULL, 5, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(588, 'E119', 'Kali Linux', NULL, 5, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(589, 'E120', 'Mudah Belajar Php', NULL, 5, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(590, 'E121', 'Belajar Otodidak Pemograman', NULL, 5, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(591, 'E122', 'Sains Modern', NULL, 5, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(592, 'E123', '72 Trik Membaca Karakter', NULL, 5, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(593, 'E124', 'Psikologi Positif', NULL, 5, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(594, 'E125', 'Membangun Entrepreneur Indonesia', NULL, 5, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(595, 'E126', 'China Membeli Dunia', NULL, 5, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(596, 'E127', 'Update Paling Lengkap Semua Jenis Pertanyaan', NULL, 5, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(597, 'E128', 'Hukum Perceraian Untuk Wanita Islam', NULL, 5, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(598, 'E129', 'Kenapa Harus Bumd ???', NULL, 5, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(599, 'E130', 'Adat Berdaulat Melawan Serbuan Kapitalisme', NULL, 5, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(600, 'E131', 'Pr Corner', NULL, 5, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(601, 'E132', 'Chevronomics', NULL, 5, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(602, 'E133', 'Dari Akar Kami Tumbuh', NULL, 5, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(603, 'E134', '101 Anak Jenius Di Dunia', NULL, 5, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(604, 'E135', 'Iblis - Iblis Wanita Hitler', NULL, 5, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(605, 'E136', 'Get Your Love', NULL, 5, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(606, 'E137', 'Membantah Atlantas', NULL, 5, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(607, 'E138', 'Pendulum Galileo', NULL, 5, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(608, 'E139', 'Visi Kepemimpinan Masyarakat Madani', NULL, 5, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(609, 'E140', 'Mengenal Dan Mengelola Perpustakaan', NULL, 5, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(610, 'E141', 'Parenting Sharing', NULL, 5, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(611, 'E142', 'Dasar - Dasar Dakwah Islam', NULL, 5, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(612, 'E143', 'Bagaimana Kita Meningkatkan Harga Diri Anak', NULL, 5, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(613, 'E144', 'Agnostisisme', NULL, 5, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(614, 'E145', 'Terapi Mengendalikan Pikiran Dan Hormon', NULL, 5, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(615, 'E146', 'Bicara Itu Ada Seninya', NULL, 5, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(616, 'E147', 'Pemasaran Online', NULL, 5, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(617, 'E148', 'Obat-Obat Sederhana Untuk Kesehatan Sehari-Hari', NULL, 5, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(618, 'E149', '123 Tips Simple Menjual Lebih Cepat', NULL, 5, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(619, 'E150', 'Buku Ajar Dendrologi', NULL, 5, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(620, 'E151', 'Dasar-Dasar Marketing Untuk Mahasiswa & Umum', NULL, 5, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(621, 'E152', 'Perkuat Jantung,Tulang Dan Ginjal', NULL, 5, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(622, 'E153', 'Cara Tepat Berdebat Secara Cerdas', NULL, 5, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(623, 'E154', 'Seni Negosiasi Superior', NULL, 5, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(624, 'E155', 'Marketing Plan Dalam Bisnis', NULL, 5, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(625, 'E156', 'Kamus Ilmiah Populer Internasional', NULL, 5, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(626, 'E157', 'Solusi Praktis Agar Awet Muda', NULL, 5, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(627, 'E158', 'Ber Opini Lah', NULL, 5, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(628, 'E159', 'Seni Membangun Relasi', NULL, 5, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, '2026-11-02 07:58:05'),
(629, 'E160', 'Filsafat Untuk Pemalas', NULL, 5, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(630, 'E161', 'Membaca Wajah Orang', NULL, 5, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(631, 'E162', 'Filsafat Moral', NULL, 5, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, '2026-11-06 08:19:50'),
(632, 'E163', 'Filsafat Kebahagiaan', NULL, 5, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(633, 'E164', 'Al-Farabi', NULL, 5, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(634, 'E165', 'The Psychology Of Change', NULL, 5, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(635, 'E166', 'The Psychology Of Money', NULL, 5, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(636, 'E167', 'Menjadi Kaya Versi Kamu Sendiri', NULL, 5, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(637, 'E168', 'Jurnalisme Dasar', NULL, 5, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(638, 'E169', 'Personal Branding', NULL, 5, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(639, 'F001', 'Sejarah Terlengkap Peradaban Islam', NULL, 3, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(640, 'F002', 'Sejarah Dan Kebudayaan Islam Periode Klasik (Abad Vii-Xiii M)', NULL, 3, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(641, 'F003', 'Atlas Wali Songo', NULL, 3, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(642, 'F004', 'Rihlah Semesta', NULL, 3, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(643, 'F005', 'Catatan Hitam Lima Presiden Indonesia', NULL, 3, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(644, 'F006', 'Sejarah Islam Di Nusantara', NULL, 3, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(645, 'F007', 'Kamus Sejarah Dan Budaya Indonesia', NULL, 3, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(646, 'F008', 'Sejarah Pemikiran Barat', NULL, 3, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(647, 'F009', 'Kraton Surakarta', NULL, 3, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(648, 'F010', 'The Fall Of The Khilafah', NULL, 3, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(649, 'F011', 'Nusantara Sejarah Indonesia', NULL, 3, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(650, 'F012', 'Dinasti Qing', NULL, 3, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(651, 'F013', 'Percikan Filsafat Sejarah Dan Peradaban Islam', NULL, 3, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(652, 'F014', 'Bungkarno Difitnah', NULL, 3, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(653, 'F015', 'Bermuka Dua', NULL, 3, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(654, 'F016', 'Perang-Perang Dalam Sejarah Islam', NULL, 3, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(655, 'F017', 'Sejarah Islam Yang Terlupakan', NULL, 3, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(656, 'F018', 'Reorientasi Wawasan Sejarah Islam', NULL, 3, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(657, 'F019', 'Kh. M. Kholil Bangkalan', NULL, 3, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(658, 'F020', 'Sejarah Isis Dan Illuminati', NULL, 3, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(659, 'F021', 'Sejarah Berdarah Sekte Salafi Wahabi', NULL, 3, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(660, 'F022', 'Sulawesi Selatan', NULL, 3, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(661, 'F023', 'Migrasi & Orang Bugis', NULL, 3, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(662, 'F024', 'Sejarah Agama Jawa', NULL, 3, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(663, 'F025', 'Akar Sejarah Etika Pesantren', NULL, 3, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(664, 'F026', 'Sejarah Umat Islam', NULL, 3, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(665, 'F027', 'Knpi & Pemuda Harapan Bangsa', NULL, 3, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(666, 'F028', 'Ensiklopedia Masjid', NULL, 3, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(667, 'F029', 'Sejarah Pembangunan Kuhp & Kuhap', NULL, 3, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(668, 'F030', 'Auman Terakhir Macan Tamil', NULL, 3, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(669, 'F031', 'Tempat Persembunyian Yahudi Di Akhir Zaman', NULL, 3, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(670, 'F032', 'Orang - Orang Yang Mempengaruhi Dunia Islam', NULL, 3, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(671, 'F033', 'Sapiens', NULL, 3, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(672, 'F034', 'Muhammad Al Fatih', NULL, 3, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(673, 'F035', 'Kepurbakalaan Islam Nusantara', NULL, 3, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(674, 'F036', '5 Khalifah Kebanggan Islam', NULL, 3, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(675, 'F037', 'Sajarah Dunia Yang Disembunyikan', NULL, 3, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(676, 'F038', 'Pergulatan Demokrasi 1950 - 1956', NULL, 3, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(677, 'F039', 'Sukarno', NULL, 3, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(678, 'F040', 'The Hidden History', NULL, 3, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(679, 'F041', 'Mitologi Dunia', NULL, 3, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(680, 'F042', 'Sejarah Nusantara', NULL, 3, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(681, 'F043', 'Zulkarnain Agung', NULL, 3, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(682, 'F044', 'Babad Tanah Jawa', NULL, 3, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(683, 'F045', 'Menemukan Kembali', NULL, 3, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(684, 'F046', 'Strategi Kebudayaan Nu', NULL, 3, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(685, 'F047', 'Intisari Sirah Nabawiyah', NULL, 3, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(686, 'F048', '108 Ilmuan & Penemu Dunia', NULL, 3, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(687, 'F049', 'Kuasa Rakyat Merdeka', NULL, 3, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(688, 'F050', 'Asal Usul Benda Disekitar Kita Tempo Doeloe', NULL, 3, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(689, 'F051', 'Momen-Momen Menentukan Dalam Sejarah Islam', NULL, 3, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(690, 'F052', 'Menanti Imam Mahdi', NULL, 3, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(691, 'F053', 'Kisah-Kisah Unik Waliyullah Ditanah Jawa', NULL, 3, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(692, 'F054', 'Pengantar Sejarah Patani', NULL, 3, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(693, 'F055', 'Hysory Of The Malay Kingdom Of Patani', NULL, 3, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(694, 'F056', 'Hikayat Patani', NULL, 3, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(695, 'F057', 'Negara Patani Darussalam', NULL, 3, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(696, 'F058', 'Perjuangan Muslim Patani', NULL, 3, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(697, 'F059', 'Hikayat Patani', NULL, 3, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(698, 'F060', 'Fatani 13 Ogos', NULL, 3, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(699, 'F061', 'Majapahit', NULL, 3, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(700, 'F062', 'Banjir Besar Zaman Nabi Nuh', NULL, 3, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(701, 'G001', 'Kamus Besar Bahasa Indonesia Pusat Bahasa', NULL, 11, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(702, 'G002', 'English Gremmar', NULL, 11, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(703, 'G003', 'Kamus Pintar Agama Islam', NULL, 11, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(704, 'G004', 'Seni Rupa Modern', NULL, 11, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(705, 'G005', 'Fundamentalis English Grammar', NULL, 11, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(706, 'G006', 'Kumpulan Puisi Kasidah Air Mata', NULL, 11, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(707, 'G007', 'Panduan Terlengkap Puebi', NULL, 11, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(708, 'G008', 'Kamus Peribahsa', NULL, 11, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(709, 'G009', 'Kamus Istilah Agama Islam [Kiai]', NULL, 11, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(710, 'G010', 'Merupa Tanah Di Ujung Timur Jawa', NULL, 11, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(711, 'G011', 'Jurnalisme Dasar', NULL, 11, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(712, 'G012', 'Kamus Arab-Indonesia', NULL, 11, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(713, 'G013', 'Pada Masa Intoleransi', NULL, 11, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(714, 'G014', 'Tiga Bulan Tiga Bahasa', NULL, 11, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(715, 'G016', 'Kado Untuk Istriku', NULL, 11, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(716, 'G017', 'Strategi Dan Kiat Menerjemahkan Teks Bahasa Arab Kedalam Bahasaa Indonesia', NULL, 11, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(717, 'G019', 'Sukses Menjadi Penulis', NULL, 11, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(718, 'G020', 'Pintar Bahasa Perancis Dalam Sekejap', NULL, 11, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(719, 'G021', 'Cara Gampang Jadi Wartawan', NULL, 11, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(720, 'G022', 'Kamus Istilah Sastra', NULL, 11, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(721, 'G023', 'Aku Bisa Nulis Cerpen', NULL, 11, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(722, 'G024', 'Sosiologi Sastra', NULL, 11, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(723, 'G025', 'English Business Letters', NULL, 11, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(724, 'G026', 'Kagum Kepada Orang Indonesia', NULL, 11, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(725, 'G027', 'English Vocabulary', NULL, 11, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(726, 'G028', 'Izinkan Aku Mencintaimu Apa Adanya', NULL, 11, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(727, 'G029', 'Oxford', NULL, 11, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(728, 'G030', '15 Menit Lancar Berbahasa Inggris', NULL, 11, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(729, 'G031', 'Menggapai Bintang Dan Matahari', NULL, 11, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(730, 'G032', 'Dancing Rain', NULL, 11, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(731, 'G033', 'Rahasia Tersembunyi Dibawah Al Aqsa', NULL, 11, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(732, 'G034', 'Indonesia Unik Dan Langka', NULL, 11, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(733, 'G035', 'Ensiklopedi Wayang', NULL, 11, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(734, 'G036', 'Cepat Dan Mudah Kuasai Bahasa Arab', NULL, 11, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(735, 'G037', 'Semiliar Cinta Untuk Bunda', NULL, 11, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(736, 'G038', 'Chairil Anwar', NULL, 11, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(737, 'G039', 'Pintar Pantun Dan Puisi Peribahasa', NULL, 11, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(738, 'G040', 'Mahir Percakapan 3 Bahasa', NULL, 11, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(739, 'H001', '100 Kisah-Kisah Tokoh Besar', NULL, 4, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(740, 'H002', 'Muhammad Sang Nabi', NULL, 4, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(741, 'H003', 'Manunggaling Kawula Gusti', NULL, 4, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(742, 'H004', 'Bung Karno Panglima', NULL, 4, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(743, 'H005', 'Gus Dur', NULL, 4, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(744, 'H006', 'Waspadalah Putriku, Serigala Mengintaimu', NULL, 4, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(745, 'H007', 'Sang Zahid Mengarungi Sufisme Gus Dur', NULL, 4, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(746, 'H008', 'Syaikhona Kholil Bangkalan Penentu Berdirinya Nu', NULL, 4, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(747, 'H009', 'Wahid Hasyim', NULL, 4, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(748, 'H010', 'Personal Success Stopries Of Top 15 Indonesia Motivators', NULL, 4, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(749, 'H011', 'Kumpulan Legenda, Hikayat & Cerita Rakyat Nusantra', NULL, 4, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(750, 'H012', 'Dari Jakarta Menuju Gedung Putih', NULL, 4, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(751, 'H013', 'Mohammad Hatta Biografi Singkat 1902-1980', NULL, 4, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(752, 'H014', 'Kiyai Sastrawan Yang Tak Dikenal', NULL, 4, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(753, 'H015', 'Menyikapi Kehidupan Para Tokoh Sufi', NULL, 4, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(754, 'H016', 'Ajaran Dan Jalan Kematian Syekh Siti Jenar', NULL, 4, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(755, 'H017', 'Soekarno & China', NULL, 4, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(756, 'H018', 'Mimpi Kosong, Mimpi Isi', NULL, 4, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(757, 'H019', 'K.H Wahab Hasbullah', NULL, 4, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(758, 'H020', 'The Davinci Memories', NULL, 4, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(759, 'H021', 'Sosok Nabi Khidir Ynag Super Misterius', NULL, 4, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(760, 'H022', 'Wanita-Wanita Penakluk Badai', NULL, 4, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(761, 'H023', 'Para Diktator Terheboh Dunia Yang Berhasil Digulingkan', NULL, 4, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(762, 'H024', 'Misteri Nyi Roro Kidul Dan Laut Selatan', NULL, 4, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(763, 'H025', 'Panggil Aku Kartini Saja', NULL, 4, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(764, 'H026', 'Cerdik Mencintai Tak Gentar Dusta', NULL, 4, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(765, 'H027', 'Kisah Hantu-Hantu China', NULL, 4, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(766, 'H028', 'Kiai Nyentrik Abdurrahman Wahid Membela Pemerintah', NULL, 4, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(767, 'H029', '80 Ilmuwan Besar Dunia Bidang Fisika & Biologi', NULL, 4, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(768, 'H030', 'Kemuliaan Taubat', NULL, 4, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(769, 'H031', 'Uniknya Dahlan', NULL, 4, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(770, 'H032', 'Kisah-Kisah Sahabat-Sahabat Nabi', NULL, 4, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(771, 'H033', 'Profi-Profil Orang-Orang Penyandangan Kekurangan Fisik Atau Mental', NULL, 4, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(772, 'H034', 'Kitab Senyuman', NULL, 4, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(773, 'H035', 'Anekdot Fauna', NULL, 4, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(774, 'H036', 'Gus Dur Dalam Obrolan Gus Mus', NULL, 4, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(775, 'H037', '1001 Keajaiban Ketakwaan', NULL, 4, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(776, 'H038', 'Menanti Giliran', NULL, 4, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(777, 'H039', 'Penelusuran Hadist Rosullah Saw', NULL, 4, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(778, 'H040', 'The Manchunian Way', NULL, 4, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(779, 'H041', 'Lupa Endonesi Deui', NULL, 4, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(780, 'H042', 'Peradilan Sesat', NULL, 4, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(781, 'H043', 'Ali Sadikin', NULL, 4, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(782, 'H044', 'Antara Mikrobiologi & Mikropolitik', NULL, 4, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(783, 'H045', 'Catatan Dari Bilik Jendela Sekolah', NULL, 4, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(784, 'H046', 'Belajar Dari Hati', NULL, 4, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(785, 'H047', 'The Bruce Lee Way', NULL, 4, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(786, 'H048', 'Biografi Inspirasional Wanita Fenominal Pencipta Dunia Cleopatra', NULL, 4, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(787, 'H049', 'Syaichona Cholil Bangkalan', NULL, 4, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(788, 'H050', 'H. Syaukani Hr', NULL, 4, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(789, 'H051', 'Samudera Hikmah Syekh Abdul Qodir', NULL, 4, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(790, 'H052', 'Pramoedya Ananta Toer :', NULL, 4, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(791, 'H053', 'Rabiah Al-Adawiyah', NULL, 4, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(792, 'H054', 'Biografi Imam Al-Ghazali', NULL, 4, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(793, 'H055', 'Sirah 60 Sahabat', NULL, 4, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(794, 'H056', 'The Great Of Shalahuddin A. & M. Al-Fatih', NULL, 4, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(795, 'H057', 'Sihir Betis Kendedes', NULL, 4, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(796, 'H058', 'Eduardus Sabda', NULL, 4, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(797, 'H059', 'Sepak Terjang Abraham Samad', NULL, 4, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(798, 'H060', 'Ibu Risma Memimpin Dengan Hati', NULL, 4, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(799, 'H061', 'Terima Kasih Ayah', NULL, 4, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(800, 'H062', 'Don Pablo', NULL, 4, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(801, 'H063', 'Antasari Azhar Dalang Atau Korban ?', NULL, 4, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(802, 'H064', '101 Kepala Negara Paling Unik', NULL, 4, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(803, 'H065', '101 Kisah Cinta Sepanjang Masa', NULL, 4, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(804, 'H066', 'Biografi Dan Tingkatan Perawi Hadits', NULL, 4, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(805, 'H067', 'H.O.S Tjokroaminoto', NULL, 4, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(806, 'H068', 'Dahlan Juga Manusia', NULL, 4, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(807, 'H069', 'Mawar Di Serambi Masjid', NULL, 4, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(808, 'H070', 'Rahasia Otak Tengah Hitler', NULL, 4, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(809, 'H071', 'Semangat Membatu', NULL, 4, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(810, 'H072', 'Harakiri', NULL, 4, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(811, 'H073', 'Mbah Hamid Pasuruan', NULL, 4, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(812, 'H074', 'Anjing Hitam Yang Mengingatkan Seorang Syekh', NULL, 4, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(813, 'H075', 'Nasruddin Manusia Yang Bijaksana', NULL, 4, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(814, 'H076', 'Kisah Mimpi Orang Shaleh', NULL, 4, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(815, 'H077', 'Memertik Matahari', NULL, 4, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(816, 'H078', 'Renung Dan Canda Pelawak Bersorban', NULL, 4, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(817, 'H079', 'Riwayat Singkat Almarhumin Pp Nurul Jadid', NULL, 4, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(818, 'H080', 'Siapa Yang Tak Disayang', NULL, 4, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(819, 'H081', 'Diktator Yang Mengguncang Dunia', NULL, 4, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(820, 'H082', 'Sisi Lain Dari Bapak Bangsa', NULL, 4, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(821, 'H083', 'Gus Dur Itu Isme', NULL, 4, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(822, 'H084', 'Gus Dur', NULL, 4, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(823, 'H085', 'Ringkasan Biografi Imam Syafii', NULL, 4, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(824, 'H086', 'Syaikh Nawawi Al-Bantani', NULL, 4, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(825, 'H087', 'Vladimir Putin', NULL, 4, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(826, 'H089', 'Abdul Qadir Al Jailani', NULL, 4, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(827, 'H090', 'Merasa Pintar Bodoh Saja Tak Punya', NULL, 4, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(828, 'H091', 'Kisah-Kisah Penggugah Jiwa Penguat Iman', NULL, 4, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(829, 'H092', 'Sufisme Sunan Kalijaga', NULL, 4, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(830, 'H093', 'Dawud', NULL, 4, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(831, 'H094', 'Siti Hajar Ibu Bangsa Arab', NULL, 4, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(832, 'H095', '99 Kiai Kharismatik Indonesia 1', NULL, 4, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(833, 'H096', 'The Great Figure Of Abu Bakar Ash-Shiddiq', NULL, 4, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(834, 'H097', 'Wali Berandal Tanah Jawa', NULL, 4, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(835, 'H098', 'The Principles Of Power', NULL, 4, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(836, 'H099', 'The Great Figure Of Umar Bin Khattab', NULL, 4, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(837, 'H100', 'The Great Figure Of Utsman Bin Affan', NULL, 4, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(838, 'H101', 'Kh. Abdul Wahab Chasbullah', NULL, 4, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(839, 'H102', 'Kh.Moh.Tolchah Mansoer', NULL, 4, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(840, 'H103', 'Zaid Bin Tsabit', NULL, 4, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(841, 'I001', 'Bahan Tayangan Materi Sosiallisasi Uud', NULL, 8, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(842, 'I002', 'Panduan Pemasyarakatan Uud', NULL, 8, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(843, 'I003', 'Membongkar Gurita Cikeas', NULL, 8, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(844, 'I004', 'Islam Dalam Lintasan Sejarah Perpolitikan', NULL, 8, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(845, 'I005', 'Ijtihad Politik Ulama', NULL, 8, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(846, 'I006', 'Politik Dan Sepak Bola', NULL, 8, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(847, 'I007', 'Sunni Dan Kekuasaan Politik', NULL, 8, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(848, 'I008', 'Php (Politik Harapan Palsu)', NULL, 8, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(849, 'I009', 'Koruptor Rajim', NULL, 8, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(850, 'I010', 'Apapun Partainya, Korupsi Hobinya', NULL, 8, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(851, 'I011', 'Uud 1945 Sesudah Dan Sebelum Amandemen', NULL, 8, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(852, 'I012', 'Buku Lengkap Kuhp & Kuhap', NULL, 8, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(853, 'I013', 'Dasar - Dasar Ilmu Politik', NULL, 8, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(854, 'I014', 'Pers Perlawanan', NULL, 8, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(855, 'I015', 'Hukum Pidana Khusus', NULL, 8, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(856, 'I016', 'Sosiologi Agama', NULL, 8, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(857, 'I017', 'Sosiologi Hukum Sebuah Pengantar', NULL, 8, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(858, 'I018', 'Sosiologi Pendidikan', NULL, 8, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(859, 'I019', 'Pemikiran Emas Tokoh-Tokoh Politik Dunia', NULL, 8, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(860, 'I020', 'Panjangnya Politik', NULL, 8, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(861, 'I021', 'Perebutan Hak Atas Kelola Sumber Daya', NULL, 8, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(862, 'I022', 'Menggapai Solidaritas', NULL, 8, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(863, 'I023', 'Partisipasi Politik Umat Kristen Indonesia', NULL, 8, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(864, 'I024', 'Kaki Langit Demokrasi', NULL, 8, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(865, 'I025', 'Gerakan Kebebasan Sipil', NULL, 8, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(866, 'I026', 'Konsolidasi', NULL, 8, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(867, 'I027', 'Berhentinya Soeharto Fakta Dan Kesaksian Harmoko', NULL, 8, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(868, 'I028', 'Kitab Undang-Undang Perlindungan Anak', NULL, 8, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(869, 'J001', 'Gerbang Dunia Ke-3', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(870, 'J002', 'La Galigo 2', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(871, 'J003', 'Muhammad 4', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(872, 'J004', 'Muhammad 3', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(873, 'J005', 'Muhammad 2', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(874, 'J006', 'Muhammad 1', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(875, 'J007', 'Amba', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(876, 'J008', 'Matahari', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(877, 'J009', 'Sirkus Pohon', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(878, 'J010', 'Hamdim, Pistim, Yandim', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(879, 'J011', 'Deharmonie', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(880, 'J012', 'Kopiss', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(881, 'J013', 'Drupadi', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(882, 'J014', 'Berciuman Dengan Mata Terpenjam', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(883, 'J015', 'Tan', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(884, 'J016', 'Kasongan', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(885, 'J017', 'Surat Cinta Untuk Bapak Presiden', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(886, 'J018', 'Sunrise For Shaila', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(887, 'J019', 'Craing Winter', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(888, 'J020', 'Irene Shiling', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(889, 'J021', 'Catatan Zeefy', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(890, 'J022', 'Mengapa Aku Cantik', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(891, 'J023', 'Edensor', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(892, 'J024', 'Mimpi Rosul', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(893, 'J025', 'Rahasia Kode Abjad', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(894, 'J026', 'Miss Hola Holic', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(895, 'J027', 'Sepotong Kata Maaf', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(896, 'J028', 'Paragus', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(897, 'J029', 'Bapak Kapan Kita Akan Berdamai', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(898, 'J030', 'Nias', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(899, 'J031', 'Gerbang Trinil', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(900, 'J032', 'Ander The Winter Sky', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(901, 'J033', '3360', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(902, 'J034', 'Mimpi Jameelah', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(903, 'J035', 'Cinta Dan Batas Biarits', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(904, 'J036', 'Gadis 360 Hari Yang Lalu', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(905, 'J037', 'Cinta Keindahan', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(906, 'J038', 'Pengantin Surga', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(907, 'J039', 'Misteri Gadis Kaligrafi', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(908, 'J040', 'Cinderella Pesantren', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(909, 'J041', 'Sabda Palon', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(910, 'J042', 'Atas Singgasana', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(911, 'J043', 'Bunga Bunga Biru', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(912, 'J044', 'Who Am I ?', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(913, 'J045', 'Tulus Untuk Orang Yang Salah', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(914, 'J046', 'Romeo Juliet', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, '2026-10-28 08:11:49'),
(915, 'J047', 'Pulang', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(916, 'J048', 'Aroma Karsa', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(917, 'J049', 'Garis Waktu', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(918, 'J050', 'Ayahku Bukan Pembohong', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(919, 'J051', '0.465972222222222', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(920, 'J052', 'Sanja Hujan & Cerita Yang Telahusai', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(921, 'J053', 'Bibir Tersenyum Hati Menangis', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(922, 'J054', 'Tertawa Ala Persia', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(923, 'J055', 'Raffles Further Adventures Of The Amateur Cracksman', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(924, 'J056', 'Cahayamu Tak Bisa Kutawar', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(925, 'J057', 'Pergi', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(926, 'J058', 'Trio Macan Lebih Macan', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(927, 'J059', 'The Memory Keeper\'S Daughter', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(928, 'J060', 'Benny Arnas', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(929, 'J061', 'Fantasyiru', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(930, 'J062', 'Replay', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(931, 'J063', 'The Things They Carried', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(932, 'J064', 'Love Asset', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(933, 'J065', 'Cerita Satu Cinta', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(934, 'J066', 'Senandika Prisma', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(935, 'J067', 'The War Of The Wordls', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(936, 'J068', 'Sherlock Holmes', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(937, 'J069', 'The Escapist', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(938, 'J070', 'Reinkarnasi', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(939, 'J071', 'The Elfstones Of Shannara', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(940, 'J072', 'Salah Pilih', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(941, 'J073', 'Dendang Penari', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(942, 'J074', 'Aku Milikmu Selamanya', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(943, 'J075', 'Kutukan Naskah Drama', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(944, 'J076', 'A Bad Boy', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(945, 'J077', 'The Chocolate Touch', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(946, 'J078', 'Bumi Cinta', NULL, 1, 1, 1, NULL, NULL, 1, 2, NULL, NULL, NULL, '2026-10-23 08:06:17'),
(947, 'J079', 'Orang-Orang Biasa', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(948, 'J080', 'Kumpulan Puisi & Cerpen Ilustrasi', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(949, 'J081', 'Pet Sematary', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(950, 'J082', 'Dunia Sophie', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(951, 'J083', 'My Bastard Prince', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, '2026-11-01 08:13:34'),
(952, 'J084', 'Di Balik Pintu No. 18', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(953, 'J085', 'Kata', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(954, 'J086', 'Rindu Itu Hujan(Rih)', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(955, 'J087', 'Ivanna', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(956, 'J088', 'I Wuf U', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(957, 'J089', 'Orangeboy', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(958, 'J090', 'Hello(Again),Cello', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(959, 'J091', 'Rembulan Tenggelam Di Wajahmu', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(960, 'J092', 'Moga Bunda Disayang Allah', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(961, 'J093', 'Humaira Dan Al Farisi', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(962, 'J094', 'The Playlist', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(963, 'J095', 'Christmas At Carrington\'S', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(964, 'J096', 'Once Upon A Time In St. Peterburg', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, '2026-11-07 09:32:28'),
(965, 'J097', 'Api Awan Asap', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(966, 'J098', 'My Bittersweet Marriage', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(967, 'J099', 'Complicated Thing Called Love', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(968, 'J100', 'Galette', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(969, 'J101', 'Golden Bird', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(970, 'J102', 'Reuni', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(971, 'J103', 'Foodcourt Corner', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(972, 'J104', 'Rahasia Klan Nicholson', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(973, 'J105', 'Mean Streak', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(974, 'J106', 'Teman', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(975, 'J107', 'Runaway To Heaven', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(976, 'J108', 'Mealova', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(977, 'J109', 'Cerita Cinta Tanpa Cinta', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(978, 'J110', 'Misteri Cinta Kamar 313', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(979, 'J111', 'A Thousand Miles In Broken Slippers', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(980, 'J112', 'Hairless', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(981, 'J113', 'Sensei', NULL, 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, '2026-11-08 08:13:14'),
(982, 'J114', 'The Lucy One', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(983, 'J115', 'Mr. Justice Raffles', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(984, 'J116', 'Surat Untuk Hera', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(985, 'J117', 'Gua Jepang 4', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(986, 'J118', 'Rindu', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(987, 'J119', 'Belahan Jiwa', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(988, 'J120', 'Si Anak Kuat', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(989, 'J121', 'The Unexpected Soulmate', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(990, 'J122', '9 Summers 10 Autumns', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(991, 'J123', 'Kiss The Rain', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(992, 'J124', 'Ailurofil', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(993, 'J125', 'Frank Frurt', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(994, 'J126', 'Hey Badboy', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(995, 'J127', 'Half', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(996, 'J128', 'Garuda', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(997, 'J129', 'Kepada Gema', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(998, 'J130', 'Neraka Cermin', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(999, 'J131', 'Hello', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, '2026-11-07 09:32:20'),
(1000, 'J132', 'The Destiny', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(1001, 'J133', 'The Gentleman Secret', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(1002, 'J134', 'Before It\'S Too Late', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(1003, 'J135', 'The Twelfth Sight', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(1004, 'J136', 'Wander Woman', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(1005, 'J137', 'Aku Cantik', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(1006, 'J138', 'Jodoh Untuk Naina', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(1007, 'J139', 'Pembunuh Berantai', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(1008, 'J140', 'Will You Marry Me?', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL);
INSERT INTO `books` (`id`, `kode_buku`, `judul`, `isbn`, `category_id`, `publisher_id`, `author_id`, `shelf_id`, `tahun_terbit`, `jumlah`, `tersedia`, `cover`, `deskripsi`, `created_at`, `updated_at`) VALUES
(1009, 'J141', 'Annisa Kapal Yang Berlabuh', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(1010, 'J142', 'Maharesa', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(1011, 'J143', 'Golden Bird Ultimate', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(1012, 'J144', 'Insya Allah Sah!', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(1013, 'J145', 'Tenggat Waktu', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(1014, 'J146', 'Seribu', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(1015, 'J147', 'My Protective Bilionare', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(1016, 'J148', 'Stuck In Love', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(1017, 'J149', 'Kefalonia', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(1018, 'J150', 'Jaka Tarub Mencari Cinta', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(1019, 'J151', 'The Elegy', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(1020, 'J152', 'Malaikat', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(1021, 'J153', 'Amoi', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(1022, 'J154', 'Cupcake Love Story', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(1023, 'J155', 'Love Spell', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(1024, 'J156', 'Oven The Rain', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(1025, 'J157', 'Love Hate Love', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(1026, 'J158', 'Bibi Gil', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(1027, 'J159', 'Biru', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(1028, 'J160', 'Joko Tingkir', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(1029, 'J161', 'Tanah Para Bandit', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(1030, 'J162', 'The Cobra', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(1031, 'J163', 'Star Light', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(1032, 'J164', 'Pacar Keliga', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(1033, 'J165', 'Bumi', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(1034, 'J166', 'Rumah Hujan', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(1035, 'J167', 'Daisy Miller', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(1036, 'J168', 'Love Me Again', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(1037, 'J169', 'Kailasa', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(1038, 'J170', 'Rahasia Kitab Atlantis', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(1039, 'J171', 'Winner', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(1040, 'J172', 'Black Monday', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(1041, 'J173', 'Sagaras', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(1042, 'J174', 'For Motrimonial Purposes', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(1043, 'J175', 'Bumi Manusia', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(1044, 'J176', 'Anak Semua Bangsa', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(1045, 'J177', 'Jejak Langkah', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(1046, 'J178', 'Rumah Kaca', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(1047, 'J179', 'Sewu Dino', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, '2026-11-08 08:18:58'),
(1048, 'J180', 'Bulan', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(1049, 'J181', 'Laut Bercerita', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(1050, 'J182', 'Bintang', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(1051, 'J183', 'Ceros Batozar', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(1052, 'J184', 'Komet', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(1053, 'J185', 'Komet Minor', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(1054, 'J186', 'Selena', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(1055, 'J187', 'Nebula', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(1056, 'J188', 'Lumpu', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(1057, 'J189', 'Si Putih', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(1058, 'J190', 'Pulang & Pergi', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(1059, 'J191', 'Ada Apa Dengan Cinta', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(1060, 'J192', 'Detektif Louisa & Daniel', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(1061, 'J193', 'Ayah Dan Sirkus Pohon', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(1062, 'J194', 'Laila & Majnun', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(1063, 'J195', 'Silence', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(1064, 'J196', 'Story Of Seth', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(1065, 'J197', 'Matahari Minor', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(1066, 'J198', 'Damiens Lovers', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(1067, 'J199', 'Anak Rantau', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(1068, 'J200', 'Santri Pilihan Bunda', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(1069, 'J201', 'Janur Ireng', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(1070, 'J202', 'The Kane Chronicles', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(1071, 'J203', 'Maaf!', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(1072, 'J204', 'Rahasia', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(1073, 'J205', 'Tidak Tahu', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(1074, 'J206', 'Kembara Rindu', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(1075, 'J207', 'Suluh Rindu', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(1076, 'J208', 'Negeri Para Bedebah', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(1077, 'J209', 'Negeri Di Ujung Tanduk', NULL, 1, 1, 1, NULL, NULL, 1, 0, NULL, NULL, NULL, '2026-11-08 08:31:42'),
(1078, 'J210', 'Bedebah Di Ujung Tanduk', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(1079, 'J211', 'Antar Kota Antar Perasaan', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(1080, 'J212', 'Tentang Kamu', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(1081, 'J213', 'Your Name', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(1082, 'J214', 'Sesuk', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(1083, 'J215', '7 Prajurit Bapak', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(1084, 'J216', 'Si Anak Cahaya', NULL, 1, 1, 1, NULL, NULL, 1, 2, NULL, NULL, NULL, '2026-11-04 08:12:31'),
(1085, 'J217', 'Si Anak Pelangi', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(1086, 'J218', 'Magma', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(1087, 'J219', 'Humor Dokter +', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(1088, 'J220', 'Si Anak Spesial', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(1089, 'J221', 'Si Anak Pintar', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(1090, 'J222', 'Si Anak Pemberani', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(1091, 'J223', 'Kau,Aku,Dan Sepucuk Angpau Merah', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(1092, 'J224', 'Agaskar', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(1093, 'J225', 'Kutukan Dosa Selina', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(1094, 'J226', 'Kisah Hantu -Hantu Dinusantara', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(1095, 'J227', 'Sekar Pati', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(1096, 'J228', 'Si Jago', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(1097, 'J229', 'Yang Telah Lama Pergi', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(1098, 'J230', 'From Pesantren With Laugh', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(1099, 'J231', 'Pemanggilan Arwah Tuan Tilly', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(1100, 'J232', 'Parable', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(1101, 'J233', 'Ranjat Kembang', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(1102, 'J234', 'Tenggelamnya Kapal Van Der Wijck', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(1103, 'J235', 'Gravity', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(1104, 'J236', 'Ily', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(1105, 'J237', 'Hero At The Fall', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(1106, 'J238', 'Si Anak Badai', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(1107, 'J239', 'The Magic Library', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(1108, 'J240', 'Pocong Gundul', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(1109, 'J241', 'Atlanta', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(1110, 'J242', 'Psychic Detective Yakumo (I)', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(1111, 'J243', 'Psychic Detective Yakumo (Ii)', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(1112, 'J244', 'Psychic Detective Yakumo (Iii)', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(1113, 'J245', 'Psychic Detective Yakumo (Iv)', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(1114, 'J246', 'Psychic Detective Yakumo (V)', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(1115, 'J247', 'Psychic Detective Yakumo Part 1 (Vi)', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(1116, 'J248', 'Psychic Detective Yakumo Part 2 (Vi)', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(1117, 'J249', 'Kereta Api Hantu', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(1118, 'J250', 'Mencari Saranjana', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(1119, 'J251', 'Sunset Bersama Rosie', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(1120, 'J252', 'Perfect Partner', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(1121, 'J253', 'Gerbang Dua Semesta', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(1122, 'J254', 'Setan-Setan Menggugat', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(1123, 'J255', 'Sihir Mesir Di Tanah Jawa', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(1124, 'J256', 'Unforgetable India', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(1125, 'J257', 'Antariksa', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(1126, 'J258', 'Raja Ratu Dan Rindu', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(1127, 'J259', 'Planet Magnon', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(1128, 'J260', 'Hafalan Shalat Delisa', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(1129, 'J261', 'Bandit-Bandit Berkelas', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(1130, 'J262', 'Berjuta Rasanya', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(1131, 'J263', 'Teror Pocong Duloh', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(1132, 'J264', 'Gara-Gara Abang', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(1133, 'J265', 'Dia Adalah Kakakku', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(1134, 'J266', 'Badan Intelijen Sekolah', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(1135, 'J267', '30 Juz', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(1136, 'J268', 'Unit Gaib Darurat', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(1137, 'J269', 'Archipelagos Wizarding School In Nusantara', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(1138, 'J270', 'Archipelagos Wizarding School In Nusantara 2', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(1139, 'J271', 'Teruslah Bodoh Jangan Pintar', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(1140, 'J272', 'Rasa', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, '2026-11-08 08:30:05'),
(1141, 'J273', 'Best Time', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(1142, 'J274', 'Cantik Itu Luka', NULL, 1, 1, 1, NULL, NULL, 1, 2, NULL, NULL, NULL, '2026-10-28 09:32:15'),
(1143, 'J275', '3478 Mdpl', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, '2026-11-03 08:23:35'),
(1144, 'J276', 'Sisi Tergelap Surga', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(1145, 'J277', 'Cinta Antara Jakarta & Kuala Lumpur', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(1146, 'J278', 'Namaku Alam', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(1147, 'J279', 'Animals Farm', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(1148, 'K001', '1001 Penemuan & Fakta Mempesona Peradaban Bumi', NULL, 6, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(1149, 'K002', 'Apa Jadinya? Boyer', NULL, 6, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(1150, 'K003', 'Why? The Human Body', NULL, 6, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(1151, 'K004', 'Why? Pooh', NULL, 6, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(1152, 'K005', 'Why? The Science Of Sleep', NULL, 6, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(1153, 'K006', 'Why? Poisionous Animal & Plants', NULL, 6, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(1154, 'K007', 'Why? Future Scince', NULL, 6, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(1155, 'K008', 'Why? Magic Scince', NULL, 6, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(1156, 'K009', 'Why? Movie Film', NULL, 6, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(1157, 'K010', 'Why? People,Bill Gates', NULL, 6, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(1158, 'K011', 'Catatan Kaki Dari Gaza', NULL, 6, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(1159, 'K012', 'Natural Disasters', NULL, 6, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(1160, 'K013', 'Insects', NULL, 6, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(1161, 'K014', 'Islam Itu Ramah, Mudah, Indah', NULL, 6, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(1162, 'K015', 'Fish', NULL, 6, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(1163, 'K016', 'Disease', NULL, 6, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(1164, 'K017', 'Virtual Reality & Augmented Reality', NULL, 6, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(1165, 'K018', 'Hijrah', NULL, 6, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(1166, 'K019', 'Shalahuddin Al-Ayyubi (01)', NULL, 6, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(1167, 'K020', 'Shalahuddin Al-Ayyubi (02)', NULL, 6, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(1168, 'K021', 'Muhammad Al-Fatih #1', NULL, 6, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(1169, 'K022', 'Muhammad Al-Fatih #2', NULL, 6, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(1170, 'K023', 'Muhammad Al-Fatih #3', NULL, 6, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(1171, 'K024', 'Why? Tradisional Science', NULL, 6, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(1172, 'K025', 'Atlas Antariksa', NULL, 6, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(1173, 'K026', 'Fauna Pedia', NULL, 6, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(1174, 'K027', 'Kreasi Busana Daerah Indonesia', NULL, 6, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(1175, 'K028', 'Information Technology', NULL, 6, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(1176, 'K029', 'Living Fossil', NULL, 6, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(1177, 'K030', 'The Amazon', NULL, 6, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(1178, 'K031', 'Symbiosis And Natural Enemy', NULL, 6, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(1179, 'K032', 'Anatomi', NULL, 6, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(1180, 'K033', 'Useful & Harmful Insects', NULL, 6, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(1181, 'K034', 'Si Juki Seri Keroykan #7', NULL, 6, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(1182, 'K035', 'Shalahuddin Al-Ayyubi (3)', NULL, 6, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(1183, 'K036', 'Shalahuddin Al-Ayyubi (4)', NULL, 6, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(1184, 'K037', 'Shalahuddin Al-Ayyubi (5)', NULL, 6, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(1185, 'K038', 'Shalahuddin Al-Ayyubi (6)', NULL, 6, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(1186, 'K039', 'Why? Fine Dust', NULL, 6, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(1187, 'K040', 'Iqomic (3)', NULL, 6, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(1188, 'K041', 'Si Toyeb', NULL, 6, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(1189, 'K042', 'Iqomic (1)', NULL, 6, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(1190, 'K043', 'Al-Fatih Vs Vlad Dracula #1', NULL, 6, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(1191, 'K044', 'Al-Fatih Vs Vlad Dracula #2', NULL, 6, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(1192, 'K045', 'Al-Fatih Vs Vlad Dracula #3', NULL, 6, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(1193, 'K046', '10 Pahlawan Islam', NULL, 6, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(1194, 'K047', '10 Sahabat Mulia Karna Islam', NULL, 6, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(1195, 'K048', '10 Sahabt Di Jamin Masuk Surga', NULL, 6, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(1196, 'K049', 'Why ? Stars And Constlellation', NULL, 6, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(1197, 'K050', 'Why ? Computer Virus', NULL, 6, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(1198, 'K051', 'Ensiklopedia Anak Hebat', NULL, 6, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(1199, 'K052', 'Guinnes World Records', NULL, 6, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(1200, 'K053', 'Kata Islam Tentang', NULL, 6, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(1201, 'K054', 'Si Juki The Movie Panitia Hari Akhir', NULL, 6, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(1202, 'K055', 'Si Juki Anak Kosan', NULL, 6, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(1203, 'K056', 'Kartun Aljabar', NULL, 6, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(1204, 'K057', 'Why (Laut Dalam)', NULL, 6, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(1205, 'K058', 'Matematika', NULL, 6, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(1206, 'K059', 'Civil Engineering And Construction', NULL, 6, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(1207, 'K060', 'Filo Komik', NULL, 6, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(1208, 'L001', 'Ihya \'Ulumiddin (1)', NULL, 9, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(1209, 'L002', 'Ihya \'Ulumiddin (2)', NULL, 9, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(1210, 'L003', 'Ihya \'Ulumiddin (3)', NULL, 9, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(1211, 'L004', 'Ihya \'Ulumiddin (4)', NULL, 9, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(1212, 'L005', 'Al-Bayjuri (1)', NULL, 9, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(1213, 'L006', 'Al-Bayjuri (2)', NULL, 9, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(1214, 'L007', 'I\'Anatut Thalibin (1)', NULL, 9, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(1215, 'L008', 'I\'Anatut Thalibin (2)', NULL, 9, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(1216, 'L009', 'I\'Anatut Thalibin (3)', NULL, 9, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(1217, 'L010', 'I\'Anatut Thalibin (4)', NULL, 9, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(1218, 'L011', 'Jami\'Ud Durus Al Arabiyah', NULL, 9, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(1219, 'L012', 'Al-Bujairomi Alalkhotib #1', NULL, 9, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(1220, 'L013', 'Al-Bujairomi Alalkhotib #2', NULL, 9, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(1221, 'L014', 'Al-Bujairomi Alalkhotib #3', NULL, 9, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(1222, 'L015', 'Al-Bujairomi Alalkhotib #4', NULL, 9, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(1223, 'L016', 'Al-Bujairomi Alalkhotib #5', NULL, 9, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(1224, 'L017', 'Al-Fiqhu Ala Madahiba Arba\'Ah #1', NULL, 9, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(1225, 'L018', 'Al-Fiqhu Ala Madahiba Arba\'Ah #2', NULL, 9, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(1226, 'L019', 'Al-Fiqhu Ala Madahiba Arba\'Ah #3', NULL, 9, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(1227, 'L020', 'Al-Fiqhu Ala Madahiba Arba\'Ah #4', NULL, 9, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(1228, 'L021', 'Al-Fiqhu Ala Madahiba Arba\'Ah #5', NULL, 9, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(1229, 'L022', 'Jatsiyah Alamatul Ash-Showi#1', NULL, 9, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(1230, 'L023', 'Jatsiyah Alamatul Ash-Showi#2', NULL, 9, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(1231, 'L024', 'Jatsiyah Alamatul Ash-Showi#3', NULL, 9, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(1232, 'L025', 'Jatsiyah Alamatul Ash-Showi#4', NULL, 9, 1, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(1233, 'J0278', 'Namaku alam', NULL, 1, 1, 1, NULL, NULL, 1, 1, NULL, NULL, '2026-09-24 07:55:27', '2026-09-24 07:55:27');

-- --------------------------------------------------------

--
-- Table structure for table `bukus`
--

CREATE TABLE `bukus` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `kode_buku` varchar(255) NOT NULL,
  `nama_buku` varchar(255) NOT NULL,
  `kategori_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bukus`
--

INSERT INTO `bukus` (`id`, `kode_buku`, `nama_buku`, `kategori_id`, `created_at`, `updated_at`) VALUES
(231, 'A001', 'Sirah Nabi', 2, NULL, NULL),
(232, 'A002', 'Ringkasan Hadis Shohih Muslim', 2, NULL, NULL),
(233, 'A003', 'Tafsir Jalalain 1', 2, NULL, NULL),
(234, 'A004', 'Tafsir Jalalain 2', 2, NULL, NULL),
(235, 'A005', 'Al Hikam 1', 2, NULL, NULL),
(236, 'A006', 'Al Hikam 2', 2, NULL, NULL),
(237, 'A007', 'Nu Menjawab Problematika Umat', 2, NULL, NULL),
(238, 'A008', 'Lebih Dekat Kepada Allah', 2, NULL, NULL),
(239, 'A009', 'Sebab Turunnya Al-Qur\'An', 2, NULL, NULL),
(240, 'A010', 'Pondok Sebagai Potret Cinta Tanah Air', 2, NULL, NULL),
(241, 'A011', 'Kajian Sullamut Taufiq', 2, NULL, NULL),
(242, 'A012', 'Kang Santri 1', 2, NULL, NULL),
(243, 'A013', 'Kang Santri 2', 2, NULL, NULL),
(244, 'A014', 'Aqidah Kaum Sarungan', 2, NULL, NULL),
(245, 'A015', 'Membuka Kedok Tokoh-Tokoh Liberal', 2, NULL, NULL),
(246, 'A016', 'Gerbang Pesantren', 2, NULL, NULL),
(247, 'A017', 'Al-Fadho-Il', 2, NULL, NULL),
(248, 'A018', 'Fihi Ma Fihi(71 Ceramah Rumi Untuk Pendidikan Ruhani)', 2, NULL, NULL),
(249, 'A019', 'Fihi Ma Fihi(Mengarungi Samudera Kebijaksanaan)', 2, NULL, NULL),
(250, 'A020', 'Menggagas Nu Masa Depan', 2, NULL, NULL),
(251, 'A021', 'Terjemah Tarikh Al-Tasiri\'', 2, NULL, NULL),
(252, 'A022', 'Tradisi Intelektual Santri', 2, NULL, NULL),
(253, 'A023', 'Pendidikan Karakter Pesantren', 2, NULL, NULL),
(254, 'A024', 'Nu Hammadiah Bicara Nasionalisme', 2, NULL, NULL),
(255, 'A025', 'Kepesantren Berwawasan Lingkungan', 2, NULL, NULL),
(256, 'A026', 'Pola Penyelenggaraan Pesantren Kilat', 2, NULL, NULL),
(257, 'A027', 'Metodologi Ilmu Tafsir', 2, NULL, NULL),
(258, 'A028', 'Fiqih Solutif', 2, NULL, NULL),
(259, 'A029', 'Living Qur\'An Dan Hadist', 2, NULL, NULL),
(260, 'A030', 'Babak Baru Pendidikan Usia Dini', 2, NULL, NULL),
(261, 'A031', 'Fiqih Muamalah', 2, NULL, NULL),
(262, 'A032', 'Ilmu Falak', 2, NULL, NULL),
(263, 'A033', 'Usul Fiqih', 2, NULL, NULL),
(264, 'A034', 'Ikhtisar Tajwid Praktis', 2, NULL, NULL),
(265, 'A035', 'Ilmu Sharaf', 2, NULL, NULL),
(266, 'A036', 'Kh. Moh. Romzi Al-Amiri Mannan, Sh., Mhi', 2, NULL, NULL),
(267, 'A037', 'Mereka Memasukkan Kitab-Kitab Karya Ulama Klasik', 2, NULL, NULL),
(268, 'A038', 'Tradisi Intelektual Nu', 2, NULL, NULL),
(269, 'A039', 'Hujjah Nu', 2, NULL, NULL),
(270, 'A040', 'Fikih Curhat', 2, NULL, NULL),
(271, 'A041', 'Etika Bergaul', 2, NULL, NULL),
(272, 'A042', 'Tafsir Surat Al-Fatihah', 2, NULL, NULL),
(273, 'A043', 'Hasyiyah', 2, NULL, NULL),
(274, 'A044', 'Menggerakkan Tradisi', 2, NULL, NULL),
(275, 'A045', 'Studi Ilmu-Ilmu Al-Qur`an', 2, NULL, NULL),
(276, 'A046', 'Terjemah Syu\'Abul Iman', 2, NULL, NULL),
(277, 'A047', 'Pendidikan Karakter Berbasis Pesantren', 2, NULL, NULL),
(278, 'A048', 'Hadis-Hadis Populer Shohih Bukhari Muslim', 2, NULL, NULL),
(279, 'A049', 'Al-Qur\'An Tarjamah Madhura', 2, NULL, NULL),
(280, 'A050', 'Tafsir Al-Asyr Al-Akhir', 2, NULL, NULL),
(281, 'A051', 'Ringkasan Al-I\'Tisham', 2, NULL, NULL),
(282, 'A052', 'Bilik-Bilik Cinta Muhammad', 2, NULL, NULL),
(283, 'A053', 'Tarikh Tasyri\'', 2, NULL, NULL),
(284, 'A054', 'Aku,Buku Dan Peradaban', 2, NULL, NULL),
(285, 'A055', 'Ta\'Lim Muta\'Allim', 2, NULL, NULL),
(286, 'A056', 'Ta\'Lim Muta\'Allim 2', 2, NULL, NULL),
(287, 'A057', 'Fiqih Viral (Fathul Mu`in) 1', 2, NULL, NULL),
(288, 'A058', 'Fiqih Viral (Fathul Mu`in) 2', 2, NULL, NULL),
(289, 'A059', 'Fiqih Viral (Fathul Mu`in) 3', 2, NULL, NULL),
(290, 'A060', 'Fiqih Viral (Fathul Mu`in) 4', 2, NULL, NULL),
(291, 'A061', 'Fiqih Viral (Fathul Mu`in) 5', 2, NULL, NULL),
(292, 'A062', 'Fiqh Sunnah E.4', 2, NULL, NULL),
(293, 'A063', 'Kependudukan Perspektif Islam', 2, NULL, NULL),
(294, 'A064', 'Fiqh Sesat', 2, NULL, NULL),
(295, 'A065', 'Nasionalisme Dan Islam Nusantara', 2, NULL, NULL),
(296, 'A066', 'Keajaiban Al-Qur\'An & Rahasia Kalimat Tauhid', 2, NULL, NULL),
(297, 'A067', 'Juz Amma 3 Bahasa', 2, NULL, NULL),
(298, 'A068', 'Ngaji Hati', 2, NULL, NULL),
(299, 'A069', 'Syarah Hadits 40', 2, NULL, NULL),
(300, 'A070', 'Ngaji Qur\'An Di Zaman Edan', 2, NULL, NULL),
(301, 'A071', 'Mari Memenuhi Panggilan Allah', 2, NULL, NULL),
(302, 'A072', 'Nashaihul \'Ibad', 2, NULL, NULL),
(303, 'A073', 'Maraqi Al-Ubudiyah', 2, NULL, NULL),
(304, 'A074', 'Kyai Pejuang', 2, NULL, NULL),
(305, 'A075', 'Peradaban Sarung', 2, NULL, NULL),
(306, 'A076', 'Implementasi Metode Amtsilati', 2, NULL, NULL),
(307, 'A077', 'Ath-Thibbu An-Nawawi', 2, NULL, NULL),
(308, 'A078', 'Terjemah Fath Al-Qorib', 2, NULL, NULL),
(309, 'A079', 'Ngaji Diri', 2, NULL, NULL),
(310, 'A080', 'Ensiklopedia Hadratus Syaikh K.H Hasyim A', 2, NULL, NULL),
(311, 'A081', 'Terjemah & Syarah Nazham Imriti', 2, NULL, NULL),
(312, 'A082', 'Penjelasan Nadhom Aqidatul Awam', 2, NULL, NULL),
(313, 'A083', 'Selayang Pandang Pondok Pesantren Nurul Jadid', 2, NULL, NULL),
(314, 'A084', 'Riyadhus Shalihin', 2, NULL, NULL),
(315, 'A085', 'Terjemah Matan Alfiah', 2, NULL, NULL),
(316, 'A086', 'Mempertajam Mata Batin', 2, NULL, NULL),
(317, 'A087', 'Tradisi Pesantren', 2, NULL, NULL),
(318, 'A088', 'Terjemah Lengkap Bulughul Maram', 2, NULL, NULL),
(319, 'A089', 'Fiqih Ibadah', 2, NULL, NULL),
(320, 'A090', 'Kitab At-Tibyan', 2, NULL, NULL),
(321, 'A091', 'Buah Buahan Yang Menjulai', 2, NULL, NULL),
(322, 'A092', 'Hukum Zakat Dan Wakaf', 2, NULL, NULL),
(323, 'A093', 'The Story Of Dajjal', 2, NULL, NULL),
(324, 'B001', 'Manusia Dan Makhluk Ghaib Di Sekelilingnya', 10, NULL, NULL),
(325, 'B002', 'Kamus Do\'A', 10, NULL, NULL),
(326, 'B003', 'Berdzikir Cara Nabi', 10, NULL, NULL),
(327, 'B004', 'Logika Agama', 10, NULL, NULL),
(328, 'B005', 'Studi Agama', 10, NULL, NULL),
(329, 'B006', 'Orang Gila Jadi Wali', 10, NULL, NULL),
(330, 'B007', 'Memahami Hubungan Antar Agama', 10, NULL, NULL),
(331, 'B008', 'Hidup Susah Tak Lupa Bersedekah', 10, NULL, NULL),
(332, 'B009', 'Hadis Versus Sains', 10, NULL, NULL),
(333, 'B010', 'Materi Kultum Penyejuk Hati', 10, NULL, NULL),
(334, 'B011', 'Sunah-Sunah Kecil Berpahalabesar', 10, NULL, NULL),
(335, 'B012', 'Greendeen', 10, NULL, NULL),
(336, 'B013', 'Perempuan Tertindas ?', 10, NULL, NULL),
(337, 'B014', 'Terapi Qur\'Ani', 10, NULL, NULL),
(338, 'B015', 'Khusyuk Sholat', 10, NULL, NULL),
(339, 'B016', 'Islam Liberal & Fundamental', 10, NULL, NULL),
(340, 'B017', 'Semiotika Al-Qur\'An', 10, NULL, NULL),
(341, 'B018', 'Taubat', 10, NULL, NULL),
(342, 'B019', 'Berakhlak & Beradab Mulia', 10, NULL, NULL),
(343, 'B020', 'Ibrahim Pernah Atheis', 10, NULL, NULL),
(344, 'B021', 'Fiqih Sosial', 10, NULL, NULL),
(345, 'B022', '1001 Cara Berdakwah', 10, NULL, NULL),
(346, 'B023', 'Misteri Energi Istigfar', 10, NULL, NULL),
(347, 'B024', 'Misteri Dibalik Perintah Sholat', 10, NULL, NULL),
(348, 'B025', 'Studi Al-Qur\'An Kontemporer', 10, NULL, NULL),
(349, 'B026', 'Akibat-Akibat Fatal Meremehkan Sholat Tah', 10, NULL, NULL),
(350, 'B027', 'Dari Mana Masuknya Setan', 10, NULL, NULL),
(351, 'B028', 'Orang Kota Mencari Allah', 10, NULL, NULL),
(352, 'B029', 'Ternyata Allah Menyuruh Pada Pesugihan', 10, NULL, NULL),
(353, 'B030', '7 Malam Pertama Di Alam Kubur', 10, NULL, NULL),
(354, 'B031', 'Bersama Do\'A-Do\'A Ini, Taklukkan Wanita Idamanmu ?', 10, NULL, NULL),
(355, 'B032', '10 Amal Sholeh Yang Membuat Tubuh Selalu Sehat', 10, NULL, NULL),
(356, 'B033', 'Bacalah Yasin Dijamin Hidupmu Kaya Dan Penuh Berkah!', 10, NULL, NULL),
(357, 'B034', 'Kesalahan-Kesalahan Istighfar', 10, NULL, NULL),
(358, 'B035', 'Musuh Besar Umat Islam', 10, NULL, NULL),
(359, 'B036', 'Do\'A Dan Dzikir Hebat Bisa Mendapatkan Pekerjaan Idaman', 10, NULL, NULL),
(360, 'B037', 'Panduan Lengkap Perawat Jenaza', 10, NULL, NULL),
(361, 'B038', 'Membangunan Keshalehan Sosial', 10, NULL, NULL),
(362, 'B039', 'Kajaiban Kitab Suci Al-Qur\'An', 10, NULL, NULL),
(363, 'B040', 'Meniggalkan Takabbur Menuju Sy', 10, NULL, NULL),
(364, 'B041', 'Ensiklopedi Halal Haram Makanan', 10, NULL, NULL),
(365, 'B042', 'Kontroversi Nabi Perempuan Dalam Islam', 10, NULL, NULL),
(366, 'B043', 'Hermeneutika Al-Qur\'An', 10, NULL, NULL),
(367, 'B044', 'Al-Qur\'An Mengungkap Tentang Y', 10, NULL, NULL),
(368, 'B045', 'Fadilah Tahajjud Untuk Mencapai Keluarga Sakinah', 10, NULL, NULL),
(369, 'B046', 'Kesalahan Dalam Solat Paling Sering Terjadi', 10, NULL, NULL),
(370, 'B047', 'Buku Pintar Halal Haram Sehari-Ha', 10, NULL, NULL),
(371, 'B048', 'Nasehat Iblis', 10, NULL, NULL),
(372, 'B049', 'Fadhilah-Fadhilah Ajaib Solat Raw', 10, NULL, NULL),
(373, 'B050', 'Kenal Baik Dengan Syetan', 10, NULL, NULL),
(374, 'B051', 'Innalillahi Wa Innailaihi Raji\'Uun', 10, NULL, NULL),
(375, 'B052', 'Shaleh Ritual Saleh Sosial', 10, NULL, NULL),
(376, 'B053', 'Obati Kankermu Dengan Mukjizat', 10, NULL, NULL),
(377, 'B054', 'Aktivitas Ilmu Laduni', 10, NULL, NULL),
(378, 'B055', 'Raih 5 Mukjizat Setiap Hari', 10, NULL, NULL),
(379, 'B056', 'Buku Pintar Ahli Ibadah', 10, NULL, NULL),
(380, 'B057', 'Puasa Bersama Rosulullah S.A.W', 10, NULL, NULL),
(381, 'B058', 'Cara Rosulullah Memperlakukan Wanita', 10, NULL, NULL),
(382, 'B059', 'Haji & Umrah', 10, NULL, NULL),
(383, 'B060', 'Panduan Ibadah Musafir', 10, NULL, NULL),
(384, 'B061', 'Larangan Berjilbab', 10, NULL, NULL),
(385, 'B062', 'Slamic Green Living', 10, NULL, NULL),
(386, 'B063', 'Bertangga Dan Bermasyarakat Dalam Islam', 10, NULL, NULL),
(387, 'B064', 'Surat Kepada Penguasa', 10, NULL, NULL),
(388, 'B065', 'Kearifan Al-Qur\'An', 10, NULL, NULL),
(389, 'B066', 'Dialog Islam Kristen', 10, NULL, NULL),
(390, 'B067', 'Syamsul Ma\'Arif', 10, NULL, NULL),
(391, 'B068', 'Fadhilah Amal', 10, NULL, NULL),
(392, 'B069', 'Menuju Negeri Keabadian', 10, NULL, NULL),
(393, 'B070', 'Islam Tanpa Ekstrimisme', 10, NULL, NULL),
(394, 'B071', 'Tasawuf Islam & Akhlak', 10, NULL, NULL),
(395, 'B072', 'Syiah Agama Kedustaan', 10, NULL, NULL),
(396, 'B073', 'Menggapai Lailatul Qadr', 10, NULL, NULL),
(397, 'B074', 'Ridha', 10, NULL, NULL),
(398, 'B075', 'Akibat-Akibat Fatal Meremehkan Sholat Taubat', 10, NULL, NULL),
(399, 'B076', 'Misteri Banjir Perahu Nuh', 10, NULL, NULL),
(400, 'B077', 'Fiqih Perempuan', 10, NULL, NULL),
(401, 'B078', 'Islam Yang Produktif', 10, NULL, NULL),
(402, 'B079', 'Keajaiban Bangun Pagi', 10, NULL, NULL),
(403, 'B080', 'Religious Studies', 10, NULL, NULL),
(404, 'B081', 'Mukjizat Doa & Air Mata Ibu', 10, NULL, NULL),
(405, 'B082', 'Fikih Muamalah Kontemporer', 10, NULL, NULL),
(406, 'B083', 'Bid\'Ah Hasanah', 10, NULL, NULL),
(407, 'B084', '400 Kebiasaan Keliru Dalam Hidup Muslim', 10, NULL, NULL),
(408, 'B085', 'Agama Cinta', 10, NULL, NULL),
(409, 'B086', 'Sihir', 10, NULL, NULL),
(410, 'B087', 'Tangan Diatas Lebih Baik Dari Tangan Dibawah', 10, NULL, NULL),
(411, 'B088', 'Rahasia Kedahsyatan Asmaul Husna', 10, NULL, NULL),
(412, 'B089', 'Memenuhi Hak Sang Kekasih', 10, NULL, NULL),
(413, 'B090', 'Islam Bukan Hanya Teriak \"Allahu Akbar\"', 10, NULL, NULL),
(414, 'B091', 'Mukjizat 7 Sunah Nabiyangsuper Dahsyat', 10, NULL, NULL),
(415, 'B092', 'Tafsir Mimpi', 10, NULL, NULL),
(416, 'B093', 'Kumpulan Dalil Dalil Quran Dan Hadits', 10, NULL, NULL),
(417, 'B094', 'Daqaiqul Akhbar', 10, NULL, NULL),
(418, 'B095', 'Ngaji Diri', 10, NULL, NULL),
(419, 'B096', 'Tuhan Maha Asyik', 10, NULL, NULL),
(420, 'B097', 'Tuhan Maha Asyik 2', 10, NULL, NULL),
(421, 'B098', 'Pahami Sebelum Sesali', 10, NULL, NULL),
(422, 'B099', 'Seni Merayu Tuhan', 10, NULL, NULL),
(423, 'B100', 'Membumikan Hukum Islam Melalui Maqosid Syariah', 10, NULL, NULL),
(424, 'B101', 'Semua Ada Saatnya', 10, NULL, NULL),
(425, 'B102', 'Qiroah Mubadalah', 10, NULL, NULL),
(426, 'B103', 'The Amazing Shalawat', 10, NULL, NULL),
(427, 'B104', 'One Day One Juz', 10, NULL, NULL),
(428, 'B105', 'Menuju Keluarga Hafidzul Qur\'An', 10, NULL, NULL),
(429, 'B106', 'Rahasia Pnciptaan Alam Semesta & Makhluk Hidup', 10, NULL, NULL),
(430, 'B107', 'Tasawuf Dan Perkembangannya Dalam Islam', 10, NULL, NULL),
(431, 'B108', 'Islam & Kebhinekaan', 10, NULL, NULL),
(432, 'B109', 'Menyelami Seluk Beluk Makrifat', 10, NULL, NULL),
(433, 'B110', 'Ushul Fiqh', 10, NULL, NULL),
(434, 'B111', 'Terjemah Hadist Mengenai Pribadi & Budi Pekerti', 10, NULL, NULL),
(435, 'B112', 'Buku Pedoman Shalat Wajib & Sunnah', 10, NULL, NULL),
(436, 'B113', 'Ahlusunnah Waljamaah Fiqih & Landasan Amaliyah', 10, NULL, NULL),
(437, 'B114', 'Ahlusunnah Waljamaah Islam Wasathiyah,Tasamuh,Cinta Damai', 10, NULL, NULL),
(438, 'B115', 'Asy-Syamail Al-Muhammadiyah', 10, NULL, NULL),
(439, 'B116', 'Pengantar Ushul Fiqh & Qowaidul Fiqhiyyah', 10, NULL, NULL),
(440, 'B117', 'Kaidah Ushul Fiqh', 10, NULL, NULL),
(441, 'B118', 'Belajar Cepat & Mudah Terjemah Al-Quran Metode An-Nashr', 10, NULL, NULL),
(442, 'B119', 'Panduan Lengkap Do\'A Untuk Muslimah', 10, NULL, NULL),
(443, 'B120', 'Buku Saku Iman Dan Islam', 10, NULL, NULL),
(444, 'B121', 'Sunni & Wahhabi', 10, NULL, NULL),
(445, 'B122', 'Dalil Dalil Amaliyah', 10, NULL, NULL),
(446, 'B123', 'Psikologi Islam', 10, NULL, NULL),
(447, 'B124', 'Tuhan Ada Dihatimu', 10, NULL, NULL),
(448, 'B125', 'Jantu Cinta Kepada-Nya', 10, NULL, NULL),
(449, 'B126', 'Mati Sebelum Mati,Buka Kesadaran Hakiki', 10, NULL, NULL),
(450, 'C001', 'Paket-Paket Soal Psikotes Untuk CPNS Dan Siswa', 12, NULL, NULL),
(451, 'C002', 'Top Peringkat Satu UN SMP/MTs', 12, NULL, NULL),
(452, 'C003', 'Rpul Global Indonesia Dan Dunia', 12, NULL, NULL),
(453, 'C004', 'Filsafat Umum Akal Dan Hati', 12, NULL, NULL),
(454, 'C005', 'Ilmu Pendidikan Dalam Perspektif Islam', 12, NULL, NULL),
(455, 'C006', 'Perencanaan Pembelajaran', 12, NULL, NULL),
(456, 'C007', 'Filsafat Ilmu', 12, NULL, NULL),
(457, 'C008', 'Perancangan Sistem Informasi Dan Aplikasinya', 12, NULL, NULL),
(458, 'C009', 'Dasar-Dasar Logika', 12, NULL, NULL),
(459, 'C010', 'Manajemen Sumber Daya Manusia', 12, NULL, NULL),
(460, 'C011', 'Pengantar Manajemen', 12, NULL, NULL),
(461, 'C012', 'Abc (Aneka Berhitung Cepat)', 12, NULL, NULL),
(462, 'C013', 'Filsafat Hukum Islam', 12, NULL, NULL),
(463, 'C014', 'Filsafat Dan Strategi Pendidikan M.Sjafei', 12, NULL, NULL),
(464, 'C015', 'Filsafat Ilmu Sebuah Pengantar Populer', 12, NULL, NULL),
(465, 'C016', 'Manajemen Pembelajaran', 12, NULL, NULL),
(466, 'C017', 'Analisis Kebijakan', 12, NULL, NULL),
(467, 'C018', 'Bimbingan Konseling', 12, NULL, NULL),
(468, 'C019', 'Filsafat Umum', 12, NULL, NULL),
(469, 'C020', 'Kiat Tembus Usm Dan Stan CPNS Depkeu', 12, NULL, NULL),
(470, 'C021', 'Panduan Lengkap Jarimatika', 12, NULL, NULL),
(471, 'C022', 'Filsafat Pendidikan Islam', 12, NULL, NULL),
(472, 'C023', 'Metodologi Hukum Islam', 12, NULL, NULL),
(473, 'C024', 'Sains Seru Seri 4 : Lingkungan', 12, NULL, NULL),
(474, 'C025', 'Sains Seru Seri 1 : Manusia', 12, NULL, NULL),
(475, 'C026', 'Manajemen Play Group & Taman Kanak-Kanak', 12, NULL, NULL),
(476, 'C027', 'Bank Soal Tbs & Tpa', 12, NULL, NULL),
(477, 'C028', '7 Tips Aplikasi Pakem', 12, NULL, NULL),
(478, 'C029', 'Pemikiran Islam Metodologis', 12, NULL, NULL),
(479, 'C030', 'Cara Mudah Belajar Filsafat', 12, NULL, NULL),
(480, 'C031', 'Bimbingan Menguasai TKU Dan TPA', 12, NULL, NULL),
(481, 'C032', 'Kalkulus', 12, NULL, NULL),
(482, 'C033', 'Percakapan Bahasa Inggris Bergambar', 12, NULL, NULL),
(483, 'C034', 'Cara Praktis Jago Matematika', 12, NULL, NULL),
(484, 'C035', 'Idola Matematika', 12, NULL, NULL),
(485, 'C036', 'Ekonomi Islam', 12, NULL, NULL),
(486, 'C037', 'Sains Seru  Seri : 5 Alam Semesta', 12, NULL, NULL),
(487, 'C038', 'Filsafat Pendidikan', 12, NULL, NULL),
(488, 'C039', 'Metode Penelitian Ekonomi Islam Muamalah', 12, NULL, NULL),
(489, 'C040', 'M.Y.O.B. Accounting Versi 8', 12, NULL, NULL),
(490, 'C041', 'Memahami Dasar-Dasar Ekonomi Islam', 12, NULL, NULL),
(491, 'C042', 'Prinsip-Prinsip Ekonomi', 12, NULL, NULL),
(492, 'C043', 'Pelatihan Tpa Dan Psikotes', 12, NULL, NULL),
(493, 'C044', 'Psikologi Umum', 12, NULL, NULL),
(494, 'C045', 'Sejarah Pendidikan Ekonomi Islam', 12, NULL, NULL),
(495, 'C046', 'Pengantar Ilmu Hukum', 12, NULL, NULL),
(496, 'C047', 'Manajemen Keuangan', 12, NULL, NULL),
(497, 'C048', 'Pendidikan Karakter Berbasis Nilai & Etika Di Sekolah', 12, NULL, NULL),
(498, 'C049', 'Keandalan Dan Sukses Sekretaris Perusahaan', 12, NULL, NULL),
(499, 'C050', 'Intisari Bahasa Indonesia', 12, NULL, NULL),
(500, 'C051', 'Step Up', 12, NULL, NULL),
(501, 'C052', 'Desain Pembelajaran', 12, NULL, NULL),
(502, 'C053', 'Soal -Soal Tes AKBID & AKPER', 12, NULL, NULL),
(503, 'C054', 'Hukum Cyberspace', 12, NULL, NULL),
(504, 'C055', 'Hukum Investasi Di Era Otonomi Daerah', 12, NULL, NULL),
(505, 'C056', 'Bank Soal Terkini', 12, NULL, NULL),
(506, 'C057', 'Pengantar Filsafat', 12, NULL, NULL),
(507, 'C058', 'Mengefektifkan Peran Birokrasi Untuk', 12, NULL, NULL),
(508, 'C059', 'Pedoman & Petunjuk Praktis Karya Tulis', 12, NULL, NULL),
(509, 'C060', 'Terpenjara Luka Lama', 12, NULL, NULL),
(510, 'C061', 'Mendidik Anak Seperti Rasul', 12, NULL, NULL),
(511, 'C062', 'Aplikasi ISO', 12, NULL, NULL),
(512, 'C063', 'Strategi Belajar Mengajar Praktis', 12, NULL, NULL),
(513, 'C064', 'Brainware Management', 12, NULL, NULL),
(514, 'C065', 'Hukum Sistem Ekonomi Islam', 12, NULL, NULL),
(515, 'C066', 'Psikologi Umum Dalam Lintasan Sejarah', 12, NULL, NULL),
(516, 'C067', 'Pembelajaran Bahasa Arab', 12, NULL, NULL),
(517, 'C068', 'Filsafat Pendidikan Islam', 12, NULL, NULL),
(518, 'C069', 'Dasar-Dasar Pendidikan Sosial', 12, NULL, NULL),
(519, 'C070', 'Buku Ajar Pendidikan Pancasila', 12, NULL, NULL),
(520, 'C071', '36 Jam Belajar Komputer Microsoft Office 2021', 12, NULL, NULL),
(521, 'C072', 'Buku Ajar Pendidikan Kewarganegaraan', 12, NULL, NULL),
(522, 'C073', 'Dasar-Dasar Hukum Acara Pidana', 12, NULL, NULL),
(523, 'C074', 'Evaluasi Pembelajaran Bahasa Arab', 12, NULL, NULL),
(524, 'C075', 'Buku Ajar Pendidikan Agama Islam', 12, NULL, NULL),
(525, 'C076', 'The Magic Of Big Thinking', 12, NULL, NULL),
(526, 'C077', 'English Time', 12, NULL, NULL),
(527, 'C078', 'Asas Asas Hukum Pidana Di Indonesia', 12, NULL, NULL),
(528, 'C079', 'Pengantar Akuntansi', 12, NULL, NULL),
(529, 'C080', 'Dunia Menurut Fisika', 12, NULL, NULL),
(530, 'C081', 'Digital Marketing Di Era 6.0', 12, NULL, NULL),
(531, 'C082', 'Perintis Bukan Pewaris', 12, NULL, NULL),
(532, 'C083', 'Secret Life Of Money', 12, NULL, NULL),
(533, 'C084', 'From Zero To Survive', 12, NULL, NULL),
(534, 'D001', 'La Tahzan', 7, NULL, NULL),
(535, 'D002', 'Semua Bisa Jadi Pengusaha', 7, NULL, NULL),
(536, 'D003', 'Boleh Gak Sih Ngarep ?', 7, NULL, NULL),
(537, 'D004', 'Undang Saja Allah', 7, NULL, NULL),
(538, 'D005', 'Sungguh Allah Menyapa Kita', 7, NULL, NULL),
(539, 'D006', 'Hanya 2 Menit', 7, NULL, NULL),
(540, 'D007', '3 Magic Memory For Musllim', 7, NULL, NULL),
(541, 'D008', '17 Strategi Jitu Sukses Kuliah Di Perguruan Tinggi', 7, NULL, NULL),
(542, 'D009', 'Ketika Guru Dan Siswa Saling Becermin', 7, NULL, NULL),
(543, 'D010', 'Matematika Ketidakpastian', 7, NULL, NULL),
(544, 'D011', 'Panduan Menjadi Remaja Percaya Diri', 7, NULL, NULL),
(545, 'D012', 'Kiat Mengatasi Gangguan Belajar', 7, NULL, NULL),
(546, 'D013', 'Kreatif Atau Mati', 7, NULL, NULL),
(547, 'D014', 'Hagakure The Wisdom Of Samurai', 7, NULL, NULL),
(548, 'D015', 'Selagi Nyawa Menyatu Di Raga', 7, NULL, NULL),
(549, 'D016', 'Ini Dia Dosa-Dosa Yang Buatmu Sulit Kerja', 7, NULL, NULL),
(550, 'D017', '25 Hari Menciptakan Pikiran Yang Lebih Kreatif Dan Kuat', 7, NULL, NULL),
(551, 'D018', 'Humor Guru Sufi', 7, NULL, NULL),
(552, 'D019', 'The Route Of Happiness', 7, NULL, NULL),
(553, 'D020', 'Think Rich You Will Get It Comes True', 7, NULL, NULL),
(554, 'D021', 'Change Your Life ! Charge Your Self !', 7, NULL, NULL),
(555, 'D022', 'Membangkitkan Energi Dari Self-Power', 7, NULL, NULL),
(556, 'D023', 'Kaya Duit Kaya Hati', 7, NULL, NULL),
(557, 'D024', 'Dicintai Allah Dirindukan Rosulullah', 7, NULL, NULL),
(558, 'D025', '4 Langkah Meraih Sukses', 7, NULL, NULL),
(559, 'D026', 'Jangan Lupa Bahagia', 7, NULL, NULL),
(560, 'D027', 'Free Your Life', 7, NULL, NULL),
(561, 'D028', 'The Mirror', 7, NULL, NULL),
(562, 'D029', 'Menumbuhkan Semangat Dan Rasa Percaya Diri', 7, NULL, NULL),
(563, 'D030', 'Si Penyebar Fitnah', 7, NULL, NULL),
(564, 'D031', 'Cara Mudah Memainkan Beragam Alat Musik', 7, NULL, NULL),
(565, 'D032', 'Right Brain', 7, NULL, NULL),
(566, 'D033', 'Open Your Heart Follow Your Prophet', 7, NULL, NULL),
(567, 'D034', 'Mutiara Hikmah', 7, NULL, NULL),
(568, 'D035', 'Asmaul Husna Untuk Nutrisi Otak Kanan Otak Kiri', 7, NULL, NULL),
(569, 'D036', 'Matematika Diri', 7, NULL, NULL),
(570, 'D037', 'Rahasia Melesitkan Daya Ingat', 7, NULL, NULL),
(571, 'D038', 'Propetich Learning', 7, NULL, NULL),
(572, 'D039', 'Tips & Trik Otak Tengah', 7, NULL, NULL),
(573, 'D040', 'Muda-Mudi Yang Dicintai Nabi', 7, NULL, NULL),
(574, 'D041', 'Lihatlah Aku!', 7, NULL, NULL),
(575, 'D042', 'Hari-Hari Paling Menyebalkan Dalam Hidupku', 7, NULL, NULL),
(576, 'D043', 'Allah Itu Nyata', 7, NULL, NULL),
(577, 'D044', 'Personality Plus', 7, NULL, NULL),
(578, 'D045', 'Komunikasi Ala Punakawan & Abu Nawas', 7, NULL, NULL),
(579, 'D046', 'How To Influence People', 7, NULL, NULL),
(580, 'D047', 'The Magic Of Picture', 7, NULL, NULL),
(581, 'D048', 'The Magic Of Connection', 7, NULL, NULL),
(582, 'D049', 'The Magic Of Love', 7, NULL, NULL),
(583, 'D050', 'What Got You Here', 7, NULL, NULL),
(584, 'D051', 'Always On Top', 7, NULL, NULL),
(585, 'D052', 'Puncak Rindu', 7, NULL, NULL),
(586, 'D053', 'Agar Hidup Lebih Baik', 7, NULL, NULL),
(587, 'D054', 'Menempuh Jalan Ke Surga', 7, NULL, NULL),
(588, 'D055', 'Menipu Setan', 7, NULL, NULL),
(589, 'D056', 'Trik Jitu Jual Diri', 7, NULL, NULL),
(590, 'D057', 'Ibadah Tanpa Beban', 7, NULL, NULL),
(591, 'D058', 'Find Your Diamond Here', 7, NULL, NULL),
(592, 'D059', 'Petaka Membawa Hikmah', 7, NULL, NULL),
(593, 'D060', 'Kisah Keajaiban Pengamal Tahajud, Duha & Puasa', 7, NULL, NULL),
(594, 'D061', 'Petuah Bijak 2', 7, NULL, NULL),
(595, 'D062', 'The Achiever', 7, NULL, NULL),
(596, 'D063', 'The Power Of Akhlak', 7, NULL, NULL),
(597, 'D064', 'The Best Advices Of Sayyidina Ali For Leader', 7, NULL, NULL),
(598, 'D065', 'Meet & Grow Rich', 7, NULL, NULL),
(599, 'D066', 'The Paradox Of Excellence', 7, NULL, NULL),
(600, 'D067', 'Mindset', 7, NULL, NULL),
(601, 'D068', 'Entrepreneur Ship', 7, NULL, NULL),
(602, 'D069', 'The Power Of Planning', 7, NULL, NULL),
(603, 'D070', 'Kiat Praktis Public Speaking', 7, NULL, NULL),
(604, 'D071', 'Pesan Cinta Mbah Moen', 7, NULL, NULL),
(605, 'D072', 'The Meaningful Life With Rumi', 7, NULL, NULL),
(606, 'D073', 'Atomic Habits', 7, NULL, NULL),
(607, 'D074', 'Malas Tapi Sukses', 7, NULL, NULL),
(608, 'D075', 'Guru Muslim Abad 21', 7, NULL, NULL),
(609, 'D076', 'Menyelami Bacaan Sholat', 7, NULL, NULL),
(610, 'D077', 'Pejuang Gelar', 7, NULL, NULL),
(611, 'D078', 'Gendeng Ways 212', 7, NULL, NULL),
(612, 'D079', 'Berjuta Jalan Menggapai Pertolongan Allah', 7, NULL, NULL),
(613, 'D080', 'Baper', 7, NULL, NULL),
(614, 'D081', 'Bersama Cahaya', 7, NULL, NULL),
(615, 'D082', 'Jarrib!', 7, NULL, NULL),
(616, 'D083', 'Awas!! Bahagia', 7, NULL, NULL),
(617, 'D084', 'Spiritual Enlightenment', 7, NULL, NULL),
(618, 'D085', 'Rosulullah', 7, NULL, NULL),
(619, 'D086', 'Motivasi Pengubah Gaya Berpikirmu', 7, NULL, NULL),
(620, 'D087', 'Munajat Ramadan', 7, NULL, NULL),
(621, 'D088', 'Bingkai Kasih Khazanah Jiwa', 7, NULL, NULL),
(622, 'D089', 'Super Wife Super Mom Super Woman', 7, NULL, NULL),
(623, 'D090', 'Karena Hidup Hanyalah Sebuah Persinggahan', 7, NULL, NULL),
(624, 'D091', 'Manusia Mulia', 7, NULL, NULL),
(625, 'D092', 'Lulus Kuliah Dengan Bismilllah', 7, NULL, NULL),
(626, 'D093', 'Kaukah Takdir Jodohku', 7, NULL, NULL),
(627, 'D094', 'Mess', 7, NULL, NULL),
(628, 'D095', 'Aku Jomblo Super', 7, NULL, NULL),
(629, 'D096', 'Hari Gini Masih Galau?!', 7, NULL, NULL),
(630, 'D097', 'I Want & Can', 7, NULL, NULL),
(631, 'D098', 'Naluri Bejo Ada Dalam Dirimu', 7, NULL, NULL),
(632, 'D099', 'Menihkahlah Agar Engkau Kaya', 7, NULL, NULL),
(633, 'D100', 'Belajarlah Kepada Lalat Dan Lebah', 7, NULL, NULL),
(634, 'D101', 'Cara Gila Membangun Kerajaan Bisnis', 7, NULL, NULL),
(635, 'D102', 'Pembangunan Masyarakat', 7, NULL, NULL),
(636, 'D103', 'Superhandbook', 7, NULL, NULL),
(637, 'D104', 'Spirit Of Life', 7, NULL, NULL),
(638, 'D105', 'Belajar Keagungan Tuhan Dari Alam', 7, NULL, NULL),
(639, 'D106', 'Jangan Berhenti Mencoba', 7, NULL, NULL),
(640, 'D107', 'Innallaaha Ma\'Anaa', 7, NULL, NULL),
(641, 'D108', 'Tharatul Qulub', 7, NULL, NULL),
(642, 'D109', 'Ada Yang Salah Dengan Hidupku', 7, NULL, NULL),
(643, 'D110', 'Muslim 4.0', 7, NULL, NULL),
(644, 'D111', 'Adabud Dunya Wad Din', 7, NULL, NULL),
(645, 'D112', 'Semesta Matsnawi', 7, NULL, NULL),
(646, 'D113', 'Berjuang Di Tengah Pandemi', 7, NULL, NULL),
(647, 'D114', 'Art Of Dakwah', 7, NULL, NULL),
(648, 'D115', 'Udah Putusin Aja', 7, NULL, NULL),
(649, 'D116', 'Beyond The Inspiration', 7, NULL, NULL),
(650, 'D117', 'Berani Tidak Disukai', 7, NULL, NULL),
(651, 'D118', 'Belajar Dengan Otak Kanan', 7, NULL, NULL),
(652, 'D119', 'Untuk Indonesia', 7, NULL, NULL),
(653, 'D120', 'Dari Biasamenjadi Luar Biasa', 7, NULL, NULL),
(654, 'D121', 'Hidup Bahagia Tanpa Keluh Kesah', 7, NULL, NULL),
(655, 'D122', 'Bisakah Aku Yang Pelupa Memili Ingatan Super', 7, NULL, NULL),
(656, 'D123', 'Self Healing', 7, NULL, NULL),
(657, 'D124', 'Passage Into Silence', 7, NULL, NULL),
(658, 'D125', 'Samudra Rubaiyat Menyelami Pesona Magis Dan Rindu', 7, NULL, NULL),
(659, 'D126', 'Matahari Diwan Syams Tabrizi', 7, NULL, NULL),
(660, 'D127', 'Bisnis Modal 10 Jutaan', 7, NULL, NULL),
(661, 'D128', 'General Psykologi', 7, NULL, NULL),
(662, 'D129', 'Filosofi Teras', 7, NULL, NULL),
(663, 'D130', 'Kalau Bisa Sekarang', 7, NULL, NULL),
(664, 'D131', 'Barasyik Asik Dahulu', 7, NULL, NULL),
(665, 'D132', 'Maaf Tuhan Aku Hampir', 7, NULL, NULL),
(666, 'D133', '100+1 Cara Bahagia', 7, NULL, NULL),
(667, 'D134', 'Semua Orang Sedang Berjuang Dengan Ujiannya Masing-Masing', 7, NULL, NULL),
(668, 'D135', 'Kita Hidup Hanya 3 Hari', 7, NULL, NULL),
(669, 'D136', 'Nanti Juga Terbiasa', 7, NULL, NULL),
(670, 'D137', 'Karena Tuhan Sesayang Itu', 7, NULL, NULL),
(671, 'D138', 'Kamu Itu Hebat', 7, NULL, NULL),
(672, 'D139', 'Think And Grow Rich', 7, NULL, NULL),
(673, 'D140', 'Pasir Buih', 7, NULL, NULL),
(674, 'D141', 'Dna Sukses Mulia', 7, NULL, NULL),
(675, 'D142', 'Sebuah Seni Berserah Diri', 7, NULL, NULL),
(676, 'D143', 'Trauma & Expectation', 7, NULL, NULL),
(677, 'D144', 'Your Life', 7, NULL, NULL),
(678, 'D145', 'Ini Cuma Dunia', 7, NULL, NULL),
(679, 'D146', 'Take Your Time Change Your Life', 7, NULL, NULL),
(680, 'D147', 'Idiot Brain', 7, NULL, NULL),
(681, 'D148', 'Temukan Dirimu Di Sisi Lain Dunia', 7, NULL, NULL),
(682, 'D149', 'Jika Kita Tak Pernah Jatuh Cinta', 7, NULL, NULL),
(683, 'D150', 'Kita Perlu Jeda Untuk Sembuh Dari Luka', 7, NULL, NULL),
(684, 'D151', 'Nanti Juga Sembuh Sendiri', 7, NULL, NULL),
(685, 'D152', 'Santai Saja Ini Hanyalah Dunia', 7, NULL, NULL),
(686, 'D153', 'Pamit Ini Untukmu', 7, NULL, NULL),
(687, 'D154', 'Terapi Menguasai Rasa Marah', 7, NULL, NULL),
(688, 'D155', 'Beresin Dulu Hidupmu', 7, NULL, NULL),
(689, 'D156', 'Rahasia Keberhasilan Bisnis Ala Khadijah', 7, NULL, NULL),
(690, 'D157', 'Seni Bahagia Menjadi Introver', 7, NULL, NULL),
(691, 'D158', 'Seribu Teman Kurang Satu Musuh Kebanyakan', 7, NULL, NULL),
(692, 'D159', 'Kaya & Bahagia Sepanjang Masa', 7, NULL, NULL),
(693, 'D160', 'Sukses Sebelum Usia 30', 7, NULL, NULL),
(694, 'D161', 'Komunikasi Itu Ada Seninya', 7, NULL, NULL),
(695, 'D162', 'Pilih Untuk Pulih', 7, NULL, NULL),
(696, 'D163', 'Belajar Merelakan', 7, NULL, NULL),
(697, 'D164', 'Untuk Kamu Yg Berani Menjadi Lebih Baik', 7, NULL, NULL),
(698, 'D165', 'Tenang', 7, NULL, NULL),
(699, 'D166', 'Power Robert Greene', 7, NULL, NULL),
(700, 'D167', 'Filosofi Teras', 7, NULL, NULL),
(701, 'D168', 'Makanya,Mikir', 7, NULL, NULL),
(702, 'D169', 'Tak Ada Masalah Berat', 7, NULL, NULL),
(703, 'D170', 'Pendosa Yang Merindukan Tuhan', 7, NULL, NULL),
(704, 'E001', 'Kamus Pintar Obat Herbal', 5, NULL, NULL),
(705, 'E002', 'Buku Pintar Adat Perkawinan Nusantara', 5, NULL, NULL),
(706, 'E003', 'Pilihan-Pilihan Kreasi Ruang Tamu & Ruang Keluarga', 5, NULL, NULL),
(707, 'E004', 'Aneka Kreasi Desain Internet Khusus Rumah Bebas Gebyok', 5, NULL, NULL),
(708, 'E005', 'Women Indonesia Society', 5, NULL, NULL),
(709, 'E006', 'Ensiklopedi Keajaiban Manusia Alam Semesta', 5, NULL, NULL),
(710, 'E008', 'Manufacturing Hope Bisa', 5, NULL, NULL),
(711, 'E009', 'Strategi Belajar Mengajar', 5, NULL, NULL),
(712, 'E010', 'Gagasan Bagi Pembangunan Berkelanjutan Di Indonesia', 5, NULL, NULL),
(713, 'E011', 'Benarkah Bumi Itu Datar ?', 5, NULL, NULL),
(714, 'E012', 'Imagologi', 5, NULL, NULL),
(715, 'E013', 'Perjalanan Panjang Tnanaman Indonesia', 5, NULL, NULL),
(716, 'E014', 'Robot Vision', 5, NULL, NULL),
(717, 'E015', 'Aipac', 5, NULL, NULL),
(718, 'E016', 'Etika', 5, NULL, NULL),
(719, 'E017', 'Virus Liberalisme Di Perguruan Tinggi Islam', 5, NULL, NULL),
(720, 'E018', 'Tips Membuat Anak Rajin, Suka, Dan Pintar Mengerjakan Pr', 5, NULL, NULL),
(721, 'E019', 'Kaya & Bahagia Sepanjang Masa', 5, NULL, NULL),
(722, 'E020', 'Membuka Pintu Langit', 5, NULL, NULL),
(723, 'E021', 'Rahasia Sehat Bersama Madu Lebah', 5, NULL, NULL),
(724, 'E022', 'Teologi Kerukunan Mencari Titik Temu Dalam Keragaman', 5, NULL, NULL),
(725, 'E023', 'Dasar-Dasar Advertiasing', 5, NULL, NULL),
(726, 'E024', 'Menyiapkan Kecerdasan Matematika Anak Sejak Dalam Kandungan', 5, NULL, NULL),
(727, 'E025', 'The Mafia\'S Greatest Hits', 5, NULL, NULL),
(728, 'E026', 'Hal-Hal Jorok Dan Menjijikkan Disekitarmu!', 5, NULL, NULL),
(729, 'E027', 'Tertawalah Biar Sehat', 5, NULL, NULL),
(730, 'E028', 'Kiat-Kiat Menegur Orang Lain', 5, NULL, NULL),
(731, 'E029', 'Fun Outbond', 5, NULL, NULL),
(732, 'E030', 'Ragam Menu Sehat Ubtuk Penderita Penyakit Ginjal', 5, NULL, NULL),
(733, 'E031', 'Buku Pintar Anak Band', 5, NULL, NULL),
(734, 'E032', 'Mengungkap Gizi-Gizi Sehat Internet', 5, NULL, NULL),
(735, 'E033', 'Mengapa Ya Anakku Suka Berbohong', 5, NULL, NULL),
(736, 'E034', 'Mengapa Anakku Malas Belajar Ya...?', 5, NULL, NULL),
(737, 'E035', 'Cara Pintar Mengelola Uang Pesangon Agar Sukses Dan Kaya', 5, NULL, NULL),
(738, 'E036', 'Duit Ngalir Bak Banjir Dengan Internet', 5, NULL, NULL),
(739, 'E037', 'Imperialisme Baru', 5, NULL, NULL),
(740, 'E038', 'Wajah Baru Perang Salib', 5, NULL, NULL),
(741, 'E039', 'Miliaran Keluarbiasaan Otak Kita', 5, NULL, NULL),
(742, 'E040', 'Konspirasi Yahudi', 5, NULL, NULL),
(743, 'E041', 'Petuah-Petuah Bijak Para Leluhur Nusantara Seputar Perkawinan', 5, NULL, NULL),
(744, 'E042', 'Total Quality Management In Education', 5, NULL, NULL),
(745, 'E043', 'Pengetahuan Praktis Ragam Penyakit Mamatikan Yang Paling Sering Menyerang Kita', 5, NULL, NULL),
(746, 'E044', 'Pintar Tanpa Payah', 5, NULL, NULL),
(747, 'E045', 'Peta Lengkap Wisata Kuliner Di Semarang', 5, NULL, NULL),
(748, 'E046', 'Cara Gila Membeli Properti Dengan Modal Seminim-Minimnya', 5, NULL, NULL),
(749, 'E047', 'Dampak Hebat Emosi Bagi Kesehatan', 5, NULL, NULL),
(750, 'E048', 'Jangan Suka Marah', 5, NULL, NULL),
(751, 'E049', 'Kesalahan-Kesalahan Pola Makan Pemicu Seabrek Penyakit', 5, NULL, NULL),
(752, 'E050', 'Jam Piket Organ Tubuh Manusia', 5, NULL, NULL),
(753, 'E051', 'Jejak-Jejak Nyata Ameerika Mengobok-Obok Wajah Dunia', 5, NULL, NULL),
(754, 'E052', 'Membuat Anak Cinta Matematika Dan Eksak Lainnya', 5, NULL, NULL),
(755, 'E054', '9 Strategi Jitu Menjadi Pembicara Dadakan', 5, NULL, NULL),
(756, 'E055', 'Bisa Banget Kok Hidup Sehat Tanpa Obat', 5, NULL, NULL),
(757, 'E056', 'Segitiga Tragedi Tanah Palestina', 5, NULL, NULL),
(758, 'E057', 'Komunitas-Komunitas Ekstrem Di Dunia', 5, NULL, NULL),
(759, 'E058', 'Buku Pintar Bahasa Tubuh Untuk Guru', 5, NULL, NULL),
(760, 'E059', 'Lebih Dalam Tentang Indra Keenam Manusia', 5, NULL, NULL),
(761, 'E060', 'Khasiat Selangit Air Putih, Air Kelapa, Manggis & Sirsak', 5, NULL, NULL),
(762, 'E061', 'Kekerasan Negara Menular Ke Masyarakat', 5, NULL, NULL),
(763, 'E062', 'Jurus-Jurus Sakti Memperbaiki Dan Memodifikasi Hp', 5, NULL, NULL),
(764, 'E063', '101+ Fakta Unik Dam Momem Terheboh Piala Dunia', 5, NULL, NULL),
(765, 'E064', 'Demokrasi Keintiman', 5, NULL, NULL),
(766, 'E065', 'Model Kepemimpinan Kepala Madrasah', 5, NULL, NULL),
(767, 'E066', 'Top Bak Artis Beken Dengan Facebook', 5, NULL, NULL),
(768, 'E067', 'Aplikasi Teori Pembelajaran Motorik', 5, NULL, NULL),
(769, 'E068', 'Berdo\'A Ataukah Menyuruh Tuhan', 5, NULL, NULL),
(770, 'E069', 'Segenggam Iman Anak Kita', 5, NULL, NULL),
(771, 'E070', 'Kenali Calon Pasanganmu', 5, NULL, NULL),
(772, 'E071', 'Konflik Nelayan', 5, NULL, NULL),
(773, 'E072', 'Penemuan-Penemuan Spektakuler', 5, NULL, NULL),
(774, 'E073', 'Membungkam Kicauan Liberal', 5, NULL, NULL),
(775, 'E074', 'Tempat Wisata Anak', 5, NULL, NULL),
(776, 'E075', 'Jago Shortcut Presentasi Powerpoint 2007', 5, NULL, NULL),
(777, 'E076', 'Met Ultah Sayang', 5, NULL, NULL),
(778, 'E077', 'Peta Lengkap Wisata Kuliner Di Surabaya', 5, NULL, NULL),
(779, 'E078', 'Berbagai Tujuan Wisata Alam Pilihan Eksotis Nusantara', 5, NULL, NULL),
(780, 'E079', 'Kiat Sukses Mencari Kerja', 5, NULL, NULL),
(781, 'E080', 'Cara Cerdas Menjawab Job Interview', 5, NULL, NULL),
(782, 'E081', 'Master Mentalis Teknik-Teknik Permainan Mentalis Terpopuler', 5, NULL, NULL),
(783, 'E083', 'Wisata Masjid Tua Di Jakarta', 5, NULL, NULL),
(784, 'E084', 'Terimakasih Tuhan Aku Melahirkan Normal', 5, NULL, NULL),
(785, 'E085', 'Bapak Tionghoa Nusantara', 5, NULL, NULL),
(786, 'E086', '77 Kesalahan', 5, NULL, NULL),
(787, 'E088', 'Blockcoin', 5, NULL, NULL),
(788, 'E089', 'Bitcoin Mining', 5, NULL, NULL),
(789, 'E090', 'Bitcoin Trading For 2 Generation', 5, NULL, NULL),
(790, 'E091', 'Misteri Otak Kanan Manusia', 5, NULL, NULL),
(791, 'E092', '200 Rekor Menakjubkan', 5, NULL, NULL),
(792, 'E093', 'Global Chaser', 5, NULL, NULL),
(793, 'E094', 'Soul Traders', 5, NULL, NULL),
(794, 'E095', 'The End Of The World', 5, NULL, NULL),
(795, 'E096', 'Kerja, Kerja, Kerja', 5, NULL, NULL),
(796, 'E097', 'The Nokia Revolution', 5, NULL, NULL),
(797, 'E098', 'The Sony Way', 5, NULL, NULL),
(798, 'E099', 'Execution Premium', 5, NULL, NULL),
(799, 'E100', 'From One Dollar To Brillion', 5, NULL, NULL),
(800, 'E101', 'Garam Kekerasan Dan Aduan Sapi', 5, NULL, NULL),
(801, 'E102', '1 Menit Belajar Bikin Web/Blog', 5, NULL, NULL),
(802, 'E103', '3 Menit Belajar Chatting', 5, NULL, NULL),
(803, 'E104', 'Goes To Pesantren', 5, NULL, NULL),
(804, 'E105', 'Padi', 5, NULL, NULL),
(805, 'E106', 'Wanita & Media Massa', 5, NULL, NULL),
(806, 'E107', 'Panduan Lengkap Windows 8', 5, NULL, NULL),
(807, 'E108', 'Perpustakaan & Buku', 5, NULL, NULL),
(808, 'E109', 'Rahasia Penjualan Zen', 5, NULL, NULL),
(809, 'E110', 'Membincangkan Televisi', 5, NULL, NULL),
(810, 'E111', 'Kontroversi Bisnis', 5, NULL, NULL),
(811, 'E112', 'Mengapa Kita (Belum) Cinta Laut?', 5, NULL, NULL),
(812, 'E113', 'Sukses Keluarga Mendidik Balita', 5, NULL, NULL),
(813, 'E114', 'Belajar Cepat Office 2010', 5, NULL, NULL),
(814, 'E115', 'Blogspot', 5, NULL, NULL),
(815, 'E116', 'Mengolah Dokumen Perkantoran', 5, NULL, NULL),
(816, 'E117', 'Panduan Internet Untuk Pemula', 5, NULL, NULL),
(817, 'E118', 'Certified Ethical Hacker', 5, NULL, NULL),
(818, 'E119', 'Kali Linux', 5, NULL, NULL),
(819, 'E120', 'Mudah Belajar Php', 5, NULL, NULL),
(820, 'E121', 'Belajar Otodidak Pemograman', 5, NULL, NULL),
(821, 'E122', 'Sains Modern', 5, NULL, NULL),
(822, 'E123', '72 Trik Membaca Karakter', 5, NULL, NULL),
(823, 'E124', 'Psikologi Positif', 5, NULL, NULL),
(824, 'E125', 'Membangun Entrepreneur Indonesia', 5, NULL, NULL),
(825, 'E126', 'China Membeli Dunia', 5, NULL, NULL),
(826, 'E127', 'Update Paling Lengkap Semua Jenis Pertanyaan', 5, NULL, NULL),
(827, 'E128', 'Hukum Perceraian Untuk Wanita Islam', 5, NULL, NULL),
(828, 'E129', 'Kenapa Harus Bumd ???', 5, NULL, NULL),
(829, 'E130', 'Adat Berdaulat Melawan Serbuan Kapitalisme', 5, NULL, NULL),
(830, 'E131', 'Pr Corner', 5, NULL, NULL),
(831, 'E132', 'Chevronomics', 5, NULL, NULL),
(832, 'E133', 'Dari Akar Kami Tumbuh', 5, NULL, NULL),
(833, 'E134', '101 Anak Jenius Di Dunia', 5, NULL, NULL),
(834, 'E135', 'Iblis - Iblis Wanita Hitler', 5, NULL, NULL),
(835, 'E136', 'Get Your Love', 5, NULL, NULL),
(836, 'E137', 'Membantah Atlantas', 5, NULL, NULL),
(837, 'E138', 'Pendulum Galileo', 5, NULL, NULL),
(838, 'E139', 'Visi Kepemimpinan Masyarakat Madani', 5, NULL, NULL),
(839, 'E140', 'Mengenal Dan Mengelola Perpustakaan', 5, NULL, NULL),
(840, 'E141', 'Parenting Sharing', 5, NULL, NULL),
(841, 'E142', 'Dasar - Dasar Dakwah Islam', 5, NULL, NULL),
(842, 'E143', 'Bagaimana Kita Meningkatkan Harga Diri Anak', 5, NULL, NULL),
(843, 'E144', 'Agnostisisme', 5, NULL, NULL),
(844, 'E145', 'Terapi Mengendalikan Pikiran Dan Hormon', 5, NULL, NULL),
(845, 'E146', 'Bicara Itu Ada Seninya', 5, NULL, NULL),
(846, 'E147', 'Pemasaran Online', 5, NULL, NULL),
(847, 'E148', 'Obat-Obat Sederhana Untuk Kesehatan Sehari-Hari', 5, NULL, NULL),
(848, 'E149', '123 Tips Simple Menjual Lebih Cepat', 5, NULL, NULL),
(849, 'E150', 'Buku Ajar Dendrologi', 5, NULL, NULL),
(850, 'E151', 'Dasar-Dasar Marketing Untuk Mahasiswa & Umum', 5, NULL, NULL),
(851, 'E152', 'Perkuat Jantung,Tulang Dan Ginjal', 5, NULL, NULL),
(852, 'E153', 'Cara Tepat Berdebat Secara Cerdas', 5, NULL, NULL),
(853, 'E154', 'Seni Negosiasi Superior', 5, NULL, NULL),
(854, 'E155', 'Marketing Plan Dalam Bisnis', 5, NULL, NULL),
(855, 'E156', 'Kamus Ilmiah Populer Internasional', 5, NULL, NULL),
(856, 'E157', 'Solusi Praktis Agar Awet Muda', 5, NULL, NULL),
(857, 'E158', 'Ber Opini Lah', 5, NULL, NULL),
(858, 'E159', 'Seni Membangun Relasi', 5, NULL, NULL),
(859, 'E160', 'Filsafat Untuk Pemalas', 5, NULL, NULL),
(860, 'E161', 'Membaca Wajah Orang', 5, NULL, NULL),
(861, 'E162', 'Filsafat Moral', 5, NULL, NULL),
(862, 'E163', 'Filsafat Kebahagiaan', 5, NULL, NULL),
(863, 'E164', 'Al-Farabi', 5, NULL, NULL),
(864, 'E165', 'The Psychology Of Change', 5, NULL, NULL),
(865, 'E166', 'The Psychology Of Money', 5, NULL, NULL),
(866, 'E167', 'Menjadi Kaya Versi Kamu Sendiri', 5, NULL, NULL),
(867, 'E168', 'Jurnalisme Dasar', 5, NULL, NULL),
(868, 'E169', 'Personal Branding', 5, NULL, NULL),
(869, 'F001', 'Sejarah Terlengkap Peradaban Islam', 3, NULL, NULL),
(870, 'F002', 'Sejarah Dan Kebudayaan Islam Periode Klasik (Abad Vii-Xiii M)', 3, NULL, NULL),
(871, 'F003', 'Atlas Wali Songo', 3, NULL, NULL),
(872, 'F004', 'Rihlah Semesta', 3, NULL, NULL),
(873, 'F005', 'Catatan Hitam Lima Presiden Indonesia', 3, NULL, NULL),
(874, 'F006', 'Sejarah Islam Di Nusantara', 3, NULL, NULL),
(875, 'F007', 'Kamus Sejarah Dan Budaya Indonesia', 3, NULL, NULL),
(876, 'F008', 'Sejarah Pemikiran Barat', 3, NULL, NULL),
(877, 'F009', 'Kraton Surakarta', 3, NULL, NULL),
(878, 'F010', 'The Fall Of The Khilafah', 3, NULL, NULL),
(879, 'F011', 'Nusantara Sejarah Indonesia', 3, NULL, NULL),
(880, 'F012', 'Dinasti Qing', 3, NULL, NULL),
(881, 'F013', 'Percikan Filsafat Sejarah Dan Peradaban Islam', 3, NULL, NULL),
(882, 'F014', 'Bungkarno Difitnah', 3, NULL, NULL),
(883, 'F015', 'Bermuka Dua', 3, NULL, NULL),
(884, 'F016', 'Perang-Perang Dalam Sejarah Islam', 3, NULL, NULL),
(885, 'F017', 'Sejarah Islam Yang Terlupakan', 3, NULL, NULL),
(886, 'F018', 'Reorientasi Wawasan Sejarah Islam', 3, NULL, NULL),
(887, 'F019', 'Kh. M. Kholil Bangkalan', 3, NULL, NULL),
(888, 'F020', 'Sejarah Isis Dan Illuminati', 3, NULL, NULL),
(889, 'F021', 'Sejarah Berdarah Sekte Salafi Wahabi', 3, NULL, NULL),
(890, 'F022', 'Sulawesi Selatan', 3, NULL, NULL),
(891, 'F023', 'Migrasi & Orang Bugis', 3, NULL, NULL),
(892, 'F024', 'Sejarah Agama Jawa', 3, NULL, NULL),
(893, 'F025', 'Akar Sejarah Etika Pesantren', 3, NULL, NULL),
(894, 'F026', 'Sejarah Umat Islam', 3, NULL, NULL),
(895, 'F027', 'Knpi & Pemuda Harapan Bangsa', 3, NULL, NULL),
(896, 'F028', 'Ensiklopedia Masjid', 3, NULL, NULL),
(897, 'F029', 'Sejarah Pembangunan Kuhp & Kuhap', 3, NULL, NULL),
(898, 'F030', 'Auman Terakhir Macan Tamil', 3, NULL, NULL),
(899, 'F031', 'Tempat Persembunyian Yahudi Di Akhir Zaman', 3, NULL, NULL),
(900, 'F032', 'Orang - Orang Yang Mempengaruhi Dunia Islam', 3, NULL, NULL),
(901, 'F033', 'Sapiens', 3, NULL, NULL),
(902, 'F034', 'Muhammad Al Fatih', 3, NULL, NULL),
(903, 'F035', 'Kepurbakalaan Islam Nusantara', 3, NULL, NULL),
(904, 'F036', '5 Khalifah Kebanggan Islam', 3, NULL, NULL),
(905, 'F037', 'Sajarah Dunia Yang Disembunyikan', 3, NULL, NULL),
(906, 'F038', 'Pergulatan Demokrasi 1950 - 1956', 3, NULL, NULL),
(907, 'F039', 'Sukarno', 3, NULL, NULL),
(908, 'F040', 'The Hidden History', 3, NULL, NULL),
(909, 'F041', 'Mitologi Dunia', 3, NULL, NULL),
(910, 'F042', 'Sejarah Nusantara', 3, NULL, NULL),
(911, 'F043', 'Zulkarnain Agung', 3, NULL, NULL),
(912, 'F044', 'Babad Tanah Jawa', 3, NULL, NULL),
(913, 'F045', 'Menemukan Kembali', 3, NULL, NULL),
(914, 'F046', 'Strategi Kebudayaan Nu', 3, NULL, NULL),
(915, 'F047', 'Intisari Sirah Nabawiyah', 3, NULL, NULL),
(916, 'F048', '108 Ilmuan & Penemu Dunia', 3, NULL, NULL),
(917, 'F049', 'Kuasa Rakyat Merdeka', 3, NULL, NULL),
(918, 'F050', 'Asal Usul Benda Disekitar Kita Tempo Doeloe', 3, NULL, NULL),
(919, 'F051', 'Momen-Momen Menentukan Dalam Sejarah Islam', 3, NULL, NULL),
(920, 'F052', 'Menanti Imam Mahdi', 3, NULL, NULL),
(921, 'F053', 'Kisah-Kisah Unik Waliyullah Ditanah Jawa', 3, NULL, NULL),
(922, 'F054', 'Pengantar Sejarah Patani', 3, NULL, NULL),
(923, 'F055', 'Hysory Of The Malay Kingdom Of Patani', 3, NULL, NULL),
(924, 'F056', 'Hikayat Patani', 3, NULL, NULL),
(925, 'F057', 'Negara Patani Darussalam', 3, NULL, NULL),
(926, 'F058', 'Perjuangan Muslim Patani', 3, NULL, NULL),
(927, 'F059', 'Hikayat Patani', 3, NULL, NULL),
(928, 'F060', 'Fatani 13 Ogos', 3, NULL, NULL),
(929, 'F061', 'Majapahit', 3, NULL, NULL),
(930, 'F062', 'Banjir Besar Zaman Nabi Nuh', 3, NULL, NULL),
(931, 'G001', 'Kamus Besar Bahasa Indonesia Pusat Bahasa', 11, NULL, NULL),
(932, 'G002', 'English Gremmar', 11, NULL, NULL),
(933, 'G003', 'Kamus Pintar Agama Islam', 11, NULL, NULL),
(934, 'G004', 'Seni Rupa Modern', 11, NULL, NULL),
(935, 'G005', 'Fundamentalis English Grammar', 11, NULL, NULL),
(936, 'G006', 'Kumpulan Puisi Kasidah Air Mata', 11, NULL, NULL),
(937, 'G007', 'Panduan Terlengkap Puebi', 11, NULL, NULL),
(938, 'G008', 'Kamus Peribahsa', 11, NULL, NULL),
(939, 'G009', 'Kamus Istilah Agama Islam [Kiai]', 11, NULL, NULL),
(940, 'G010', 'Merupa Tanah Di Ujung Timur Jawa', 11, NULL, NULL),
(941, 'G011', 'Jurnalisme Dasar', 11, NULL, NULL),
(942, 'G012', 'Kamus Arab-Indonesia', 11, NULL, NULL),
(943, 'G013', 'Pada Masa Intoleransi', 11, NULL, NULL),
(944, 'G014', 'Tiga Bulan Tiga Bahasa', 11, NULL, NULL),
(945, 'G016', 'Kado Untuk Istriku', 11, NULL, NULL),
(946, 'G017', 'Strategi Dan Kiat Menerjemahkan Teks Bahasa Arab Kedalam Bahasaa Indonesia', 11, NULL, NULL),
(947, 'G019', 'Sukses Menjadi Penulis', 11, NULL, NULL),
(948, 'G020', 'Pintar Bahasa Perancis Dalam Sekejap', 11, NULL, NULL),
(949, 'G021', 'Cara Gampang Jadi Wartawan', 11, NULL, NULL),
(950, 'G022', 'Kamus Istilah Sastra', 11, NULL, NULL),
(951, 'G023', 'Aku Bisa Nulis Cerpen', 11, NULL, NULL),
(952, 'G024', 'Sosiologi Sastra', 11, NULL, NULL),
(953, 'G025', 'English Business Letters', 11, NULL, NULL),
(954, 'G026', 'Kagum Kepada Orang Indonesia', 11, NULL, NULL),
(955, 'G027', 'English Vocabulary', 11, NULL, NULL),
(956, 'G028', 'Izinkan Aku Mencintaimu Apa Adanya', 11, NULL, NULL),
(957, 'G029', 'Oxford', 11, NULL, NULL),
(958, 'G030', '15 Menit Lancar Berbahasa Inggris', 11, NULL, NULL),
(959, 'G031', 'Menggapai Bintang Dan Matahari', 11, NULL, NULL),
(960, 'G032', 'Dancing Rain', 11, NULL, NULL),
(961, 'G033', 'Rahasia Tersembunyi Dibawah Al Aqsa', 11, NULL, NULL),
(962, 'G034', 'Indonesia Unik Dan Langka', 11, NULL, NULL),
(963, 'G035', 'Ensiklopedi Wayang', 11, NULL, NULL),
(964, 'G036', 'Cepat Dan Mudah Kuasai Bahasa Arab', 11, NULL, NULL),
(965, 'G037', 'Semiliar Cinta Untuk Bunda', 11, NULL, NULL),
(966, 'G038', 'Chairil Anwar', 11, NULL, NULL),
(967, 'G039', 'Pintar Pantun Dan Puisi Peribahasa', 11, NULL, NULL),
(968, 'G040', 'Mahir Percakapan 3 Bahasa', 11, NULL, NULL),
(969, 'H001', '100 Kisah-Kisah Tokoh Besar', 4, NULL, NULL),
(970, 'H002', 'Muhammad Sang Nabi', 4, NULL, NULL),
(971, 'H003', 'Manunggaling Kawula Gusti', 4, NULL, NULL),
(972, 'H004', 'Bung Karno Panglima', 4, NULL, NULL),
(973, 'H005', 'Gus Dur', 4, NULL, NULL),
(974, 'H006', 'Waspadalah Putriku, Serigala Mengintaimu', 4, NULL, NULL),
(975, 'H007', 'Sang Zahid Mengarungi Sufisme Gus Dur', 4, NULL, NULL),
(976, 'H008', 'Syaikhona Kholil Bangkalan Penentu Berdirinya Nu', 4, NULL, NULL),
(977, 'H009', 'Wahid Hasyim', 4, NULL, NULL),
(978, 'H010', 'Personal Success Stopries Of Top 15 Indonesia Motivators', 4, NULL, NULL),
(979, 'H011', 'Kumpulan Legenda, Hikayat & Cerita Rakyat Nusantra', 4, NULL, NULL),
(980, 'H012', 'Dari Jakarta Menuju Gedung Putih', 4, NULL, NULL),
(981, 'H013', 'Mohammad Hatta Biografi Singkat 1902-1980', 4, NULL, NULL),
(982, 'H014', 'Kiyai Sastrawan Yang Tak Dikenal', 4, NULL, NULL),
(983, 'H015', 'Menyikapi Kehidupan Para Tokoh Sufi', 4, NULL, NULL),
(984, 'H016', 'Ajaran Dan Jalan Kematian Syekh Siti Jenar', 4, NULL, NULL),
(985, 'H017', 'Soekarno & China', 4, NULL, NULL),
(986, 'H018', 'Mimpi Kosong, Mimpi Isi', 4, NULL, NULL),
(987, 'H019', 'K.H Wahab Hasbullah', 4, NULL, NULL),
(988, 'H020', 'The Davinci Memories', 4, NULL, NULL),
(989, 'H021', 'Sosok Nabi Khidir Ynag Super Misterius', 4, NULL, NULL),
(990, 'H022', 'Wanita-Wanita Penakluk Badai', 4, NULL, NULL),
(991, 'H023', 'Para Diktator Terheboh Dunia Yang Berhasil Digulingkan', 4, NULL, NULL),
(992, 'H024', 'Misteri Nyi Roro Kidul Dan Laut Selatan', 4, NULL, NULL),
(993, 'H025', 'Panggil Aku Kartini Saja', 4, NULL, NULL),
(994, 'H026', 'Cerdik Mencintai Tak Gentar Dusta', 4, NULL, NULL),
(995, 'H027', 'Kisah Hantu-Hantu China', 4, NULL, NULL),
(996, 'H028', 'Kiai Nyentrik Abdurrahman Wahid Membela Pemerintah', 4, NULL, NULL),
(997, 'H029', '80 Ilmuwan Besar Dunia Bidang Fisika & Biologi', 4, NULL, NULL),
(998, 'H030', 'Kemuliaan Taubat', 4, NULL, NULL),
(999, 'H031', 'Uniknya Dahlan', 4, NULL, NULL),
(1000, 'H032', 'Kisah-Kisah Sahabat-Sahabat Nabi', 4, NULL, NULL),
(1001, 'H033', 'Profi-Profil Orang-Orang Penyandangan Kekurangan Fisik Atau Mental', 4, NULL, NULL),
(1002, 'H034', 'Kitab Senyuman', 4, NULL, NULL),
(1003, 'H035', 'Anekdot Fauna', 4, NULL, NULL),
(1004, 'H036', 'Gus Dur Dalam Obrolan Gus Mus', 4, NULL, NULL),
(1005, 'H037', '1001 Keajaiban Ketakwaan', 4, NULL, NULL),
(1006, 'H038', 'Menanti Giliran', 4, NULL, NULL),
(1007, 'H039', 'Penelusuran Hadist Rosullah Saw', 4, NULL, NULL),
(1008, 'H040', 'The Manchunian Way', 4, NULL, NULL),
(1009, 'H041', 'Lupa Endonesi Deui', 4, NULL, NULL),
(1010, 'H042', 'Peradilan Sesat', 4, NULL, NULL),
(1011, 'H043', 'Ali Sadikin', 4, NULL, NULL),
(1012, 'H044', 'Antara Mikrobiologi & Mikropolitik', 4, NULL, NULL),
(1013, 'H045', 'Catatan Dari Bilik Jendela Sekolah', 4, NULL, NULL),
(1014, 'H046', 'Belajar Dari Hati', 4, NULL, NULL),
(1015, 'H047', 'The Bruce Lee Way', 4, NULL, NULL),
(1016, 'H048', 'Biografi Inspirasional Wanita Fenominal Pencipta Dunia Cleopatra', 4, NULL, NULL),
(1017, 'H049', 'Syaichona Cholil Bangkalan', 4, NULL, NULL),
(1018, 'H050', 'H. Syaukani Hr', 4, NULL, NULL),
(1019, 'H051', 'Samudera Hikmah Syekh Abdul Qodir', 4, NULL, NULL),
(1020, 'H052', 'Pramoedya Ananta Toer :', 4, NULL, NULL),
(1021, 'H053', 'Rabiah Al-Adawiyah', 4, NULL, NULL),
(1022, 'H054', 'Biografi Imam Al-Ghazali', 4, NULL, NULL),
(1023, 'H055', 'Sirah 60 Sahabat', 4, NULL, NULL),
(1024, 'H056', 'The Great Of Shalahuddin A. & M. Al-Fatih', 4, NULL, NULL),
(1025, 'H057', 'Sihir Betis Kendedes', 4, NULL, NULL),
(1026, 'H058', 'Eduardus Sabda', 4, NULL, NULL),
(1027, 'H059', 'Sepak Terjang Abraham Samad', 4, NULL, NULL),
(1028, 'H060', 'Ibu Risma Memimpin Dengan Hati', 4, NULL, NULL),
(1029, 'H061', 'Terima Kasih Ayah', 4, NULL, NULL),
(1030, 'H062', 'Don Pablo', 4, NULL, NULL),
(1031, 'H063', 'Antasari Azhar Dalang Atau Korban ?', 4, NULL, NULL),
(1032, 'H064', '101 Kepala Negara Paling Unik', 4, NULL, NULL),
(1033, 'H065', '101 Kisah Cinta Sepanjang Masa', 4, NULL, NULL),
(1034, 'H066', 'Biografi Dan Tingkatan Perawi Hadits', 4, NULL, NULL),
(1035, 'H067', 'H.O.S Tjokroaminoto', 4, NULL, NULL),
(1036, 'H068', 'Dahlan Juga Manusia', 4, NULL, NULL),
(1037, 'H069', 'Mawar Di Serambi Masjid', 4, NULL, NULL),
(1038, 'H070', 'Rahasia Otak Tengah Hitler', 4, NULL, NULL),
(1039, 'H071', 'Semangat Membatu', 4, NULL, NULL),
(1040, 'H072', 'Harakiri', 4, NULL, NULL),
(1041, 'H073', 'Mbah Hamid Pasuruan', 4, NULL, NULL),
(1042, 'H074', 'Anjing Hitam Yang Mengingatkan Seorang Syekh', 4, NULL, NULL),
(1043, 'H075', 'Nasruddin Manusia Yang Bijaksana', 4, NULL, NULL),
(1044, 'H076', 'Kisah Mimpi Orang Shaleh', 4, NULL, NULL),
(1045, 'H077', 'Memertik Matahari', 4, NULL, NULL),
(1046, 'H078', 'Renung Dan Canda Pelawak Bersorban', 4, NULL, NULL),
(1047, 'H079', 'Riwayat Singkat Almarhumin Pp Nurul Jadid', 4, NULL, NULL),
(1048, 'H080', 'Siapa Yang Tak Disayang', 4, NULL, NULL),
(1049, 'H081', 'Diktator Yang Mengguncang Dunia', 4, NULL, NULL),
(1050, 'H082', 'Sisi Lain Dari Bapak Bangsa', 4, NULL, NULL),
(1051, 'H083', 'Gus Dur Itu Isme', 4, NULL, NULL),
(1052, 'H084', 'Gus Dur', 4, NULL, NULL),
(1053, 'H085', 'Ringkasan Biografi Imam Syafii', 4, NULL, NULL),
(1054, 'H086', 'Syaikh Nawawi Al-Bantani', 4, NULL, NULL),
(1055, 'H087', 'Vladimir Putin', 4, NULL, NULL),
(1056, 'H089', 'Abdul Qadir Al Jailani', 4, NULL, NULL),
(1057, 'H090', 'Merasa Pintar Bodoh Saja Tak Punya', 4, NULL, NULL),
(1058, 'H091', 'Kisah-Kisah Penggugah Jiwa Penguat Iman', 4, NULL, NULL),
(1059, 'H092', 'Sufisme Sunan Kalijaga', 4, NULL, NULL),
(1060, 'H093', 'Dawud', 4, NULL, NULL),
(1061, 'H094', 'Siti Hajar Ibu Bangsa Arab', 4, NULL, NULL),
(1062, 'H095', '99 Kiai Kharismatik Indonesia 1', 4, NULL, NULL),
(1063, 'H096', 'The Great Figure Of Abu Bakar Ash-Shiddiq', 4, NULL, NULL),
(1064, 'H097', 'Wali Berandal Tanah Jawa', 4, NULL, NULL),
(1065, 'H098', 'The Principles Of Power', 4, NULL, NULL),
(1066, 'H099', 'The Great Figure Of Umar Bin Khattab', 4, NULL, NULL),
(1067, 'H100', 'The Great Figure Of Utsman Bin Affan', 4, NULL, NULL),
(1068, 'H101', 'Kh. Abdul Wahab Chasbullah', 4, NULL, NULL),
(1069, 'H102', 'Kh.Moh.Tolchah Mansoer', 4, NULL, NULL),
(1070, 'H103', 'Zaid Bin Tsabit', 4, NULL, NULL),
(1071, 'I001', 'Bahan Tayangan Materi Sosiallisasi Uud', 8, NULL, NULL),
(1072, 'I002', 'Panduan Pemasyarakatan Uud', 8, NULL, NULL),
(1073, 'I003', 'Membongkar Gurita Cikeas', 8, NULL, NULL),
(1074, 'I004', 'Islam Dalam Lintasan Sejarah Perpolitikan', 8, NULL, NULL),
(1075, 'I005', 'Ijtihad Politik Ulama', 8, NULL, NULL),
(1076, 'I006', 'Politik Dan Sepak Bola', 8, NULL, NULL),
(1077, 'I007', 'Sunni Dan Kekuasaan Politik', 8, NULL, NULL),
(1078, 'I008', 'Php (Politik Harapan Palsu)', 8, NULL, NULL),
(1079, 'I009', 'Koruptor Rajim', 8, NULL, NULL),
(1080, 'I010', 'Apapun Partainya, Korupsi Hobinya', 8, NULL, NULL),
(1081, 'I011', 'Uud 1945 Sesudah Dan Sebelum Amandemen', 8, NULL, NULL),
(1082, 'I012', 'Buku Lengkap Kuhp & Kuhap', 8, NULL, NULL),
(1083, 'I013', 'Dasar - Dasar Ilmu Politik', 8, NULL, NULL),
(1084, 'I014', 'Pers Perlawanan', 8, NULL, NULL),
(1085, 'I015', 'Hukum Pidana Khusus', 8, NULL, NULL),
(1086, 'I016', 'Sosiologi Agama', 8, NULL, NULL),
(1087, 'I017', 'Sosiologi Hukum Sebuah Pengantar', 8, NULL, NULL),
(1088, 'I018', 'Sosiologi Pendidikan', 8, NULL, NULL);
INSERT INTO `bukus` (`id`, `kode_buku`, `nama_buku`, `kategori_id`, `created_at`, `updated_at`) VALUES
(1089, 'I019', 'Pemikiran Emas Tokoh-Tokoh Politik Dunia', 8, NULL, NULL),
(1090, 'I020', 'Panjangnya Politik', 8, NULL, NULL),
(1091, 'I021', 'Perebutan Hak Atas Kelola Sumber Daya', 8, NULL, NULL),
(1092, 'I022', 'Menggapai Solidaritas', 8, NULL, NULL),
(1093, 'I023', 'Partisipasi Politik Umat Kristen Indonesia', 8, NULL, NULL),
(1094, 'I024', 'Kaki Langit Demokrasi', 8, NULL, NULL),
(1095, 'I025', 'Gerakan Kebebasan Sipil', 8, NULL, NULL),
(1096, 'I026', 'Konsolidasi', 8, NULL, NULL),
(1097, 'I027', 'Berhentinya Soeharto Fakta Dan Kesaksian Harmoko', 8, NULL, NULL),
(1098, 'I028', 'Kitab Undang-Undang Perlindungan Anak', 8, NULL, NULL),
(1099, 'J001', 'Gerbang Dunia Ke-3', 1, NULL, NULL),
(1100, 'J002', 'La Galigo 2', 1, NULL, NULL),
(1101, 'J003', 'Muhammad 4', 1, NULL, NULL),
(1102, 'J004', 'Muhammad 3', 1, NULL, NULL),
(1103, 'J005', 'Muhammad 2', 1, NULL, NULL),
(1104, 'J006', 'Muhammad 1', 1, NULL, NULL),
(1105, 'J007', 'Amba', 1, NULL, NULL),
(1106, 'J008', 'Matahari', 1, NULL, NULL),
(1107, 'J009', 'Sirkus Pohon', 1, NULL, NULL),
(1108, 'J010', 'Hamdim, Pistim, Yandim', 1, NULL, NULL),
(1109, 'J011', 'Deharmonie', 1, NULL, NULL),
(1110, 'J012', 'Kopiss', 1, NULL, NULL),
(1111, 'J013', 'Drupadi', 1, NULL, NULL),
(1112, 'J014', 'Berciuman Dengan Mata Terpenjam', 1, NULL, NULL),
(1113, 'J015', 'Tan', 1, NULL, NULL),
(1114, 'J016', 'Kasongan', 1, NULL, NULL),
(1115, 'J017', 'Surat Cinta Untuk Bapak Presiden', 1, NULL, NULL),
(1116, 'J018', 'Sunrise For Shaila', 1, NULL, NULL),
(1117, 'J019', 'Craing Winter', 1, NULL, NULL),
(1118, 'J020', 'Irene Shiling', 1, NULL, NULL),
(1119, 'J021', 'Catatan Zeefy', 1, NULL, NULL),
(1120, 'J022', 'Mengapa Aku Cantik', 1, NULL, NULL),
(1121, 'J023', 'Edensor', 1, NULL, NULL),
(1122, 'J024', 'Mimpi Rosul', 1, NULL, NULL),
(1123, 'J025', 'Rahasia Kode Abjad', 1, NULL, NULL),
(1124, 'J026', 'Miss Hola Holic', 1, NULL, NULL),
(1125, 'J027', 'Sepotong Kata Maaf', 1, NULL, NULL),
(1126, 'J028', 'Paragus', 1, NULL, NULL),
(1127, 'J029', 'Bapak Kapan Kita Akan Berdamai', 1, NULL, NULL),
(1128, 'J030', 'Nias', 1, NULL, NULL),
(1129, 'J031', 'Gerbang Trinil', 1, NULL, NULL),
(1130, 'J032', 'Ander The Winter Sky', 1, NULL, NULL),
(1131, 'J033', '3360', 1, NULL, NULL),
(1132, 'J034', 'Mimpi Jameelah', 1, NULL, NULL),
(1133, 'J035', 'Cinta Dan Batas Biarits', 1, NULL, NULL),
(1134, 'J036', 'Gadis 360 Hari Yang Lalu', 1, NULL, NULL),
(1135, 'J037', 'Cinta Keindahan', 1, NULL, NULL),
(1136, 'J038', 'Pengantin Surga', 1, NULL, NULL),
(1137, 'J039', 'Misteri Gadis Kaligrafi', 1, NULL, NULL),
(1138, 'J040', 'Cinderella Pesantren', 1, NULL, NULL),
(1139, 'J041', 'Sabda Palon', 1, NULL, NULL),
(1140, 'J042', 'Atas Singgasana', 1, NULL, NULL),
(1141, 'J043', 'Bunga Bunga Biru', 1, NULL, NULL),
(1142, 'J044', 'Who Am I ?', 1, NULL, NULL),
(1143, 'J045', 'Tulus Untuk Orang Yang Salah', 1, NULL, NULL),
(1144, 'J046', 'Romeo Juliet', 1, NULL, NULL),
(1145, 'J047', 'Pulang', 1, NULL, NULL),
(1146, 'J048', 'Aroma Karsa', 1, NULL, NULL),
(1147, 'J049', 'Garis Waktu', 1, NULL, NULL),
(1148, 'J050', 'Ayahku Bukan Pembohong', 1, NULL, NULL),
(1149, 'J051', '0.465972222222222', 1, NULL, NULL),
(1150, 'J052', 'Sanja Hujan & Cerita Yang Telahusai', 1, NULL, NULL),
(1151, 'J053', 'Bibir Tersenyum Hati Menangis', 1, NULL, NULL),
(1152, 'J054', 'Tertawa Ala Persia', 1, NULL, NULL),
(1153, 'J055', 'Raffles Further Adventures Of The Amateur Cracksman', 1, NULL, NULL),
(1154, 'J056', 'Cahayamu Tak Bisa Kutawar', 1, NULL, NULL),
(1155, 'J057', 'Pergi', 1, NULL, NULL),
(1156, 'J058', 'Trio Macan Lebih Macan', 1, NULL, NULL),
(1157, 'J059', 'The Memory Keeper\'S Daughter', 1, NULL, NULL),
(1158, 'J060', 'Benny Arnas', 1, NULL, NULL),
(1159, 'J061', 'Fantasyiru', 1, NULL, NULL),
(1160, 'J062', 'Replay', 1, NULL, NULL),
(1161, 'J063', 'The Things They Carried', 1, NULL, NULL),
(1162, 'J064', 'Love Asset', 1, NULL, NULL),
(1163, 'J065', 'Cerita Satu Cinta', 1, NULL, NULL),
(1164, 'J066', 'Senandika Prisma', 1, NULL, NULL),
(1165, 'J067', 'The War Of The Wordls', 1, NULL, NULL),
(1166, 'J068', 'Sherlock Holmes', 1, NULL, NULL),
(1167, 'J069', 'The Escapist', 1, NULL, NULL),
(1168, 'J070', 'Reinkarnasi', 1, NULL, NULL),
(1169, 'J071', 'The Elfstones Of Shannara', 1, NULL, NULL),
(1170, 'J072', 'Salah Pilih', 1, NULL, NULL),
(1171, 'J073', 'Dendang Penari', 1, NULL, NULL),
(1172, 'J074', 'Aku Milikmu Selamanya', 1, NULL, NULL),
(1173, 'J075', 'Kutukan Naskah Drama', 1, NULL, NULL),
(1174, 'J076', 'A Bad Boy', 1, NULL, NULL),
(1175, 'J077', 'The Chocolate Touch', 1, NULL, NULL),
(1176, 'J078', 'Bumi Cinta', 1, NULL, NULL),
(1177, 'J079', 'Orang-Orang Biasa', 1, NULL, NULL),
(1178, 'J080', 'Kumpulan Puisi & Cerpen Ilustrasi', 1, NULL, NULL),
(1179, 'J081', 'Pet Sematary', 1, NULL, NULL),
(1180, 'J082', 'Dunia Sophie', 1, NULL, NULL),
(1181, 'J083', 'My Bastard Prince', 1, NULL, NULL),
(1182, 'J084', 'Di Balik Pintu No. 18', 1, NULL, NULL),
(1183, 'J085', 'Kata', 1, NULL, NULL),
(1184, 'J086', 'Rindu Itu Hujan(Rih)', 1, NULL, NULL),
(1185, 'J087', 'Ivanna', 1, NULL, NULL),
(1186, 'J088', 'I Wuf U', 1, NULL, NULL),
(1187, 'J089', 'Orangeboy', 1, NULL, NULL),
(1188, 'J090', 'Hello(Again),Cello', 1, NULL, NULL),
(1189, 'J091', 'Rembulan Tenggelam Di Wajahmu', 1, NULL, NULL),
(1190, 'J092', 'Moga Bunda Disayang Allah', 1, NULL, NULL),
(1191, 'J093', 'Humaira Dan Al Farisi', 1, NULL, NULL),
(1192, 'J094', 'The Playlist', 1, NULL, NULL),
(1193, 'J095', 'Christmas At Carrington\'S', 1, NULL, NULL),
(1194, 'J096', 'Once Upon A Time In St. Peterburg', 1, NULL, NULL),
(1195, 'J097', 'Api Awan Asap', 1, NULL, NULL),
(1196, 'J098', 'My Bittersweet Marriage', 1, NULL, NULL),
(1197, 'J099', 'Complicated Thing Called Love', 1, NULL, NULL),
(1198, 'J100', 'Galette', 1, NULL, NULL),
(1199, 'J101', 'Golden Bird', 1, NULL, NULL),
(1200, 'J102', 'Reuni', 1, NULL, NULL),
(1201, 'J103', 'Foodcourt Corner', 1, NULL, NULL),
(1202, 'J104', 'Rahasia Klan Nicholson', 1, NULL, NULL),
(1203, 'J105', 'Mean Streak', 1, NULL, NULL),
(1204, 'J106', 'Teman', 1, NULL, NULL),
(1205, 'J107', 'Runaway To Heaven', 1, NULL, NULL),
(1206, 'J108', 'Mealova', 1, NULL, NULL),
(1207, 'J109', 'Cerita Cinta Tanpa Cinta', 1, NULL, NULL),
(1208, 'J110', 'Misteri Cinta Kamar 313', 1, NULL, NULL),
(1209, 'J111', 'A Thousand Miles In Broken Slippers', 1, NULL, NULL),
(1210, 'J112', 'Hairless', 1, NULL, NULL),
(1211, 'J113', 'Sensei', 1, NULL, NULL),
(1212, 'J114', 'The Lucy One', 1, NULL, NULL),
(1213, 'J115', 'Mr. Justice Raffles', 1, NULL, NULL),
(1214, 'J116', 'Surat Untuk Hera', 1, NULL, NULL),
(1215, 'J117', 'Gua Jepang 4', 1, NULL, NULL),
(1216, 'J118', 'Rindu', 1, NULL, NULL),
(1217, 'J119', 'Belahan Jiwa', 1, NULL, NULL),
(1218, 'J120', 'Si Anak Kuat', 1, NULL, NULL),
(1219, 'J121', 'The Unexpected Soulmate', 1, NULL, NULL),
(1220, 'J122', '9 Summers 10 Autumns', 1, NULL, NULL),
(1221, 'J123', 'Kiss The Rain', 1, NULL, NULL),
(1222, 'J124', 'Ailurofil', 1, NULL, NULL),
(1223, 'J125', 'Frank Frurt', 1, NULL, NULL),
(1224, 'J126', 'Hey Badboy', 1, NULL, NULL),
(1225, 'J127', 'Half', 1, NULL, NULL),
(1226, 'J128', 'Garuda', 1, NULL, NULL),
(1227, 'J129', 'Kepada Gema', 1, NULL, NULL),
(1228, 'J130', 'Neraka Cermin', 1, NULL, NULL),
(1229, 'J131', 'Hello', 1, NULL, NULL),
(1230, 'J132', 'The Destiny', 1, NULL, NULL),
(1231, 'J133', 'The Gentleman Secret', 1, NULL, NULL),
(1232, 'J134', 'Before It\'S Too Late', 1, NULL, NULL),
(1233, 'J135', 'The Twelfth Sight', 1, NULL, NULL),
(1234, 'J136', 'Wander Woman', 1, NULL, NULL),
(1235, 'J137', 'Aku Cantik', 1, NULL, NULL),
(1236, 'J138', 'Jodoh Untuk Naina', 1, NULL, NULL),
(1237, 'J139', 'Pembunuh Berantai', 1, NULL, NULL),
(1238, 'J140', 'Will You Marry Me?', 1, NULL, NULL),
(1239, 'J141', 'Annisa Kapal Yang Berlabuh', 1, NULL, NULL),
(1240, 'J142', 'Maharesa', 1, NULL, NULL),
(1241, 'J143', 'Golden Bird Ultimate', 1, NULL, NULL),
(1242, 'J144', 'Insya Allah Sah!', 1, NULL, NULL),
(1243, 'J145', 'Tenggat Waktu', 1, NULL, NULL),
(1244, 'J146', 'Seribu', 1, NULL, NULL),
(1245, 'J147', 'My Protective Bilionare', 1, NULL, NULL),
(1246, 'J148', 'Stuck In Love', 1, NULL, NULL),
(1247, 'J149', 'Kefalonia', 1, NULL, NULL),
(1248, 'J150', 'Jaka Tarub Mencari Cinta', 1, NULL, NULL),
(1249, 'J151', 'The Elegy', 1, NULL, NULL),
(1250, 'J152', 'Malaikat', 1, NULL, NULL),
(1251, 'J153', 'Amoi', 1, NULL, NULL),
(1252, 'J154', 'Cupcake Love Story', 1, NULL, NULL),
(1253, 'J155', 'Love Spell', 1, NULL, NULL),
(1254, 'J156', 'Oven The Rain', 1, NULL, NULL),
(1255, 'J157', 'Love Hate Love', 1, NULL, NULL),
(1256, 'J158', 'Bibi Gil', 1, NULL, NULL),
(1257, 'J159', 'Biru', 1, NULL, NULL),
(1258, 'J160', 'Joko Tingkir', 1, NULL, NULL),
(1259, 'J161', 'Tanah Para Bandit', 1, NULL, NULL),
(1260, 'J162', 'The Cobra', 1, NULL, NULL),
(1261, 'J163', 'Star Light', 1, NULL, NULL),
(1262, 'J164', 'Pacar Keliga', 1, NULL, NULL),
(1263, 'J165', 'Bumi', 1, NULL, NULL),
(1264, 'J166', 'Rumah Hujan', 1, NULL, NULL),
(1265, 'J167', 'Daisy Miller', 1, NULL, NULL),
(1266, 'J168', 'Love Me Again', 1, NULL, NULL),
(1267, 'J169', 'Kailasa', 1, NULL, NULL),
(1268, 'J170', 'Rahasia Kitab Atlantis', 1, NULL, NULL),
(1269, 'J171', 'Winner', 1, NULL, NULL),
(1270, 'J172', 'Black Monday', 1, NULL, NULL),
(1271, 'J173', 'Sagaras', 1, NULL, NULL),
(1272, 'J174', 'For Motrimonial Purposes', 1, NULL, NULL),
(1273, 'J175', 'Bumi Manusia', 1, NULL, NULL),
(1274, 'J176', 'Anak Semua Bangsa', 1, NULL, NULL),
(1275, 'J177', 'Jejak Langkah', 1, NULL, NULL),
(1276, 'J178', 'Rumah Kaca', 1, NULL, NULL),
(1277, 'J179', 'Sewu Dino', 1, NULL, NULL),
(1278, 'J180', 'Bulan', 1, NULL, NULL),
(1279, 'J181', 'Laut Bercerita', 1, NULL, NULL),
(1280, 'J182', 'Bintang', 1, NULL, NULL),
(1281, 'J183', 'Ceros Batozar', 1, NULL, NULL),
(1282, 'J184', 'Komet', 1, NULL, NULL),
(1283, 'J185', 'Komet Minor', 1, NULL, NULL),
(1284, 'J186', 'Selena', 1, NULL, NULL),
(1285, 'J187', 'Nebula', 1, NULL, NULL),
(1286, 'J188', 'Lumpu', 1, NULL, NULL),
(1287, 'J189', 'Si Putih', 1, NULL, NULL),
(1288, 'J190', 'Pulang & Pergi', 1, NULL, NULL),
(1289, 'J191', 'Ada Apa Dengan Cinta', 1, NULL, NULL),
(1290, 'J192', 'Detektif Louisa & Daniel', 1, NULL, NULL),
(1291, 'J193', 'Ayah Dan Sirkus Pohon', 1, NULL, NULL),
(1292, 'J194', 'Laila & Majnun', 1, NULL, NULL),
(1293, 'J195', 'Silence', 1, NULL, NULL),
(1294, 'J196', 'Story Of Seth', 1, NULL, NULL),
(1295, 'J197', 'Matahari Minor', 1, NULL, NULL),
(1296, 'J198', 'Damiens Lovers', 1, NULL, NULL),
(1297, 'J199', 'Anak Rantau', 1, NULL, NULL),
(1298, 'J200', 'Santri Pilihan Bunda', 1, NULL, NULL),
(1299, 'J201', 'Janur Ireng', 1, NULL, NULL),
(1300, 'J202', 'The Kane Chronicles', 1, NULL, NULL),
(1301, 'J203', 'Maaf!', 1, NULL, NULL),
(1302, 'J204', 'Rahasia', 1, NULL, NULL),
(1303, 'J205', 'Tidak Tahu', 1, NULL, NULL),
(1304, 'J206', 'Kembara Rindu', 1, NULL, NULL),
(1305, 'J207', 'Suluh Rindu', 1, NULL, NULL),
(1306, 'J208', 'Negeri Para Bedebah', 1, NULL, NULL),
(1307, 'J209', 'Negeri Di Ujung Tanduk', 1, NULL, NULL),
(1308, 'J210', 'Bedebah Di Ujung Tanduk', 1, NULL, NULL),
(1309, 'J211', 'Antar Kota Antar Perasaan', 1, NULL, NULL),
(1310, 'J212', 'Tentang Kamu', 1, NULL, NULL),
(1311, 'J213', 'Your Name', 1, NULL, NULL),
(1312, 'J214', 'Sesuk', 1, NULL, NULL),
(1313, 'J215', '7 Prajurit Bapak', 1, NULL, NULL),
(1314, 'J216', 'Si Anak Cahaya', 1, NULL, NULL),
(1315, 'J217', 'Si Anak Pelangi', 1, NULL, NULL),
(1316, 'J218', 'Magma', 1, NULL, NULL),
(1317, 'J219', 'Humor Dokter +', 1, NULL, NULL),
(1318, 'J220', 'Si Anak Spesial', 1, NULL, NULL),
(1319, 'J221', 'Si Anak Pintar', 1, NULL, NULL),
(1320, 'J222', 'Si Anak Pemberani', 1, NULL, NULL),
(1321, 'J223', 'Kau,Aku,Dan Sepucuk Angpau Merah', 1, NULL, NULL),
(1322, 'J224', 'Agaskar', 1, NULL, NULL),
(1323, 'J225', 'Kutukan Dosa Selina', 1, NULL, NULL),
(1324, 'J226', 'Kisah Hantu -Hantu Dinusantara', 1, NULL, NULL),
(1325, 'J227', 'Sekar Pati', 1, NULL, NULL),
(1326, 'J228', 'Si Jago', 1, NULL, NULL),
(1327, 'J229', 'Yang Telah Lama Pergi', 1, NULL, NULL),
(1328, 'J230', 'From Pesantren With Laugh', 1, NULL, NULL),
(1329, 'J231', 'Pemanggilan Arwah Tuan Tilly', 1, NULL, NULL),
(1330, 'J232', 'Parable', 1, NULL, NULL),
(1331, 'J233', 'Ranjat Kembang', 1, NULL, NULL),
(1332, 'J234', 'Tenggelamnya Kapal Van Der Wijck', 1, NULL, NULL),
(1333, 'J235', 'Gravity', 1, NULL, NULL),
(1334, 'J236', 'Ily', 1, NULL, NULL),
(1335, 'J237', 'Hero At The Fall', 1, NULL, NULL),
(1336, 'J238', 'Si Anak Badai', 1, NULL, NULL),
(1337, 'J239', 'The Magic Library', 1, NULL, NULL),
(1338, 'J240', 'Pocong Gundul', 1, NULL, NULL),
(1339, 'J241', 'Atlanta', 1, NULL, NULL),
(1340, 'J242', 'Psychic Detective Yakumo (I)', 1, NULL, NULL),
(1341, 'J243', 'Psychic Detective Yakumo (Ii)', 1, NULL, NULL),
(1342, 'J244', 'Psychic Detective Yakumo (Iii)', 1, NULL, NULL),
(1343, 'J245', 'Psychic Detective Yakumo (Iv)', 1, NULL, NULL),
(1344, 'J246', 'Psychic Detective Yakumo (V)', 1, NULL, NULL),
(1345, 'J247', 'Psychic Detective Yakumo Part 1 (Vi)', 1, NULL, NULL),
(1346, 'J248', 'Psychic Detective Yakumo Part 2 (Vi)', 1, NULL, NULL),
(1347, 'J249', 'Kereta Api Hantu', 1, NULL, NULL),
(1348, 'J250', 'Mencari Saranjana', 1, NULL, NULL),
(1349, 'J251', 'Sunset Bersama Rosie', 1, NULL, NULL),
(1350, 'J252', 'Perfect Partner', 1, NULL, NULL),
(1351, 'J253', 'Gerbang Dua Semesta', 1, NULL, NULL),
(1352, 'J254', 'Setan-Setan Menggugat', 1, NULL, NULL),
(1353, 'J255', 'Sihir Mesir Di Tanah Jawa', 1, NULL, NULL),
(1354, 'J256', 'Unforgetable India', 1, NULL, NULL),
(1355, 'J257', 'Antariksa', 1, NULL, NULL),
(1356, 'J258', 'Raja Ratu Dan Rindu', 1, NULL, NULL),
(1357, 'J259', 'Planet Magnon', 1, NULL, NULL),
(1358, 'J260', 'Hafalan Shalat Delisa', 1, NULL, NULL),
(1359, 'J261', 'Bandit-Bandit Berkelas', 1, NULL, NULL),
(1360, 'J262', 'Berjuta Rasanya', 1, NULL, NULL),
(1361, 'J263', 'Teror Pocong Duloh', 1, NULL, NULL),
(1362, 'J264', 'Gara-Gara Abang', 1, NULL, NULL),
(1363, 'J265', 'Dia Adalah Kakakku', 1, NULL, NULL),
(1364, 'J266', 'Badan Intelijen Sekolah', 1, NULL, NULL),
(1365, 'J267', '30 Juz', 1, NULL, NULL),
(1366, 'J268', 'Unit Gaib Darurat', 1, NULL, NULL),
(1367, 'J269', 'Archipelagos Wizarding School In Nusantara', 1, NULL, NULL),
(1368, 'J270', 'Archipelagos Wizarding School In Nusantara 2', 1, NULL, NULL),
(1369, 'J271', 'Teruslah Bodoh Jangan Pintar', 1, NULL, NULL),
(1370, 'J272', 'Rasa', 1, NULL, NULL),
(1371, 'J273', 'Best Time', 1, NULL, NULL),
(1372, 'J274', 'Cantik Itu Luka', 1, NULL, NULL),
(1373, 'J275', '3478 Mdpl', 1, NULL, NULL),
(1374, 'J276', 'Sisi Tergelap Surga', 1, NULL, NULL),
(1375, 'J277', 'Cinta Antara Jakarta & Kuala Lumpur', 1, NULL, NULL),
(1376, 'J278', 'Namaku Alam', 1, NULL, NULL),
(1377, 'J279', 'Animals Farm', 1, NULL, NULL),
(1378, 'K001', '1001 Penemuan & Fakta Mempesona Peradaban Bumi', 6, NULL, NULL),
(1379, 'K002', 'Apa Jadinya? Boyer', 6, NULL, NULL),
(1380, 'K003', 'Why? The Human Body', 6, NULL, NULL),
(1381, 'K004', 'Why? Pooh', 6, NULL, NULL),
(1382, 'K005', 'Why? The Science Of Sleep', 6, NULL, NULL),
(1383, 'K006', 'Why? Poisionous Animal & Plants', 6, NULL, NULL),
(1384, 'K007', 'Why? Future Scince', 6, NULL, NULL),
(1385, 'K008', 'Why? Magic Scince', 6, NULL, NULL),
(1386, 'K009', 'Why? Movie Film', 6, NULL, NULL),
(1387, 'K010', 'Why? People,Bill Gates', 6, NULL, NULL),
(1388, 'K011', 'Catatan Kaki Dari Gaza', 6, NULL, NULL),
(1389, 'K012', 'Natural Disasters', 6, NULL, NULL),
(1390, 'K013', 'Insects', 6, NULL, NULL),
(1391, 'K014', 'Islam Itu Ramah, Mudah, Indah', 6, NULL, NULL),
(1392, 'K015', 'Fish', 6, NULL, NULL),
(1393, 'K016', 'Disease', 6, NULL, NULL),
(1394, 'K017', 'Virtual Reality & Augmented Reality', 6, NULL, NULL),
(1395, 'K018', 'Hijrah', 6, NULL, NULL),
(1396, 'K019', 'Shalahuddin Al-Ayyubi (01)', 6, NULL, NULL),
(1397, 'K020', 'Shalahuddin Al-Ayyubi (02)', 6, NULL, NULL),
(1398, 'K021', 'Muhammad Al-Fatih #1', 6, NULL, NULL),
(1399, 'K022', 'Muhammad Al-Fatih #2', 6, NULL, NULL),
(1400, 'K023', 'Muhammad Al-Fatih #3', 6, NULL, NULL),
(1401, 'K024', 'Why? Tradisional Science', 6, NULL, NULL),
(1402, 'K025', 'Atlas Antariksa', 6, NULL, NULL),
(1403, 'K026', 'Fauna Pedia', 6, NULL, NULL),
(1404, 'K027', 'Kreasi Busana Daerah Indonesia', 6, NULL, NULL),
(1405, 'K028', 'Information Technology', 6, NULL, NULL),
(1406, 'K029', 'Living Fossil', 6, NULL, NULL),
(1407, 'K030', 'The Amazon', 6, NULL, NULL),
(1408, 'K031', 'Symbiosis And Natural Enemy', 6, NULL, NULL),
(1409, 'K032', 'Anatomi', 6, NULL, NULL),
(1410, 'K033', 'Useful & Harmful Insects', 6, NULL, NULL),
(1411, 'K034', 'Si Juki Seri Keroykan #7', 6, NULL, NULL),
(1412, 'K035', 'Shalahuddin Al-Ayyubi (3)', 6, NULL, NULL),
(1413, 'K036', 'Shalahuddin Al-Ayyubi (4)', 6, NULL, NULL),
(1414, 'K037', 'Shalahuddin Al-Ayyubi (5)', 6, NULL, NULL),
(1415, 'K038', 'Shalahuddin Al-Ayyubi (6)', 6, NULL, NULL),
(1416, 'K039', 'Why? Fine Dust', 6, NULL, NULL),
(1417, 'K040', 'Iqomic (3)', 6, NULL, NULL),
(1418, 'K041', 'Si Toyeb', 6, NULL, NULL),
(1419, 'K042', 'Iqomic (1)', 6, NULL, NULL),
(1420, 'K043', 'Al-Fatih Vs Vlad Dracula #1', 6, NULL, NULL),
(1421, 'K044', 'Al-Fatih Vs Vlad Dracula #2', 6, NULL, NULL),
(1422, 'K045', 'Al-Fatih Vs Vlad Dracula #3', 6, NULL, NULL),
(1423, 'K046', '10 Pahlawan Islam', 6, NULL, NULL),
(1424, 'K047', '10 Sahabat Mulia Karna Islam', 6, NULL, NULL),
(1425, 'K048', '10 Sahabt Di Jamin Masuk Surga', 6, NULL, NULL),
(1426, 'K049', 'Why ? Stars And Constlellation', 6, NULL, NULL),
(1427, 'K050', 'Why ? Computer Virus', 6, NULL, NULL),
(1428, 'K051', 'Ensiklopedia Anak Hebat', 6, NULL, NULL),
(1429, 'K052', 'Guinnes World Records', 6, NULL, NULL),
(1430, 'K053', 'Kata Islam Tentang', 6, NULL, NULL),
(1431, 'K054', 'Si Juki The Movie Panitia Hari Akhir', 6, NULL, NULL),
(1432, 'K055', 'Si Juki Anak Kosan', 6, NULL, NULL),
(1433, 'K056', 'Kartun Aljabar', 6, NULL, NULL),
(1434, 'K057', 'Why (Laut Dalam)', 6, NULL, NULL),
(1435, 'K058', 'Matematika', 6, NULL, NULL),
(1436, 'K059', 'Civil Engineering And Construction', 6, NULL, NULL),
(1437, 'K060', 'Filo Komik', 6, NULL, NULL),
(1438, 'L001', 'Ihya \'Ulumiddin (1)', 9, NULL, NULL),
(1439, 'L002', 'Ihya \'Ulumiddin (2)', 9, NULL, NULL),
(1440, 'L003', 'Ihya \'Ulumiddin (3)', 9, NULL, NULL),
(1441, 'L004', 'Ihya \'Ulumiddin (4)', 9, NULL, NULL),
(1442, 'L005', 'Al-Bayjuri (1)', 9, NULL, NULL),
(1443, 'L006', 'Al-Bayjuri (2)', 9, NULL, NULL),
(1444, 'L007', 'I\'Anatut Thalibin (1)', 9, NULL, NULL),
(1445, 'L008', 'I\'Anatut Thalibin (2)', 9, NULL, NULL),
(1446, 'L009', 'I\'Anatut Thalibin (3)', 9, NULL, NULL),
(1447, 'L010', 'I\'Anatut Thalibin (4)', 9, NULL, NULL),
(1448, 'L011', 'Jami\'Ud Durus Al Arabiyah', 9, NULL, NULL),
(1449, 'L012', 'Al-Bujairomi Alalkhotib #1', 9, NULL, NULL),
(1450, 'L013', 'Al-Bujairomi Alalkhotib #2', 9, NULL, NULL),
(1451, 'L014', 'Al-Bujairomi Alalkhotib #3', 9, NULL, NULL),
(1452, 'L015', 'Al-Bujairomi Alalkhotib #4', 9, NULL, NULL),
(1453, 'L016', 'Al-Bujairomi Alalkhotib #5', 9, NULL, NULL),
(1454, 'L017', 'Al-Fiqhu Ala Madahiba Arba\'Ah #1', 9, NULL, NULL),
(1455, 'L018', 'Al-Fiqhu Ala Madahiba Arba\'Ah #2', 9, NULL, NULL),
(1456, 'L019', 'Al-Fiqhu Ala Madahiba Arba\'Ah #3', 9, NULL, NULL),
(1457, 'L020', 'Al-Fiqhu Ala Madahiba Arba\'Ah #4', 9, NULL, NULL),
(1458, 'L021', 'Al-Fiqhu Ala Madahiba Arba\'Ah #5', 9, NULL, NULL),
(1459, 'L022', 'Jatsiyah Alamatul Ash-Showi#1', 9, NULL, NULL),
(1460, 'L023', 'Jatsiyah Alamatul Ash-Showi#2', 9, NULL, NULL),
(1461, 'L024', 'Jatsiyah Alamatul Ash-Showi#3', 9, NULL, NULL),
(1462, 'L025', 'Jatsiyah Alamatul Ash-Showi#4', 9, NULL, NULL),
(1463, 'J0278', 'Namaku alam', 1, '2026-09-24 07:55:27', '2026-09-24 07:55:27');

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cache`
--

INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
('laravel_cache_5c785c036466adea360111aa28563bfd556b5fba', 'i:2;', 1794150730),
('laravel_cache_5c785c036466adea360111aa28563bfd556b5fba:timer', 'i:1794150730;', 1794150730);

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cart_items`
--

CREATE TABLE `cart_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `cart_id` bigint(20) UNSIGNED NOT NULL,
  `book_id` bigint(20) UNSIGNED NOT NULL,
  `jumlah` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `kode_kategori` varchar(255) NOT NULL,
  `nama_kategori` varchar(255) NOT NULL,
  `deskripsi` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `kode_kategori`, `nama_kategori`, `deskripsi`, `created_at`, `updated_at`) VALUES
(1, 'KAT-0001', 'J - Novel', NULL, '2026-04-23 06:52:52', '2026-04-25 08:18:48'),
(2, 'KAT-0002', 'A - Kepesantrenan', NULL, '2026-04-23 07:05:09', '2026-04-26 08:49:43'),
(3, 'KAT-0003', 'F - Sejarah', NULL, '2026-04-23 07:05:20', '2026-04-26 08:49:57'),
(4, 'KAT-0004', 'H - Kisah & Biografi', NULL, '2026-04-23 07:05:31', '2026-04-26 08:50:14'),
(5, 'KAT-0005', 'E - Pengetahuan & Wawasan', NULL, '2026-04-23 07:05:43', '2026-04-26 08:50:31'),
(6, 'KAT-0006', 'K - Komik', NULL, '2026-04-23 07:05:50', '2026-04-26 08:50:49'),
(7, 'KAT-0007', 'D - Pengembangan diri dan Motivasi', NULL, '2026-04-23 07:06:09', '2026-04-26 08:48:32'),
(8, 'KAT-0008', 'I - Politik', NULL, '2026-04-23 07:06:22', '2026-04-26 08:51:09'),
(9, 'KAT-0009', 'L - Kitab Klasik', NULL, '2026-04-23 07:07:11', '2026-04-26 08:51:25'),
(10, 'KAT-0010', 'B - Keagamaan', NULL, '2026-04-23 07:07:43', '2026-04-26 08:51:42'),
(11, 'KAT-0011', 'G - Bahasa & Budaya', NULL, '2026-04-23 07:07:51', '2026-04-26 08:51:58'),
(12, 'KAT-0012', 'C - Pendidikan', NULL, '2026-04-23 17:54:00', '2026-04-26 08:52:11');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fines`
--

CREATE TABLE `fines` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `kode_denda` varchar(255) NOT NULL,
  `member_id` bigint(20) UNSIGNED NOT NULL,
  `loan_id` bigint(20) UNSIGNED DEFAULT NULL,
  `jumlah` decimal(10,2) NOT NULL,
  `keterangan` text NOT NULL,
  `status` enum('belum_bayar','lunas') NOT NULL DEFAULT 'belum_bayar',
  `tanggal_bayar` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `fines`
--

INSERT INTO `fines` (`id`, `kode_denda`, `member_id`, `loan_id`, `jumlah`, `keterangan`, `status`, `tanggal_bayar`, `created_at`, `updated_at`) VALUES
(1, 'DND-000113', 13, 11, 2000.00, 'Denda warisan data lama - peminjaman #113 (status lama: dikembalikan)', 'lunas', '2026-11-01', '2026-09-27 08:27:43', '2026-11-01 08:27:32'),
(2, 'DND-000115', 28, 13, 4000.00, 'Denda warisan data lama - peminjaman #115 (status lama: dikembalikan)', 'lunas', '2026-10-23', '2026-09-29 08:28:52', '2026-10-23 06:51:32'),
(4, 'DND-001', 79, 35, 5000.00, 'Terlambat mengembalikan buku Bumi Manusia.', 'lunas', '2026-07-22', '2026-07-26 23:03:15', '2026-07-26 23:03:15'),
(5, 'DND-002', 77, 33, 15000.00, 'Terlambat mengembalikan buku Laskar Pelangi.', 'belum_bayar', NULL, '2026-07-26 23:03:15', '2026-07-26 23:03:15'),
(9, 'DND-5OKRLZO0', 63, 31, 0.00, 'Denda keterlambatan pengembalian 2 hari (Kode: PJ-000133)', 'lunas', '2026-11-01', '2026-10-26 08:17:44', '2026-11-01 08:27:00'),
(10, 'DND-NO0EIXMW', 70, 23, 34000.00, 'Denda keterlambatan pengembalian 17 hari (Kode: PJ-000125)', 'lunas', '2026-10-28', '2026-10-28 09:32:15', '2026-10-28 09:32:43'),
(11, 'DND-LOOODRHC', 44, 30, 10000.00, 'Denda keterlambatan pengembalian 5 hari (Kode: PJ-000132)', 'lunas', '2026-10-28', '2026-10-28 09:32:29', '2026-10-28 10:03:02'),
(14, 'DND-EH3CTWEG', 59, 43, 2000.00, 'Denda keterlambatan pengembalian 1 hari (Kode: PJN-KHIV0MAU)', 'belum_bayar', NULL, '2026-11-06 08:19:50', '2026-11-06 08:19:50'),
(15, 'DND-4RBFPNXU', 72, 45, 2000.00, 'Denda keterlambatan pengembalian 1 hari (Kode: PJN-WOHAF0SV)', 'lunas', '2026-11-08', '2026-11-08 08:14:46', '2026-11-08 08:24:24'),
(16, 'DND-DDOPKSK4', 17, 40, 8000.00, 'Denda keterlambatan pengembalian 4 hari (Kode: PJN-EVIJKNXW)', 'lunas', '2026-11-08', '2026-11-08 08:18:58', '2026-11-08 08:24:20');

-- --------------------------------------------------------

--
-- Table structure for table `fine_histories`
--

CREATE TABLE `fine_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `fine_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `jumlah_sebelum` decimal(10,2) NOT NULL,
  `jumlah_sesudah` decimal(10,2) NOT NULL,
  `status_sebelum` varchar(255) NOT NULL,
  `status_sesudah` varchar(255) NOT NULL,
  `catatan` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `fine_histories`
--

INSERT INTO `fine_histories` (`id`, `fine_id`, `user_id`, `jumlah_sebelum`, `jumlah_sesudah`, `status_sebelum`, `status_sesudah`, `catatan`, `created_at`, `updated_at`) VALUES
(4, 10, 19, 35378.13, 35378.13, 'belum_bayar', 'lunas', 'Pembayaran denda dilunasi oleh petugas.', '2026-10-28 09:32:43', '2026-10-28 09:32:43'),
(5, 11, 19, 11378.47, 11378.47, 'belum_bayar', 'lunas', 'Pembayaran denda dilunasi oleh petugas.', '2026-10-28 10:03:02', '2026-10-28 10:03:02'),
(6, 9, 18, 5274.64, 0.00, 'belum_bayar', 'lunas', 'kesalahan tanggal yang di lakukan pengurus', '2026-11-01 08:26:59', '2026-11-01 08:26:59'),
(7, 9, 18, 0.00, 0.00, 'lunas', 'lunas', 'kesalahan tanggal yang di lakukan pengurus', '2026-11-01 08:27:00', '2026-11-01 08:27:00'),
(8, 1, 18, 2000.00, 2000.00, 'belum_bayar', 'lunas', 'Pembayaran denda dilunasi oleh petugas.', '2026-11-01 08:27:32', '2026-11-01 08:27:32'),
(11, 16, 18, 8000.00, 8000.00, 'belum_bayar', 'lunas', 'Pembayaran denda dilunasi oleh petugas.', '2026-11-08 08:24:20', '2026-11-08 08:24:20'),
(12, 15, 18, 2000.00, 2000.00, 'belum_bayar', 'lunas', 'Pembayaran denda dilunasi oleh petugas.', '2026-11-08 08:24:24', '2026-11-08 08:24:24');

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE `kategori` (
  `id` bigint(20) NOT NULL,
  `nama_kategori` varchar(100) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`id`, `nama_kategori`, `created_at`, `updated_at`) VALUES
(1, 'Novel', NULL, NULL),
(2, 'Komik', NULL, NULL),
(3, 'Kitab', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `kategoris`
--

CREATE TABLE `kategoris` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama_kategori` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `kategoris`
--

INSERT INTO `kategoris` (`id`, `nama_kategori`, `created_at`, `updated_at`) VALUES
(1, 'J - Novel', '2026-04-23 06:52:52', '2026-04-25 08:18:48'),
(2, 'A - Kepesantrenan', '2026-04-23 07:05:09', '2026-04-26 08:49:43'),
(3, 'F - Sejarah', '2026-04-23 07:05:20', '2026-04-26 08:49:57'),
(4, 'H - Kisah & Biografi', '2026-04-23 07:05:31', '2026-04-26 08:50:14'),
(5, 'E - Pengetahuan & Wawasan', '2026-04-23 07:05:43', '2026-04-26 08:50:31'),
(6, 'K - Komik', '2026-04-23 07:05:50', '2026-04-26 08:50:49'),
(7, 'D - Pengembangan diri dan Motivasi', '2026-04-23 07:06:09', '2026-04-26 08:48:32'),
(8, 'I - Politik', '2026-04-23 07:06:22', '2026-04-26 08:51:09'),
(9, 'L - Kitab Klasik', '2026-04-23 07:07:11', '2026-04-26 08:51:25'),
(10, 'B - Keagamaan', '2026-04-23 07:07:43', '2026-04-26 08:51:42'),
(11, 'G - Bahasa & Budaya', '2026-04-23 07:07:51', '2026-04-26 08:51:58'),
(12, 'C - Pendidikan', '2026-04-23 17:54:00', '2026-04-26 08:52:11');

-- --------------------------------------------------------

--
-- Table structure for table `lama_books`
--

CREATE TABLE `lama_books` (
  `id` bigint(20) NOT NULL,
  `kode_buku` varchar(50) NOT NULL,
  `nama_buku` varchar(255) NOT NULL,
  `kategori_id` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `lama_books`
--

INSERT INTO `lama_books` (`id`, `kode_buku`, `nama_buku`, `kategori_id`, `created_at`, `updated_at`) VALUES
(1, 'BK001', 'Laskar Pelangi', 1, NULL, NULL),
(2, 'BK002', 'Naruto Vol 1', 2, NULL, NULL),
(3, 'BK003', 'Fathul Qorib', 3, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `lama_cache`
--

CREATE TABLE `lama_cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lama_cache_locks`
--

CREATE TABLE `lama_cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lama_failed_jobs`
--

CREATE TABLE `lama_failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lama_jobs`
--

CREATE TABLE `lama_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lama_job_batches`
--

CREATE TABLE `lama_job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lama_migrations`
--

CREATE TABLE `lama_migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `lama_migrations`
--

INSERT INTO `lama_migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2026_04_23_130823_create_kategoris_table', 1),
(5, '2026_04_23_130947_create_bukus_table', 1),
(6, '2026_04_23_131105_create_peminjams_table', 1),
(7, '2026_04_23_131108_create_peminjamen_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `lama_password_reset_tokens`
--

CREATE TABLE `lama_password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lama_sessions`
--

CREATE TABLE `lama_sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `lama_sessions`
--

INSERT INTO `lama_sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('D8w564tIyzfTb4RWS1FnaugnyK7JcB58yZ4WL9ob', NULL, '127.0.0.1', 'curl/8.21.0', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiWUtydkdDZ1A5VVBKOHh4VDdDQnM2TlJuZVBQMjBiNFdpb25BNzR5byI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9sb2dpbiI7czo1OiJyb3V0ZSI7czo1OiJsb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjI6e2k6MDtzOjEwOiJfb2xkX2lucHV0IjtpOjE7czo2OiJlcnJvcnMiO31zOjM6Im5ldyI7YTowOnt9fXM6MTA6Il9vbGRfaW5wdXQiO2E6Mjp7czo2OiJfdG9rZW4iO3M6NDA6IllLcnZHQ2dQOVVQSjh4eFQ3Q0JzNk5SbmVQUDIwYjRXaW9uQTc0eW8iO3M6NToibG9naW4iO3M6NDoiQXN0YSI7fXM6NjoiZXJyb3JzIjtPOjMxOiJJbGx1bWluYXRlXFN1cHBvcnRcVmlld0Vycm9yQmFnIjoxOntzOjc6IgAqAGJhZ3MiO2E6MTp7czo3OiJkZWZhdWx0IjtPOjI5OiJJbGx1bWluYXRlXFN1cHBvcnRcTWVzc2FnZUJhZyI6Mjp7czoxMToiACoAbWVzc2FnZXMiO2E6MTp7czo1OiJlbWFpbCI7YToxOntpOjA7czoyODoiVGhlIGVtYWlsIGZpZWxkIGlzIHJlcXVpcmVkLiI7fX1zOjk6IgAqAGZvcm1hdCI7czo4OiI6bWVzc2FnZSI7fX19fQ==', 1792510605),
('EGL2glWUR6g3VeQcIBoQ2kYBqqT05c7XaNE6EVaq', NULL, '127.0.0.1', 'curl/8.21.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRHplYTFuQ2JnaVFxSloxY1RyRGpMS2hQVTdNYUZrY2lqSGRzYk10bCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9sb2dpbiI7czo1OiJyb3V0ZSI7czo1OiJsb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1792510659),
('L6G2H4xsB6Cz8qzNcxe1gcGJkhM2XKTqkJRZ0i7D', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoibTAyVzJpNG5uTExKMzNCSE5rakRibDR4OEQ0S0s1ZUN3SjRLQzU5SyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hZG1pbiI7czo1OiJyb3V0ZSI7czoxNToiYWRtaW4uZGFzaGJvYXJkIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTt9', 1792677869),
('MwUdi0SyVpBLxpzth1VHM7FferyutAze0QUF0iQ4', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36 Edg/155.0.0.0', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoia2ZzYjdZQUtwVTZBZ3ZqN0pZTXZDR3k1U2dZY3hzUUhwa2gxaGhUVCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6OTI6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hZG1pbi9wZW1pbmphbWFuP3NlYXJjaD1uZWdlcmkmc3RhdHVzPSZ0YW5nZ2FsX211bGFpPSZ0YW5nZ2FsX3NlbGVzYWk9IjtzOjU6InJvdXRlIjtzOjIyOiJhZG1pbi5wZW1pbmphbWFuLmluZGV4Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTt9', 1792510288),
('tMgH7ZuhUyPWW11SRtaeojetTTqZId1TFZfeoXXq', NULL, '127.0.0.1', 'curl/8.21.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQU5uaEk4ZU1COERMMWpZQWVQMG1EbzVGR1VuMlhTcmR3WHo3b3pFYyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9sb2dpbiI7czo1OiJyb3V0ZSI7czo1OiJsb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1792510639),
('uDnjkxCoVOuo9KZQiUuOmQfjDkiO1ewzK2SZjAgE', NULL, '127.0.0.1', 'curl/8.21.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWE5JWUpja0NoRURMRVlKbWQ3eW94SkRKY1lSeDZNR0hQc1ZKek8xUiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9sb2dpbiI7czo1OiJyb3V0ZSI7czo1OiJsb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1792510658),
('v0DXflVNulQ3WadiV0xPanBmrs2C90O5gZtVyQdi', NULL, '127.0.0.1', 'curl/8.21.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTlVCSDdud2JCV2JMNVhOWWFXNHlidjZNSjV6UjhiTDljZWNSTWxJeSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9sb2dpbiI7czo1OiJyb3V0ZSI7czo1OiJsb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1792510669),
('VFGryAorzl52KzuM9aw9ea4BosmZEKJV023ZhAWG', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36 Edg/155.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNGVmVU14VHZvU1FOWFIxSUViRVoyY1FHeWVBZmk3aE5HMGFqU3V1RyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9sb2dpbiI7czo1OiJyb3V0ZSI7czo1OiJsb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1792733208),
('zDQwsfv42vb9EIfrnssdb4ikQzRkq6g7MNyxVrLN', NULL, '192.168.1.29', 'Mozilla/5.0 (X11; Linux x86_64; rv:158.0) Gecko/20100101 Firefox/158.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVjhxTmpDaW1mMjBGS2NHYnRLbEhZdjF0aGs2NUVtMUlNaWdhbjZobCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzA6Imh0dHA6Ly8xOTIuMTY4LjEuNDI6ODAwMC9sb2dpbiI7czo1OiJyb3V0ZSI7czo1OiJsb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1792733609);

-- --------------------------------------------------------

--
-- Table structure for table `lama_users`
--

CREATE TABLE `lama_users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `lama_users`
--

INSERT INTO `lama_users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Admin Zabitsa', 'admin@zabitsa.com', NULL, '$2y$12$a3vaoe25Lj8T1dUKA3/39uxlg5pTggpytf5TrAA.S8pXfJQXl4PkC', NULL, '2026-04-23 06:49:29', '2026-04-23 06:49:29'),
(3, 'SANGKURIANG', 'sangkuriang@admin.com', NULL, '$2y$12$BEeqLqCu2Jao4eUgFL9ZGuI2NKVmj5Q6hiUnWOSh6rsqwTvBUMc2e', NULL, '2026-04-27 04:57:37', '2026-04-27 04:57:37');

-- --------------------------------------------------------

--
-- Table structure for table `loans`
--

CREATE TABLE `loans` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `kode_pinjam` varchar(255) NOT NULL,
  `member_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `tanggal_pinjam` date NOT NULL,
  `tanggal_kembali` date NOT NULL,
  `tanggal_dikembalikan` date DEFAULT NULL,
  `status` enum('pending','dipinjam','dikembalikan','terlambat','rejected') NOT NULL DEFAULT 'pending',
  `source` enum('petugas','anggota') NOT NULL DEFAULT 'petugas',
  `catatan` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `approved_by` bigint(20) UNSIGNED DEFAULT NULL,
  `approved_at` timestamp NULL DEFAULT NULL,
  `rejected_reason` text DEFAULT NULL,
  `rejected_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `loans`
--

INSERT INTO `loans` (`id`, `kode_pinjam`, `member_id`, `user_id`, `tanggal_pinjam`, `tanggal_kembali`, `tanggal_dikembalikan`, `status`, `source`, `catatan`, `created_at`, `updated_at`, `approved_by`, `approved_at`, `rejected_reason`, `rejected_at`) VALUES
(1, 'PJ-000103', 63, NULL, '2026-09-09', '2026-09-15', '2026-09-16', 'dikembalikan', 'petugas', NULL, '2026-09-10 08:10:37', '2026-09-16 08:38:10', NULL, NULL, NULL, NULL),
(2, 'PJ-000104', 13, NULL, '2026-09-10', '2026-09-16', '2026-09-16', 'dikembalikan', 'petugas', NULL, '2026-09-11 08:35:00', '2026-09-16 08:38:13', NULL, NULL, NULL, NULL),
(3, 'PJ-000105', 25, NULL, '2026-09-11', '2026-09-17', '2026-09-26', 'dikembalikan', 'petugas', NULL, '2026-09-12 08:10:13', '2026-09-26 08:25:15', NULL, NULL, NULL, NULL),
(4, 'PJ-000106', 13, NULL, '2026-09-17', '2026-09-23', '2026-09-23', 'dikembalikan', 'petugas', NULL, '2026-09-18 08:26:41', '2026-09-23 08:30:01', NULL, NULL, NULL, NULL),
(5, 'PJ-000107', 63, NULL, '2026-09-17', '2026-09-23', '2026-09-21', 'dikembalikan', 'petugas', NULL, '2026-09-18 08:27:17', '2026-09-21 07:13:24', NULL, NULL, NULL, NULL),
(6, 'PJ-000108', 21, NULL, '2026-09-19', '2026-09-25', '2026-09-25', 'dikembalikan', 'petugas', NULL, '2026-09-20 08:07:39', '2026-09-25 08:18:22', NULL, NULL, NULL, NULL),
(7, 'PJ-000109', 64, NULL, '2026-09-22', '2026-09-28', '2026-10-04', 'dikembalikan', 'petugas', NULL, '2026-09-23 08:18:52', '2026-10-04 08:11:10', NULL, NULL, NULL, NULL),
(8, 'PJ-000110', 13, NULL, '2026-09-22', '2026-09-28', '2026-09-27', 'dikembalikan', 'petugas', NULL, '2026-09-23 08:30:59', '2026-09-27 08:27:23', NULL, NULL, NULL, NULL),
(9, 'PJ-000111', 65, NULL, '2026-09-23', '2026-09-29', '2026-09-29', 'dikembalikan', 'petugas', NULL, '2026-09-24 07:57:30', '2026-09-29 08:12:48', NULL, NULL, NULL, NULL),
(10, 'PJ-000112', 66, NULL, '2026-09-26', '2026-10-02', '2026-09-30', 'dikembalikan', 'petugas', NULL, '2026-09-27 08:24:39', '2026-09-30 08:19:09', NULL, NULL, NULL, NULL),
(11, 'PJ-000113', 13, NULL, '2026-09-26', '2026-10-02', '2026-10-04', 'dikembalikan', 'petugas', NULL, '2026-09-27 08:27:43', '2026-10-04 08:32:06', NULL, NULL, NULL, NULL),
(12, 'PJ-000114', 25, NULL, '2026-09-28', '2026-10-04', '2026-10-01', 'dikembalikan', 'petugas', NULL, '2026-09-29 08:27:11', '2026-10-01 07:16:24', NULL, NULL, NULL, NULL),
(13, 'PJ-000115', 28, NULL, '2026-09-28', '2026-10-04', '2026-10-06', 'dikembalikan', 'petugas', NULL, '2026-09-29 08:28:52', '2026-10-06 08:27:04', NULL, NULL, NULL, NULL),
(14, 'PJ-000116', 39, NULL, '2026-09-29', '2026-10-05', '2026-10-04', 'dikembalikan', 'petugas', NULL, '2026-09-30 08:23:05', '2026-10-04 08:25:53', NULL, NULL, NULL, NULL),
(15, 'PJ-000117', 36, NULL, '2026-09-29', '2026-10-05', '2026-10-12', 'dikembalikan', 'petugas', NULL, '2026-09-30 08:28:27', '2026-10-12 08:27:31', NULL, NULL, NULL, NULL),
(16, 'PJ-000118', 25, NULL, '2026-09-30', '2026-10-06', '2026-10-12', 'dikembalikan', 'petugas', NULL, '2026-10-01 07:16:44', '2026-10-12 08:27:15', NULL, NULL, NULL, NULL),
(17, 'PJ-000119', 67, NULL, '2026-09-30', '2026-10-06', '2026-10-11', 'dikembalikan', 'petugas', NULL, '2026-10-01 07:20:44', '2026-10-11 09:11:23', NULL, NULL, NULL, NULL),
(18, 'PJ-000120', 61, NULL, '2026-09-30', '2026-10-06', '2026-10-05', 'dikembalikan', 'petugas', NULL, '2026-10-01 08:09:50', '2026-10-05 07:46:12', NULL, NULL, NULL, NULL),
(19, 'PJ-000121', 63, NULL, '2026-09-30', '2026-10-06', '2026-10-05', 'dikembalikan', 'petugas', NULL, '2026-10-01 08:15:21', '2026-10-05 07:34:59', NULL, NULL, NULL, NULL),
(20, 'PJ-000122', 66, NULL, '2026-09-30', '2026-10-06', '2026-10-06', 'dikembalikan', 'petugas', NULL, '2026-10-01 08:21:53', '2026-10-06 08:14:15', NULL, NULL, NULL, NULL),
(21, 'PJ-000123', 68, NULL, '2026-10-03', '2026-10-09', '2026-10-12', 'dikembalikan', 'petugas', NULL, '2026-10-04 08:14:11', '2026-10-12 08:27:55', NULL, NULL, NULL, NULL),
(22, 'PJ-000124', 69, NULL, '2026-10-03', '2026-10-09', '2026-10-09', 'dikembalikan', 'petugas', NULL, '2026-10-04 08:19:57', '2026-10-09 08:39:22', NULL, NULL, NULL, NULL),
(23, 'PJ-000125', 70, NULL, '2026-10-05', '2026-10-11', '2026-10-28', 'dikembalikan', 'petugas', NULL, '2026-10-06 08:12:56', '2026-10-28 09:32:15', NULL, NULL, NULL, NULL),
(24, 'PJ-000126', 64, NULL, '2026-10-05', '2026-10-11', '2026-10-12', 'dikembalikan', 'petugas', NULL, '2026-10-06 08:15:28', '2026-10-12 08:25:05', NULL, NULL, NULL, NULL),
(25, 'PJ-000127', 64, NULL, '2026-10-08', '2026-10-14', '2026-10-12', 'dikembalikan', 'petugas', NULL, '2026-10-09 08:29:58', '2026-10-12 08:25:22', NULL, NULL, NULL, NULL),
(26, 'PJ-000128', 72, NULL, '2026-10-14', '2026-10-20', '2026-10-20', 'dikembalikan', 'petugas', NULL, '2026-10-15 08:21:43', '2026-10-20 08:15:18', NULL, NULL, NULL, NULL),
(27, 'PJ-000129', 73, NULL, '2026-10-16', '2026-10-22', NULL, 'dipinjam', 'petugas', NULL, '2026-10-17 08:25:02', '2026-10-17 08:25:02', NULL, NULL, NULL, NULL),
(28, 'PJ-000130', 28, NULL, '2026-10-17', '2026-10-23', '2026-10-23', 'dikembalikan', 'petugas', NULL, '2026-10-18 08:27:00', '2026-10-23 08:06:42', NULL, NULL, NULL, NULL),
(29, 'PJ-000131', 74, NULL, '2026-10-17', '2026-10-23', '2026-10-23', 'dikembalikan', 'petugas', NULL, '2026-10-18 08:32:08', '2026-10-23 08:06:17', NULL, NULL, NULL, NULL),
(30, 'PJ-000132', 44, NULL, '2026-10-17', '2026-10-23', '2026-10-28', 'dikembalikan', 'petugas', NULL, '2026-10-18 08:36:01', '2026-10-28 09:32:29', NULL, NULL, NULL, NULL),
(31, 'PJ-000133', 63, NULL, '2026-10-18', '2026-10-24', '2026-10-26', 'dikembalikan', 'petugas', NULL, '2026-10-19 08:01:09', '2026-10-26 08:17:44', NULL, NULL, NULL, NULL),
(32, 'PJ-000134', 76, NULL, '2026-10-18', '2026-10-24', NULL, 'dipinjam', 'petugas', NULL, '2026-10-19 09:04:18', '2026-10-19 09:04:18', NULL, NULL, NULL, NULL),
(33, 'PJM-001', 77, NULL, '2026-07-24', '2026-07-31', NULL, 'dipinjam', 'petugas', NULL, '2026-07-26 23:03:15', '2026-07-26 23:03:15', NULL, NULL, NULL, NULL),
(34, 'PJM-002', 78, NULL, '2026-07-26', '2026-08-02', NULL, 'dipinjam', 'petugas', NULL, '2026-07-26 23:03:15', '2026-07-26 23:03:15', NULL, NULL, NULL, NULL),
(35, 'PJM-003', 79, NULL, '2026-07-13', '2026-07-20', NULL, 'dikembalikan', 'petugas', NULL, '2026-07-26 23:03:15', '2026-07-26 23:03:15', NULL, NULL, NULL, NULL),
(36, 'PJN-SX3VK8J6', 66, 18, '2026-10-24', '2026-10-29', '2026-10-28', 'dikembalikan', 'petugas', NULL, '2026-10-24 08:31:07', '2026-10-28 08:11:49', NULL, NULL, NULL, NULL),
(37, 'PJN-GWKCR0OP', 85, 19, '2026-10-29', '2026-11-03', '2026-11-03', 'dikembalikan', 'petugas', NULL, '2026-10-29 07:45:38', '2026-11-03 08:23:35', NULL, NULL, NULL, NULL),
(38, 'PJN-LTUY8T23', 86, 18, '2026-10-29', '2026-11-03', '2026-11-01', 'dikembalikan', 'petugas', NULL, '2026-10-29 07:48:13', '2026-11-01 08:13:34', NULL, NULL, NULL, NULL),
(39, 'PJN-CXKWE4CF', 28, 19, '2026-10-29', '2026-11-03', '2026-11-03', 'dikembalikan', 'petugas', NULL, '2026-10-29 08:03:12', '2026-11-03 08:26:10', NULL, NULL, NULL, NULL),
(40, 'PJN-EVIJKNXW', 17, 18, '2026-10-30', '2026-11-04', '2026-11-08', 'dikembalikan', 'petugas', NULL, '2026-10-30 08:30:32', '2026-11-08 08:18:58', NULL, NULL, NULL, NULL),
(41, 'PJN-PXJC99WP', 87, 18, '2026-10-31', '2026-11-05', '2026-11-03', 'dikembalikan', 'petugas', NULL, '2026-10-31 08:13:20', '2026-11-03 08:18:50', NULL, NULL, NULL, NULL),
(42, 'PJN-NXWV6MCV', 50, 18, '2026-10-31', '2026-11-05', '2026-11-04', 'dikembalikan', 'petugas', NULL, '2026-10-31 08:16:35', '2026-11-04 08:11:08', NULL, NULL, NULL, NULL),
(43, 'PJN-KHIV0MAU', 59, 18, '2026-10-31', '2026-11-05', '2026-11-06', 'dikembalikan', 'petugas', NULL, '2026-10-31 08:30:41', '2026-11-06 08:19:50', NULL, NULL, NULL, NULL),
(44, 'PJN-PDRYYGIC', 86, 18, '2026-11-01', '2026-11-06', '2026-11-04', 'dikembalikan', 'petugas', NULL, '2026-11-01 08:15:33', '2026-11-04 08:12:31', NULL, NULL, NULL, NULL),
(45, 'PJN-WOHAF0SV', 72, 18, '2026-11-02', '2026-11-07', '2026-11-08', 'dikembalikan', 'petugas', NULL, '2026-11-02 07:57:28', '2026-11-08 08:14:46', NULL, NULL, NULL, NULL),
(46, 'PJN-KLPY5ZPU', 88, 18, '2026-11-02', '2026-11-07', NULL, 'dipinjam', 'petugas', NULL, '2026-11-02 07:58:05', '2026-11-02 07:58:05', NULL, NULL, NULL, NULL),
(47, 'PJN-CEZJCHJB', 85, 18, '2026-11-03', '2026-11-08', '2026-11-07', 'dikembalikan', 'petugas', NULL, '2026-11-03 08:25:47', '2026-11-07 09:32:28', NULL, NULL, NULL, NULL),
(48, 'PJN-VVJIZYGV', 66, 18, '2026-11-03', '2026-11-08', '2026-11-07', 'dikembalikan', 'petugas', NULL, '2026-11-03 08:27:20', '2026-11-07 09:32:20', NULL, NULL, NULL, NULL),
(49, 'PJN-HK8PWLYM', 66, 18, '2026-11-07', '2026-11-12', '2026-11-08', 'dikembalikan', 'petugas', NULL, '2026-11-07 09:32:44', '2026-11-08 08:30:05', NULL, NULL, NULL, NULL),
(50, 'PJN-XJWDQO9W', 86, 18, '2026-11-08', '2026-11-13', NULL, 'dipinjam', 'petugas', NULL, '2026-11-08 08:13:14', '2026-11-08 08:13:14', NULL, NULL, NULL, NULL),
(51, 'PJN-D8FQY5IL', 13, 18, '2026-11-08', '2026-11-13', NULL, 'dipinjam', 'petugas', NULL, '2026-11-08 08:31:42', '2026-11-08 08:31:42', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `loan_details`
--

CREATE TABLE `loan_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `loan_id` bigint(20) UNSIGNED NOT NULL,
  `book_id` bigint(20) UNSIGNED NOT NULL,
  `jumlah` int(11) NOT NULL DEFAULT 1,
  `kondisi` enum('baik','rusak','hilang') NOT NULL DEFAULT 'baik',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `loan_details`
--

INSERT INTO `loan_details` (`id`, `loan_id`, `book_id`, `jumlah`, `kondisi`, `created_at`, `updated_at`) VALUES
(1, 1, 1090, 1, 'baik', '2026-09-10 08:10:37', '2026-09-16 08:38:10'),
(2, 2, 1080, 1, 'baik', '2026-09-11 08:35:00', '2026-09-16 08:38:13'),
(3, 3, 1054, 1, 'baik', '2026-09-12 08:10:13', '2026-09-26 08:25:15'),
(4, 4, 1077, 1, 'baik', '2026-09-18 08:26:41', '2026-09-23 08:30:01'),
(5, 5, 1088, 1, 'baik', '2026-09-18 08:27:17', '2026-09-21 07:13:24'),
(6, 6, 1138, 1, 'baik', '2026-09-20 08:07:39', '2026-09-25 08:18:22'),
(7, 7, 1033, 1, 'baik', '2026-09-23 08:18:52', '2026-10-04 08:11:10'),
(8, 8, 877, 1, 'baik', '2026-09-23 08:30:59', '2026-09-27 08:27:23'),
(9, 9, 1233, 1, 'baik', '2026-09-24 07:57:30', '2026-09-29 08:12:48'),
(10, 10, 1097, 1, 'baik', '2026-09-27 08:24:39', '2026-09-30 08:19:09'),
(11, 11, 1143, 1, 'baik', '2026-09-27 08:27:43', '2026-10-04 08:32:06'),
(12, 12, 1041, 1, 'baik', '2026-09-29 08:27:11', '2026-10-01 07:16:24'),
(13, 13, 969, 1, 'baik', '2026-09-29 08:28:52', '2026-10-06 08:27:04'),
(14, 14, 1142, 1, 'baik', '2026-09-30 08:23:05', '2026-10-04 08:25:53'),
(15, 15, 1047, 1, 'baik', '2026-09-30 08:28:27', '2026-10-12 08:27:31'),
(16, 16, 1026, 1, 'baik', '2026-10-01 07:16:44', '2026-10-12 08:27:15'),
(17, 17, 967, 1, 'baik', '2026-10-01 07:20:44', '2026-10-11 09:11:23'),
(18, 18, 1097, 1, 'baik', '2026-10-01 08:09:50', '2026-10-05 07:46:12'),
(19, 19, 988, 1, 'baik', '2026-10-01 08:15:21', '2026-10-05 07:34:59'),
(20, 20, 728, 1, 'baik', '2026-10-01 08:21:53', '2026-10-06 08:14:15'),
(21, 21, 471, 1, 'baik', '2026-10-04 08:14:11', '2026-10-12 08:27:55'),
(22, 22, 303, 1, 'baik', '2026-10-04 08:19:57', '2026-10-09 08:39:22'),
(23, 23, 1142, 1, 'baik', '2026-10-06 08:12:56', '2026-10-06 08:12:56'),
(24, 24, 1048, 1, 'baik', '2026-10-06 08:15:28', '2026-10-12 08:25:05'),
(25, 25, 1050, 1, 'baik', '2026-10-09 08:29:58', '2026-10-12 08:25:22'),
(26, 26, 1077, 1, 'baik', '2026-10-15 08:21:43', '2026-10-20 08:15:18'),
(27, 27, 1145, 1, 'baik', '2026-10-17 08:25:02', '2026-10-17 08:25:02'),
(28, 28, 217, 1, 'baik', '2026-10-18 08:27:00', '2026-10-18 08:27:00'),
(29, 29, 946, 1, 'baik', '2026-10-18 08:32:08', '2026-10-18 08:32:08'),
(30, 30, 523, 1, 'baik', '2026-10-18 08:36:01', '2026-10-18 08:36:01'),
(31, 31, 1084, 1, 'baik', '2026-10-19 08:01:09', '2026-10-19 08:01:09'),
(32, 32, 1041, 1, 'baik', '2026-10-19 09:04:18', '2026-10-19 09:04:18'),
(35, 36, 914, 1, 'baik', '2026-10-24 08:31:07', '2026-10-24 08:31:07'),
(36, 37, 1143, 1, 'baik', '2026-10-29 07:45:38', '2026-10-29 07:45:38'),
(37, 38, 951, 1, 'baik', '2026-10-29 07:48:13', '2026-10-29 07:48:13'),
(38, 39, 217, 1, 'baik', '2026-10-29 08:03:12', '2026-10-29 08:03:12'),
(39, 40, 1047, 1, 'baik', '2026-10-30 08:30:32', '2026-10-30 08:30:32'),
(40, 41, 228, 1, 'baik', '2026-10-31 08:13:20', '2026-10-31 08:13:20'),
(41, 42, 374, 1, 'baik', '2026-10-31 08:16:35', '2026-10-31 08:16:35'),
(42, 43, 631, 1, 'baik', '2026-10-31 08:30:41', '2026-10-31 08:30:41'),
(43, 44, 1084, 1, 'baik', '2026-11-01 08:15:33', '2026-11-01 08:15:33'),
(44, 45, 1077, 1, 'baik', '2026-11-02 07:57:28', '2026-11-02 07:57:28'),
(45, 46, 628, 1, 'baik', '2026-11-02 07:58:05', '2026-11-02 07:58:05'),
(46, 47, 964, 1, 'baik', '2026-11-03 08:25:47', '2026-11-03 08:25:47'),
(47, 48, 999, 1, 'baik', '2026-11-03 08:27:21', '2026-11-03 08:27:21'),
(48, 49, 1140, 1, 'baik', '2026-11-07 09:32:44', '2026-11-07 09:32:44'),
(49, 50, 981, 1, 'baik', '2026-11-08 08:13:14', '2026-11-08 08:13:14'),
(50, 51, 1077, 1, 'baik', '2026-11-08 08:31:42', '2026-11-08 08:31:42');

-- --------------------------------------------------------

--
-- Table structure for table `members`
--

CREATE TABLE `members` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `kode_member` varchar(255) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `nis_nip` varchar(255) DEFAULT NULL,
  `jenis_kelamin` enum('L','P') NOT NULL,
  `alamat` varchar(255) NOT NULL,
  `telepon` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `tanggal_daftar` date NOT NULL,
  `status` enum('aktif','nonaktif') NOT NULL DEFAULT 'aktif',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `members`
--

INSERT INTO `members` (`id`, `kode_member`, `nama`, `nis_nip`, `jenis_kelamin`, `alamat`, `telepon`, `email`, `password`, `tanggal_daftar`, `status`, `created_at`, `updated_at`, `remember_token`) VALUES
(5, 'MBR-00001', 'A Subhan Ridho Rohmatullah', NULL, 'L', 'Situbondo (Sekolah: Universitas Nurul Jadid)', NULL, NULL, NULL, '2026-04-23', 'aktif', '2026-04-23 06:52:39', '2026-04-23 06:52:39', NULL),
(6, 'MBR-00002', 'M Fauzan Khoiron', NULL, 'L', 'Malang (Sekolah: MTsNJ)', NULL, NULL, NULL, '2026-04-23', 'aktif', '2026-04-23 08:52:36', '2026-05-10 08:22:26', NULL),
(7, 'MBR-00003', 'Moh rafa asyari', NULL, 'L', 'Situbondo (Sekolah: Smp nj)', NULL, NULL, NULL, '2026-04-23', 'aktif', '2026-04-23 08:53:29', '2026-04-23 08:53:29', NULL),
(8, 'MBR-00004', 'Achmad ferdy s', NULL, 'L', 'Probolinggo (Sekolah: Mts nj)', NULL, NULL, NULL, '2026-04-23', 'aktif', '2026-04-23 08:54:19', '2026-04-23 08:54:19', NULL),
(9, 'MBR-00005', 'M fadhil', NULL, 'L', 'Probolinggo (Sekolah: Smp nj)', NULL, NULL, NULL, '2026-04-23', 'aktif', '2026-04-23 08:55:01', '2026-04-23 08:55:01', NULL),
(10, 'MBR-00006', 'Ahmad ibra maulana', NULL, 'L', 'Jember (Sekolah: Smp nj)', NULL, NULL, NULL, '2026-04-23', 'aktif', '2026-04-23 08:55:33', '2026-04-23 08:55:33', NULL),
(11, 'MBR-00008', 'M aditya nizam kafabi e', NULL, 'L', 'Bondowoso (Sekolah: SMPNJ)', NULL, NULL, NULL, '2026-04-23', 'aktif', '2026-04-23 08:56:50', '2026-05-10 08:19:26', NULL),
(12, 'MBR-00009', 'Nabil farhan haidar', NULL, 'L', 'Probolinggo (Sekolah: Smp nj)', NULL, NULL, NULL, '2026-04-23', 'aktif', '2026-04-23 09:00:06', '2026-04-23 09:00:06', NULL),
(13, 'MBR-00010', 'Giofani arie wibowo', NULL, 'L', 'Situbondo (Sekolah: MANJ)', NULL, NULL, NULL, '2026-04-23', 'aktif', '2026-04-23 09:00:54', '2026-05-17 08:25:56', NULL),
(14, 'MBR-00011', 'Muhammad andika pratama', NULL, 'L', 'Bondowoso (Sekolah: Smp nj)', NULL, NULL, NULL, '2026-04-23', 'aktif', '2026-04-23 09:02:12', '2026-04-23 09:02:12', NULL),
(15, 'MBR-00016', 'Bintang raditya pratama', NULL, 'L', 'Jakarta (Sekolah: Mts nj)', NULL, NULL, NULL, '2026-04-23', 'aktif', '2026-04-23 09:09:16', '2026-04-23 09:13:06', NULL),
(16, 'MBR-00017', 'Teguh Bambang Alvaro', NULL, 'L', 'Bondowoso (Sekolah: MANJ)', NULL, NULL, NULL, '2026-04-23', 'aktif', '2026-04-23 09:10:15', '2026-04-30 08:01:00', NULL),
(17, 'MBR-00020', 'Salman habib al anwar', NULL, 'L', 'Denpasar (Sekolah: Smp nj)', NULL, NULL, NULL, '2026-04-23', 'aktif', '2026-04-23 09:14:19', '2026-04-23 09:14:19', NULL),
(18, 'MBR-00021', 'Zainul muhaimin fakhri', NULL, 'L', 'Bondowoso (Sekolah: Mts nj)', NULL, NULL, NULL, '2026-04-23', 'aktif', '2026-04-23 09:14:53', '2026-04-23 09:14:53', NULL),
(19, 'MBR-00022', 'M Alvino Tirta Qomaru', NULL, 'L', 'Bondowoso (Sekolah: MTsNJ)', NULL, NULL, NULL, '2026-04-23', 'aktif', '2026-04-23 09:15:56', '2026-04-30 08:25:46', NULL),
(20, 'MBR-00023', 'M zidan  rabbani', NULL, 'L', 'Situbondo (Sekolah: Smp nj)', NULL, NULL, NULL, '2026-04-23', 'aktif', '2026-04-23 09:16:45', '2026-04-23 09:16:45', NULL),
(21, 'MBR-00024', 'Rafi hasan', NULL, 'L', 'Bondowoso (Sekolah: Mts nj)', NULL, NULL, NULL, '2026-04-23', 'aktif', '2026-04-23 09:17:47', '2026-04-23 09:17:47', NULL),
(22, 'MBR-00025', 'M danish safaraz', NULL, 'L', 'Probolinggo (Sekolah: SMANJ)', NULL, NULL, NULL, '2026-04-23', 'aktif', '2026-04-23 09:18:13', '2026-05-10 08:22:49', NULL),
(23, 'MBR-00027', 'Moch Fatillah Zamani', NULL, 'L', 'Surabaya (Sekolah: MANJ)', NULL, NULL, NULL, '2026-04-23', 'aktif', '2026-04-23 09:21:13', '2026-04-26 08:39:35', NULL),
(24, 'MBR-00028', 'Fakhrullah Wafiy Arrosyid', NULL, 'L', 'Situbondo (Sekolah: MTsNJ)', NULL, NULL, NULL, '2026-04-23', 'aktif', '2026-04-23 09:21:56', '2026-04-26 08:55:38', NULL),
(25, 'MBR-00029', 'Ilzam Qoif Niam', NULL, 'L', 'Probolinggo (Sekolah: SMANJ)', NULL, NULL, NULL, '2026-04-23', 'aktif', '2026-04-23 09:22:37', '2026-04-26 08:55:05', NULL),
(26, 'MBR-00030', 'Muhammad Rafi R', NULL, 'L', 'Probolinggo (Sekolah: MTsNJ)', NULL, NULL, NULL, '2026-04-24', 'aktif', '2026-04-24 08:11:33', '2026-04-24 08:23:11', NULL),
(27, 'MBR-00031', 'Moh. Fatih Al-royyan', NULL, 'L', 'Besuki (Sekolah: SMPNJ)', NULL, NULL, NULL, '2026-04-24', 'aktif', '2026-04-24 08:13:40', '2026-04-24 08:13:40', NULL),
(28, 'MBR-00032', 'M Mahardika Gita', NULL, 'L', 'Probolinggo (Sekolah: Universitas Nurul Jadid)', NULL, NULL, NULL, '2026-04-24', 'aktif', '2026-04-24 08:31:34', '2026-04-26 08:39:08', NULL),
(29, 'MBR-00033', 'Naufal Nur Fawaid', NULL, 'L', 'Kalimantan Timur (Sekolah: MTsNJ)', NULL, NULL, NULL, '2026-04-25', 'aktif', '2026-04-25 08:21:08', '2026-04-25 08:21:08', NULL),
(30, 'MBR-00034', 'Sangkuriang', NULL, 'L', 'Uc-Charleston (Sekolah: Universitas Jamaica)', NULL, NULL, NULL, '2026-04-26', 'aktif', '2026-04-26 06:07:42', '2026-04-26 06:07:42', NULL),
(31, 'MBR-00035', 'M Azka Amani Attamimi', NULL, 'L', 'Lumajang (Sekolah: MTsNJ)', NULL, NULL, NULL, '2026-04-26', 'aktif', '2026-04-26 08:29:11', '2026-04-27 04:59:28', NULL),
(32, 'MBR-00036', 'Davin Alim Sukma R', NULL, 'L', 'Situbondo (Sekolah: SMPNJ)', NULL, NULL, NULL, '2026-04-26', 'aktif', '2026-04-26 08:31:19', '2026-04-27 04:59:48', NULL),
(33, 'MBR-00037', 'R.Muhammad Nashihul I. A.', NULL, 'L', 'PROBOLINGGO (Sekolah: SMPNJ)', NULL, NULL, NULL, '2026-04-26', 'aktif', '2026-04-26 08:32:34', '2026-04-26 08:32:34', NULL),
(34, 'MBR-00038', 'M naufal sunni', NULL, 'L', 'Situbondo (Sekolah: SMA NJ)', NULL, NULL, NULL, '2026-04-27', 'aktif', '2026-04-27 07:18:49', '2026-04-27 07:18:49', NULL),
(35, 'MBR-00039', 'M Thaariq Alvaro', NULL, 'L', 'Probolinggo (Sekolah: MTsNJ)', NULL, NULL, NULL, '2026-04-27', 'aktif', '2026-04-27 07:39:04', '2026-04-30 08:06:08', NULL),
(36, 'MBR-00040', 'M Wi\'am Aluf', NULL, 'L', 'Probolinggo (Sekolah: SMP NJ)', NULL, NULL, NULL, '2026-04-27', 'aktif', '2026-04-27 07:44:14', '2026-05-02 08:22:58', NULL),
(37, 'MBR-00043', 'Achmad Fahmi', NULL, 'L', 'Bondowoso (Sekolah: MTsNJ)', NULL, NULL, NULL, '2026-04-27', 'aktif', '2026-04-27 07:54:02', '2026-04-30 08:05:50', NULL),
(38, 'MBR-00044', 'Akbar M Pratama', NULL, 'L', 'Probolinggo (Sekolah: SMP NJ)', NULL, NULL, NULL, '2026-04-27', 'aktif', '2026-04-27 08:15:18', '2026-04-27 08:15:18', NULL),
(39, 'MBR-00045', 'Sulton Naufal Alif M', NULL, 'L', 'Probolinggo (Sekolah: SMPNJ)', NULL, NULL, NULL, '2026-04-27', 'aktif', '2026-04-27 08:18:56', '2026-05-10 08:20:05', NULL),
(40, 'MBR-00046', 'Rafisqi Nizam Al-Hafid', NULL, 'L', 'Probolnggo (Sekolah: SMPNJ)', NULL, NULL, NULL, '2026-04-28', 'aktif', '2026-04-28 08:36:56', '2026-05-10 08:19:53', NULL),
(41, 'MBR-00047', 'M. Az-Zuhri Kholidi R', NULL, 'L', 'Probolinggo (Sekolah: MTsNJ)', NULL, NULL, NULL, '2026-04-29', 'aktif', '2026-04-29 08:17:04', '2026-04-29 08:17:04', NULL),
(42, 'MBR-00048', 'Masraka Gita', NULL, 'L', 'Probolinggo (Sekolah: Universitas Nurul Jadid)', NULL, NULL, NULL, '2026-04-30', 'aktif', '2026-04-30 07:32:59', '2026-04-30 07:32:59', NULL),
(43, 'MBR-00049', 'Baqqial ittaqi Al ghifari', NULL, 'L', 'Sampang (Sekolah: MTsNJ)', NULL, NULL, NULL, '2026-04-30', 'aktif', '2026-04-30 07:41:13', '2026-04-30 07:41:13', NULL),
(44, 'MBR-00050', 'Aydin Rafan H.', NULL, 'L', 'Bondowoso (Sekolah: MTsNJ)', NULL, NULL, NULL, '2026-04-30', 'aktif', '2026-04-30 08:20:37', '2026-04-30 08:20:37', NULL),
(45, 'MBR-00051', 'Alvino Akbar Firdaus', NULL, 'L', 'Probolinggo (Sekolah: SMANJ)', NULL, NULL, NULL, '2026-04-30', 'aktif', '2026-04-30 08:24:45', '2026-04-30 08:24:45', NULL),
(46, 'MBR-00052', 'A. Kahfil Waro Ridwan', NULL, 'L', 'Situbondo (Sekolah: MANJ)', NULL, NULL, NULL, '2026-05-03', 'aktif', '2026-05-03 08:21:00', '2026-05-03 08:21:00', NULL),
(47, 'MBR-00053', 'A. Rezky Nurwita', NULL, 'L', 'Bali (Sekolah: SMPNJ)', NULL, NULL, NULL, '2026-05-04', 'aktif', '2026-05-04 07:20:39', '2026-05-04 07:20:39', NULL),
(48, 'MBR-00054', 'M. Raihan Maftuh', NULL, 'L', 'Besuki (Sekolah: MTsNJ)', NULL, NULL, NULL, '2026-05-04', 'aktif', '2026-05-04 07:35:38', '2026-05-04 07:35:38', NULL),
(49, 'MBR-00055', 'Kafin Aunullah', NULL, 'L', 'Bondowoso (Sekolah: SMPNJ)', NULL, NULL, NULL, '2026-05-04', 'aktif', '2026-05-04 07:49:46', '2026-05-04 07:49:46', NULL),
(50, 'MBR-00056', 'Anshory', NULL, 'L', 'Surabaya (Sekolah: SMPNJ)', NULL, NULL, NULL, '2026-05-04', 'aktif', '2026-05-04 08:16:02', '2026-05-04 08:16:02', NULL),
(51, 'MBR-00057', 'Hasan Rosyidi', NULL, 'L', 'Bojonegoro (Sekolah: SMPNJ)', NULL, NULL, NULL, '2026-05-05', 'aktif', '2026-05-05 08:27:37', '2026-05-10 08:19:39', NULL),
(52, 'MBR-00058', 'Rasyidina Rafi Wibisono', NULL, 'L', 'Jember (Sekolah: MTS NJ)', NULL, NULL, NULL, '2026-05-05', 'aktif', '2026-05-05 08:29:30', '2026-05-05 08:29:30', NULL),
(53, 'MBR-00059', 'Muhammad Allif F', NULL, 'L', 'Probolinggo (Sekolah: MTsNJ)', NULL, NULL, NULL, '2026-05-07', 'aktif', '2026-05-07 07:23:27', '2026-05-07 07:23:27', NULL),
(54, 'MBR-00060', 'Miftahussurur', NULL, 'L', 'Bondowoso (Sekolah: SMPNJ)', NULL, NULL, NULL, '2026-05-08', 'aktif', '2026-05-08 08:17:41', '2026-05-08 08:17:41', NULL),
(55, 'MBR-00061', 'Afzal Fathur Rahman', NULL, 'L', 'Lumajang (Sekolah: MTsNJ)', NULL, NULL, NULL, '2026-05-08', 'aktif', '2026-05-08 08:20:23', '2026-05-08 08:20:23', NULL),
(56, 'MBR-00062', 'Rizky Pratama Nur R.', NULL, 'L', 'Bondowoso (Sekolah: MTs NJ)', NULL, NULL, NULL, '2026-05-12', 'aktif', '2026-05-12 08:24:41', '2026-05-12 08:24:41', NULL),
(57, 'MBR-00063', 'Ata Ariezuna', NULL, 'L', 'Banyuwangi (Sekolah: Mts NJ)', NULL, NULL, NULL, '2026-05-12', 'aktif', '2026-05-12 08:28:11', '2026-05-12 08:28:11', NULL),
(58, 'MBR-00064', 'Ahmad kahfil waro', NULL, 'L', 'situbondo (Sekolah: Ma nj)', NULL, NULL, NULL, '2026-05-14', 'aktif', '2026-05-14 08:34:00', '2026-05-14 08:34:00', NULL),
(59, 'MBR-00065', 'A Rofiul Ilmi', NULL, 'L', 'Bali (Sekolah: MANJ)', NULL, NULL, NULL, '2026-05-16', 'aktif', '2026-05-16 08:26:53', '2026-05-16 08:26:53', NULL),
(60, 'MBR-00066', 'Maulana Muhammad Azzam', NULL, 'L', 'Situbondo (Sekolah: SMPNJ)', NULL, NULL, NULL, '2026-08-06', 'aktif', '2026-08-06 08:16:15', '2026-08-06 08:16:15', NULL),
(61, 'MBR-00067', 'Ilfan alghifari', NULL, 'L', 'banyuwangi (Sekolah: MTS)', NULL, NULL, NULL, '2026-08-07', 'aktif', '2026-08-07 08:23:20', '2026-08-07 08:23:20', NULL),
(62, 'MBR-00068', 'Muhammad Rohman', NULL, 'L', 'Probolinggo (Sekolah: SMKNJ)', NULL, NULL, NULL, '2026-08-07', 'aktif', '2026-08-07 08:45:32', '2026-08-07 08:45:32', NULL),
(63, 'MBR-00069', 'Sultan Cesar Aftar M.', NULL, 'L', 'Bondowoso (Sekolah: MA NJ)', NULL, NULL, NULL, '2026-09-10', 'aktif', '2026-09-10 08:10:20', '2026-09-10 08:10:20', NULL),
(64, 'MBR-00070', 'Naufal zivana irsyad', NULL, 'L', 'Situbondo (Sekolah: SMANJ)', NULL, NULL, NULL, '2026-09-23', 'aktif', '2026-09-23 08:17:55', '2026-09-23 08:17:55', NULL),
(65, 'MBR-00071', 'Harby sabdho wiyono', NULL, 'L', 'Situbondo (Sekolah: SMANJ)', NULL, NULL, NULL, '2026-09-24', 'aktif', '2026-09-24 07:56:51', '2026-09-24 07:56:51', NULL),
(66, 'MBR-00072', 'Muhammad Robith Buldan', NULL, 'L', 'Surabaya (Sekolah: SMA-NJ)', NULL, NULL, NULL, '2026-09-27', 'aktif', '2026-09-27 08:24:12', '2026-09-27 08:24:12', NULL),
(67, 'MBR-00073', 'Moh. Arif Zainul Haq', NULL, 'L', 'Probolinggo (Sekolah: MA-NJ)', NULL, NULL, NULL, '2026-10-01', 'aktif', '2026-10-01 07:20:20', '2026-10-01 07:20:20', NULL),
(68, 'MBR-00074', 'M.Sholehudin Al Ayubi', NULL, 'L', 'Bondowoso (Sekolah: SMK NJ)', NULL, NULL, NULL, '2026-10-04', 'aktif', '2026-10-04 08:13:43', '2026-10-04 08:13:43', NULL),
(69, 'MBR-00075', 'Ahmad Zaini', NULL, 'L', 'SItubondo (Sekolah: MA-NJ)', NULL, NULL, NULL, '2026-10-04', 'aktif', '2026-10-04 08:19:33', '2026-10-04 08:19:33', NULL),
(70, 'MBR-00076', 'Ahmad Qindi Haqiqi', NULL, 'L', 'Lumajang (Sekolah: SMK NJ)', NULL, NULL, NULL, '2026-10-06', 'aktif', '2026-10-06 08:12:37', '2026-10-06 08:12:37', NULL),
(71, 'MBR-00077', 'Naufal Zifana Irsyad', NULL, 'L', 'Situbondo (Sekolah: SMANJ)', NULL, NULL, NULL, '2026-10-06', 'aktif', '2026-10-06 08:15:10', '2026-10-06 08:15:10', NULL),
(72, 'MBR-00078', 'M.ainur rofiqi', NULL, 'L', 'probolinggo (Sekolah: MANJ)', NULL, NULL, NULL, '2026-10-15', 'aktif', '2026-10-15 08:21:07', '2026-10-15 08:21:07', NULL),
(73, 'MBR-00079', 'Fabian Abdillah', NULL, 'L', 'Probolingga (Sekolah: SMP NJ)', NULL, NULL, NULL, '2026-10-17', 'aktif', '2026-10-17 08:24:40', '2026-10-17 08:24:40', NULL),
(74, 'MBR-00080', 'Syauqi caromee A.', NULL, 'L', 'Situbondo (Sekolah: SMK NJ)', NULL, NULL, NULL, '2026-10-18', 'aktif', '2026-10-18 08:31:27', '2026-10-18 08:31:27', NULL),
(75, 'MBR-00081', 'Syauqi caromee A.', NULL, 'L', 'Situbondo (Sekolah: SMK NJ)', NULL, NULL, NULL, '2026-10-18', 'aktif', '2026-10-18 08:31:29', '2026-10-18 08:31:29', NULL),
(76, 'MBR-00082', 'Hamdan Abdillah', NULL, 'L', 'Situbondo (Sekolah: SMANJ)', NULL, NULL, NULL, '2026-10-19', 'aktif', '2026-10-19 09:03:40', '2026-10-19 09:03:40', NULL),
(77, 'MBR-001', 'Ahmad Fauzi', '2024001', 'L', 'Jl. Merdeka No. 10', '081234567890', 'ahmad@email.com', NULL, '2026-04-27', 'aktif', '2026-07-26 23:03:15', '2026-07-26 23:03:15', NULL),
(78, 'MBR-002', 'Dina Saputri', '2024002', 'P', 'Jl. Pahlawan No. 5', '089876543210', 'dina@email.com', NULL, '2026-05-27', 'aktif', '2026-07-26 23:03:15', '2026-07-26 23:03:15', NULL),
(79, 'MBR-003', 'Budi Santoso', '2024003', 'L', 'Jl. Sudirman No. 15', '085612345678', 'budi@email.com', NULL, '2026-06-27', 'aktif', '2026-07-26 23:03:15', '2026-07-26 23:03:15', NULL),
(80, 'MBR-004', 'Rina Wati', '2024004', 'P', 'Jl. Diponegoro No. 20', '087811223344', 'rina@email.com', NULL, '2026-07-17', 'nonaktif', '2026-07-26 23:03:15', '2026-07-26 23:03:15', NULL),
(84, 'MBR-VHD1VH', 'Irfan Abdul Faidh', NULL, 'L', 'Belum dilengkapi', NULL, NULL, NULL, '2026-10-23', 'aktif', '2026-10-23 07:00:11', '2026-10-23 07:00:11', NULL),
(85, 'MBR-QX9WIE', 'M. Naufal Thufail Anwar', NULL, 'L', 'Probolinggo', NULL, 'naufal123@gmail.com', NULL, '2026-10-29', 'aktif', '2026-10-29 07:44:53', '2026-10-29 07:44:53', NULL),
(86, 'MBR-WDDEBK', 'A Kafi Fairus Z O', NULL, 'L', 'Bondowos', NULL, 'kafi123@gmail.com', NULL, '2026-10-29', 'aktif', '2026-10-29 07:47:48', '2026-10-29 07:47:48', NULL),
(87, 'MBR-KGBZHW', 'Ahmad Nauval Khairi', NULL, 'L', 'Probolinggo', NULL, 'nauval@gmail.com', NULL, '2026-10-31', 'aktif', '2026-10-31 08:12:31', '2026-10-31 08:12:31', NULL),
(88, 'MBR-JGESMR', 'wiam aluf', NULL, 'L', 'probolinggi', NULL, 'akunmlbb223434@gmail.com', NULL, '2026-11-02', 'aktif', '2026-11-02 07:42:21', '2026-11-02 07:42:21', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2026_08_03_015605_create_categories_table', 1),
(5, '2026_08_03_015724_create_publishers_table', 1),
(6, '2026_08_03_015759_create_authors_table', 1),
(7, '2026_08_03_015814_create_shelves_table', 1),
(8, '2026_08_03_015824_create_members_table', 1),
(9, '2026_08_03_015838_create_books_table', 1),
(10, '2026_08_03_015847_create_loans_table', 1),
(11, '2026_08_03_015901_create_loan__details_table', 1),
(12, '2026_08_03_015917_create_book__returns_table', 1),
(13, '2026_08_03_015925_create_fines_table', 1),
(14, '2026_08_03_015939_create_settings_table', 1),
(15, '2026_10_20_020042_create_fine_histories_table', 1),
(16, '2026_10_21_000001_add_authentication_to_members_table', 1),
(18, '2026_10_21_000003_add_request_status_to_loans_table', 1),
(19, '2026_10_21_100001_add_status_and_approval_to_users_table', 1),
(20, '2026_10_21_100002_add_anggota_role_to_users_table', 1),
(22, '2026_10_21_100004_create_cart_items_table', 2),
(23, '2026_10_21_100005_add_source_and_pending_to_loans_table', 2),
(24, '2026_10_21_100006_add_member_id_to_users_table', 2),
(25, '2026_10_21_100007_set_existing_users_as_approved', 2),
(26, '2026_10_21_000002_create_cart_items_table', 3),
(27, '2026_10_21_100003_create_carts_table', 4),
(28, '2026_10_23_100001_add_rejection_and_phone_to_users_table', 5),
(29, '2026_10_23_100002_create_account_validation_logs_table', 5),
(30, '2026_10_23_100003_make_members_telepon_nullable', 6),
(31, '2026_10_23_100004_make_users_email_and_password_nullable', 7);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `peminjam`
--

CREATE TABLE `peminjam` (
  `id` bigint(20) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `alamat` text NOT NULL,
  `sekolah` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `peminjam`
--

INSERT INTO `peminjam` (`id`, `nama`, `alamat`, `sekolah`, `created_at`, `updated_at`) VALUES
(1, 'Ahmad', 'Jl. Mawar No.1', 'SMK Nurul Jadid', NULL, NULL),
(2, 'Budi', 'Jl. Melati No.2', 'SMA 1', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `peminjaman`
--

CREATE TABLE `peminjaman` (
  `id` bigint(20) NOT NULL,
  `peminjam_id` bigint(20) NOT NULL,
  `book_id` bigint(20) NOT NULL,
  `petugas_id` bigint(20) NOT NULL,
  `tanggal_pinjam` date NOT NULL,
  `tanggal_jatuh_tempo` date NOT NULL,
  `status` enum('dipinjam','dikembalikan') DEFAULT 'dipinjam',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `peminjaman`
--

INSERT INTO `peminjaman` (`id`, `peminjam_id`, `book_id`, `petugas_id`, `tanggal_pinjam`, `tanggal_jatuh_tempo`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, '2026-04-23', '2026-04-30', 'dipinjam', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `peminjamans`
--

CREATE TABLE `peminjamans` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `buku_id` bigint(20) UNSIGNED NOT NULL,
  `peminjam_id` bigint(20) UNSIGNED NOT NULL,
  `tanggal_pinjam` date NOT NULL,
  `tanggal_jatuh_tempo` date NOT NULL,
  `tanggal_kembali` date DEFAULT NULL,
  `status` enum('dipinjam','dikembalikan') NOT NULL DEFAULT 'dipinjam',
  `denda` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `peminjamans`
--

INSERT INTO `peminjamans` (`id`, `buku_id`, `peminjam_id`, `tanggal_pinjam`, `tanggal_jatuh_tempo`, `tanggal_kembali`, `status`, `denda`, `created_at`, `updated_at`) VALUES
(103, 1320, 69, '2026-09-09', '2026-09-15', '2026-09-16', 'dikembalikan', 0, '2026-09-10 08:10:37', '2026-09-16 08:38:10'),
(104, 1310, 10, '2026-09-10', '2026-09-16', '2026-09-16', 'dikembalikan', 0, '2026-09-11 08:35:00', '2026-09-16 08:38:13'),
(105, 1284, 29, '2026-09-11', '2026-09-17', '2026-09-26', 'dikembalikan', 0, '2026-09-12 08:10:13', '2026-09-26 08:25:15'),
(106, 1307, 10, '2026-09-17', '2026-09-23', '2026-09-23', 'dikembalikan', 0, '2026-09-18 08:26:41', '2026-09-23 08:30:01'),
(107, 1318, 69, '2026-09-17', '2026-09-23', '2026-09-21', 'dikembalikan', 0, '2026-09-18 08:27:17', '2026-09-21 07:13:24'),
(108, 1368, 24, '2026-09-19', '2026-09-25', '2026-09-25', 'dikembalikan', 0, '2026-09-20 08:07:39', '2026-09-25 08:18:22'),
(109, 1263, 70, '2026-09-22', '2026-09-28', '2026-10-04', 'dikembalikan', 0, '2026-09-23 08:18:52', '2026-10-04 08:11:10'),
(110, 1107, 10, '2026-09-22', '2026-09-28', '2026-09-27', 'dikembalikan', 0, '2026-09-23 08:30:59', '2026-09-27 08:27:23'),
(111, 1463, 71, '2026-09-23', '2026-09-29', '2026-09-29', 'dikembalikan', 0, '2026-09-24 07:57:30', '2026-09-29 08:12:48'),
(112, 1327, 72, '2026-09-26', '2026-10-02', '2026-09-30', 'dikembalikan', 0, '2026-09-27 08:24:39', '2026-09-30 08:19:09'),
(113, 1373, 10, '2026-09-26', '2026-10-02', '2026-10-04', 'dikembalikan', 2000, '2026-09-27 08:27:43', '2026-10-04 08:32:06'),
(114, 1271, 29, '2026-09-28', '2026-10-04', '2026-10-01', 'dikembalikan', 0, '2026-09-29 08:27:11', '2026-10-01 07:16:24'),
(115, 1199, 32, '2026-09-28', '2026-10-04', '2026-10-06', 'dikembalikan', 4000, '2026-09-29 08:28:52', '2026-10-06 08:27:04'),
(116, 1372, 45, '2026-09-29', '2026-10-05', '2026-10-04', 'dikembalikan', 0, '2026-09-30 08:23:05', '2026-10-04 08:25:53'),
(117, 1277, 40, '2026-09-29', '2026-10-05', '2026-10-12', 'dikembalikan', 0, '2026-09-30 08:28:27', '2026-10-12 08:27:31'),
(118, 1256, 29, '2026-09-30', '2026-10-06', '2026-10-12', 'dikembalikan', 0, '2026-10-01 07:16:44', '2026-10-12 08:27:15'),
(119, 1197, 73, '2026-09-30', '2026-10-06', '2026-10-11', 'dikembalikan', 0, '2026-10-01 07:20:44', '2026-10-11 09:11:23'),
(120, 1327, 67, '2026-09-30', '2026-10-06', '2026-10-05', 'dikembalikan', 0, '2026-10-01 08:09:50', '2026-10-05 07:46:12'),
(121, 1218, 69, '2026-09-30', '2026-10-06', '2026-10-05', 'dikembalikan', 0, '2026-10-01 08:15:21', '2026-10-05 07:34:59'),
(122, 958, 72, '2026-09-30', '2026-10-06', '2026-10-06', 'dikembalikan', 0, '2026-10-01 08:21:53', '2026-10-06 08:14:15'),
(123, 701, 74, '2026-10-03', '2026-10-09', '2026-10-12', 'dikembalikan', 0, '2026-10-04 08:14:11', '2026-10-12 08:27:55'),
(124, 533, 75, '2026-10-03', '2026-10-09', '2026-10-09', 'dikembalikan', 0, '2026-10-04 08:19:57', '2026-10-09 08:39:22'),
(125, 1372, 76, '2026-10-05', '2026-10-11', NULL, 'dipinjam', 0, '2026-10-06 08:12:56', '2026-10-06 08:12:56'),
(126, 1278, 70, '2026-10-05', '2026-10-11', '2026-10-12', 'dikembalikan', 0, '2026-10-06 08:15:28', '2026-10-12 08:25:05'),
(127, 1280, 70, '2026-10-08', '2026-10-14', '2026-10-12', 'dikembalikan', 0, '2026-10-09 08:29:58', '2026-10-12 08:25:22'),
(128, 1307, 78, '2026-10-14', '2026-10-20', '2026-10-20', 'dikembalikan', 0, '2026-10-15 08:21:43', '2026-10-20 08:15:18'),
(129, 1375, 79, '2026-10-16', '2026-10-22', NULL, 'dipinjam', 0, '2026-10-17 08:25:02', '2026-10-17 08:25:02'),
(130, 447, 32, '2026-10-17', '2026-10-23', NULL, 'dipinjam', 0, '2026-10-18 08:27:00', '2026-10-18 08:27:00'),
(131, 1176, 80, '2026-10-17', '2026-10-23', NULL, 'dipinjam', 0, '2026-10-18 08:32:08', '2026-10-18 08:32:08'),
(132, 753, 50, '2026-10-17', '2026-10-23', NULL, 'dipinjam', 0, '2026-10-18 08:36:01', '2026-10-18 08:36:01'),
(133, 1314, 69, '2026-10-18', '2026-10-24', NULL, 'dipinjam', 0, '2026-10-19 08:01:09', '2026-10-19 08:01:09'),
(134, 1271, 82, '2026-10-18', '2026-10-24', NULL, 'dipinjam', 0, '2026-10-19 09:04:18', '2026-10-19 09:04:18');

-- --------------------------------------------------------

--
-- Table structure for table `peminjams`
--

CREATE TABLE `peminjams` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama` varchar(255) NOT NULL,
  `alamat` text NOT NULL,
  `sekolah` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `peminjams`
--

INSERT INTO `peminjams` (`id`, `nama`, `alamat`, `sekolah`, `created_at`, `updated_at`) VALUES
(1, 'A Subhan Ridho Rohmatullah', 'Situbondo', 'Universitas Nurul Jadid', '2026-04-23 06:52:39', '2026-04-23 06:52:39'),
(2, 'M Fauzan Khoiron', 'Malang', 'MTsNJ', '2026-04-23 08:52:36', '2026-05-10 08:22:26'),
(3, 'Moh rafa asyari', 'Situbondo', 'Smp nj', '2026-04-23 08:53:29', '2026-04-23 08:53:29'),
(4, 'Achmad ferdy s', 'Probolinggo', 'Mts nj', '2026-04-23 08:54:19', '2026-04-23 08:54:19'),
(5, 'M fadhil', 'Probolinggo', 'Smp nj', '2026-04-23 08:55:01', '2026-04-23 08:55:01'),
(6, 'Ahmad ibra maulana', 'Jember', 'Smp nj', '2026-04-23 08:55:33', '2026-04-23 08:55:33'),
(8, 'M aditya nizam kafabi e', 'Bondowoso', 'SMPNJ', '2026-04-23 08:56:50', '2026-05-10 08:19:26'),
(9, 'Nabil farhan haidar', 'Probolinggo', 'Smp nj', '2026-04-23 09:00:06', '2026-04-23 09:00:06'),
(10, 'Giofani arie wibowo', 'Situbondo', 'MANJ', '2026-04-23 09:00:54', '2026-05-17 08:25:56'),
(11, 'Muhammad andika pratama', 'Bondowoso', 'Smp nj', '2026-04-23 09:02:12', '2026-04-23 09:02:12'),
(16, 'Bintang raditya pratama', 'Jakarta', 'Mts nj', '2026-04-23 09:09:16', '2026-04-23 09:13:06'),
(17, 'Teguh Bambang Alvaro', 'Bondowoso', 'MANJ', '2026-04-23 09:10:15', '2026-04-30 08:01:00'),
(20, 'Salman habib al anwar', 'Denpasar', 'Smp nj', '2026-04-23 09:14:19', '2026-04-23 09:14:19'),
(21, 'Zainul muhaimin fakhri', 'Bondowoso', 'Mts nj', '2026-04-23 09:14:53', '2026-04-23 09:14:53'),
(22, 'M Alvino Tirta Qomaru', 'Bondowoso', 'MTsNJ', '2026-04-23 09:15:56', '2026-04-30 08:25:46'),
(23, 'M zidan  rabbani', 'Situbondo', 'Smp nj', '2026-04-23 09:16:45', '2026-04-23 09:16:45'),
(24, 'Rafi hasan', 'Bondowoso', 'Mts nj', '2026-04-23 09:17:47', '2026-04-23 09:17:47'),
(25, 'M danish safaraz', 'Probolinggo', 'SMANJ', '2026-04-23 09:18:13', '2026-05-10 08:22:49'),
(27, 'Moch Fatillah Zamani', 'Surabaya', 'MANJ', '2026-04-23 09:21:13', '2026-04-26 08:39:35'),
(28, 'Fakhrullah Wafiy Arrosyid', 'Situbondo', 'MTsNJ', '2026-04-23 09:21:56', '2026-04-26 08:55:38'),
(29, 'Ilzam Qoif Niam', 'Probolinggo', 'SMANJ', '2026-04-23 09:22:37', '2026-04-26 08:55:05'),
(30, 'Muhammad Rafi R', 'Probolinggo', 'MTsNJ', '2026-04-24 08:11:33', '2026-04-24 08:23:11'),
(31, 'Moh. Fatih Al-royyan', 'Besuki', 'SMPNJ', '2026-04-24 08:13:40', '2026-04-24 08:13:40'),
(32, 'M Mahardika Gita', 'Probolinggo', 'Universitas Nurul Jadid', '2026-04-24 08:31:34', '2026-04-26 08:39:08'),
(33, 'Naufal Nur Fawaid', 'Kalimantan Timur', 'MTsNJ', '2026-04-25 08:21:08', '2026-04-25 08:21:08'),
(34, 'Sangkuriang', 'Uc-Charleston', 'Universitas Jamaica', '2026-04-26 06:07:42', '2026-04-26 06:07:42'),
(35, 'M Azka Amani Attamimi', 'Lumajang', 'MTsNJ', '2026-04-26 08:29:11', '2026-04-27 04:59:28'),
(36, 'Davin Alim Sukma R', 'Situbondo', 'SMPNJ', '2026-04-26 08:31:19', '2026-04-27 04:59:48'),
(37, 'R.Muhammad Nashihul I. A.', 'PROBOLINGGO', 'SMPNJ', '2026-04-26 08:32:34', '2026-04-26 08:32:34'),
(38, 'M naufal sunni', 'Situbondo', 'SMA NJ', '2026-04-27 07:18:49', '2026-04-27 07:18:49'),
(39, 'M Thaariq Alvaro', 'Probolinggo', 'MTsNJ', '2026-04-27 07:39:04', '2026-04-30 08:06:08'),
(40, 'M Wi\'am Aluf', 'Probolinggo', 'SMP NJ', '2026-04-27 07:44:14', '2026-05-02 08:22:58'),
(43, 'Achmad Fahmi', 'Bondowoso', 'MTsNJ', '2026-04-27 07:54:02', '2026-04-30 08:05:50'),
(44, 'Akbar M Pratama', 'Probolinggo', 'SMP NJ', '2026-04-27 08:15:18', '2026-04-27 08:15:18'),
(45, 'Sulton Naufal Alif M', 'Probolinggo', 'SMPNJ', '2026-04-27 08:18:56', '2026-05-10 08:20:05'),
(46, 'Rafisqi Nizam Al-Hafid', 'Probolnggo', 'SMPNJ', '2026-04-28 08:36:56', '2026-05-10 08:19:53'),
(47, 'M. Az-Zuhri Kholidi R', 'Probolinggo', 'MTsNJ', '2026-04-29 08:17:04', '2026-04-29 08:17:04'),
(48, 'Masraka Gita', 'Probolinggo', 'Universitas Nurul Jadid', '2026-04-30 07:32:59', '2026-04-30 07:32:59'),
(49, 'Baqqial ittaqi Al ghifari', 'Sampang', 'MTsNJ', '2026-04-30 07:41:13', '2026-04-30 07:41:13'),
(50, 'Aydin Rafan H.', 'Bondowoso', 'MTsNJ', '2026-04-30 08:20:37', '2026-04-30 08:20:37'),
(51, 'Alvino Akbar Firdaus', 'Probolinggo', 'SMANJ', '2026-04-30 08:24:45', '2026-04-30 08:24:45'),
(52, 'A. Kahfil Waro Ridwan', 'Situbondo', 'MANJ', '2026-05-03 08:21:00', '2026-05-03 08:21:00'),
(53, 'A. Rezky Nurwita', 'Bali', 'SMPNJ', '2026-05-04 07:20:39', '2026-05-04 07:20:39'),
(54, 'M. Raihan Maftuh', 'Besuki', 'MTsNJ', '2026-05-04 07:35:38', '2026-05-04 07:35:38'),
(55, 'Kafin Aunullah', 'Bondowoso', 'SMPNJ', '2026-05-04 07:49:46', '2026-05-04 07:49:46'),
(56, 'Anshory', 'Surabaya', 'SMPNJ', '2026-05-04 08:16:02', '2026-05-04 08:16:02'),
(57, 'Hasan Rosyidi', 'Bojonegoro', 'SMPNJ', '2026-05-05 08:27:37', '2026-05-10 08:19:39'),
(58, 'Rasyidina Rafi Wibisono', 'Jember', 'MTS NJ', '2026-05-05 08:29:30', '2026-05-05 08:29:30'),
(59, 'Muhammad Allif F', 'Probolinggo', 'MTsNJ', '2026-05-07 07:23:27', '2026-05-07 07:23:27'),
(60, 'Miftahussurur', 'Bondowoso', 'SMPNJ', '2026-05-08 08:17:41', '2026-05-08 08:17:41'),
(61, 'Afzal Fathur Rahman', 'Lumajang', 'MTsNJ', '2026-05-08 08:20:23', '2026-05-08 08:20:23'),
(62, 'Rizky Pratama Nur R.', 'Bondowoso', 'MTs NJ', '2026-05-12 08:24:41', '2026-05-12 08:24:41'),
(63, 'Ata Ariezuna', 'Banyuwangi', 'Mts NJ', '2026-05-12 08:28:11', '2026-05-12 08:28:11'),
(64, 'Ahmad kahfil waro', 'situbondo', 'Ma nj', '2026-05-14 08:34:00', '2026-05-14 08:34:00'),
(65, 'A Rofiul Ilmi', 'Bali', 'MANJ', '2026-05-16 08:26:53', '2026-05-16 08:26:53'),
(66, 'Maulana Muhammad Azzam', 'Situbondo', 'SMPNJ', '2026-08-06 08:16:15', '2026-08-06 08:16:15'),
(67, 'Ilfan alghifari', 'banyuwangi', 'MTS', '2026-08-07 08:23:20', '2026-08-07 08:23:20'),
(68, 'Muhammad Rohman', 'Probolinggo', 'SMKNJ', '2026-08-07 08:45:32', '2026-08-07 08:45:32'),
(69, 'Sultan Cesar Aftar M.', 'Bondowoso', 'MA NJ', '2026-09-10 08:10:20', '2026-09-10 08:10:20'),
(70, 'Naufal zivana irsyad', 'Situbondo', 'SMANJ', '2026-09-23 08:17:55', '2026-09-23 08:17:55'),
(71, 'Harby sabdho wiyono', 'Situbondo', 'SMANJ', '2026-09-24 07:56:51', '2026-09-24 07:56:51'),
(72, 'Muhammad Robith Buldan', 'Surabaya', 'SMA-NJ', '2026-09-27 08:24:12', '2026-09-27 08:24:12'),
(73, 'Moh. Arif Zainul Haq', 'Probolinggo', 'MA-NJ', '2026-10-01 07:20:20', '2026-10-01 07:20:20'),
(74, 'M.Sholehudin Al Ayubi', 'Bondowoso', 'SMK NJ', '2026-10-04 08:13:43', '2026-10-04 08:13:43'),
(75, 'Ahmad Zaini', 'SItubondo', 'MA-NJ', '2026-10-04 08:19:33', '2026-10-04 08:19:33'),
(76, 'Ahmad Qindi Haqiqi', 'Lumajang', 'SMK NJ', '2026-10-06 08:12:37', '2026-10-06 08:12:37'),
(77, 'Naufal Zifana Irsyad', 'Situbondo', 'SMANJ', '2026-10-06 08:15:10', '2026-10-06 08:15:10'),
(78, 'M.ainur rofiqi', 'probolinggo', 'MANJ', '2026-10-15 08:21:07', '2026-10-15 08:21:07'),
(79, 'Fabian Abdillah', 'Probolingga', 'SMP NJ', '2026-10-17 08:24:40', '2026-10-17 08:24:40'),
(80, 'Syauqi caromee A.', 'Situbondo', 'SMK NJ', '2026-10-18 08:31:27', '2026-10-18 08:31:27'),
(81, 'Syauqi caromee A.', 'Situbondo', 'SMK NJ', '2026-10-18 08:31:29', '2026-10-18 08:31:29'),
(82, 'Hamdan Abdillah', 'Situbondo', 'SMANJ', '2026-10-19 09:03:40', '2026-10-19 09:03:40');

-- --------------------------------------------------------

--
-- Table structure for table `pengembalian`
--

CREATE TABLE `pengembalian` (
  `id` bigint(20) NOT NULL,
  `peminjaman_id` bigint(20) NOT NULL,
  `tanggal_dikembalikan` date NOT NULL,
  `terlambat_hari` int(11) DEFAULT 0,
  `denda` decimal(10,2) DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `petugas`
--

CREATE TABLE `petugas` (
  `id` bigint(20) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `petugas`
--

INSERT INTO `petugas` (`id`, `nama`, `email`, `password`, `created_at`, `updated_at`) VALUES
(1, 'Admin Perpus', 'adminperpus@gmail.com', '\\$2y\\$12\\$jtwWxKGWkhvgDLq50OKHVOYQVSG4xnmHweeCsOIFKeclV3GqAMqfK', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `publishers`
--

CREATE TABLE `publishers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `kode_penerbit` varchar(255) NOT NULL,
  `nama_penerbit` varchar(255) NOT NULL,
  `alamat` varchar(255) DEFAULT NULL,
  `telepon` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `publishers`
--

INSERT INTO `publishers` (`id`, `kode_penerbit`, `nama_penerbit`, `alamat`, `telepon`, `email`, `created_at`, `updated_at`) VALUES
(1, 'PBN-LEGACY', 'Penerbit Tidak Tercatat', NULL, NULL, NULL, '2026-10-23 09:42:57', '2026-10-23 09:42:57'),
(2, 'PNB-001', 'Gramedia', 'Jakarta', NULL, NULL, '2026-07-26 23:03:15', '2026-07-26 23:03:15'),
(3, 'PNB-002', 'Mizan', 'Bandung', NULL, NULL, '2026-07-26 23:03:15', '2026-07-26 23:03:15');

-- --------------------------------------------------------

--
-- Table structure for table `returns`
--

CREATE TABLE `returns` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `kode_kembali` varchar(255) NOT NULL,
  `loan_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `tanggal_kembali` date NOT NULL,
  `terlambat_hari` int(11) NOT NULL DEFAULT 0,
  `denda` decimal(10,2) NOT NULL DEFAULT 0.00,
  `catatan` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `returns`
--

INSERT INTO `returns` (`id`, `kode_kembali`, `loan_id`, `user_id`, `tanggal_kembali`, `terlambat_hari`, `denda`, `catatan`, `created_at`, `updated_at`) VALUES
(1, 'KBL-LEKOD6WM', 29, 18, '2026-10-23', 0, 0.00, NULL, '2026-10-23 08:06:17', '2026-10-23 08:06:17'),
(2, 'KBL-CJB07VKR', 28, 18, '2026-10-23', 0, 0.00, NULL, '2026-10-23 08:06:42', '2026-10-23 08:06:42'),
(3, 'KBL-HTQC2M1F', 31, 19, '2026-10-26', 2, 4000.00, 'ini inputnya terlambat. jadinya telat!!!. mangkanah jek elang meloloh cong', '2026-10-26 08:17:44', '2026-10-26 08:17:44'),
(4, 'KBL-GMUI4VHC', 36, 19, '2026-10-28', 0, 0.00, NULL, '2026-10-28 08:11:49', '2026-10-28 08:11:49'),
(5, 'KBL-E6VJFAUQ', 23, 19, '2026-10-28', 17, 34000.00, NULL, '2026-10-28 09:32:15', '2026-10-28 09:32:15'),
(6, 'KBL-U0SWHQ2L', 30, 19, '2026-10-28', 5, 10000.00, NULL, '2026-10-28 09:32:29', '2026-10-28 09:32:29'),
(7, 'KBL-SRFRM6KM', 38, 18, '2026-11-01', 0, 0.00, NULL, '2026-11-01 08:13:34', '2026-11-01 08:13:34'),
(8, 'KBL-6YSJ6F3E', 41, 18, '2026-11-03', 0, 0.00, 'aman', '2026-11-03 08:18:51', '2026-11-03 08:18:51'),
(9, 'KBL-QWWTIKIO', 37, 18, '2026-11-03', 0, 0.00, NULL, '2026-11-03 08:23:35', '2026-11-03 08:23:35'),
(10, 'KBL-OCRFY7U9', 39, 18, '2026-11-03', 0, 0.00, NULL, '2026-11-03 08:26:10', '2026-11-03 08:26:10'),
(11, 'KBL-DZWZULFX', 42, 18, '2026-11-04', 0, 0.00, NULL, '2026-11-04 08:11:08', '2026-11-04 08:11:08'),
(12, 'KBL-X3DHGT6T', 44, 18, '2026-11-04', 0, 0.00, NULL, '2026-11-04 08:12:31', '2026-11-04 08:12:31'),
(13, 'KBL-CWAX2NOI', 43, 18, '2026-11-06', 1, 2000.00, 'kemarin malam pembukaan harlah', '2026-11-06 08:19:50', '2026-11-06 08:19:50'),
(14, 'KBL-ZF5CLNGR', 48, 18, '2026-11-07', 0, 0.00, 'Aman', '2026-11-07 09:32:20', '2026-11-07 09:32:20'),
(15, 'KBL-SPI68NCR', 47, 18, '2026-11-07', 0, 0.00, 'Aman', '2026-11-07 09:32:28', '2026-11-07 09:32:28'),
(16, 'KBL-BJTQY24C', 45, 18, '2026-11-08', 1, 2000.00, 'Sudah selesai dendanya', '2026-11-08 08:14:46', '2026-11-08 08:14:46'),
(17, 'KBL-HNE7YVAU', 40, 18, '2026-11-08', 4, 8000.00, 'Dendanya sudah', '2026-11-08 08:18:58', '2026-11-08 08:18:58'),
(18, 'KBL-AA5FM7FE', 49, 18, '2026-11-08', 0, 0.00, 'Sudah', '2026-11-08 08:30:05', '2026-11-08 08:30:05');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('IQkCb8Nxla0umdaF73qUXYoLAU1lDe9SVk3eDblM', 18, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64; rv:159.0) Gecko/20100101 Firefox/159.0', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiTFFITmxMMjlkeWRreFhDNmRqV1hCQ0ZTRFZVWmRITGVkTUttTTVSViI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9sb2FucyI7czo1OiJyb3V0ZSI7czoxMToibG9hbnMuaW5kZXgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxODt9', 1794151902),
('MnGsuAGFI7H3lId6YYyhBQ9J4gQy6tyIkjkqN3g3', 18, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64; rv:159.0) Gecko/20100101 Firefox/159.0', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiMThLZXlWSkptNUxJSWpIY2YyUUJST3k3WW1ZbHJWbFY5NUw5bDlLWiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9sb2FucyI7czo1OiJyb3V0ZSI7czoxMToibG9hbnMuaW5kZXgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxODt9', 1794069164),
('WuDgcZa0LaYtebT5apF4S41lYkh4JIHXkIcv5xJN', NULL, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64; rv:159.0) Gecko/20100101 Firefox/159.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRVBNb1hRV1IySTJVOWRDdkRONnc3VW9SQTZRMDBpTUI4SlZmbndEQiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1794069112);

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(255) NOT NULL,
  `value` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `key`, `value`, `created_at`, `updated_at`) VALUES
(1, 'nama_perpustakaan', 'PerpusZabitsa', '2026-10-23 06:42:32', '2026-10-23 06:42:32'),
(2, 'email_perpustakaan', NULL, '2026-10-23 06:42:32', '2026-10-23 06:42:32'),
(3, 'telepon_perpustakaan', NULL, '2026-10-23 06:42:32', '2026-10-23 06:42:32'),
(4, 'alamat_perpustakaan', NULL, '2026-10-23 06:42:32', '2026-10-23 06:42:32'),
(5, 'denda_per_hari', '2000', '2026-10-23 06:42:32', '2026-10-23 06:43:02'),
(6, 'maksimal_hari_pinjam', '5', '2026-10-23 06:42:32', '2026-10-23 06:43:02'),
(7, 'maksimal_jumlah_buku', '1', '2026-10-23 06:42:32', '2026-10-23 06:43:02');

-- --------------------------------------------------------

--
-- Table structure for table `shelves`
--

CREATE TABLE `shelves` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `kode_rak` varchar(255) NOT NULL,
  `nama_rak` varchar(255) NOT NULL,
  `lokasi` varchar(255) DEFAULT NULL,
  `tipe` enum('rak','etalase') NOT NULL DEFAULT 'rak',
  `kapasitas` int(11) NOT NULL DEFAULT 0,
  `deskripsi` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shelves`
--

INSERT INTO `shelves` (`id`, `kode_rak`, `nama_rak`, `lokasi`, `tipe`, `kapasitas`, `deskripsi`, `created_at`, `updated_at`) VALUES
(1, 'RAK-A01', 'Rak Fiksi 1', 'Lantai 1', 'rak', 50, NULL, '2026-07-26 23:03:15', '2026-07-26 23:03:15'),
(2, 'RAK-B01', 'Rak Sains 1', 'Lantai 2', 'rak', 50, NULL, '2026-07-26 23:03:15', '2026-07-26 23:03:15');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `telepon` varchar(20) DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `role` enum('admin','petugas','anggota') NOT NULL DEFAULT 'petugas',
  `member_id` bigint(20) UNSIGNED DEFAULT NULL,
  `status` enum('pending','approved','rejected') NOT NULL DEFAULT 'approved',
  `foto` varchar(255) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `approved_by` bigint(20) UNSIGNED DEFAULT NULL,
  `approved_at` timestamp NULL DEFAULT NULL,
  `rejected_at` timestamp NULL DEFAULT NULL,
  `rejected_reason` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `email`, `telepon`, `email_verified_at`, `password`, `role`, `member_id`, `status`, `foto`, `remember_token`, `created_at`, `updated_at`, `approved_by`, `approved_at`, `rejected_at`, `rejected_reason`) VALUES
(1, 'admin', 'admin', 'admin@perpus.com', NULL, NULL, '$2y$12$Rx2iYUFEl7wKUh.dvn2GHeK.lrcMskDTHfOGeGRVpaNYORF4jomhu', 'admin', NULL, 'approved', NULL, NULL, '2026-10-20 20:07:49', '2026-10-20 20:07:49', NULL, '2026-10-20 20:07:49', NULL, NULL),
(18, 'Petugas', 'petugas', 'petugas0711@gmail.com', NULL, NULL, '$2y$12$7mcU4ArWII3kjxHWbRmFeuDlG/dWSuWWogIwaKEfCgOwWwGqlPZA6', 'petugas', NULL, 'approved', NULL, NULL, '2026-10-23 07:30:20', '2026-10-23 07:30:20', 1, '2026-10-23 07:30:20', NULL, NULL),
(19, 'Muhammad Babun Nur Malikil Mulki Tamami', 'malik', 'malik123@gmail.com', NULL, NULL, '$2y$12$y225TmAooNj98O3rsxNgUe1R9wFDezoZvw9/bsDJBnxc4HE4437yS', 'petugas', NULL, 'approved', NULL, NULL, '2026-10-26 08:15:30', '2026-10-26 08:15:30', 1, '2026-10-26 08:15:30', NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account_validation_logs`
--
ALTER TABLE `account_validation_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `account_validation_logs_user_id_foreign` (`user_id`),
  ADD KEY `account_validation_logs_acted_by_foreign` (`acted_by`);

--
-- Indexes for table `authors`
--
ALTER TABLE `authors`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `authors_kode_penulis_unique` (`kode_penulis`);

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `books_kode_buku_unique` (`kode_buku`),
  ADD KEY `books_category_id_foreign` (`category_id`),
  ADD KEY `books_publisher_id_foreign` (`publisher_id`),
  ADD KEY `books_author_id_foreign` (`author_id`),
  ADD KEY `books_shelf_id_foreign` (`shelf_id`);

--
-- Indexes for table `bukus`
--
ALTER TABLE `bukus`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `bukus_kode_buku_unique` (`kode_buku`),
  ADD KEY `bukus_kategori_id_foreign` (`kategori_id`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `carts_user_id_unique` (`user_id`);

--
-- Indexes for table `cart_items`
--
ALTER TABLE `cart_items`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cart_items_cart_id_book_id_unique` (`cart_id`,`book_id`),
  ADD KEY `cart_items_book_id_foreign` (`book_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_kode_kategori_unique` (`kode_kategori`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `fines`
--
ALTER TABLE `fines`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `fines_kode_denda_unique` (`kode_denda`),
  ADD KEY `fines_member_id_foreign` (`member_id`),
  ADD KEY `fines_loan_id_foreign` (`loan_id`);

--
-- Indexes for table `fine_histories`
--
ALTER TABLE `fine_histories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fine_histories_fine_id_foreign` (`fine_id`),
  ADD KEY `fine_histories_user_id_foreign` (`user_id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nama_kategori` (`nama_kategori`);

--
-- Indexes for table `kategoris`
--
ALTER TABLE `kategoris`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lama_books`
--
ALTER TABLE `lama_books`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `kode_buku` (`kode_buku`),
  ADD KEY `kategori_id` (`kategori_id`);

--
-- Indexes for table `lama_cache`
--
ALTER TABLE `lama_cache`
  ADD PRIMARY KEY (`key`),
  ADD KEY `cache_expiration_index` (`expiration`);

--
-- Indexes for table `lama_cache_locks`
--
ALTER TABLE `lama_cache_locks`
  ADD PRIMARY KEY (`key`),
  ADD KEY `cache_locks_expiration_index` (`expiration`);

--
-- Indexes for table `lama_failed_jobs`
--
ALTER TABLE `lama_failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `lama_jobs`
--
ALTER TABLE `lama_jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `lama_job_batches`
--
ALTER TABLE `lama_job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lama_migrations`
--
ALTER TABLE `lama_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lama_password_reset_tokens`
--
ALTER TABLE `lama_password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `lama_sessions`
--
ALTER TABLE `lama_sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `lama_users`
--
ALTER TABLE `lama_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `loans`
--
ALTER TABLE `loans`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `loans_kode_pinjam_unique` (`kode_pinjam`),
  ADD KEY `loans_member_id_foreign` (`member_id`),
  ADD KEY `loans_user_id_foreign` (`user_id`),
  ADD KEY `loans_approved_by_foreign` (`approved_by`);

--
-- Indexes for table `loan_details`
--
ALTER TABLE `loan_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `loan_details_loan_id_foreign` (`loan_id`),
  ADD KEY `loan_details_book_id_foreign` (`book_id`);

--
-- Indexes for table `members`
--
ALTER TABLE `members`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `members_kode_member_unique` (`kode_member`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `peminjam`
--
ALTER TABLE `peminjam`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `peminjaman`
--
ALTER TABLE `peminjaman`
  ADD PRIMARY KEY (`id`),
  ADD KEY `peminjam_id` (`peminjam_id`),
  ADD KEY `book_id` (`book_id`),
  ADD KEY `petugas_id` (`petugas_id`);

--
-- Indexes for table `peminjamans`
--
ALTER TABLE `peminjamans`
  ADD PRIMARY KEY (`id`),
  ADD KEY `peminjamans_buku_id_foreign` (`buku_id`),
  ADD KEY `peminjamans_peminjam_id_foreign` (`peminjam_id`);

--
-- Indexes for table `peminjams`
--
ALTER TABLE `peminjams`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pengembalian`
--
ALTER TABLE `pengembalian`
  ADD PRIMARY KEY (`id`),
  ADD KEY `peminjaman_id` (`peminjaman_id`);

--
-- Indexes for table `petugas`
--
ALTER TABLE `petugas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `publishers`
--
ALTER TABLE `publishers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `publishers_kode_penerbit_unique` (`kode_penerbit`);

--
-- Indexes for table `returns`
--
ALTER TABLE `returns`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `returns_kode_kembali_unique` (`kode_kembali`),
  ADD KEY `returns_loan_id_foreign` (`loan_id`),
  ADD KEY `returns_user_id_foreign` (`user_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `settings_key_unique` (`key`);

--
-- Indexes for table `shelves`
--
ALTER TABLE `shelves`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `shelves_kode_rak_unique` (`kode_rak`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_username_unique` (`username`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_approved_by_foreign` (`approved_by`),
  ADD KEY `users_member_id_foreign` (`member_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `account_validation_logs`
--
ALTER TABLE `account_validation_logs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `authors`
--
ALTER TABLE `authors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `books`
--
ALTER TABLE `books`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1238;

--
-- AUTO_INCREMENT for table `bukus`
--
ALTER TABLE `bukus`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1464;

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cart_items`
--
ALTER TABLE `cart_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fines`
--
ALTER TABLE `fines`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `fine_histories`
--
ALTER TABLE `fine_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `kategoris`
--
ALTER TABLE `kategoris`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `lama_books`
--
ALTER TABLE `lama_books`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `lama_failed_jobs`
--
ALTER TABLE `lama_failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lama_jobs`
--
ALTER TABLE `lama_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lama_migrations`
--
ALTER TABLE `lama_migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `lama_users`
--
ALTER TABLE `lama_users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `loans`
--
ALTER TABLE `loans`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `loan_details`
--
ALTER TABLE `loan_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `members`
--
ALTER TABLE `members`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=89;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `peminjam`
--
ALTER TABLE `peminjam`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `peminjaman`
--
ALTER TABLE `peminjaman`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `peminjamans`
--
ALTER TABLE `peminjamans`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=135;

--
-- AUTO_INCREMENT for table `peminjams`
--
ALTER TABLE `peminjams`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=83;

--
-- AUTO_INCREMENT for table `pengembalian`
--
ALTER TABLE `pengembalian`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `petugas`
--
ALTER TABLE `petugas`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `publishers`
--
ALTER TABLE `publishers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `returns`
--
ALTER TABLE `returns`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `shelves`
--
ALTER TABLE `shelves`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `account_validation_logs`
--
ALTER TABLE `account_validation_logs`
  ADD CONSTRAINT `account_validation_logs_acted_by_foreign` FOREIGN KEY (`acted_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `account_validation_logs_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `books`
--
ALTER TABLE `books`
  ADD CONSTRAINT `books_author_id_foreign` FOREIGN KEY (`author_id`) REFERENCES `authors` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `books_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `books_publisher_id_foreign` FOREIGN KEY (`publisher_id`) REFERENCES `publishers` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `books_shelf_id_foreign` FOREIGN KEY (`shelf_id`) REFERENCES `shelves` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `bukus`
--
ALTER TABLE `bukus`
  ADD CONSTRAINT `bukus_kategori_id_foreign` FOREIGN KEY (`kategori_id`) REFERENCES `kategoris` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `carts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `cart_items`
--
ALTER TABLE `cart_items`
  ADD CONSTRAINT `cart_items_book_id_foreign` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_items_cart_id_foreign` FOREIGN KEY (`cart_id`) REFERENCES `carts` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `fines`
--
ALTER TABLE `fines`
  ADD CONSTRAINT `fines_loan_id_foreign` FOREIGN KEY (`loan_id`) REFERENCES `loans` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fines_member_id_foreign` FOREIGN KEY (`member_id`) REFERENCES `members` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `fine_histories`
--
ALTER TABLE `fine_histories`
  ADD CONSTRAINT `fine_histories_fine_id_foreign` FOREIGN KEY (`fine_id`) REFERENCES `fines` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fine_histories_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `lama_books`
--
ALTER TABLE `lama_books`
  ADD CONSTRAINT `lama_books_ibfk_1` FOREIGN KEY (`kategori_id`) REFERENCES `kategori` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `loans`
--
ALTER TABLE `loans`
  ADD CONSTRAINT `loans_approved_by_foreign` FOREIGN KEY (`approved_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `loans_member_id_foreign` FOREIGN KEY (`member_id`) REFERENCES `members` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `loans_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `loan_details`
--
ALTER TABLE `loan_details`
  ADD CONSTRAINT `loan_details_book_id_foreign` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `loan_details_loan_id_foreign` FOREIGN KEY (`loan_id`) REFERENCES `loans` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `peminjaman`
--
ALTER TABLE `peminjaman`
  ADD CONSTRAINT `peminjaman_ibfk_1` FOREIGN KEY (`peminjam_id`) REFERENCES `peminjam` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `peminjaman_ibfk_2` FOREIGN KEY (`book_id`) REFERENCES `lama_books` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `peminjaman_ibfk_3` FOREIGN KEY (`petugas_id`) REFERENCES `petugas` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `peminjamans`
--
ALTER TABLE `peminjamans`
  ADD CONSTRAINT `peminjamans_buku_id_foreign` FOREIGN KEY (`buku_id`) REFERENCES `bukus` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `peminjamans_peminjam_id_foreign` FOREIGN KEY (`peminjam_id`) REFERENCES `peminjams` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `pengembalian`
--
ALTER TABLE `pengembalian`
  ADD CONSTRAINT `pengembalian_ibfk_1` FOREIGN KEY (`peminjaman_id`) REFERENCES `peminjaman` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `returns`
--
ALTER TABLE `returns`
  ADD CONSTRAINT `returns_loan_id_foreign` FOREIGN KEY (`loan_id`) REFERENCES `loans` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `returns_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_approved_by_foreign` FOREIGN KEY (`approved_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `users_member_id_foreign` FOREIGN KEY (`member_id`) REFERENCES `members` (`id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
