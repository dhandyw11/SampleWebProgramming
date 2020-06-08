-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 08 Jun 2020 pada 08.10
-- Versi server: 10.4.11-MariaDB
-- Versi PHP: 7.4.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `smartlock`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `dosen`
--

CREATE TABLE `dosen` (
  `id_access_ruangan` varchar(20) NOT NULL,
  `nama_dosen` varchar(50) NOT NULL,
  `kode_mk` varchar(15) DEFAULT NULL,
  `waktu` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `dosen`
--

INSERT INTO `dosen` (`id_access_ruangan`, `nama_dosen`, `kode_mk`, `waktu`) VALUES
('0987654', 'Alimuddin', 'TEL619307', NULL),
('12346789', 'Anggoro Suryo Pramudyo M.Kom', 'TEL619403', NULL),
('24627658', 'Rian Fahrizal', 'TEL619308', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `matakuliah`
--

CREATE TABLE `matakuliah` (
  `kode_mk` varchar(15) NOT NULL,
  `nama_mk` varchar(50) NOT NULL,
  `sks` varchar(10) DEFAULT NULL,
  `jurusan` varchar(20) DEFAULT NULL,
  `hari` varchar(10) NOT NULL,
  `waktu` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `matakuliah`
--

INSERT INTO `matakuliah` (`kode_mk`, `nama_mk`, `sks`, `jurusan`, `hari`, `waktu`) VALUES
('TEL619307', 'Pemodelan dan Identifikasi Sistem', '3', 'Teknik Elektro', 'Selasa', '16:20:00'),
('TEL619308', 'Kecerdasan Buatan', '2', 'Teknik Elektro', 'Rabu', '13:10:00'),
('TEL619403', 'Pemrograman WEB', '2', 'Teknik Elektro', 'Selasa', '07:30:00'),
('TEM619520', 'Mekanika Fluida', '3', 'Teknik Kimia', 'Kamis', '14:25:00');

-- --------------------------------------------------------

--
-- Struktur dari tabel `ruangan_dosen`
--

CREATE TABLE `ruangan_dosen` (
  `id_access_ruangan` varchar(20) DEFAULT NULL,
  `nama_dosen` varchar(50) NOT NULL,
  `lokasi` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `ruangan_dosen`
--

INSERT INTO `ruangan_dosen` (`id_access_ruangan`, `nama_dosen`, `lokasi`) VALUES
('0987654', 'Alimuddin', 'C2'),
('12346789', 'Anggoro', 'C1'),
('24627658', 'Rian Fahrizal', 'C1');

-- --------------------------------------------------------

--
-- Struktur dari tabel `ruangan_kelas`
--

CREATE TABLE `ruangan_kelas` (
  `nama_ruangan` varchar(50) CHARACTER SET utf8 NOT NULL,
  `kode_mk` varchar(15) CHARACTER SET utf8 NOT NULL,
  `nama_dosen` varchar(50) CHARACTER SET utf8 NOT NULL,
  `dari_jam` time DEFAULT NULL,
  `sampai_jam` time DEFAULT NULL,
  `kondisi` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `ruangan_kelas`
--

INSERT INTO `ruangan_kelas` (`nama_ruangan`, `kode_mk`, `nama_dosen`, `dari_jam`, `sampai_jam`, `kondisi`) VALUES
('R2-13', 'TEL619307', 'Alimuddin', '16:20:00', '17:50:00', 1),
('R2-12', 'TEL619403', 'Anggoro', '07:30:00', '08:45:00', 1),
('R2-14', 'TEL619308', 'Rian Fahrizal', '13:10:00', '14:30:00', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `ruangan_mk`
--

CREATE TABLE `ruangan_mk` (
  `nama_ruangan` varchar(50) NOT NULL,
  `lokasi` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `ruangan_mk`
--

INSERT INTO `ruangan_mk` (`nama_ruangan`, `lokasi`) VALUES
('R2-12', ''),
('R2-13', ''),
('R2-14', ''),
('R2-15', ''),
('R2-16', '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `jurusan` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `gambar` varchar(100) NOT NULL,
  `waktu` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`username`, `password`, `nama`, `jurusan`, `email`, `gambar`, `waktu`) VALUES
('3332170039', 'pemweb123', 'Dhandy Wiriyadinata', 'Teknik Elektro', 'dhandy.w11@gmail.com', '5edcbf6d739ad.png', '2020-06-07 15:22:09'),
('Elektro', 'elektro123', 'Dosen Elektro', 'Teknik Elektro', 'dosen.elektro@gmail.com', '', '2020-06-07 15:22:09'),
('smartlock', 'qwerty123', 'Admin', 'Teknik Elektro', 'admin_smartlock@yahoo.com', '', '2020-06-07 15:22:09');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `dosen`
--
ALTER TABLE `dosen`
  ADD PRIMARY KEY (`id_access_ruangan`),
  ADD KEY `kode_mk` (`kode_mk`);

--
-- Indeks untuk tabel `matakuliah`
--
ALTER TABLE `matakuliah`
  ADD PRIMARY KEY (`kode_mk`);

--
-- Indeks untuk tabel `ruangan_dosen`
--
ALTER TABLE `ruangan_dosen`
  ADD PRIMARY KEY (`nama_dosen`),
  ADD KEY `id_access_ruangan` (`id_access_ruangan`);

--
-- Indeks untuk tabel `ruangan_kelas`
--
ALTER TABLE `ruangan_kelas`
  ADD KEY `kode_mk` (`kode_mk`),
  ADD KEY `nama_dosen` (`nama_dosen`),
  ADD KEY `nama_ruangan` (`nama_ruangan`);

--
-- Indeks untuk tabel `ruangan_mk`
--
ALTER TABLE `ruangan_mk`
  ADD PRIMARY KEY (`nama_ruangan`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`username`);

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `dosen`
--
ALTER TABLE `dosen`
  ADD CONSTRAINT `dosen_ibfk_1` FOREIGN KEY (`kode_mk`) REFERENCES `matakuliah` (`kode_mk`);

--
-- Ketidakleluasaan untuk tabel `ruangan_dosen`
--
ALTER TABLE `ruangan_dosen`
  ADD CONSTRAINT `ruangan_dosen_id_access_ruangan_fkey` FOREIGN KEY (`id_access_ruangan`) REFERENCES `dosen` (`id_access_ruangan`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `ruangan_kelas`
--
ALTER TABLE `ruangan_kelas`
  ADD CONSTRAINT `ruangan_kelas_ibfk_1` FOREIGN KEY (`kode_mk`) REFERENCES `matakuliah` (`kode_mk`),
  ADD CONSTRAINT `ruangan_kelas_ibfk_2` FOREIGN KEY (`nama_dosen`) REFERENCES `ruangan_dosen` (`nama_dosen`),
  ADD CONSTRAINT `ruangan_kelas_ibfk_3` FOREIGN KEY (`nama_ruangan`) REFERENCES `ruangan_mk` (`nama_ruangan`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
