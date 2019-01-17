-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 17, 2019 at 12:40 PM
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
  `UserId` int(11) NOT NULL,
  `Module` varchar(50) NOT NULL,
  `Activity` varchar(100) NOT NULL,
  `CreatedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
(1, 8, 'Notice', 'Undefined index: PanCard', 'C:\\xampp\\htdocs\\ACH-master\\api\\application\\modules\\Ach\\models\\Ach_model.php', 24, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2019-01-16 15:07:51'),
(2, 8, 'Notice', 'Undefined index: AddressProof', 'C:\\xampp\\htdocs\\ACH-master\\api\\application\\modules\\Ach\\models\\Ach_model.php', 25, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2019-01-16 15:07:51'),
(3, 8, 'Notice', 'Undefined index: PanCard', 'C:\\xampp\\htdocs\\ACH-master\\api\\application\\modules\\Ach\\models\\Ach_model.php', 24, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2019-01-16 15:08:59'),
(4, 8, 'Notice', 'Undefined index: AddressProof', 'C:\\xampp\\htdocs\\ACH-master\\api\\application\\modules\\Ach\\models\\Ach_model.php', 25, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2019-01-16 15:08:59'),
(5, 0, '0', 'Too few arguments to function Ach::getBankDetails(), 0 passed in C:\\xampp\\htdocs\\ACH-master\\api\\system\\core\\CodeIgniter.php on line 532 and exactly 1 expected', 'C:\\xampp\\htdocs\\ACH-master\\api\\application\\modules\\Ach\\controllers\\Ach.php', 38, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2019-01-17 08:26:28'),
(6, 0, '0', 'Too few arguments to function Ach::getBankDetails(), 0 passed in C:\\xampp\\htdocs\\ACH-master\\api\\system\\core\\CodeIgniter.php on line 532 and exactly 1 expected', 'C:\\xampp\\htdocs\\ACH-master\\api\\application\\modules\\Ach\\controllers\\Ach.php', 38, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2019-01-17 08:26:29'),
(7, 0, '0', 'Too few arguments to function Ach::getBankDetails(), 0 passed in C:\\xampp\\htdocs\\ACH-master\\api\\system\\core\\CodeIgniter.php on line 532 and exactly 1 expected', 'C:\\xampp\\htdocs\\ACH-master\\api\\application\\modules\\Ach\\controllers\\Ach.php', 38, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2019-01-17 08:26:29'),
(8, 0, '0', 'Too few arguments to function Ach::getBankDetails(), 0 passed in C:\\xampp\\htdocs\\ACH-master\\api\\system\\core\\CodeIgniter.php on line 532 and exactly 1 expected', 'C:\\xampp\\htdocs\\ACH-master\\api\\application\\modules\\Ach\\controllers\\Ach.php', 38, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2019-01-17 08:26:30'),
(9, 0, '0', 'Too few arguments to function Ach::getBankDetails(), 0 passed in C:\\xampp\\htdocs\\ACH-master\\api\\system\\core\\CodeIgniter.php on line 532 and exactly 1 expected', 'C:\\xampp\\htdocs\\ACH-master\\api\\application\\modules\\Ach\\controllers\\Ach.php', 38, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2019-01-17 08:26:30'),
(10, 0, '0', 'Too few arguments to function Ach::getBankDetails(), 0 passed in C:\\xampp\\htdocs\\ACH-master\\api\\system\\core\\CodeIgniter.php on line 532 and exactly 1 expected', 'C:\\xampp\\htdocs\\ACH-master\\api\\application\\modules\\Ach\\controllers\\Ach.php', 38, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2019-01-17 08:26:30'),
(11, 0, '0', 'Too few arguments to function Ach::getBankDetails(), 0 passed in C:\\xampp\\htdocs\\ACH-master\\api\\system\\core\\CodeIgniter.php on line 532 and exactly 1 expected', 'C:\\xampp\\htdocs\\ACH-master\\api\\application\\modules\\Ach\\controllers\\Ach.php', 38, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2019-01-17 08:27:41'),
(12, 0, '0', 'Too few arguments to function Ach::getBankDetails(), 0 passed in C:\\xampp\\htdocs\\ACH-master\\api\\system\\core\\CodeIgniter.php on line 532 and exactly 1 expected', 'C:\\xampp\\htdocs\\ACH-master\\api\\application\\modules\\Ach\\controllers\\Ach.php', 38, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2019-01-17 08:27:41'),
(13, 0, '0', 'Too few arguments to function Ach::getBankDetails(), 0 passed in C:\\xampp\\htdocs\\ACH-master\\api\\system\\core\\CodeIgniter.php on line 532 and exactly 1 expected', 'C:\\xampp\\htdocs\\ACH-master\\api\\application\\modules\\Ach\\controllers\\Ach.php', 38, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2019-01-17 08:28:00'),
(14, 0, '0', 'Too few arguments to function Ach::getBankDetails(), 0 passed in C:\\xampp\\htdocs\\ACH-master\\api\\system\\core\\CodeIgniter.php on line 532 and exactly 1 expected', 'C:\\xampp\\htdocs\\ACH-master\\api\\application\\modules\\Ach\\controllers\\Ach.php', 38, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2019-01-17 08:28:01');

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

--
-- Dumping data for table `tblmstbank`
--

INSERT INTO `tblmstbank` (`BankId`, `BankName`, `BankIFSCCode`, `BankAddress`, `BankPhoneNumber`, `IsActive`, `CreatedBy`, `CreatedOn`, `UpdatedBy`, `UpdatedOn`) VALUES
(1, 'Bank 1', 'bank1111111', 'kjjefdf', '567890', b'1', 0, '2019-01-16 19:37:51', 0, '2019-01-16 19:37:51'),
(2, 'Bank 2', 'bank2222222', 'ghjkhgf', '76545678', b'1', 0, '2019-01-16 19:37:51', 0, '2019-01-16 19:37:51'),
(3, 'sdertyu', 'rrrr4555555', 'dfgtyui', '4567898765', b'1', 0, '2019-01-17 15:38:26', 0, '2019-01-17 15:38:26'),
(4, 'YES Bank', 'aaaa111111', 'juhyftdyu', '76545678', b'1', 0, '2019-01-17 16:33:10', 0, '2019-01-17 16:33:10'),
(5, 'Bank of Baroda', 'cccc3333333', 'ytrertyuj', '7654345678', b'1', 0, '2019-01-17 16:33:11', 0, '2019-01-17 16:33:11'),
(6, 'wertyu', 'aaaa1111111', 'dfrgtyui', '4567890-345', b'1', 0, '2019-01-17 16:36:48', 0, '2019-01-17 16:36:48');

-- --------------------------------------------------------

--
-- Table structure for table `tbluser`
--

CREATE TABLE `tbluser` (
  `UserId` int(11) NOT NULL,
  `FirstName` varchar(100) NOT NULL,
  `LastName` varchar(100) NOT NULL,
  `Address` text NOT NULL,
  `PhoneNumber` varchar(13) NOT NULL,
  `EmailAddress` varchar(100) NOT NULL,
  `PanCard` text NOT NULL,
  `AddressProof` text NOT NULL,
  `IsActive` bit(1) NOT NULL DEFAULT b'1',
  `CreatedBy` int(11) NOT NULL,
  `CreatedOn` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UpdatedBy` int(11) NOT NULL,
  `UpdatedOn` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbluser`
--

INSERT INTO `tbluser` (`UserId`, `FirstName`, `LastName`, `Address`, `PhoneNumber`, `EmailAddress`, `PanCard`, `AddressProof`, `IsActive`, `CreatedBy`, `CreatedOn`, `UpdatedBy`, `UpdatedOn`) VALUES
(1, 'Uttam', 'Bhut', 'yuiuyt', '876543456789', 'it@gmail.com', 'PanCard.png', 'AddressProof.png', b'1', 0, '2019-01-16 19:37:51', 0, '2019-01-16 19:37:51'),
(2, 'Sudhir', 'Parmar', 'uytrrty', '876543456789', 'uttam.bhut@theopeneyes.in', 'PanCard.png', 'Address.png', b'1', 0, '2019-01-16 19:38:59', 0, '2019-01-16 19:38:59'),
(3, 'ertyu', 'drtyu', 'drty', '43567890', 'dertyu@yu.ghj', '1547719690007_OESS-LH-HRQuestionnaires.pdf', '1547719698799_greytHR-Pricing Sheet 2018-2019.pdf', b'1', 0, '2019-01-17 15:38:26', 0, '2019-01-17 15:38:26'),
(4, 'Uttam', 'Bhut', 'dfgthyjuijhg', '76545678', 'uttam.bhut@theopeneyes.in', '1547722987527_PanCard.pdf', '1547722989017_Address Proof.pdf', b'1', 0, '2019-01-17 16:33:10', 0, '2019-01-17 16:33:10'),
(5, 'dfrtyuio', 'dfrtyuio', 'dertyui', '4567890', 'it@theopeneyes.com', '1547723204598_PanCard.pdf', '1547723205985_Address Proof.pdf', b'1', 0, '2019-01-17 16:36:48', 0, '2019-01-17 16:36:48'),
(6, 'rtyui', 'dfrtyu', 'dertyui', '456789', 'rtyuiotre@ghj.uytr', '1547723515186_PanCard.pdf', '1547723516439_Address_Proof.pdf', b'1', 0, '2019-01-17 16:41:59', 0, '2019-01-17 16:41:59');

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
-- Dumping data for table `tbluserbank`
--

INSERT INTO `tbluserbank` (`UserBankId`, `UserId`, `BankId`, `BankAccountNumber`, `AccountType`, `PercOfSalary`, `IsActive`, `CreatedBy`, `CreatedOn`, `UpdatedBy`, `UpdatedOn`) VALUES
(1, 1, 1, '7654345678', 'Saving', '50.00', b'1', 0, '2019-01-16 19:37:51', 0, '2019-01-16 19:37:51'),
(2, 1, 2, '8765435678', 'Current', '50.00', b'1', 0, '2019-01-16 19:37:51', 0, '2019-01-16 19:37:51'),
(3, 2, 1, '8765456789', 'Saving', '100.00', b'1', 0, '2019-01-16 19:38:59', 0, '2019-01-16 19:38:59'),
(4, 3, 3, '34567890890', 'Current', '100.00', b'1', 0, '2019-01-17 15:38:26', 0, '2019-01-17 15:38:26'),
(5, 4, 4, '876545678765', 'Saving', '50.00', b'1', 0, '2019-01-17 16:33:10', 0, '2019-01-17 16:33:10'),
(6, 4, 5, '87654567654578', 'Saving', '50.00', b'1', 0, '2019-01-17 16:33:11', 0, '2019-01-17 16:33:11'),
(7, 5, 6, '56789009876543', 'Saving', '34.00', b'1', 0, '2019-01-17 16:36:48', 0, '2019-01-17 16:36:48'),
(8, 6, 6, '34567890987654', 'Current', '43.00', b'1', 0, '2019-01-17 16:41:59', 0, '2019-01-17 16:41:59');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tblerrorlog`
--
ALTER TABLE `tblerrorlog`
  ADD PRIMARY KEY (`id`,`ip_address`,`user_agent`);

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
  ADD PRIMARY KEY (`UserBankId`),
  ADD KEY `ACHUserId` (`UserId`),
  ADD KEY `ACHBankId` (`BankId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tblerrorlog`
--
ALTER TABLE `tblerrorlog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `tblmstbank`
--
ALTER TABLE `tblmstbank`
  MODIFY `BankId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tbluser`
--
ALTER TABLE `tbluser`
  MODIFY `UserId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tbluserbank`
--
ALTER TABLE `tbluserbank`
  MODIFY `UserBankId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbluserbank`
--
ALTER TABLE `tbluserbank`
  ADD CONSTRAINT `tbluserbank_ibfk_1` FOREIGN KEY (`UserId`) REFERENCES `tbluser` (`UserId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbluserbank_ibfk_2` FOREIGN KEY (`BankId`) REFERENCES `tblmstbank` (`BankId`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
