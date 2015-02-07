-- phpMyAdmin SQL Dump
-- version 4.2.7.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Nov 24, 2014 at 03:36 AM
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
  `account_no` varchar(8) COLLATE utf8_bin NOT NULL COMMENT 'Primary Key. Should follow a certain rule.',
  `user_id` varchar(50) COLLATE utf8_bin NOT NULL COMMENT 'Could be email address or phone number.',
  `nick_name` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT 'Fill in automatically if user chooses to use the phone number to register.',
  `email` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT 'Fill in automatically if user chooses to use the email address to register.',
  `password` char(32) COLLATE utf8_bin NOT NULL COMMENT 'Encrypted with MD5 function.',
  `subscribed` tinyint(1) NOT NULL COMMENT '1 if the user subscribes for news & offers from the website, otherwise: 0.',
  `default_info_id` smallint(2) DEFAULT NULL COMMENT 'Foreign key references from table account_info.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Used for sign up and log in.';

-- --------------------------------------------------------

--
-- Table structure for table `account_info`
--

CREATE TABLE IF NOT EXISTS `account_info` (
  `account_no` varchar(8) COLLATE utf8_bin NOT NULL COMMENT 'Composite primary key. Foreign key.',
  `info_id` smallint(2) NOT NULL COMMENT 'Composite primary key. From 1 to n.',
  `name` varchar(100) COLLATE utf8_bin NOT NULL COMMENT 'Name of person whom to contact.',
  `contact_phone1` varchar(20) COLLATE utf8_bin NOT NULL,
  `contact_phone2` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `contact_phone3` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `buzzer` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `apt` varchar(10) COLLATE utf8_bin NOT NULL,
  `street_address` varchar(100) COLLATE utf8_bin NOT NULL,
  `postal_code` varchar(10) COLLATE utf8_bin NOT NULL,
  `city` varchar(30) COLLATE utf8_bin NOT NULL DEFAULT 'Montreal',
  `province` varchar(30) COLLATE utf8_bin NOT NULL DEFAULT 'QC',
  `country` varchar(30) COLLATE utf8_bin NOT NULL DEFAULT 'Canada'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='This table saves contact information used for delivery.';

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account`
--
ALTER TABLE `account`
 ADD PRIMARY KEY (`account_no`), ADD UNIQUE KEY `account_no` (`account_no`,`user_id`,`phone`,`email`);

--
-- Indexes for table `account_info`
--
ALTER TABLE `account_info`
 ADD PRIMARY KEY (`account_no`,`info_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `account_info`
--
ALTER TABLE `account_info`
ADD CONSTRAINT `account_info_ibfk_1` FOREIGN KEY (`account_no`) REFERENCES `account` (`account_no`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
