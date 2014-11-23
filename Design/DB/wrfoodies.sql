-- phpMyAdmin SQL Dump
-- version 4.2.7.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Nov 23, 2014 at 05:19 AM
-- Server version: 5.6.20
-- PHP Version: 5.5.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `wrfoodies`
--

-- --------------------------------------------------------

--
-- Table structure for table `account`
--

CREATE TABLE IF NOT EXISTS `account` (
  `account_no` varchar(8) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'Account Number. Should follow a certain role',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_lithuanian_ci NOT NULL COMMENT 'Email Address.',
  `password` varchar(40) CHARACTER SET utf16 NOT NULL COMMENT 'password',
  `subscribed` tinyint(1) NOT NULL COMMENT 'T if the user subscribes for news & offers from the website, otherwise: F.'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Signup and log in related info';

-- --------------------------------------------------------

--
-- Table structure for table `account_info`
--

CREATE TABLE IF NOT EXISTS `account_info` (
  `account_no` varchar(8) COLLATE utf8_bin NOT NULL,
  `name` varchar(100) COLLATE utf8_bin NOT NULL,
  `phone` varchar(20) COLLATE utf8_bin NOT NULL,
  `buzzer` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `apt` varchar(5) COLLATE utf8_bin NOT NULL,
  `street_address` varchar(100) COLLATE utf8_bin NOT NULL,
  `postal_code` varchar(6) COLLATE utf8_bin NOT NULL,
  `city` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT 'Montreal',
  `province` varchar(30) COLLATE utf8_bin NOT NULL DEFAULT 'QC'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='store user''s delivery related information';

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account`
--
ALTER TABLE `account`
 ADD PRIMARY KEY (`account_no`), ADD UNIQUE KEY `email` (`email`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
