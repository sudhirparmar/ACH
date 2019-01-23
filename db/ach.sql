-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 23, 2019 at 06:32 AM
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
  `UserId` int(11) NOT NULL DEFAULT '1',
  `Module` varchar(50) NOT NULL,
  `Activity` varchar(100) NOT NULL,
  `CreatedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tblactivitylog`
--

INSERT INTO `tblactivitylog` (`ActivityLogId`, `UserId`, `Module`, `Activity`, `CreatedOn`) VALUES
(1, 1, 'Invite User', 'Invitation sent to -uttam.bhut@theopeneyes.in', '2019-01-22 13:32:32'),
(2, 1, 'Revoke User', 'Revoke Invitation of -', '2019-01-22 13:32:43'),
(3, 1, 'Revoke User', 'Revoke Invitation of -uttam.bhut@theopeneyes.in', '2019-01-22 13:35:57'),
(4, 1, 'Revoke User', 'Revoke Invitation of - uttam.bhut@theopeneyes.in', '2019-01-22 13:39:07'),
(5, 1, 'Re-Invite User', 'Re-Invitation sent to - uttam.bhut@theopeneyes.in', '2019-01-22 13:39:24'),
(6, 1, 'Revoke User', 'Revoke Invitation of - uttam.bhut@theopeneyes.in', '2019-01-22 13:41:56'),
(7, 1, 'Re-Invite User', 'Re-Invitation sent to - uttam.bhut@theopeneyes.in', '2019-01-22 13:42:06'),
(8, 1, 'Revoke User', 'Revoke Invitation of - uttam.bhut@theopeneyes.in', '2019-01-22 13:43:10'),
(9, 1, 'Re-Invite User', 'Re-Invitation sent to - uttam.bhut@theopeneyes.in', '2019-01-22 13:43:24'),
(10, 1, 'Invite User', 'Invitation sent to - uttam.bhut@theopeneyes.in', '2019-01-22 14:08:58'),
(11, 1, 'Revoke User', 'Revoke Invitation of - uttam.bhut@theopeneyes.in', '2019-01-22 14:09:26'),
(12, 1, 'Re-Invite User', 'Re-Invitation sent to - uttam.bhut@theopeneyes.in', '2019-01-22 14:09:41'),
(13, 1, 'Revoke User', 'Revoke Invitation of - uttam.bhut@theopeneyes.in', '2019-01-22 14:22:18'),
(14, 1, 'Re-Invite User', 'Re-Invitation sent to - uttam.bhut@theopeneyes.in', '2019-01-22 14:23:11');

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
(1, 'IT', 'Admin', 'it@theopeneyes.com', '25d55ad283aa400af464c76d713c07ad', NULL, b'1', 1, '2019-01-21 06:18:38', 1, '2019-01-21 06:18:38');

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

--
-- Dumping data for table `tblemaillog`
--

