-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 24, 2019 at 06:57 AM
-- Server version: 10.1.36-MariaDB
-- PHP Version: 7.2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ach`
--

-- --------------------------------------------------------

--
-- Table structure for table `tblactivitylog`
--

CREATE TABLE `tblactivitylog` (
  `ActivityLogId` int(11) NOT NULL,
  `UserId` int(11) NOT NULL DEFAULT '0',
  `Module` varchar(50) NOT NULL,
  `Activity` varchar(100) NOT NULL,
  `CreatedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbladminuser`
--

CREATE TABLE `tbladminuser` (
  `AdminUserId` int(11) NOT NULL,
  `FirstName` varchar(50) NOT NULL,
  `LastName` varchar(50) NOT NULL,
  `EmailAddress` varchar(100) NOT NULL,
  `Password` varchar(100) NOT NULL,
  `ForgotPasswordCode` varchar(10) DEFAULT NULL,
  `IsActive` bit(1) NOT NULL DEFAULT b'1',
  `CreatedBy` int(11) NOT NULL DEFAULT '1',
  `CreatedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UpdatedBy` int(11) NOT NULL DEFAULT '1',
  `UpdatedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbladminuser`
--

INSERT INTO `tbladminuser` (`AdminUserId`, `FirstName`, `LastName`, `EmailAddress`, `Password`, `ForgotPasswordCode`, `IsActive`, `CreatedBy`, `CreatedOn`, `UpdatedBy`, `UpdatedOn`) VALUES
(1, 'IT', 'Admin', 'it@theopeneyes.com', 'e807f1fcf82d132f9bb018ca6738a19f', NULL, b'1', 1, '2019-01-21 06:18:38', 1, '2019-01-23 12:48:10');

-- --------------------------------------------------------

--
-- Table structure for table `tblemaillog`
--

CREATE TABLE `tblemaillog` (
  `EmailLogId` int(11) NOT NULL,
  `TokenId` int(11) NOT NULL,
  `From` varchar(100) NOT NULL,
  `Cc` text NOT NULL,
  `Bcc` text NOT NULL,
  `To` varchar(100) NOT NULL,
  `Subject` varchar(250) NOT NULL,
  `MessageBody` text NOT NULL,
  `CreatedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tblerrorlog`
--

CREATE TABLE `tblerrorlog` (
  `id` int(11) NOT NULL,
  `errno` int(2) NOT NULL,
  `errtype` varchar(32) NOT NULL,
  `errstr` text NOT NULL,
  `errfile` varchar(255) NOT NULL,
  `errline` int(4) NOT NULL,
  `user_agent` varchar(120) NOT NULL,
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tblerrorlog`
--

INSERT INTO `tblerrorlog` (`id`, `errno`, `errtype`, `errstr`, `errfile`, `errline`, `user_agent`, `ip_address`, `time`) VALUES
(1, 8, 'Notice', 'Undefined index: AdminUserId', 'C:\\xampp\\htdocs\\ACH-master\\api\\application\\modules\\Login\\controllers\\Login.php', 55, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2019-01-24 11:21:15');

-- --------------------------------------------------------

--
-- Table structure for table `tblloginlog`
--

CREATE TABLE `tblloginlog` (
  `LoginLogId` int(11) NOT NULL,
  `UserId` int(11) NOT NULL,
  `LoginType` int(1) NOT NULL,
  `UserAgent` int(11) DEFAULT NULL,
  `IPAddress` varchar(50) DEFAULT NULL,
  `CreatedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tblmstbank`
--

CREATE TABLE `tblmstbank` (
  `BankId` int(11) NOT NULL,
  `BankName` varchar(255) NOT NULL,
  `BankIFSCCode` varchar(20) NOT NULL,
  `BankAddress` text NOT NULL,
  `BankPhoneNumber` varchar(12) NOT NULL,
  `IsActive` bit(1) NOT NULL DEFAULT b'1',
  `CreatedBy` int(11) NOT NULL,
  `CreatedOn` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UpdatedBy` int(11) NOT NULL,
  `UpdatedOn` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbluser`
--

CREATE TABLE `tbluser` (
  `UserId` int(11) NOT NULL,
  `FirstName` varchar(100) DEFAULT NULL,
  `LastName` varchar(100) DEFAULT NULL,
  `Address` text,
  `PhoneNumber` varchar(13) DEFAULT NULL,
  `EmailAddress` varchar(100) DEFAULT NULL,
  `PanCard` text,
  `AddressProof` text,
  `InvitationCode` varchar(6) DEFAULT NULL,
  `StatusId` tinyint(1) NOT NULL DEFAULT '0',
  `IsActive` bit(1) NOT NULL DEFAULT b'1',
  `CreatedBy` int(11) NOT NULL,
  `CreatedOn` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UpdatedBy` int(11) NOT NULL,
  `UpdatedOn` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbluserbank`
--

CREATE TABLE `tbluserbank` (
  `UserBankId` int(11) NOT NULL,
  `UserId` int(11) NOT NULL,
  `BankId` int(11) NOT NULL,
  `BankAccountNumber` varchar(20) NOT NULL,
  `AccountType` varchar(10) NOT NULL,
  `PercOfSalary` decimal(5,2) NOT NULL,
  `IsActive` bit(1) NOT NULL DEFAULT b'1',
  `CreatedBy` int(11) NOT NULL,
  `CreatedOn` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UpdatedBy` int(11) NOT NULL,
  `UpdatedOn` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tblactivitylog`
--
ALTER TABLE `tblactivitylog`
  ADD PRIMARY KEY (`ActivityLogId`);

--
-- Indexes for table `tbladminuser`
--
ALTER TABLE `tbladminuser`
  ADD PRIMARY KEY (`AdminUserId`);

--
-- Indexes for table `tblemaillog`
--
ALTER TABLE `tblemaillog`
  ADD PRIMARY KEY (`EmailLogId`);

--
-- Indexes for table `tblerrorlog`
--
ALTER TABLE `tblerrorlog`
  ADD PRIMARY KEY (`id`,`ip_address`,`user_agent`);

--
-- Indexes for table `tblloginlog`
--
ALTER TABLE `tblloginlog`
  ADD PRIMARY KEY (`LoginLogId`);

--
-- Indexes for table `tblmstbank`
--
ALTER TABLE `tblmstbank`
  ADD PRIMARY KEY (`BankId`);

--
-- Indexes for table `tbluser`
--
ALTER TABLE `tbluser`
  ADD PRIMARY KEY (`UserId`);

--
-- Indexes for table `tbluserbank`
--
ALTER TABLE `tbluserbank`
  ADD PRIMARY KEY (`UserBankId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tblactivitylog`
--
ALTER TABLE `tblactivitylog`
  MODIFY `ActivityLogId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbladminuser`
--
ALTER TABLE `tbladminuser`
  MODIFY `AdminUserId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tblemaillog`
--
ALTER TABLE `tblemaillog`
  MODIFY `EmailLogId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblerrorlog`
--
ALTER TABLE `tblerrorlog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tblloginlog`
--
ALTER TABLE `tblloginlog`
  MODIFY `LoginLogId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblmstbank`
--
ALTER TABLE `tblmstbank`
  MODIFY `BankId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbluser`
--
ALTER TABLE `tbluser`
  MODIFY `UserId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbluserbank`
--
ALTER TABLE `tbluserbank`
  MODIFY `UserBankId` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
