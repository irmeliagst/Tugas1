-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 27 Nov 2021 pada 23.47
-- Versi server: 10.1.36-MariaDB
-- Versi PHP: 5.6.38

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_penjualan`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_admin`
--

CREATE TABLE `tbl_admin` (
  `kodeadmin` varchar(6) NOT NULL,
  `namaadmin` varchar(50) NOT NULL,
  `passwordadmin` varchar(30) NOT NULL,
  `leveladmin` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbl_admin`
--

INSERT INTO `tbl_admin` (`kodeadmin`, `namaadmin`, `passwordadmin`, `leveladmin`) VALUES
('ADM001', 'ADMIN', 'ADMIN', 'ADMIN'),
('ADM002', 'USER', 'USER', 'USER'),
('adm003', 'andi', 'user', 'USER'),
('adm004', 'ina', 'admin', 'ADMIN'),
('ADM005', 'putri', 'amdin', 'USER'),
('ADM006', 'kira', 'admin', 'ADMIN'),
('ADM007', 'nara', 'admin', 'USER'),
('ADM008', 'suryati', 'admin', 'ADMIN');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_barang`
--

CREATE TABLE `tbl_barang` (
  `kodebarang` varchar(6) NOT NULL,
  `namabarang` varchar(50) NOT NULL,
  `hargabarang` int(11) NOT NULL,
  `jumlahbarang` int(11) NOT NULL,
  `satuanbarang` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbl_barang`
--

INSERT INTO `tbl_barang` (`kodebarang`, `namabarang`, `hargabarang`, `jumlahbarang`, `satuanbarang`) VALUES
('BRG001', 'Ember', 10000, 32, 'PCS'),
('BRG002', 'Panci', 12000, 23, 'PCS'),
('BRG003', 'Kecap', 8000, 13, 'BOTOL'),
('BRG004', 'peci', 20000, 100, 'PCS'),
('BRG005', 'guci', 50000, 90, 'BOTOL'),
('BRG006', 'Baju', 150000, 98, 'PCS');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_detailjual`
--

CREATE TABLE `tbl_detailjual` (
  `nojual` varchar(10) NOT NULL,
  `kodebarang` varchar(6) NOT NULL,
  `namabarang` varchar(50) NOT NULL,
  `hargajual` int(11) NOT NULL,
  `jumlahjual` int(11) NOT NULL,
  `subtotal` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbl_detailjual`
--

INSERT INTO `tbl_detailjual` (`nojual`, `kodebarang`, `namabarang`, `hargajual`, `jumlahjual`, `subtotal`) VALUES
('J200218002', 'BRG001', 'Ember', 10000, 1, 10000),
('J200218003', 'BRG002', 'Panci', 12000, 2, 24000),
('J200220004', 'BRG003', 'Kecap', 8000, 2, 16000),
('J200220004', 'BRG002', 'Panci', 12000, 3, 36000),
('J200309005', 'BRG001', 'Ember', 10000, 2, 20000),
('J200309005', 'BRG002', 'Panci', 12000, 2, 24000),
('J201024006', 'BRG001', 'Ember', 10000, 10, 100000),
('J201024007', 'BRG003', 'Kecap', 8000, 5, 40000),
('J201024008', 'BRG001', 'Ember', 10000, 5, 50000),
('J201029009', 'BRG005', 'guci', 50000, 10, 500000),
('J201107010', 'BRG006', 'Baju', 150000, 2, 300000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_jual`
--

CREATE TABLE `tbl_jual` (
  `nojual` varchar(10) NOT NULL,
  `tgljual` date NOT NULL,
  `jamjual` time NOT NULL,
  `itemjual` int(11) NOT NULL,
  `totaljual` int(11) NOT NULL,
  `dibayar` int(11) NOT NULL,
  `kembali` int(11) NOT NULL,
  `kodepelanggan` varchar(6) NOT NULL,
  `kodeadmin` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbl_jual`
--

INSERT INTO `tbl_jual` (`nojual`, `tgljual`, `jamjual`, `itemjual`, `totaljual`, `dibayar`, `kembali`, `kodepelanggan`, `kodeadmin`) VALUES
('J200218001', '2020-02-18', '00:00:07', 1, 10000, 10000, 0, 'PLG001', 'ADM001'),
('J200218002', '2020-02-18', '00:00:08', 1, 10000, 10000, 0, 'PLG001', 'ADM001'),
('J200218003', '2020-02-18', '00:00:08', 2, 24000, 30000, 6000, 'PLG002', 'ADM001'),
('J200220004', '2020-02-20', '00:00:08', 5, 52000, 60000, 8000, 'PLG001', 'ADM001'),
('J200309005', '2020-03-09', '00:00:18', 4, 44000, 50000, 6000, 'PLG001', 'ADM001'),
('J201024006', '2020-10-24', '00:00:09', 10, 100000, 100000, 0, 'PLG002', 'ADM001'),
('J201024007', '2020-10-24', '00:00:10', 5, 40000, 50000, 10000, 'PLG004', 'ADM001'),
('J201024008', '2020-10-24', '00:00:10', 5, 50000, 100000, 50000, 'PLG005', 'ADM001'),
('J201029009', '2020-10-29', '00:00:11', 10, 500000, 500000, 0, 'PLG006', 'ADM001'),
('J201107010', '2020-11-07', '00:00:09', 2, 300000, 300000, 0, 'PLG007', 'ADM001');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_pelanggan`
--

CREATE TABLE `tbl_pelanggan` (
  `kodepelanggan` varchar(6) NOT NULL,
  `namapelanggan` varchar(50) NOT NULL,
  `alamatpelanggan` varchar(100) NOT NULL,
  `telppelanggan` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbl_pelanggan`
--

INSERT INTO `tbl_pelanggan` (`kodepelanggan`, `namapelanggan`, `alamatpelanggan`, `telppelanggan`) VALUES
('PLG001', 'Ibu Waryati', 'Jl Jakarta No 1', '0897653421'),
('PLG002', 'Ibu Sumama', 'Jl Kampung Melayu', '06742864214'),
('PLG003', 'Ibu Susi', 'Jl Bogor No 3', '021333333'),
('PLG004', 'Ibu supatri', 'Jl.merpatoi', '0987654321'),
('PLG005', 'Ibu sumarti', 'Jl.kenanga', '0897654321'),
('PLG006', 'sugito', 'jl.melati no.06', '0897654321'),
('PLG007', 'Ibu kikik', 'Jl.annur', '08976543212');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `tbl_admin`
--
ALTER TABLE `tbl_admin`
  ADD PRIMARY KEY (`kodeadmin`);

--
-- Indeks untuk tabel `tbl_barang`
--
ALTER TABLE `tbl_barang`
  ADD PRIMARY KEY (`kodebarang`);

--
-- Indeks untuk tabel `tbl_jual`
--
ALTER TABLE `tbl_jual`
  ADD PRIMARY KEY (`nojual`);

--
-- Indeks untuk tabel `tbl_pelanggan`
--
ALTER TABLE `tbl_pelanggan`
  ADD PRIMARY KEY (`kodepelanggan`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