INSERT INTO `tblemaillog` (`EmailLogId`, `TokenId`, `From`, `Cc`, `Bcc`, `To`, `Subject`, `MessageBody`, `CreatedOn`) VALUES
(1, 0, 'myopeneyes3937@gmail.com', '', '', 'uttam.bhut@theopeneyes.in', 'OpenEyes Software Soluations - Fill ACH Form', '\r\n				<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"border:1px solid #333333; color:#000000; font-family:Arial,Helvetica,sans-serif; font-size:15px; line-height:22px; margin:0 auto; width:600px\">\r\n					<tbody>\r\n						<tr>\r\n							<td style=\"background-color:#fff; background:#fff; padding:10px 10px 5px 10px; text-align:center\"><img alt=\"\" style=\"width:130px\" src=\"https://devbyopeneyes.com/emailer_images/oess.png\" /></td>\r\n						</tr>\r\n						<tr>\r\n							<td style=\"border-width:0; padding:20px 10px 10px 10px; text-align:center\">\r\n								<p style=\"color:#000; font-size: 14px; line-height:20px; padding: 0; margin: 0 0;\">Find your link to fill ACH Form:</p>\r\n							</td>\r\n						</tr>\r\n						<tr>\r\n							<td style=\"border-width:0; padding:0; text-align:center; vertical-align:middle\">\r\n							<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"border:0; font-family:Arial,Helvetica,sans-serif; font-size:15px; line-height:22px; margin:0 auto\">\r\n								<tbody>\r\n									<tr>\r\n										<td style=\"background-color:#0061AF; background:#0061AF; border-radius:4px; border-width:0; clear:both; color:#ffffff; font-size:14px; line-height:13px; opacity:1; padding:10px; text-align:center; text-decoration:none; width:130px\"><a href=\"http://localhost:4200//ach/eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJVc2VySWQiOjIxLCJJbnZpdGF0aW9uQ29kZSI6IjYxMlRVTCIsIkVtYWlsQWRkcmVzcyI6InV0dGFtLmJodXRAdGhlb3BlbmV5ZXMuaW4ifQ.kIhuWQFklGYcfwxRQ1i10cza2p3v9J2OvMZ2h9ZodaM\" style=\"color:#fff; text-decoration:none;\">Fill ACH Form</a></td>\r\n									</tr>\r\n								</tbody>\r\n							</table>\r\n							</td>\r\n						</tr>\r\n						<tr>\r\n							<td style=\"border-width:0; padding:20px 10px 10px 10px; text-align:center; vertical-align:middle\">\r\n								<p style=\"color:#777; font-size: 12px; line-height:20px; padding: 0; margin: 0 0 10px; text-align: left;\">If you&rsquo;re having trouble with the button above, copy and paste the URL below into your web browser. <a href=\"http://localhost:4200//ach/eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJVc2VySWQiOjIxLCJJbnZpdGF0aW9uQ29kZSI6IjYxMlRVTCIsIkVtYWlsQWRkcmVzcyI6InV0dGFtLmJodXRAdGhlb3BlbmV5ZXMuaW4ifQ.kIhuWQFklGYcfwxRQ1i10cza2p3v9J2OvMZ2h9ZodaM\" style=\"cursor:pointer;\">click here</a></p>\r\n							</td>\r\n						</tr>\r\n						<tr>\r\n							<td style=\"background-color:#a6ce39; background:#a6ce39; border-top:1px solid #cccccc; color:#000; font-size:13px; padding:7px; text-align:center\">Copyright &copy; 2018 OpenEyes Software Solutions</td>\r\n						</tr>\r\n					</tbody>\r\n				</table>\r\n				', '2019-01-22 14:09:03'),
(2, 0, 'myopeneyes3937@gmail.com', '', '', 'uttam.bhut@theopeneyes.in', 'OpenEyes Software Soluations - Fill ACH Form', '\r\n				<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"border:1px solid #333333; color:#000000; font-family:Arial,Helvetica,sans-serif; font-size:15px; line-height:22px; margin:0 auto; width:600px\">\r\n					<tbody>\r\n						<tr>\r\n							<td style=\"background-color:#fff; background:#fff; padding:10px 10px 5px 10px; text-align:center\"><img alt=\"\" style=\"width:130px\" src=\"https://devbyopeneyes.com/emailer_images/oess.png\" /></td>\r\n						</tr>\r\n						<tr>\r\n							<td style=\"border-width:0; padding:20px 10px 10px 10px; text-align:center\">\r\n								<p style=\"color:#000; font-size: 14px; line-height:20px; padding: 0; margin: 0 0;\">Find your link to fill ACH Form:</p>\r\n							</td>\r\n						</tr>\r\n						<tr>\r\n							<td style=\"border-width:0; padding:0; text-align:center; vertical-align:middle\">\r\n							<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"border:0; font-family:Arial,Helvetica,sans-serif; font-size:15px; line-height:22px; margin:0 auto\">\r\n								<tbody>\r\n									<tr>\r\n										<td style=\"background-color:#0061AF; background:#0061AF; border-radius:4px; border-width:0; clear:both; color:#ffffff; font-size:14px; line-height:13px; opacity:1; padding:10px; text-align:center; text-decoration:none; width:130px\"><a href=\"http://localhost:4200//ach/eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6IjIxIiwiRW1haWwiOiJ1dHRhbS5iaHV0QHRoZW9wZW5leWVzLmluIiwiSW52aXRhdGlvbkNvZGUiOiJHVk4xS0UiLCJVc2VySWQiOiIyMSIsIkVtYWlsQWRkcmVzcyI6InV0dGFtLmJodXRAdGhlb3BlbmV5ZXMuaW4ifQ.VOQnd558n7U00J9P8Tr5BFdR6vwsYRlXGwyT3ybVGdM\" style=\"color:#fff; text-decoration:none;\">Fill ACH Form</a></td>\r\n									</tr>\r\n								</tbody>\r\n							</table>\r\n							</td>\r\n						</tr>\r\n						<tr>\r\n							<td style=\"border-width:0; padding:20px 10px 10px 10px; text-align:center; vertical-align:middle\">\r\n								<p style=\"color:#777; font-size: 12px; line-height:20px; padding: 0; margin: 0 0 10px; text-align: left;\">If you&rsquo;re having trouble with the button above, copy and paste the URL below into your web browser. <a href=\"http://localhost:4200//ach/eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6IjIxIiwiRW1haWwiOiJ1dHRhbS5iaHV0QHRoZW9wZW5leWVzLmluIiwiSW52aXRhdGlvbkNvZGUiOiJHVk4xS0UiLCJVc2VySWQiOiIyMSIsIkVtYWlsQWRkcmVzcyI6InV0dGFtLmJodXRAdGhlb3BlbmV5ZXMuaW4ifQ.VOQnd558n7U00J9P8Tr5BFdR6vwsYRlXGwyT3ybVGdM\" style=\"cursor:pointer;\">click here</a></p>\r\n							</td>\r\n						</tr>\r\n						<tr>\r\n							<td style=\"background-color:#a6ce39; background:#a6ce39; border-top:1px solid #cccccc; color:#000; font-size:13px; padding:7px; text-align:center\">Copyright &copy; 2018 OpenEyes Software Solutions</td>\r\n						</tr>\r\n					</tbody>\r\n				</table>\r\n				', '2019-01-22 14:09:45'),
(3, 0, 'myopeneyes3937@gmail.com', '', '', 'uttam.bhut@theopeneyes.in', 'OpenEyes Software Soluations - Fill ACH Form', '\r\n				<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"border:1px solid #333333; color:#000000; font-family:Arial,Helvetica,sans-serif; font-size:15px; line-height:22px; margin:0 auto; width:600px\">\r\n					<tbody>\r\n						<tr>\r\n							<td style=\"background-color:#fff; background:#fff; padding:10px 10px 5px 10px; text-align:center\"><img alt=\"\" style=\"width:130px\" src=\"https://devbyopeneyes.com/emailer_images/oess.png\" /></td>\r\n						</tr>\r\n						<tr>\r\n							<td style=\"border-width:0; padding:20px 10px 10px 10px; text-align:center\">\r\n								<p style=\"color:#000; font-size: 14px; line-height:20px; padding: 0; margin: 0 0;\">Find your link to fill ACH Form:</p>\r\n							</td>\r\n						</tr>\r\n						<tr>\r\n							<td style=\"border-width:0; padding:0; text-align:center; vertical-align:middle\">\r\n							<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"border:0; font-family:Arial,Helvetica,sans-serif; font-size:15px; line-height:22px; margin:0 auto\">\r\n								<tbody>\r\n									<tr>\r\n										<td style=\"background-color:#0061AF; background:#0061AF; border-radius:4px; border-width:0; clear:both; color:#ffffff; font-size:14px; line-height:13px; opacity:1; padding:10px; text-align:center; text-decoration:none; width:130px\"><a href=\"http://localhost:4200//ach/eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6IjIxIiwiRW1haWwiOiJ1dHRhbS5iaHV0QHRoZW9wZW5leWVzLmluIiwiSW52aXRhdGlvbkNvZGUiOiJDQ1Y3MzEiLCJVc2VySWQiOiIyMSIsIkVtYWlsQWRkcmVzcyI6InV0dGFtLmJodXRAdGhlb3BlbmV5ZXMuaW4ifQ.iyPLpjC5tL2LJwl1ifRStbnYyZGLDofgO0w3Bii89yU\" style=\"color:#fff; text-decoration:none;\">Fill ACH Form</a></td>\r\n									</tr>\r\n								</tbody>\r\n							</table>\r\n							</td>\r\n						</tr>\r\n						<tr>\r\n							<td style=\"border-width:0; padding:20px 10px 10px 10px; text-align:center; vertical-align:middle\">\r\n								<p style=\"color:#777; font-size: 12px; line-height:20px; padding: 0; margin: 0 0 10px; text-align: left;\">If you&rsquo;re having trouble with the button above, copy and paste the URL below into your web browser. <a href=\"http://localhost:4200//ach/eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6IjIxIiwiRW1haWwiOiJ1dHRhbS5iaHV0QHRoZW9wZW5leWVzLmluIiwiSW52aXRhdGlvbkNvZGUiOiJDQ1Y3MzEiLCJVc2VySWQiOiIyMSIsIkVtYWlsQWRkcmVzcyI6InV0dGFtLmJodXRAdGhlb3BlbmV5ZXMuaW4ifQ.iyPLpjC5tL2LJwl1ifRStbnYyZGLDofgO0w3Bii89yU\" style=\"cursor:pointer;\">click here</a></p>\r\n							</td>\r\n						</tr>\r\n						<tr>\r\n							<td style=\"background-color:#a6ce39; background:#a6ce39; border-top:1px solid #cccccc; color:#000; font-size:13px; padding:7px; text-align:center\">Copyright &copy; 2018 OpenEyes Software Solutions</td>\r\n						</tr>\r\n					</tbody>\r\n				</table>\r\n				', '2019-01-22 14:23:15');

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
(14, 0, '0', 'Too few arguments to function Ach::getBankDetails(), 0 passed in C:\\xampp\\htdocs\\ACH-master\\api\\system\\core\\CodeIgniter.php on line 532 and exactly 1 expected', 'C:\\xampp\\htdocs\\ACH-master\\api\\application\\modules\\Ach\\controllers\\Ach.php', 38, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2019-01-17 08:28:01'),
(15, 8, 'Notice', 'Undefined property: InviteUser::$User_Invite_model', 'C:\\xampp\\htdocs\\ACH-master\\api\\application\\modules\\InviteUser\\controllers\\InviteUser.php', 25, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2019-01-17 14:41:53'),
(16, 0, '0', 'Call to a member function userInvite() on null', 'C:\\xampp\\htdocs\\ACH-master\\api\\application\\modules\\InviteUser\\controllers\\InviteUser.php', 25, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2019-01-17 14:41:53'),
(17, 0, '0', 'Call to undefined method InviteUser_model::userInvite()', 'C:\\xampp\\htdocs\\ACH-master\\api\\application\\modules\\InviteUser\\controllers\\InviteUser.php', 25, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2019-01-17 14:43:08'),
(18, 256, 'User Error', 'Database error! Error Code [1054] Error: Unknown column \'StatusId\' in \'field list\'', 'C:\\xampp\\htdocs\\ACH-master\\api\\application\\modules\\InviteUser\\models\\InviteUser_model.php', 50, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2019-01-17 14:43:45'),
(19, 2, 'Warning', 'include(C:\\xampp\\htdocs\\ACH-master\\api\\application\\vendor/firebase/php-jwt/src/JWT.php): failed to open stream: No such file or directory', 'C:\\xampp\\htdocs\\ACH-master\\api\\application\\modules\\Login\\controllers\\Login.php', 14, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2019-01-21 07:43:24'),
(20, 2, 'Warning', 'include(): Failed opening \'C:\\xampp\\htdocs\\ACH-master\\api\\application\\vendor/firebase/php-jwt/src/JWT.php\' for inclusion (include_path=\'C:\\xampp\\php\\PEAR\')', 'C:\\xampp\\htdocs\\ACH-master\\api\\application\\modules\\Login\\controllers\\Login.php', 14, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2019-01-21 07:43:24'),
(21, 2, 'Warning', 'include(C:\\xampp\\htdocs\\ACH-master\\api\\application\\vendor/firebase/php-jwt/src/JWT.php): failed to open stream: No such file or directory', 'C:\\xampp\\htdocs\\ACH-master\\api\\application\\modules\\Login\\controllers\\Login.php', 14, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2019-01-21 07:43:27'),
(22, 2, 'Warning', 'include(): Failed opening \'C:\\xampp\\htdocs\\ACH-master\\api\\application\\vendor/firebase/php-jwt/src/JWT.php\' for inclusion (include_path=\'C:\\xampp\\php\\PEAR\')', 'C:\\xampp\\htdocs\\ACH-master\\api\\application\\modules\\Login\\controllers\\Login.php', 14, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2019-01-21 07:43:27'),
(23, 2, 'Warning', 'include(C:\\xampp\\htdocs\\ACH-master\\api\\application\\vendor/firebase/php-jwt/src/JWT.php): failed to open stream: No such file or directory', 'C:\\xampp\\htdocs\\ACH-master\\api\\application\\modules\\Login\\controllers\\Login.php', 14, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2019-01-21 07:44:05'),
(24, 2, 'Warning', 'include(): Failed opening \'C:\\xampp\\htdocs\\ACH-master\\api\\application\\vendor/firebase/php-jwt/src/JWT.php\' for inclusion (include_path=\'C:\\xampp\\php\\PEAR\')', 'C:\\xampp\\htdocs\\ACH-master\\api\\application\\modules\\Login\\controllers\\Login.php', 14, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2019-01-21 07:44:05'),
(25, 2, 'Warning', 'include(C:\\xampp\\htdocs\\ACH-master\\api\\application\\vendor/firebase/php-jwt/src/JWT.php): failed to open stream: No such file or directory', 'C:\\xampp\\htdocs\\ACH-master\\api\\application\\modules\\Login\\controllers\\Login.php', 14, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2019-01-21 07:46:53'),
(26, 2, 'Warning', 'include(): Failed opening \'C:\\xampp\\htdocs\\ACH-master\\api\\application\\vendor/firebase/php-jwt/src/JWT.php\' for inclusion (include_path=\'C:\\xampp\\php\\PEAR\')', 'C:\\xampp\\htdocs\\ACH-master\\api\\application\\modules\\Login\\controllers\\Login.php', 14, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2019-01-21 07:46:53'),
(27, 8, 'Notice', 'Array to string conversion', 'C:\\xampp\\htdocs\\ACH-master\\api\\application\\modules\\Login\\controllers\\Login.php', 28, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2019-01-21 08:50:40'),
(28, 8, 'Notice', 'Undefined property: stdClass::$UserId', 'C:\\xampp\\htdocs\\ACH-master\\api\\application\\modules\\Login\\models\\Login_model.php', 17, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2019-01-21 09:06:36'),
(29, 0, '0', 'Class \'JWT\' not found', 'C:\\xampp\\htdocs\\ACH-master\\api\\application\\modules\\InviteUser\\controllers\\InviteUser.php', 78, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2019-01-21 14:10:02'),
(30, 0, '0', 'Class \'Firebase\\JWT\\JWT\' not found', 'C:\\xampp\\htdocs\\ACH-master\\api\\application\\modules\\InviteUser\\controllers\\InviteUser.php', 80, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2019-01-21 14:11:27'),
(31, 2, 'Warning', 'fsockopen(): SSL operation failed with code 1. OpenSSL Error messages:\nerror:1416F086:SSL routines:tls_process_server_certificate:certificate verify failed', 'C:\\xampp\\htdocs\\ACH-master\\api\\system\\libraries\\Email.php', 2069, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2019-01-21 14:14:17'),
(32, 2, 'Warning', 'fsockopen(): Failed to enable crypto', 'C:\\xampp\\htdocs\\ACH-master\\api\\system\\libraries\\Email.php', 2069, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2019-01-21 14:14:17'),
(33, 2, 'Warning', 'fsockopen(): unable to connect to ssl://smtp.googlemail.com:465 (Unknown error)', 'C:\\xampp\\htdocs\\ACH-master\\api\\system\\libraries\\Email.php', 2069, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2019-01-21 14:14:17'),
(34, 2, 'Warning', 'fsockopen(): SSL operation failed with code 1. OpenSSL Error messages:\nerror:1416F086:SSL routines:tls_process_server_certificate:certificate verify failed', 'C:\\xampp\\htdocs\\ACH-master\\api\\system\\libraries\\Email.php', 2069, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2019-01-21 14:20:24'),
(35, 2, 'Warning', 'fsockopen(): Failed to enable crypto', 'C:\\xampp\\htdocs\\ACH-master\\api\\system\\libraries\\Email.php', 2069, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2019-01-21 14:20:24'),
(36, 2, 'Warning', 'fsockopen(): unable to connect to ssl://smtp.googlemail.com:465 (Unknown error)', 'C:\\xampp\\htdocs\\ACH-master\\api\\system\\libraries\\Email.php', 2069, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2019-01-21 14:20:24'),
(37, 8, 'Notice', 'fwrite(): send of 6 bytes failed with errno=10054 An existing connection was forcibly closed by the remote host.\r\n', 'C:\\xampp\\htdocs\\ACH-master\\api\\system\\libraries\\Email.php', 2268, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2019-01-21 14:27:31'),
(38, 8, 'Notice', 'fwrite(): send of 6 bytes failed with errno=10054 An existing connection was forcibly closed by the remote host.\r\n', 'C:\\xampp\\htdocs\\ACH-master\\api\\system\\libraries\\Email.php', 2268, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2019-01-21 14:27:31'),
(39, 8, 'Notice', 'fwrite(): send of 6 bytes failed with errno=10054 An existing connection was forcibly closed by the remote host.\r\n', 'C:\\xampp\\htdocs\\ACH-master\\api\\system\\libraries\\Email.php', 2268, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2019-01-21 14:27:32'),
(40, 8, 'Notice', 'fwrite(): send of 6 bytes failed with errno=10054 An existing connection was forcibly closed by the remote host.\r\n', 'C:\\xampp\\htdocs\\ACH-master\\api\\system\\libraries\\Email.php', 2268, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2019-01-21 14:27:32'),
(41, 8, 'Notice', 'fwrite(): send of 6 bytes failed with errno=10054 An existing connection was forcibly closed by the remote host.\r\n', 'C:\\xampp\\htdocs\\ACH-master\\api\\system\\libraries\\Email.php', 2268, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2019-01-21 14:27:32'),
(42, 8, 'Notice', 'fwrite(): send of 6 bytes failed with errno=10054 An existing connection was forcibly closed by the remote host.\r\n', 'C:\\xampp\\htdocs\\ACH-master\\api\\system\\libraries\\Email.php', 2268, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2019-01-21 14:27:32'),
(43, 8, 'Notice', 'fwrite(): send of 6 bytes failed with errno=10054 An existing connection was forcibly closed by the remote host.\r\n', 'C:\\xampp\\htdocs\\ACH-master\\api\\system\\libraries\\Email.php', 2268, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2019-01-21 14:27:33'),
(44, 8, 'Notice', 'fwrite(): send of 6 bytes failed with errno=10054 An existing connection was forcibly closed by the remote host.\r\n', 'C:\\xampp\\htdocs\\ACH-master\\api\\system\\libraries\\Email.php', 2268, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2019-01-21 14:27:33'),
(45, 8, 'Notice', 'fwrite(): send of 6 bytes failed with errno=10054 An existing connection was forcibly closed by the remote host.\r\n', 'C:\\xampp\\htdocs\\ACH-master\\api\\system\\libraries\\Email.php', 2268, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2019-01-21 14:27:33'),
(46, 8, 'Notice', 'fwrite(): send of 6 bytes failed with errno=10054 An existing connection was forcibly closed by the remote host.\r\n', 'C:\\xampp\\htdocs\\ACH-master\\api\\system\\libraries\\Email.php', 2268, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2019-01-21 14:27:34'),
(47, 8, 'Notice', 'fwrite(): send of 6 bytes failed with errno=10054 An existing connection was forcibly closed by the remote host.\r\n', 'C:\\xampp\\htdocs\\ACH-master\\api\\system\\libraries\\Email.php', 2268, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2019-01-21 14:27:34'),
(48, 8, 'Notice', 'fwrite(): send of 6 bytes failed with errno=10054 An existing connection was forcibly closed by the remote host.\r\n', 'C:\\xampp\\htdocs\\ACH-master\\api\\system\\libraries\\Email.php', 2268, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2019-01-21 14:27:34'),
(49, 8, 'Notice', 'fwrite(): send of 6 bytes failed with errno=10054 An existing connection was forcibly closed by the remote host.\r\n', 'C:\\xampp\\htdocs\\ACH-master\\api\\system\\libraries\\Email.php', 2268, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2019-01-21 14:27:35'),
(50, 8, 'Notice', 'fwrite(): send of 6 bytes failed with errno=10054 An existing connection was forcibly closed by the remote host.\r\n', 'C:\\xampp\\htdocs\\ACH-master\\api\\system\\libraries\\Email.php', 2268, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2019-01-21 14:27:35'),
(51, 8, 'Notice', 'fwrite(): send of 6 bytes failed with errno=10054 An existing connection was forcibly closed by the remote host.\r\n', 'C:\\xampp\\htdocs\\ACH-master\\api\\system\\libraries\\Email.php', 2268, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2019-01-21 14:27:35'),
(52, 8, 'Notice', 'fwrite(): send of 6 bytes failed with errno=10054 An existing connection was forcibly closed by the remote host.\r\n', 'C:\\xampp\\htdocs\\ACH-master\\api\\system\\libraries\\Email.php', 2268, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2019-01-21 14:27:35'),
(53, 8, 'Notice', 'fwrite(): send of 6 bytes failed with errno=10054 An existing connection was forcibly closed by the remote host.\r\n', 'C:\\xampp\\htdocs\\ACH-master\\api\\system\\libraries\\Email.php', 2268, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2019-01-21 14:27:36'),
(54, 8, 'Notice', 'fwrite(): send of 6 bytes failed with errno=10054 An existing connection was forcibly closed by the remote host.\r\n', 'C:\\xampp\\htdocs\\ACH-master\\api\\system\\libraries\\Email.php', 2268, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2019-01-21 14:27:36'),
(55, 8, 'Notice', 'fwrite(): send of 6 bytes failed with errno=10054 An existing connection was forcibly closed by the remote host.\r\n', 'C:\\xampp\\htdocs\\ACH-master\\api\\system\\libraries\\Email.php', 2268, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2019-01-21 14:27:36'),
(56, 2, 'Warning', 'fsockopen(): SSL operation failed with code 1. OpenSSL Error messages:\nerror:1416F086:SSL routines:tls_process_server_certificate:certificate verify failed', 'C:\\xampp\\htdocs\\ACH-master\\api\\system\\libraries\\Email.php', 2069, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2019-01-21 14:29:05'),
(57, 2, 'Warning', 'fsockopen(): Failed to enable crypto', 'C:\\xampp\\htdocs\\ACH-master\\api\\system\\libraries\\Email.php', 2069, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2019-01-21 14:29:05'),
(58, 2, 'Warning', 'fsockopen(): unable to connect to ssl://smtp.googlemail.com:465 (Unknown error)', 'C:\\xampp\\htdocs\\ACH-master\\api\\system\\libraries\\Email.php', 2069, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2019-01-21 14:29:05'),
(59, 2, 'Warning', 'fsockopen(): SSL operation failed with code 1. OpenSSL Error messages:\nerror:1416F086:SSL routines:tls_process_server_certificate:certificate verify failed', 'C:\\xampp\\htdocs\\ACH-master\\api\\system\\libraries\\Email.php', 2069, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2019-01-21 14:29:38'),
(60, 2, 'Warning', 'fsockopen(): Failed to enable crypto', 'C:\\xampp\\htdocs\\ACH-master\\api\\system\\libraries\\Email.php', 2069, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2019-01-21 14:29:39'),
(61, 2, 'Warning', 'fsockopen(): unable to connect to ssl://smtp.googlemail.com:465 (Unknown error)', 'C:\\xampp\\htdocs\\ACH-master\\api\\system\\libraries\\Email.php', 2069, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2019-01-21 14:29:39'),
(62, 0, '0', 'Class \'Firebase\\JWT\\JWT\' not found', 'C:\\xampp\\htdocs\\ACH-master\\api\\application\\modules\\InviteUser\\controllers\\InviteUser.php', 80, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2019-01-21 14:34:17'),
(63, 0, '0', 'Class \'Firebase\\JWT\\JWT\' not found', 'C:\\xampp\\htdocs\\ACH-master\\api\\application\\modules\\InviteUser\\controllers\\InviteUser.php', 80, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2019-01-21 14:36:59'),
(64, 0, '0', 'Class \'Firebase\\JWT\\JWT\' not found', 'C:\\xampp\\htdocs\\ACH-master\\api\\application\\modules\\InviteUser\\controllers\\InviteUser.php', 80, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2019-01-21 14:51:23'),
(65, 0, '0', 'Class \'Firebase\\JWT\\JWT\' not found', 'C:\\xampp\\htdocs\\ACH-master\\api\\application\\modules\\InviteUser\\controllers\\InviteUser.php', 78, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2019-01-22 11:49:39'),
(66, 8, 'Notice', 'Undefined variable: post_pass', 'C:\\xampp\\htdocs\\ACH-master\\api\\application\\modules\\InviteUser\\controllers\\InviteUser.php', 83, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2019-01-22 12:56:33'),
(67, 8, 'Notice', 'Undefined index: userid', 'C:\\xampp\\htdocs\\ACH-master\\api\\application\\modules\\InviteUser\\models\\InviteUser_model.php', 70, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2019-01-22 16:18:58'),
(68, 8, 'Notice', 'Undefined index: revokecode', 'C:\\xampp\\htdocs\\ACH-master\\api\\application\\modules\\InviteUser\\models\\InviteUser_model.php', 71, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2019-01-22 16:18:58'),
(69, 8, 'Notice', 'Undefined index: UserId', 'C:\\xampp\\htdocs\\ACH-master\\api\\application\\modules\\InviteUser\\models\\InviteUser_model.php', 70, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2019-01-22 16:21:10'),
(70, 8, 'Notice', 'Undefined index: EmailAddress', 'C:\\xampp\\htdocs\\ACH-master\\api\\application\\modules\\InviteUser\\controllers\\InviteUser.php', 72, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2019-01-22 17:48:25'),
(71, 0, '0', 'syntax error, unexpected \';\', expecting \')\'', 'C:\\xampp\\htdocs\\ACH-master\\api\\application\\modules\\InviteUser\\models\\InviteUser_model.php', 156, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2019-01-22 18:32:11'),
(72, 0, '0', 'syntax error, unexpected \';\', expecting \')\'', 'C:\\xampp\\htdocs\\ACH-master\\api\\application\\modules\\InviteUser\\models\\InviteUser_model.php', 156, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2019-01-22 18:32:11'),
(73, 8, 'Notice', 'Undefined index: UserId', 'C:\\xampp\\htdocs\\ACH-master\\api\\application\\modules\\InviteUser\\models\\InviteUser_model.php', 172, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2019-01-22 18:37:21'),
(74, 256, 'User Error', 'Database error! Error Code [1048] Error: Column \'UserId\' cannot be null', 'C:\\xampp\\htdocs\\ACH-master\\api\\application\\modules\\InviteUser\\models\\InviteUser_model.php', 199, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2019-01-22 18:37:21'),
(75, 8, 'Notice', 'Undefined index: UserId', 'C:\\xampp\\htdocs\\ACH-master\\api\\application\\modules\\InviteUser\\models\\InviteUser_model.php', 172, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2019-01-22 18:37:41'),
(76, 256, 'User Error', 'Database error! Error Code [1048] Error: Column \'UserId\' cannot be null', 'C:\\xampp\\htdocs\\ACH-master\\api\\application\\modules\\InviteUser\\models\\InviteUser_model.php', 199, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2019-01-22 18:37:41'),
(77, 8, 'Notice', 'Undefined index: UserId', 'C:\\xampp\\htdocs\\ACH-master\\api\\application\\modules\\InviteUser\\models\\InviteUser_model.php', 80, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2019-01-22 18:59:37'),
(78, 8, 'Notice', 'Undefined index: Email', 'C:\\xampp\\htdocs\\ACH-master\\api\\application\\modules\\InviteUser\\models\\InviteUser_model.php', 82, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2019-01-22 18:59:37'),
(79, 8, 'Notice', 'Undefined index: Email', 'C:\\xampp\\htdocs\\ACH-master\\api\\application\\modules\\InviteUser\\models\\InviteUser_model.php', 81, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2019-01-22 19:02:43');

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

--
-- Dumping data for table `tblloginlog`
--

INSERT INTO `tblloginlog` (`LoginLogId`, `UserId`, `LoginType`, `UserAgent`, `IPAddress`, `CreatedOn`) VALUES
(1, 1, 1, NULL, NULL, '2019-01-23 05:03:25');

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
(1, 'HDFC', 'HDFC0000001', 'thytre', '2345543234', b'1', 0, '2019-01-22 16:08:00', 0, '2019-01-22 16:08:00'),
(2, 'YES BAnk', 'YESB0000001', 'rtyuyt', '45676543', b'1', 0, '2019-01-22 16:08:00', 0, '2019-01-22 16:08:00'),
(3, 'gtyui', 'sdcd456789', 'fcece', '567890-', b'1', 0, '2019-01-22 16:29:35', 0, '2019-01-22 16:29:35');

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

--
-- Dumping data for table `tbluser`
--

INSERT INTO `tbluser` (`UserId`, `FirstName`, `LastName`, `Address`, `PhoneNumber`, `EmailAddress`, `PanCard`, `AddressProof`, `InvitationCode`, `StatusId`, `IsActive`, `CreatedBy`, `CreatedOn`, `UpdatedBy`, `UpdatedOn`) VALUES
(13, NULL, NULL, NULL, NULL, 'mitesh.patel@theopeneyes.inbb', NULL, NULL, '1NGYP4', 1, b'1', 0, '2019-01-22 16:52:31', 0, '2019-01-22 16:52:31'),
(14, NULL, NULL, NULL, NULL, 'sparmar@theopeneyes.in', NULL, NULL, 'JJJTDE', 0, b'1', 0, '2019-01-22 16:53:42', 0, '2019-01-22 16:53:42'),
(21, NULL, NULL, NULL, NULL, 'uttam.bhut@theopeneyes.in', NULL, NULL, 'CCV731', 0, b'1', 0, '2019-01-22 19:38:58', 0, '2019-01-22 19:38:58');

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
  ADD PRIMARY KEY (`UserBankId`),
  ADD KEY `ACHUserId` (`UserId`),
  ADD KEY `ACHBankId` (`BankId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tblactivitylog`
--
ALTER TABLE `tblactivitylog`
  MODIFY `ActivityLogId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `tbladminuser`
--
ALTER TABLE `tbladminuser`
  MODIFY `AdminUserId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tblemaillog`
--
ALTER TABLE `tblemaillog`
  MODIFY `EmailLogId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tblerrorlog`
--
ALTER TABLE `tblerrorlog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80;

--
-- AUTO_INCREMENT for table `tblloginlog`
--
ALTER TABLE `tblloginlog`
  MODIFY `LoginLogId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tblmstbank`
--
ALTER TABLE `tblmstbank`
  MODIFY `BankId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbluser`
--
ALTER TABLE `tbluser`
  MODIFY `UserId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `tbluserbank`
--
ALTER TABLE `tbluserbank`
  MODIFY `UserBankId` int(11) NOT NULL AUTO_INCREMENT;

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
