-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 05, 2023 at 01:55 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 7.4.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `vif`
--

-- --------------------------------------------------------

--
-- Table structure for table `catatan`
--

CREATE TABLE `catatan` (
  `catatan_id` int(11) NOT NULL,
  `marketing_client` varchar(40) NOT NULL,
  `nama_client` varchar(40) NOT NULL,
  `no_client` varchar(20) NOT NULL,
  `pekerjaan_client` varchar(20) NOT NULL,
  `alamatnya` varchar(200) NOT NULL,
  `jk_client` int(1) NOT NULL,
  `keterangan` varchar(100) NOT NULL,
  `komentar` varchar(100) DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `catatan`
--

INSERT INTO `catatan` (`catatan_id`, `marketing_client`, `nama_client`, `no_client`, `pekerjaan_client`, `alamatnya`, `jk_client`, `keterangan`, `komentar`, `created`) VALUES
(35, 'Adam123', 'Stevano', '08122939391', 'PNS', 'Semarang', 1, 'belum prospek', 'segera diprospek', '2023-01-01 14:59:24'),
(36, 'Adam123', 'Rifki Hasanah', '0816252725', 'Karyawan', 'Banjarnegara', 2, 'Belum Contacting', 'bagus', '2023-01-01 15:01:21'),
(37, 'Abid', 'Suryadi', '08976255267', 'Karyawan ', 'Semarang', 1, 'Belum di prospek', NULL, '2023-01-01 15:55:29');

-- --------------------------------------------------------

--
-- Table structure for table `izin`
--

CREATE TABLE `izin` (
  `izin_id` int(11) NOT NULL,
  `nama_izin` varchar(40) NOT NULL,
  `username_izin` varchar(40) NOT NULL,
  `alasan` varchar(300) NOT NULL,
  `keterangan` enum('Izin','Terlambat','Tanpa Izin','Sakit') NOT NULL,
  `tgl_izin` date NOT NULL,
  `created` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `approved_izin` int(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `izin`
--

INSERT INTO `izin` (`izin_id`, `nama_izin`, `username_izin`, `alasan`, `keterangan`, `tgl_izin`, `created`, `approved_izin`) VALUES
(20, 'sumarno', 'Marno', 'sakit', 'Sakit', '2023-01-10', '2023-01-01 16:03:03', 2),
(21, 'Adam Arian ', 'Adam123', 'ban bocor', 'Terlambat', '2023-01-01', '2023-01-01 16:04:12', 1);

-- --------------------------------------------------------

--
-- Table structure for table `marketing`
--

CREATE TABLE `marketing` (
  `marketing_id` int(11) NOT NULL,
  `foto` varchar(200) NOT NULL,
  `username` varchar(100) DEFAULT NULL,
  `name` varchar(40) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `address` varchar(100) NOT NULL,
  `tgl_lahir` date NOT NULL,
  `jk_marketing` varchar(20) NOT NULL,
  `agama` varchar(20) NOT NULL,
  `created` datetime NOT NULL DEFAULT current_timestamp(),
  `updated` datetime DEFAULT NULL,
  `status` int(1) NOT NULL,
  `approved_marketing` int(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `marketing`
--

INSERT INTO `marketing` (`marketing_id`, `foto`, `username`, `name`, `phone`, `address`, `tgl_lahir`, `jk_marketing`, `agama`, `created`, `updated`, `status`, `approved_marketing`) VALUES
(36, 'bange10.jpeg', 'adam123', 'Adam arian N', '08972676272', 'Semarang', '2022-07-01', '1', '1', '2023-01-01 15:58:05', NULL, 0, 1),
(37, '21BF8CEB-127B-4F03-9EF6-F4B0ABF1858D10.jpg', 'abid', 'Mohamad Abid Ardiansyah', '081229959510', 'jenggul rt 04/09 kel. Krandegan Central Java', '2001-07-19', '1', 'Budha', '2023-01-01 22:53:59', NULL, 0, 1),
(38, 'yoona.png', 'dewi', 'Retno dewi', '0897625526', 'semarang ', '1999-01-01', '2', 'Hindu', '2023-01-01 22:58:01', NULL, 0, 1),
(39, 'Nazri_(1).jpg', 'marno', 'Sumarno', '08762552425', 'semarang', '2001-08-09', '1', 'Islam', '2023-01-01 23:01:29', NULL, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `username` varchar(45) NOT NULL,
  `kode` varchar(10) NOT NULL,
  `name` varchar(200) NOT NULL,
  `password` varchar(100) NOT NULL,
  `address` varchar(100) NOT NULL,
  `level` int(1) NOT NULL,
  `approved` int(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `username`, `kode`, `name`, `password`, `address`, `level`, `approved`) VALUES
(24, 'admin', '11111', 'admin', 'd033e22ae348aeb5660fc2140aec35850c4da997', 'Semarang, Indonesia', 1, 1),
(64, 'user', '', 'user', '12dea96fec20593566ab75692c9949596833adc9', 'semarang', 1, 1),
(69, 'adam123', '', 'Adam arian', '92f6073b3fcbc0dd635c0494d4c0313e5544ecdd', 'Semarang', 2, 1),
(70, 'abid', '', 'Mohamad Abid Ardiansyah', 'b3ebd2a2b681f39acee7be945a24cc158acf424a', 'jenggul rt 04/09 kel. Krandegan Central Java', 2, 1),
(71, 'dewi', '', 'Retno dewi', 'c329b25dda86b9b0e6718d553c8b9b156c9b3a1a', 'semarang ', 2, 1),
(72, 'marno', '', 'Sumarno', '50a795415a0a4f383d993f29b33bf5735e41dbe7', 'semarang', 2, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `catatan`
--
ALTER TABLE `catatan`
  ADD PRIMARY KEY (`catatan_id`);

--
-- Indexes for table `izin`
--
ALTER TABLE `izin`
  ADD PRIMARY KEY (`izin_id`);

--
-- Indexes for table `marketing`
--
ALTER TABLE `marketing`
  ADD PRIMARY KEY (`marketing_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `catatan`
--
ALTER TABLE `catatan`
  MODIFY `catatan_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `izin`
--
ALTER TABLE `izin`
  MODIFY `izin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `marketing`
--
ALTER TABLE `marketing`
  MODIFY `marketing_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
