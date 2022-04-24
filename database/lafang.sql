-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 03, 2022 at 01:18 AM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `lafang`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `contact_us` (IN `name` VARCHAR(50), IN `email` VARCHAR(50), IN `subject` VARCHAR(50), IN `message` TEXT)  INSERT INTO contacts (name, email,subject, message)
VALUES (name, email, subject, message)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `reserved_book` (IN `name` VARCHAR(50), IN `email` VARCHAR(50), IN `phone` INT, IN `date` DATE, IN `time` VARCHAR(50), IN `no_people` INT, IN `message` TEXT)  INSERT INTO reserved (name, email, phone, date, time, no_people, message) VALUES (name, email, phone, date, time, no_people, message)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `show_reserved` ()  SELECT * FROM `reserved`$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `update_reserved` (IN `id` INT, IN `name` VARCHAR(50), IN `email` VARCHAR(50), IN `phone` INT, IN `date` DATE, IN `time` INT, IN `no_people` INT, IN `message` TEXT)  UPDATE reserved set name = name, email = email, phone = phone, date = date, time = time, no_people = no_people, message = message WHERE reserved_id = id$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `administrator`
--

CREATE TABLE `administrator` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `administrator`
--

INSERT INTO `administrator` (`id`, `username`, `password`) VALUES
(1, 'admin', 'admin123'),
(2, 'admin2', 'admin2');

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `contact_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `subject` varchar(50) NOT NULL,
  `message` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`contact_id`, `name`, `email`, `subject`, `message`) VALUES
(18, 'Edmun Macasero', 'edmun@gmail.com', 'Test', 'For testing purposess,, charr hahah'),
(19, 'Stefan Ezra Arado', 'stefan@gmail.com', 'Test2', 'for tesgin purposes of our system, hopefully no bugsss'),
(20, 'Crisanta Artezuela', 'Crisanta@gmail.com', 'Testing number 3', 'yes no bug'),
(21, 'Rodrigo Duterte', 'rodrigo@yahoo.com', 'President', 'I will choose your system as the best system'),
(22, 'Junard Ahong Chan', 'junard@yahoo.com', 'Restaurant', 'I want to reserve your restaurant for our team building for ahong chan supporters'),
(23, 'Rizaldy Baguio', 'rizaldy@gmail.com', 'Project', 'Your system and Design layout is so nice i love it, Great job'),
(24, 'Jonus Gwapo', 'jonus@gmail.com', 'System', 'The system is great good for any restaurant to use'),
(25, 'Alejandro', 'ale@gmail.com', 'Inquries', 'I want to inquire about your restaurant'),
(26, 'Trixie Lucena', 'trixie@yahoo.com', 'Inquire', 'i want to inquire about your restaurant terms and privacy'),
(27, 'sdsdsddsds', 'hesoyam@yahoo.com', 'butchak', 'cdsdsds');

-- --------------------------------------------------------

--
-- Table structure for table `reserved`
--

CREATE TABLE `reserved` (
  `reserved_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone` int(11) NOT NULL,
  `date` date NOT NULL,
  `time` varchar(50) NOT NULL,
  `no_people` int(11) NOT NULL,
  `message` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `reserved`
--

INSERT INTO `reserved` (`reserved_id`, `name`, `email`, `phone`, `date`, `time`, `no_people`, `message`) VALUES
(270, 'edmun', 'edmun@yahoo.com', 91926471, '2021-12-06', '23', 23, 'This is for Updating the reservation'),
(274, 'rodeny', 'dsdsds@gmail.com', 2147483647, '2222-11-11', '22', 1, 'dsds'),
(277, 'dsjkdjskj', 'kjsdjsdkj@yahoo.com', 0, '2222-12-22', '`23', 1, 'dsdsdkjsd');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `administrator`
--
ALTER TABLE `administrator`
  ADD KEY `id` (`id`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`contact_id`);

--
-- Indexes for table `reserved`
--
ALTER TABLE `reserved`
  ADD PRIMARY KEY (`reserved_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `administrator`
--
ALTER TABLE `administrator`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `contact_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `reserved`
--
ALTER TABLE `reserved`
  MODIFY `reserved_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=278;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
