-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 26, 2018 at 11:48 AM
-- Server version: 10.1.32-MariaDB
-- PHP Version: 7.2.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `i-atp`
--

-- --------------------------------------------------------

--
-- Table structure for table `ach_payment`
--

CREATE TABLE `ach_payment` (
  `id` int(11) NOT NULL,
  `firstname` varchar(100) NOT NULL,
  `lastname` varchar(100) NOT NULL,
  `homeaddress` varchar(250) NOT NULL,
  `phone` varchar(10) NOT NULL,
  `email` varchar(200) NOT NULL,
  `pancard` varchar(100) NOT NULL,
  `address_proof` varchar(100) NOT NULL,
  `bankname` varchar(100) NOT NULL,
  `bankaddress` varchar(200) NOT NULL,
  `bankacno` varchar(16) NOT NULL,
  `ifsc_code` varchar(15) NOT NULL,
  `account_type` varchar(10) NOT NULL,
  `bank_phone` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ach_payment`
--

INSERT INTO `ach_payment` (`id`, `firstname`, `lastname`, `homeaddress`, `phone`, `email`, `pancard`, `address_proof`, `bankname`, `bankaddress`, `bankacno`, `ifsc_code`, `account_type`, `bank_phone`) VALUES
(33, 'sudhir', 'parmar', 'chhani jakat naka vadodara', '7567652964', 'sudhir16mcl19@gmail.com', 'pancard_data/OESS _ACH on LH.pdf', 'address_proof_data/OESS _ACH on LH.pdf', 'State bank of India', 'chhani', '32232343234', 'sbi01231287', 'Saving', '9988776655');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ach_payment`
--
ALTER TABLE `ach_payment`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ach_payment`
--
ALTER TABLE `ach_payment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
