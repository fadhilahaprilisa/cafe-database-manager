-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 09, 2026 at 03:13 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `smart_cafe_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `kategori_menu`
--

CREATE TABLE `kategori_menu` (
  `id_kategori` int(11) NOT NULL,
  `nama_kategori` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kategori_menu`
--

INSERT INTO `kategori_menu` (`id_kategori`, `nama_kategori`) VALUES
(1, 'Makanan'),
(2, 'Minuman'),
(3, 'Snack');

-- --------------------------------------------------------

--
-- Table structure for table `menu_item`
--

CREATE TABLE `menu_item` (
  `id_menu` int(11) NOT NULL,
  `nama_menu` varchar(100) NOT NULL,
  `harga` double NOT NULL,
  `id_kategori` int(11) DEFAULT NULL,
  `tersedia` tinyint(1) DEFAULT 1,
  `stok` int(11) DEFAULT 50
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `menu_item`
--

INSERT INTO `menu_item` (`id_menu`, `nama_menu`, `harga`, `id_kategori`, `tersedia`, `stok`) VALUES
(1, 'Nasi Goreng', 25000, 1, 1, 30),
(2, 'Mie Ayam', 20000, 1, 1, 30),
(3, 'Ayam Bakar', 30000, 1, 1, 30),
(4, 'Es Teh Manis', 5000, 2, 1, 50),
(5, 'Jus Alpukat', 15000, 2, 1, 50),
(6, 'Kopi Hitam', 10000, 2, 1, 50),
(7, 'Kentang Goreng', 12000, 3, 1, 40),
(8, 'Pisang Goreng', 8000, 3, 1, 40);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id_order` int(11) NOT NULL,
  `no_meja` int(11) NOT NULL,
  `total_harga` double DEFAULT 0,
  `status` varchar(20) DEFAULT 'BARU',
  `tanggal` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id_order`, `no_meja`, `total_harga`, `status`, `tanggal`) VALUES
(1, 5, 71500, 'PROSES', '2026-06-01 13:33:53');

-- --------------------------------------------------------

--
-- Table structure for table `order_detail`
--

CREATE TABLE `order_detail` (
  `id_detail` int(11) NOT NULL,
  `id_order` int(11) DEFAULT NULL,
  `id_menu` int(11) DEFAULT NULL,
  `jumlah` int(11) NOT NULL,
  `subtotal` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_detail`
--

INSERT INTO `order_detail` (`id_detail`, `id_order`, `id_menu`, `jumlah`, `subtotal`) VALUES
(1, 1, 1, 2, 50000),
(2, 1, 4, 3, 15000);

-- --------------------------------------------------------

--
-- Table structure for table `rekap_harian`
--

CREATE TABLE `rekap_harian` (
  `id_rekap` int(11) NOT NULL,
  `tanggal_rekap` date NOT NULL,
  `total_order` int(11) DEFAULT 0,
  `total_pendapatan` double DEFAULT 0,
  `total_pajak` double DEFAULT 0,
  `total_diskon` double DEFAULT 0,
  `dibuat_oleh` varchar(100) DEFAULT NULL,
  `catatan` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `rekap_harian`
--

INSERT INTO `rekap_harian` (`id_rekap`, `tanggal_rekap`, `total_order`, `total_pendapatan`, `total_pajak`, `total_diskon`, `dibuat_oleh`, `catatan`, `created_at`) VALUES
(1, '2024-06-01', 0, 0, 0, 0, 'Ahmad SPV', '', '2026-06-04 11:22:06'),
(2, '2024-06-01', 0, 0, 0, 0, 'Ahmad SPV', '', '2026-06-05 08:48:40');

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `id_transaksi` varchar(20) NOT NULL,
  `id_order` int(11) DEFAULT NULL,
  `id_kasir` int(11) DEFAULT NULL,
  `nama_kasir` varchar(100) DEFAULT NULL,
  `total_sebelum_diskon` double DEFAULT NULL,
  `total_diskon` double DEFAULT 0,
  `total_pajak` double DEFAULT NULL,
  `total_bayar` double DEFAULT NULL,
  `uang_diterima` double DEFAULT NULL,
  `kembalian` double DEFAULT NULL,
  `metode_bayar` varchar(20) DEFAULT 'TUNAI',
  `status` varchar(20) DEFAULT 'LUNAS',
  `keterangan` varchar(255) DEFAULT NULL,
  `tanggal` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `kategori_menu`
--
ALTER TABLE `kategori_menu`
  ADD PRIMARY KEY (`id_kategori`);

--
-- Indexes for table `menu_item`
--
ALTER TABLE `menu_item`
  ADD PRIMARY KEY (`id_menu`),
  ADD KEY `id_kategori` (`id_kategori`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id_order`);

--
-- Indexes for table `order_detail`
--
ALTER TABLE `order_detail`
  ADD PRIMARY KEY (`id_detail`),
  ADD KEY `id_order` (`id_order`),
  ADD KEY `id_menu` (`id_menu`);

--
-- Indexes for table `rekap_harian`
--
ALTER TABLE `rekap_harian`
  ADD PRIMARY KEY (`id_rekap`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id_transaksi`),
  ADD KEY `id_order` (`id_order`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `kategori_menu`
--
ALTER TABLE `kategori_menu`
  MODIFY `id_kategori` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `menu_item`
--
ALTER TABLE `menu_item`
  MODIFY `id_menu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id_order` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `order_detail`
--
ALTER TABLE `order_detail`
  MODIFY `id_detail` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `rekap_harian`
--
ALTER TABLE `rekap_harian`
  MODIFY `id_rekap` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `menu_item`
--
ALTER TABLE `menu_item`
  ADD CONSTRAINT `menu_item_ibfk_1` FOREIGN KEY (`id_kategori`) REFERENCES `kategori_menu` (`id_kategori`);

--
-- Constraints for table `order_detail`
--
ALTER TABLE `order_detail`
  ADD CONSTRAINT `order_detail_ibfk_1` FOREIGN KEY (`id_order`) REFERENCES `orders` (`id_order`),
  ADD CONSTRAINT `order_detail_ibfk_2` FOREIGN KEY (`id_menu`) REFERENCES `menu_item` (`id_menu`);

--
-- Constraints for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `transaksi_ibfk_1` FOREIGN KEY (`id_order`) REFERENCES `orders` (`id_order`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
