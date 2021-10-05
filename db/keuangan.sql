-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 23, 2021 at 08:37 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `fofima`
--

-- --------------------------------------------------------

--
-- Table structure for table `buku_besar`
--

CREATE TABLE `buku_besar` (
  `tanggal` date NOT NULL,
  `tipe` enum('debet','kredit') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'debet',
  `nmr_perkiraan` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nominal` int(11) NOT NULL,
  `keterangan_transaksi` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nota` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `buku_besar`
--

INSERT INTO `buku_besar` (`tanggal`, `tipe`, `nmr_perkiraan`, `nominal`, `keterangan_transaksi`, `nota`, `created_at`, `updated_at`) VALUES
('2021-09-13', 'debet', '1001', 10000, 'Bikin ikan', 'images.jpg', NULL, NULL),
('2021-09-13', 'kredit', '1001', 10000, 'Bikin ikan', 'images.jpg', NULL, NULL),
('2021-09-13', 'debet', '1326', 10000, 'Beli Turbo', 'pipa1.png', NULL, NULL),
('2021-09-13', 'kredit', '1001', 10000, 'Beli Turbo', 'pipa1.png', NULL, NULL),
('2021-09-16', 'debet', '1003', 100000, 'dsdsd', '2.jpg', NULL, NULL),
('2021-09-16', 'kredit', '1003', 100000, 'dsdsd', '2.jpg', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2021_09_10_041931_create_table_kategori', 1),
(2, '2021_09_15_023604_create_permission_tables', 1),
(3, '2021_09_15_025423_create_users_table', 1),
(4, '2021_09_15_025458_create_password_resets_table', 1),
(5, '2021_09_15_025513_create_failed_jobs_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\User', 1),
(1, 'App\\User', 3),
(1, 'App\\User', 5);

-- --------------------------------------------------------

--
-- Table structure for table `nomor_perkiraan`
--

CREATE TABLE `nomor_perkiraan` (
  `nmr_perkiraan` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `keterangan_nomor` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kode_kategori` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `nomor_perkiraan`
--

INSERT INTO `nomor_perkiraan` (`nmr_perkiraan`, `keterangan_nomor`, `kode_kategori`) VALUES
('1001', 'Kas SMK', '1000'),
('1002', 'Kas Asrama', '1000'),
('1003', 'Kas Yayasan', '1000'),
('1021', 'BCA 796-076777', '1000'),
('1022', 'BCA 426-2121121', '1000'),
('1023', 'Permata', '1000'),
('1024', 'Mandiri 135.00.1111119.0', '1000'),
('1051', 'Piutang Siswa', '1000'),
('1052', 'Piutang Alumni', '1000'),
('1053', 'Piutang Lain-lain', '1000'),
('1321', 'Bangunan SMK', '1081'),
('1322', 'Peralatan kantor dll SMK & ktr Yayasan', '1081'),
('1323', 'Peralatan RPL', '1081'),
('1324', 'Peralatan MM', '1081'),
('1325', 'Peralatan BKP', '1081'),
('1326', 'Peralatan TKRO', '1081'),
('1327', 'Peralatan TB', '1081'),
('1328', 'Kendaraan', '1081'),
('1401', 'Akum Peny Bangunan', '1081'),
('1402', 'Akum Peny Peralatan kantor SMK & kantor Yayasan', '1081'),
('1403', 'Akum Peny Peralatan RPL', '1081'),
('1404', 'Akum Peny Peralatan MM', '1081'),
('1405', 'Akum Peny Peralatan BKP', '1081'),
('1406', 'Akum Peny Peralatan TKRO', '1081'),
('1407', 'Akum Peny Peralatan TB', '1081'),
('1408', 'Akum Peny Kendaraan', '1081'),
('1710', 'Biaya Perijinan Ditangguhkan', '1081'),
('1720', 'Biaya Renovasi Ditangguhkan', '1081'),
('2021', 'Hutang Biaya', '1081'),
('2031', 'PPh 21', '1081'),
('2032', 'PPh 29', '1081'),
('2033', 'PPN Keluaran', '1081'),
('2034', 'PPh Final ps 4 ay 2', '1081'),
('2080', 'Hutang Lain-lain', '1081'),
('2090', 'Hutang Jangka Panjang', '1081'),
('3001', 'Modal Hibah', '1081'),
('3002', 'Tambah Hibah', '1081'),
('3003', 'Surplus (defisit) tahun lalu (sd thn 2019)', '1081'),
('3004', 'Surplus (defisit) tahun 2020', '1081'),
('3005', 'Surplus (defisit) Tahun Berjalan', '1081'),
('4001', 'BCA 796-076777', '4000'),
('4002', 'BCA 426-2121121', '4000'),
('4003', 'Permata', '4000'),
('4004', 'Mandiri 135.00.1111119.0', '4000'),
('4101', 'Uang Pendaftaran', '4000'),
('4102', 'SPI', '4000'),
('4103', 'Seragam', '4000'),
('4104', 'Asrama', '4000'),
('4105', 'Lain-lain', '4000'),
('4200', 'DANA BOS', '4000'),
('4300', 'Penerimaan Lain-lain', '4000'),
('5101', 'Gaji Guru Karyawan SMKBN', '5000'),
('5102', 'THR', '5000'),
('5103', 'Kegiatan Ekstrakulikuler', '5000'),
('5104', 'Lembur & Bi.KB-KB', '5000'),
('5201', 'Service Komputer', '5000'),
('5203', 'Service Printer', '5000'),
('5204', 'Service AC', '5000'),
('5205', 'Service LCD', '5000'),
('5206', 'Service Elektronik', '5000'),
('5207', 'Service Bus/Mobil', '5000'),
('5208', 'Service Motor', '5000'),
('5209', 'Service Genset', '5000'),
('5210', 'Perawatan Gedung', '5000'),
('5211', 'Perawatan Taman', '5000'),
('5212', 'Perawatan KIR Bis', '5000'),
('5212', 'Pemeliharaan Penunjang Pendididkan', '5000'),
('5214', 'Pemeliharaan Peralatan Boga', '5000'),
('5201', 'ATK', '5000'),
('5302', 'FC & Jilid', '5000'),
('5304', 'RTK/Kebersihan', '5000'),
('5305', 'Listrik', '5000'),
('5306', 'Telp.', '5000'),
('5307', 'Konsumsi rapat dll', '5000'),
('5308', 'Iuran Gugus/MPK/PKG', '5000'),
('5309', 'Obat-obatan/UKS', '5000'),
('5310', 'Sumbangan/Hadiah/DanSos', '5000'),
('5311', 'Majalah/Koran', '5000'),
('5312', 'Perjalanan Dinas', '5000'),
('5313', 'BBM Bus/Mobil', '5000'),
('5314', 'BBM Motor', '5000'),
('5315', 'Pajak Bis ,motor', '5000'),
('5316', 'Bi.Ekspedisi/TU', '5000'),
('5317', 'Bi.Ekspedisi/HUMAR', '5000'),
('5318', 'Bi.KB-KB', '5000'),
('5319', 'Parkir/Tol', '5000'),
('5320', 'Bi.Bank', '5000'),
('5401', 'Seragam Guru', '5000'),
('5402', 'Buku Guru RPL', '5000'),
('5403', 'Buku Guru MM', '5000'),
('5404', 'Buku Guru TKR', '5000'),
('5405', 'Buku Guru BOGA', '5000'),
('5406', 'Bahan Praktik Lab.Multimedia', '5000'),
('5407', 'Bahan Praktik Lab.Komp(KKPI,RPL,TKJ)', '5000'),
('5408', 'Bahan Praktik Lab.TKR', '5000'),
('5409', 'Bahan Praktek Lab.TKBB', '5000'),
('5410', 'Bahan Praltek Lab.Jasa Boga', '5000'),
('5411', 'Bahan Praktek Lab.IPA', '5000'),
('5412', 'Retret/pembinaan rohani', '5000'),
('5413', 'Pembinaan Guru Karyawan', '5000'),
('5414', 'Guru tamu', '5000'),
('5415', 'Humas(DU/DI)', '5000'),
('5416', 'Ulangan Harian/Kurikulum', '5000'),
('5417', 'Ulangan Tengah Semester/Kurikulum', '5000'),
('5418', 'Ulangan Akhir Semester/Kurikulum', '5000'),
('5419', 'Ulangan Nasional (UN).try out,UPK', '5000'),
('5420', 'Ulangan Sekolah (US)/Kurikulum', '5000'),
('5421', 'Raport Peserta Didik/Kurikulum', '5000'),
('5422', 'Kurikulum/Akreditasi', '5000'),
('5423', 'Study Banding/Pelatihan guru dll/Kurikulum', '5000'),
('5424', 'BK', '5000'),
('5425', 'Kesiswaan :PPDB', '5000'),
('5426', 'Keiswaan :HUT', '5000'),
('5427', 'Kesiswaan :Pramuka,Osis,Lomba,MPLS,dll', '5000'),
('5428', 'Ekstrakulikuler/Kesiswaan', '5000'),
('529', 'Seminar,pelatihan dll', '5000'),
('5430', 'Program Perpustakaan /TKBB', '5000'),
('5431', 'Program Perpustakaan /TKR', '5000'),
('5432', 'Program Perpustakaan/Boga', '5000'),
('5433', 'Biaya lain-lain', '5000'),
('5434', 'Pembelian sarana dan prasarana', '5000'),
('6101', 'Gaji Karyawan Asrama', '6000'),
('6102', 'THR', '6000'),
('6103', 'Biaya Lembur/honor', '6000'),
('6201', 'Lauk Pauk', '6000'),
('6202', 'Beras', '6000'),
('6203', 'Gas', '6000'),
('6204', 'Air', '6000'),
('6301', 'Kebutuhan Rumah Tangga', '6000'),
('6302', 'Kebutuhan Siswa', '6000'),
('6303', 'Koran dan Majalah', '6000'),
('6304', 'ATK/meterai/Percetakan', '6000'),
('6305', 'Kesehatan', '6000'),
('6306', 'Snack', '6000'),
('6307', 'Kebersihan', '6000'),
('6308', 'Listrik & telp.', '6000'),
('6309', 'Transport/Bensin', '6000'),
('6310', 'Service/Pemeliharaan asrama dll', '6000'),
('6311', 'Perlengkapan asrama/dll', '6000'),
('6312', 'Pengeluaran Lain-lain', '6000'),
('7101', 'Gaji staf & pegawai Yayasan', '7000'),
('7102', 'THR', '7000'),
('7103', 'PPh psl 21 yang ditanggung yayasan', '7000'),
('7104', 'BPJS Kesehatan', '7000'),
('7105', 'BPJS Ketenagakerjaan', '7000'),
('7201', 'ATK', '7000'),
('7202', 'Tali Asih,Tanda kasih,Uang Duka dll', '7000'),
('7203', 'RTK', '7000'),
('7204', 'Biaya Langganan Internet & Telepon', '7000'),
('7205', 'Cetak Profile,Kop Surat,buletin dll', '7000'),
('7206', 'Seragam Satpam/driver,pelatihan satpam', '7000'),
('7207', 'Dispenser/Kulkas dll', '7000'),
('7208', 'Maintenance Fotocopy', '7000'),
('7209', 'Printer+Voice Recorder', '7000'),
('7210', 'Pembelian laptop,meja,UPS,pasang CCTV dll', '7000'),
('7211', 'Service Komputer/ac dll', '7000'),
('7212', 'Biaya sewa foto copy', '7000'),
('7213', 'Perbaikan gedung/instalasi & perawatan Kebun', '7000'),
('7214', 'Rapat Kerja,Rekreasi,Seminar dll', '7000'),
('7215', 'Biaya pendidikan/pengembangan guru', '7000'),
('7216', 'Biaya Audient Independent', '7000'),
('7217', 'Beasisiswa SD', '7000'),
('7218', 'Seragam siswa', '7000'),
('7219', 'PPDB', '7000'),
('7220', 'Biaya Pengindukan Siswa', '7000'),
('7221', 'Biaya HUT dan Pelepasan Siswa,dll', '7000'),
('7222', 'Biaya Perpanjangan STNK', '7000'),
('7223', 'Parcel', '7000'),
('7224', 'Penggantian transport/Perjalanan dinas', '7000'),
('7225', 'Biaya pelatihan guru/siswa, out bond, VL,dll', '7000'),
('7226', 'Service Mobil,Bis.dll', '7000'),
('7227', 'Biaya umum dll', '7000'),
('8001', 'Peny.Bangunan', '8000'),
('8002', 'Peny.Peralatan kantor SMK & ktr yayasan', '8000'),
('8003', 'Peny.Peralatan RPL', '8000'),
('8004', 'Peny.Peralatan MM', '8000'),
('8005', 'Peny.Peralatan BKP', '8000'),
('8006', 'Peny.Peralatan TKRO', '8000'),
('8007', 'Peny.Peralatan TB', '8000'),
('8008', 'Peny.Kendaraan', '8000'),
('9001', 'Pendapatan Bunga', '9000'),
('9002', 'Pendapatan Lain-lain', '9000'),
('9101', 'Bi Administrasi Bank', '9100'),
('9102', 'Bi Bunga (Pajak) Bank', '9100'),
('9103', 'Bi Lain-lain', '9100'),
('9104', 'PPh Final ps 4 ay 2', '9100'),
('9105', 'PPh 21', '9100'),
('9106', 'PPh 23', '9100'),
('9107', 'Ikhtisar Rugi Laba', '9100');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'add post', 'web', '2021-09-15 18:51:27', '2021-09-15 18:51:27'),
(2, 'edit post', 'web', '2021-09-15 18:51:33', '2021-09-15 18:51:33'),
(3, 'delete post', 'web', '2021-09-15 18:51:38', '2021-09-15 18:51:38');

-- --------------------------------------------------------

--
-- Table structure for table `p_kategori`
--

CREATE TABLE `p_kategori` (
  `kategori` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kode_kategori` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `p_kategori`
--

INSERT INTO `p_kategori` (`kategori`, `kode_kategori`) VALUES
('Aktiva Lancar', '1000'),
('Biaya Dibayar Dimuka', '1081'),
('PEMASUKAN', '4000'),
('PENGELUARAN (BIAYA-BIAYA) SMK BAGIMU NEGERIKU', '5000'),
('ASRAMA', '6000'),
('YAYASAN', '7000'),
('Biaya Aktiva', '8000'),
('PEMASUKAN LAIN-LAIN', '9000'),
('BIAYA LAIN-LAIN', '9100');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'Yayasan', 'web', '2021-09-14 19:57:49', '2021-09-14 19:57:49'),
(2, 'SMK', 'web', '2021-09-14 19:57:50', '2021-09-14 19:57:50'),
(3, 'Asrama', 'web', '2021-09-16 08:02:12', '2021-09-16 08:02:12');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `table_kategori`
--

CREATE TABLE `table_kategori` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Admin Role', 'admin@role.test', NULL, '$2y$10$zQXtjNh2woszVuRfWknssuFNKD9Z/vPDTCI2une4odrkvDbPZPeca', NULL, '2021-09-14 19:57:50', '2021-09-14 19:57:50'),
(3, 'Ega', 'kharisega17@gmail.com', NULL, '$2y$10$t4nJA2jhcHRt4uUn0pfxNO5zYGh98ojJyqQnBIrlZMKyhQF2CXIC2', NULL, '2021-09-14 20:53:26', '2021-09-14 20:53:26'),
(5, 'Dionisius', 'dezodting012@gmail.com', NULL, '$2y$10$7zUT5yQumdMNAeBNsYBQy.DazzbnM.r3N2Cr.INVBcW1LpMOUL9qC', NULL, '2021-09-15 20:47:28', '2021-09-15 20:47:28');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `table_kategori`
--
ALTER TABLE `table_kategori`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `table_kategori`
--
ALTER TABLE `table_kategori`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
