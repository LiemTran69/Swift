-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: May 31, 2017 at 04:24 PM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `WebServices_150317`
--

-- --------------------------------------------------------

--
-- Table structure for table `Users`
--

CREATE TABLE `Users` (
  `id` int(11) NOT NULL,
  `HoTen` varchar(100) NOT NULL,
  `Email` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Users`
--

INSERT INTO `Users` (`id`, `HoTen`, `Email`) VALUES
(1, 'Hà Anh 111', 'haanh@gmail.com 2222'),
(2, 'Optional(\"Optional(\"vu cao\")\")', 'Optional(\"Optional(\"cao@vu.com\")\")'),
(4, 'Optional(\"TEO222\")', 'Optional(\"teo@888888.com\")'),
(5, 'Optional(\"Mai Tiến Dũng\")', 'Optional(\"dung@gmail.com\")'),
(8, 'teo', 'teo@yahooo.com'),
(9, 'teo', 'teo@yahooo.com'),
(10, 'teo', 'teo@yahooo.com'),
(11, 'Tun', 'Tun@gmail.com'),
(12, 'Nguyen Sinbad', 'sinbad@yahoo.com'),
(13, 'user2', 'pass2'),
(14, 'user3', 'email3'),
(15, 'fdsaf', 'fdsafdsaf'),
(16, 'tre', 'tre'),
(17, 'tre', 'tre'),
(18, 'aaa', 'aaa@aaa'),
(19, 'bbb', 'bbb@bbb'),
(20, 'ccc', 'ccc@ccc'),
(21, 'aaaaaaa', 'BBBBBBB');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Users`
--
ALTER TABLE `Users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Users`
--
ALTER TABLE `Users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
