-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 17, 2021 at 08:13 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pmtn1`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `names` text NOT NULL,
  `create_date` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `names`, `create_date`) VALUES
(44, 'Technology', '15/02/2021'),
(45, 'Life Style', '15/02/2021'),
(46, 'Political', '15/02/2021'),
(47, 'Tour & Travel', '15/02/2021'),
(48, 'Business', '15/02/2021'),
(49, 'Game', '15/02/2021'),
(50, 'Sport', '15/02/2021');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `comment` text NOT NULL,
  `user_email` text NOT NULL,
  `post_id` int(11) NOT NULL,
  `comments_date` text NOT NULL,
  `isSeen` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `comment`, `user_email`, `post_id`, `comments_date`, `isSeen`) VALUES
(16, 'mantap', 'rapi21@gmail.com', 4, '15/02/2021', 0),
(17, 'wow', 'rapi21@gmail.com', 90, '15/02/2021', 1),
(18, 'siap', 'rapi21@gmail.com', 90, '15/02/2021', 0),
(19, 'parancuk wkwk', 'rapi21@gmail.com', 90, '15/02/2021', 0),
(20, 'hay', 'rapi21@gmail.com', 90, '15/02/2021', 0),
(21, 'woooow', 'ew@gmail.com', 92, '15/02/2021', 1),
(22, 'ya', 'rapi21@gmail.com', 90, '17/02/2021', 0);

-- --------------------------------------------------------

--
-- Table structure for table `copyright`
--

CREATE TABLE `copyright` (
  `name` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `copyright`
--

INSERT INTO `copyright` (`name`) VALUES
('Copyright©Tony Nurdianto\r\n\r\n');

-- --------------------------------------------------------

--
-- Table structure for table `login_register`
--

CREATE TABLE `login_register` (
  `id` int(11) NOT NULL,
  `users` varchar(20) NOT NULL,
  `passw` varchar(50) NOT NULL,
  `tlp` varchar(12) NOT NULL,
  `email` varchar(20) NOT NULL,
  `status` varchar(100) NOT NULL DEFAULT '''user'''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `login_register`
--

INSERT INTO `login_register` (`id`, `users`, `passw`, `tlp`, `email`, `status`) VALUES
(1, 'Admin', '1', '082295969799', 'tonit686@gmail.com', 'admin'),
(53, 'rapi', '1', '081321257169', 'rapi21@gmail.com', '\'user\''),
(54, 'ade', '1', '088882121212', 'ade45@gmail.com', '\'user\''),
(63, 'arip', '1', '087721450076', 'ew@gmail.com', '\'user\''),
(65, 'firman', '1', '089965639776', 'firman21@gmail.com', '\'user\''),
(74, 'Tony Nurdianto', '1', '082295969799', 'tonit686@gmail.com', '\'user\''),
(76, '', '', '', '', '\'user\''),
(77, 'asepudin', '12345', '08521213721', 'asepudin11@gmail.com', '\'user\'');

-- --------------------------------------------------------

--
-- Table structure for table `post_table`
--

CREATE TABLE `post_table` (
  `id` int(11) NOT NULL,
  `images` text NOT NULL,
  `author` text NOT NULL,
  `post_date` text NOT NULL,
  `comments` text NOT NULL,
  `total_like` text NOT NULL,
  `title` text NOT NULL,
  `body` text NOT NULL,
  `category_name` text NOT NULL,
  `create_date` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `post_table`
--

INSERT INTO `post_table` (`id`, `images`, `author`, `post_date`, `comments`, `total_like`, `title`, `body`, `category_name`, `create_date`) VALUES
(90, 'image_picker7514813492800667263.jpg', 'Admin', '15/02/2021', '31', '100', 'Game Gabungan Bully-Yakuza', 'Developer game asal Indonesia, Gamecom Team baru saja merilis versi demo dari game baru buatannya yang bernama Parakacuk. Game yang sudah diumumkan beberapa waktu yang lalu ini menarik perhatian banyak orang karena konsep gamenya terinspirasi dari game-game seperti Bully dan juga Yakuza.', 'Game', ''),
(91, 'image_picker8463039828069150576.jpg', 'Admin', '15/02/2021', '25', '10', 'Update Dread Out Remastered 2!', 'Digital Happiness kini dikenal sebagai salah satu developer game asal Indonesia paling sukses berkat game horror buatannya yaitu Dreadout dan Dreadout 2. Kini pihaknya berencana untuk membuat hal baru untuk franchise game horror miliknya tersebut.', 'Game', ''),
(92, 'image_picker7640625159571412476.jpg', 'Admin', '15/02/2021', '88', '98', 'Game Gratis dari Epic Game!!', 'Epic Games sampai saat ini masih terus memberikan game gratis setiap minggunya kepada para pengguna layanan Epic Games, meskipun game yang digratiskan saat ini tidak terlalu populer, tidak ada salahnya jika kita mengklaim game yang belum pernah dimainkan.', 'Game', ''),
(93, 'image_picker1467700054964822421.jpg', 'Admin', '15/02/2021', '10', '32', 'Xbox Seiries X  Terbaru 2021.', 'Saat ini persaingan antara console PlayStation 5, Xbox Series X, dan Nintendo Switch masih terus terjadi. Tiga console tersebut berhasil terjual dengan jumlah cukup banyak di sejumlah negara, termasuk di Inggris.', 'Technology', ''),
(94, 'image_picker7158616032560426072.jpg', 'Admin', '15/02/2021', '20', '25', 'Game Gabungan Bully-Yakuza', 'Game Gabungan Bully-Yakuza Rilis ke Part 2 salah satu PR bagi Gamecom Team jika mereka ingin merilis game Parakacuk di tahun ini. Kontrol dari game tersebut bisa dibilang masih sangat buruk dan sulit untuk dikuasai. Saya mengetahui bahwa karakter Budi dapat melakukan dodge dengan menekan tombol [Space] (di PC). ', 'Game', ''),
(95, 'image_picker2548148853973993759.jpg', 'Admin', '15/02/2021', '5', '44', 'Usia bukan alasan untuk Hidup.', 'Ahli kardiologi terkemuka Indonesia, Hendra Purnomo, pensiun di usia 70 tahun, meskipun begitu, jiwa dan tubuhnya tetap muda. Beliau telah pensiun selama 39 tahun, dan sampai sekarang masih sehat dan bugar! Saat ini, sang akademisi menginjak usia 109 tahun, tapi dia masih merasa bagaikan masih berusia 60 tahun Karnataka sering olahraga.', 'Sport', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `login_register`
--
ALTER TABLE `login_register`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `post_table`
--
ALTER TABLE `post_table`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `login_register`
--
ALTER TABLE `login_register`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;

--
-- AUTO_INCREMENT for table `post_table`
--
ALTER TABLE `post_table`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=98;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
