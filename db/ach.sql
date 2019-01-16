-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 16, 2019 at 08:32 AM
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
-- Table structure for table `logs`
--

CREATE TABLE `logs` (
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
-- Dumping data for table `logs`
--

INSERT INTO `logs` (`id`, `errno`, `errtype`, `errstr`, `errfile`, `errline`, `user_agent`, `ip_address`, `time`) VALUES
(1, 256, 'User Error', 'Database Error ! Error Code :[1318] Error: Incorrect number of arguments for PROCEDURE ach.addData; expected 7, got 13', 'C:\\xampp\\htdocs\\ACH\\application\\models\\Adddata_model.php', 38, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2018-12-18 12:59:31'),
(2, 256, 'User Error', 'Database Error ! Error Code :[1305] Error: PROCEDURE ach.getuserdata does not exist', 'C:\\xampp\\htdocs\\ACH\\application\\models\\AchList_model.php', 31, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2018-12-18 12:59:31'),
(3, 0, '0', 'Call to a member function result() on boolean', 'C:\\xampp\\htdocs\\ACH\\application\\views\\AchList.php', 55, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2018-12-18 12:59:31'),
(4, 256, 'User Error', 'Database Error ! Error Code :[1064] Error: You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near \'?,?,?,?,?,?,?)\' at line 1', 'C:\\xampp\\htdocs\\ACH\\application\\models\\Adddata_model.php', 38, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2018-12-18 13:01:20'),
(5, 256, 'User Error', 'Database Error ! Error Code :[1305] Error: PROCEDURE ach.getuserdata does not exist', 'C:\\xampp\\htdocs\\ACH\\application\\models\\AchList_model.php', 31, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2018-12-18 13:01:20'),
(6, 0, '0', 'Call to a member function result() on boolean', 'C:\\xampp\\htdocs\\ACH\\application\\views\\AchList.php', 55, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2018-12-18 13:01:20'),
(7, 256, 'User Error', 'Database Error ! Error Code :[1064] Error: You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near \'?,?,?,?,?,?,?)\' at line 1', 'C:\\xampp\\htdocs\\ACH\\application\\models\\Adddata_model.php', 38, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2018-12-18 13:06:35'),
(8, 256, 'User Error', 'Database Error ! Error Code :[1305] Error: PROCEDURE ach.getuserdata does not exist', 'C:\\xampp\\htdocs\\ACH\\application\\models\\AchList_model.php', 31, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2018-12-18 13:06:35'),
(9, 0, '0', 'Call to a member function result() on boolean', 'C:\\xampp\\htdocs\\ACH\\application\\views\\AchList.php', 55, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2018-12-18 13:06:35'),
(10, 0, '0', 'Call to undefined method MY_Loader::_ci_object_to_array()', 'C:\\xampp\\htdocs\\ACH\\application\\third_party\\MX\\Loader.php', 300, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2018-12-24 10:35:45'),
(11, 0, '0', 'Call to undefined method MY_Loader::_ci_object_to_array()', 'C:\\xampp\\htdocs\\ACH\\application\\third_party\\MX\\Loader.php', 300, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2018-12-24 10:38:56'),
(12, 0, '0', 'Call to undefined method MY_Loader::_ci_object_to_array()', 'C:\\xampp\\htdocs\\ACH\\application\\third_party\\MX\\Loader.php', 300, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2018-12-24 10:39:41'),
(13, 0, '0', 'Call to undefined method MY_Loader::_ci_object_to_array()', 'C:\\xampp\\htdocs\\ACH\\application\\third_party\\MX\\Loader.php', 300, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2018-12-24 10:43:55'),
(14, 0, '0', 'Call to undefined method MY_Loader::_ci_object_to_array()', 'C:\\xampp\\htdocs\\ACH\\application\\third_party\\MX\\Loader.php', 300, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2018-12-24 10:44:01'),
(15, 8192, 'Runtime Notice', 'The each() function is deprecated. This message will be suppressed on further calls', 'C:\\xampp\\htdocs\\ACH\\application\\third_party\\MX\\Modules.php', 83, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2018-12-24 10:48:36'),
(16, 8192, 'Runtime Notice', 'The each() function is deprecated. This message will be suppressed on further calls', 'C:\\xampp\\htdocs\\ACH\\application\\third_party\\MX\\Modules.php', 83, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2018-12-24 10:48:41'),
(17, 8192, 'Runtime Notice', 'The each() function is deprecated. This message will be suppressed on further calls', 'C:\\xampp\\htdocs\\ACH\\application\\third_party\\MX\\Modules.php', 83, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2018-12-24 10:48:44'),
(18, 0, '0', 'Unable to locate the model you have specified: Adddata_model', 'C:\\xampp\\htdocs\\ACH\\system\\core\\Loader.php', 348, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2018-12-24 10:50:10'),
(19, 0, '0', 'Unable to locate the model you have specified: Adddata_model', 'C:\\xampp\\htdocs\\ACH\\system\\core\\Loader.php', 348, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2018-12-24 10:51:04'),
(20, 0, '0', 'Unable to locate the model you have specified: Adddata_model', 'C:\\xampp\\htdocs\\ACH\\system\\core\\Loader.php', 348, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2018-12-24 10:51:27'),
(21, 0, '0', 'Unable to locate the model you have specified: Adddata_model', 'C:\\xampp\\htdocs\\ACH\\system\\core\\Loader.php', 348, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2018-12-24 10:51:44'),
(22, 0, '0', 'Unable to locate the model you have specified: Adddata_model', 'C:\\xampp\\htdocs\\ACH\\system\\core\\Loader.php', 348, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2018-12-24 10:52:39'),
(23, 0, '0', 'Unable to locate the model you have specified: Adddata_model', 'C:\\xampp\\htdocs\\ACH\\system\\core\\Loader.php', 348, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2018-12-24 10:52:43'),
(24, 8192, 'Runtime Notice', 'The each() function is deprecated. This message will be suppressed on further calls', 'C:\\xampp\\htdocs\\ACH\\application\\third_party\\MX\\Modules.php', 83, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2018-12-24 10:52:51'),
(25, 0, '0', 'Unable to locate the model you have specified: Adddata_model', 'C:\\xampp\\htdocs\\ACH\\system\\core\\Loader.php', 348, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2018-12-24 10:52:58'),
(26, 0, '0', 'Unable to locate the model you have specified: Adddata_model', 'C:\\xampp\\htdocs\\ACH\\system\\core\\Loader.php', 348, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2018-12-24 10:59:57'),
(27, 0, '0', 'Unable to locate the model you have specified: Adddata_model', 'C:\\xampp\\htdocs\\ACH\\system\\core\\Loader.php', 348, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2018-12-24 10:59:59'),
(28, 0, '0', 'Unable to locate the model you have specified: Adddata_model', 'C:\\xampp\\htdocs\\ACH\\system\\core\\Loader.php', 348, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2018-12-24 11:00:01'),
(29, 0, '0', 'Unable to locate the model you have specified: Adddata_model', 'C:\\xampp\\htdocs\\ACH\\system\\core\\Loader.php', 348, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2018-12-24 11:00:06'),
(30, 0, '0', 'Unable to locate the model you have specified: Adddata_model', 'C:\\xampp\\htdocs\\ACH\\system\\core\\Loader.php', 348, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2018-12-24 11:05:14'),
(31, 0, '0', 'Unable to locate the model you have specified: Adddata_model', 'C:\\xampp\\htdocs\\ACH\\system\\core\\Loader.php', 348, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2018-12-24 11:06:57'),
(32, 0, '0', 'Unable to locate the model you have specified: Adddata_model', 'C:\\xampp\\htdocs\\ACH\\system\\core\\Loader.php', 348, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2018-12-24 11:08:48'),
(33, 0, '0', 'Unable to locate the model you have specified: Adddata_model', 'C:\\xampp\\htdocs\\ACH\\system\\core\\Loader.php', 348, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2018-12-24 11:09:07'),
(34, 0, '0', 'Unable to locate the model you have specified: Adddata_model', 'C:\\xampp\\htdocs\\ACH\\system\\core\\Loader.php', 348, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2018-12-24 11:10:53'),
(35, 0, '0', 'Unable to locate the model you have specified: Adddata_model', 'C:\\xampp\\htdocs\\ACH\\system\\core\\Loader.php', 348, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2018-12-24 11:10:54'),
(36, 0, '0', 'Call to undefined method MY_Loader::_ci_object_to_array()', 'C:\\xampp\\htdocs\\ACH\\application\\third_party\\MX\\Loader.php', 300, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2018-12-24 11:11:21'),
(37, 0, '0', 'Call to undefined method MY_Loader::_ci_object_to_array()', 'C:\\xampp\\htdocs\\ACH\\application\\third_party\\MX\\Loader.php', 300, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2018-12-24 11:11:56'),
(38, 0, '0', 'Call to undefined method MY_Loader::_ci_object_to_array()', 'C:\\xampp\\htdocs\\ACH\\application\\third_party\\MX\\Loader.php', 300, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2018-12-24 11:11:58'),
(39, 0, '0', 'Call to undefined method MY_Loader::_ci_object_to_array()', 'C:\\xampp\\htdocs\\ACH\\application\\third_party\\MX\\Loader.php', 300, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2018-12-24 11:11:59'),
(40, 0, '0', 'Call to undefined method MY_Loader::_ci_object_to_array()', 'C:\\xampp\\htdocs\\ACH\\application\\third_party\\MX\\Loader.php', 300, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2018-12-24 11:12:26'),
(41, 0, '0', 'Call to undefined method MY_Loader::_ci_object_to_array()', 'C:\\xampp\\htdocs\\ACH\\application\\third_party\\MX\\Loader.php', 300, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2018-12-24 11:12:33'),
(42, 0, '0', 'Call to undefined method MY_Loader::_ci_object_to_array()', 'C:\\xampp\\htdocs\\ACH\\application\\third_party\\MX\\Loader.php', 300, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2018-12-24 11:12:42'),
(43, 0, '0', 'Call to undefined method MY_Loader::_ci_object_to_array()', 'C:\\xampp\\htdocs\\ACH\\application\\third_party\\MX\\Loader.php', 300, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2018-12-24 11:13:19'),
(44, 0, '0', 'Call to undefined method MY_Loader::_ci_object_to_array()', 'C:\\xampp\\htdocs\\ACH\\application\\third_party\\MX\\Loader.php', 300, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2018-12-24 11:13:20'),
(45, 0, '0', 'Call to undefined method MY_Loader::_ci_object_to_array()', 'C:\\xampp\\htdocs\\ACH\\application\\third_party\\MX\\Loader.php', 300, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2018-12-24 11:14:26'),
(46, 0, '0', 'Call to undefined method MY_Loader::_ci_object_to_array()', 'C:\\xampp\\htdocs\\ACH\\application\\third_party\\MX\\Loader.php', 300, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2018-12-24 11:14:27'),
(47, 0, '0', 'Call to undefined method MY_Loader::_ci_object_to_array()', 'C:\\xampp\\htdocs\\ACH\\application\\third_party\\MX\\Loader.php', 300, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2018-12-24 11:14:27'),
(48, 8192, 'Runtime Notice', 'The each() function is deprecated. This message will be suppressed on further calls', 'C:\\xampp\\htdocs\\ACH\\application\\third_party\\MX\\Modules.php', 82, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2018-12-24 11:15:37'),
(49, 8192, 'Runtime Notice', 'The each() function is deprecated. This message will be suppressed on further calls', 'C:\\xampp\\htdocs\\ACH\\application\\third_party\\MX\\Modules.php', 82, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2018-12-24 11:15:54'),
(50, 8192, 'Runtime Notice', 'The each() function is deprecated. This message will be suppressed on further calls', 'C:\\xampp\\htdocs\\ACH\\application\\third_party\\MX\\Modules.php', 82, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2018-12-24 11:17:23'),
(51, 8192, 'Runtime Notice', 'The each() function is deprecated. This message will be suppressed on further calls', 'C:\\xampp\\htdocs\\ACH\\application\\third_party\\MX\\Modules.php', 82, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2018-12-24 11:18:07'),
(52, 8192, 'Runtime Notice', 'The each() function is deprecated. This message will be suppressed on further calls', 'C:\\xampp\\htdocs\\ACH\\application\\third_party\\MX\\Modules.php', 82, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2018-12-24 11:18:08'),
(53, 8192, 'Runtime Notice', 'The each() function is deprecated. This message will be suppressed on further calls', 'C:\\xampp\\htdocs\\ACH\\application\\third_party\\MX\\Modules.php', 82, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2018-12-24 11:19:09'),
(54, 8192, 'Runtime Notice', 'The each() function is deprecated. This message will be suppressed on further calls', 'C:\\xampp\\htdocs\\ACH\\application\\third_party\\MX\\Modules.php', 82, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2018-12-24 11:20:01'),
(55, 8192, 'Runtime Notice', 'The each() function is deprecated. This message will be suppressed on further calls', 'C:\\xampp\\htdocs\\ACH\\application\\third_party\\MX\\Modules.php', 82, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2018-12-24 11:20:04'),
(56, 8192, 'Runtime Notice', 'The each() function is deprecated. This message will be suppressed on further calls', 'C:\\xampp\\htdocs\\ACH\\application\\third_party\\MX\\Modules.php', 82, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2018-12-24 11:22:59'),
(57, 8192, 'Runtime Notice', 'The each() function is deprecated. This message will be suppressed on further calls', 'C:\\xampp\\htdocs\\ACH\\application\\third_party\\MX\\Modules.php', 82, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2018-12-24 11:23:01'),
(58, 0, '0', 'Call to undefined method MY_Loader::_ci_object_to_array()', 'C:\\xampp\\htdocs\\ACH\\application\\third_party\\MX\\Loader.php', 300, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2018-12-24 11:23:11'),
(59, 0, '0', 'Call to undefined method MY_Loader::_ci_object_to_array()', 'C:\\xampp\\htdocs\\ACH\\application\\third_party\\MX\\Loader.php', 300, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2018-12-24 11:23:42'),
(60, 0, '0', 'Call to undefined method MY_Loader::_ci_object_to_array()', 'C:\\xampp\\htdocs\\ACH\\application\\third_party\\MX\\Loader.php', 300, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2018-12-24 11:24:18'),
(61, 8192, 'Runtime Notice', 'The each() function is deprecated. This message will be suppressed on further calls', 'C:\\xampp\\htdocs\\ACH\\application\\third_party\\MX\\Modules.php', 82, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2018-12-24 11:30:44'),
(62, 8192, 'Runtime Notice', 'The each() function is deprecated. This message will be suppressed on further calls', 'C:\\xampp\\htdocs\\ACH\\application\\third_party\\MX\\Modules.php', 82, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2018-12-24 11:30:56'),
(63, 8192, 'Runtime Notice', 'The each() function is deprecated. This message will be suppressed on further calls', 'C:\\xampp\\htdocs\\ACH\\application\\third_party\\MX\\Modules.php', 82, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2018-12-24 11:31:21'),
(64, 8192, 'Runtime Notice', 'The each() function is deprecated. This message will be suppressed on further calls', 'C:\\xampp\\htdocs\\ACH\\application\\third_party\\MX\\Modules.php', 82, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2018-12-24 11:31:50'),
(65, 8192, 'Runtime Notice', 'The each() function is deprecated. This message will be suppressed on further calls', 'C:\\xampp\\htdocs\\ACH\\application\\third_party\\MX\\Modules.php', 82, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2018-12-24 11:32:01'),
(66, 0, '0', 'Call to undefined method MY_Loader::_ci_object_to_array()', 'C:\\xampp\\htdocs\\ACH\\application\\third_party\\MX\\Loader.php', 300, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2018-12-24 11:32:12'),
(67, 0, '0', 'Call to undefined method MY_Loader::_ci_object_to_array()', 'C:\\xampp\\htdocs\\ACH\\application\\third_party\\MX\\Loader.php', 300, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2018-12-24 11:32:22'),
(68, 0, '0', 'Call to undefined method MY_Loader::_ci_object_to_array()', 'C:\\xampp\\htdocs\\ACH\\application\\third_party\\MX\\Loader.php', 300, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2018-12-24 11:32:30'),
(69, 8192, 'Runtime Notice', 'The each() function is deprecated. This message will be suppressed on further calls', 'C:\\xampp\\htdocs\\ACH\\application\\third_party\\MX\\Modules.php', 82, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2018-12-24 11:32:43'),
(70, 2, 'Warning', 'include(C:\\xampp\\htdocs\\ACH\\application\\vendor/firebase/php-jwt/src/JWT.php): failed to open stream: No such file or directory', 'C:\\xampp\\htdocs\\ACH\\application\\core\\MY_Controller.php', 11, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2018-12-24 11:34:12'),
(71, 2, 'Warning', 'include(): Failed opening \'C:\\xampp\\htdocs\\ACH\\application\\vendor/firebase/php-jwt/src/JWT.php\' for inclusion (include_path=\'C:\\xampp\\php\\PEAR\')', 'C:\\xampp\\htdocs\\ACH\\application\\core\\MY_Controller.php', 11, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2018-12-24 11:34:12'),
(72, 8192, 'Runtime Notice', 'The each() function is deprecated. This message will be suppressed on further calls', 'C:\\xampp\\htdocs\\ACH\\application\\third_party\\MX\\Modules.php', 82, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2018-12-24 11:34:12'),
(73, 2, 'Warning', 'include(C:\\xampp\\htdocs\\ACH\\application\\vendor/firebase/php-jwt/src/JWT.php): failed to open stream: No such file or directory', 'C:\\xampp\\htdocs\\ACH\\application\\core\\MY_Controller.php', 11, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2018-12-24 11:34:14'),
(74, 2, 'Warning', 'include(): Failed opening \'C:\\xampp\\htdocs\\ACH\\application\\vendor/firebase/php-jwt/src/JWT.php\' for inclusion (include_path=\'C:\\xampp\\php\\PEAR\')', 'C:\\xampp\\htdocs\\ACH\\application\\core\\MY_Controller.php', 11, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2018-12-24 11:34:14'),
(75, 8192, 'Runtime Notice', 'The each() function is deprecated. This message will be suppressed on further calls', 'C:\\xampp\\htdocs\\ACH\\application\\third_party\\MX\\Modules.php', 82, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2018-12-24 11:34:14'),
(76, 0, '0', 'Call to undefined method MY_Loader::_ci_object_to_array()', 'C:\\xampp\\htdocs\\ACH\\application\\third_party\\MX\\Loader.php', 300, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2018-12-24 11:35:33'),
(77, 8192, 'Runtime Notice', 'The each() function is deprecated. This message will be suppressed on further calls', 'C:\\xampp\\htdocs\\ACH\\application\\third_party\\MX\\Modules.php', 82, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2018-12-24 11:35:40'),
(78, 8192, 'Runtime Notice', 'The each() function is deprecated. This message will be suppressed on further calls', 'C:\\xampp\\htdocs\\ACH\\application\\third_party\\MX\\Modules.php', 82, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2018-12-24 11:36:24'),
(79, 8192, 'Runtime Notice', 'The each() function is deprecated. This message will be suppressed on further calls', 'C:\\xampp\\htdocs\\ACH\\application\\third_party\\MX\\Modules.php', 82, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2018-12-24 11:36:25'),
(80, 8192, 'Runtime Notice', 'The each() function is deprecated. This message will be suppressed on further calls', 'C:\\xampp\\htdocs\\ACH\\application\\third_party\\MX\\Modules.php', 82, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2018-12-24 11:36:28'),
(81, 8192, 'Runtime Notice', 'The each() function is deprecated. This message will be suppressed on further calls', 'C:\\xampp\\htdocs\\ACH\\application\\third_party\\MX\\Modules.php', 82, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2018-12-24 11:37:08'),
(82, 8192, 'Runtime Notice', 'The each() function is deprecated. This message will be suppressed on further calls', 'C:\\xampp\\htdocs\\ACH\\application\\third_party\\MX\\Modules.php', 82, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2018-12-24 11:37:57'),
(83, 8192, 'Runtime Notice', 'The each() function is deprecated. This message will be suppressed on further calls', 'C:\\xampp\\htdocs\\ACH\\application\\third_party\\MX\\Modules.php', 82, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2018-12-24 11:38:02'),
(84, 8192, 'Runtime Notice', 'The each() function is deprecated. This message will be suppressed on further calls', 'C:\\xampp\\htdocs\\ACH\\application\\third_party\\MX\\Modules.php', 82, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2018-12-24 11:38:10'),
(85, 8192, 'Runtime Notice', 'The each() function is deprecated. This message will be suppressed on further calls', 'C:\\xampp\\htdocs\\ACH\\application\\third_party\\MX\\Modules.php', 82, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2018-12-24 11:38:27'),
(86, 8192, 'Runtime Notice', 'The each() function is deprecated. This message will be suppressed on further calls', 'C:\\xampp\\htdocs\\ACH\\application\\third_party\\MX\\Modules.php', 82, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2018-12-24 11:39:00'),
(87, 8192, 'Runtime Notice', 'The each() function is deprecated. This message will be suppressed on further calls', 'C:\\xampp\\htdocs\\ACH\\application\\third_party\\MX\\Modules.php', 82, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2018-12-24 11:43:38'),
(88, 8192, 'Runtime Notice', 'The each() function is deprecated. This message will be suppressed on further calls', 'C:\\xampp\\htdocs\\ACH\\application\\third_party\\MX\\Modules.php', 82, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2018-12-24 11:44:28'),
(89, 8192, 'Runtime Notice', 'The each() function is deprecated. This message will be suppressed on further calls', 'C:\\xampp\\htdocs\\ACH\\application\\third_party\\MX\\Modules.php', 82, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2018-12-24 11:44:30'),
(90, 8192, 'Runtime Notice', 'The each() function is deprecated. This message will be suppressed on further calls', 'C:\\xampp\\htdocs\\ACH\\application\\third_party\\MX\\Modules.php', 82, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2018-12-24 11:45:09'),
(91, 8192, 'Runtime Notice', 'The each() function is deprecated. This message will be suppressed on further calls', 'C:\\xampp\\htdocs\\ACH\\application\\third_party\\MX\\Modules.php', 82, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2018-12-24 11:45:17'),
(92, 8192, 'Runtime Notice', 'The each() function is deprecated. This message will be suppressed on further calls', 'C:\\xampp\\htdocs\\ACH\\application\\third_party\\MX\\Modules.php', 82, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2018-12-24 11:45:20'),
(93, 8192, 'Runtime Notice', 'The each() function is deprecated. This message will be suppressed on further calls', 'C:\\xampp\\htdocs\\ACH\\application\\third_party\\MX\\Modules.php', 82, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2018-12-24 11:45:30'),
(94, 8192, 'Runtime Notice', 'The each() function is deprecated. This message will be suppressed on further calls', 'C:\\xampp\\htdocs\\ACH\\application\\third_party\\MX\\Modules.php', 82, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2018-12-24 11:45:43'),
(95, 8192, 'Runtime Notice', 'The each() function is deprecated. This message will be suppressed on further calls', 'C:\\xampp\\htdocs\\ACH\\application\\third_party\\MX\\Modules.php', 82, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2018-12-24 11:45:45'),
(96, 8192, 'Runtime Notice', 'The each() function is deprecated. This message will be suppressed on further calls', 'C:\\xampp\\htdocs\\ACH\\application\\third_party\\MX\\Modules.php', 82, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2018-12-24 11:45:49'),
(97, 0, '0', 'Call to undefined method MY_Loader::_ci_object_to_array()', 'C:\\xampp\\htdocs\\ACH\\application\\third_party\\MX\\Loader.php', 300, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2018-12-24 11:46:18'),
(98, 0, '0', 'Call to undefined method MY_Loader::_ci_object_to_array()', 'C:\\xampp\\htdocs\\ACH\\application\\third_party\\MX\\Loader.php', 300, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2018-12-24 11:46:28'),
(99, 0, '0', 'Call to undefined method MY_Loader::_ci_object_to_array()', 'C:\\xampp\\htdocs\\ACH\\application\\third_party\\MX\\Loader.php', 300, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2018-12-24 11:49:04'),
(100, 0, '0', 'Call to undefined method MY_Loader::_ci_object_to_array()', 'C:\\xampp\\htdocs\\ACH\\application\\third_party\\MX\\Loader.php', 300, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2018-12-24 11:49:09'),
(101, 0, '0', 'Call to undefined method MY_Loader::_ci_object_to_array()', 'C:\\xampp\\htdocs\\ACH\\application\\third_party\\MX\\Loader.php', 300, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2018-12-24 11:53:06'),
(102, 0, '0', 'Call to undefined method MY_Loader::_ci_object_to_array()', 'C:\\xampp\\htdocs\\ACH\\application\\third_party\\MX\\Loader.php', 300, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2018-12-24 11:53:07'),
(103, 0, '0', 'Call to undefined method MY_Loader::_ci_object_to_array()', 'C:\\xampp\\htdocs\\ACH\\application\\third_party\\MX\\Loader.php', 300, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2018-12-24 11:53:28'),
(104, 0, '0', 'Call to undefined method MY_Loader::_ci_object_to_array()', 'C:\\xampp\\htdocs\\ACH\\application\\third_party\\MX\\Loader.php', 300, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2018-12-24 11:53:38'),
(105, 8192, 'Runtime Notice', 'The each() function is deprecated. This message will be suppressed on further calls', 'C:\\xampp\\htdocs\\ACH\\application\\third_party\\MX\\Modules.php', 82, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2018-12-24 11:53:52'),
(106, 8192, 'Runtime Notice', 'The each() function is deprecated. This message will be suppressed on further calls', 'C:\\xampp\\htdocs\\ACH\\application\\third_party\\MX\\Modules.php', 82, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2018-12-24 11:55:31'),
(107, 8192, 'Runtime Notice', 'The each() function is deprecated. This message will be suppressed on further calls', 'C:\\xampp\\htdocs\\ACH\\application\\third_party\\MX\\Modules.php', 82, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2018-12-24 11:55:41'),
(108, 8192, 'Runtime Notice', 'The each() function is deprecated. This message will be suppressed on further calls', 'C:\\xampp\\htdocs\\ACH\\application\\third_party\\MX\\Modules.php', 82, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2018-12-24 11:55:46'),
(109, 8192, 'Runtime Notice', 'The each() function is deprecated. This message will be suppressed on further calls', 'C:\\xampp\\htdocs\\ACH\\application\\third_party\\MX\\Modules.php', 82, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2018-12-24 11:56:29'),
(110, 2, 'Warning', 'include(C:\\xampp\\htdocs\\ACH\\application\\vendor/firebase/php-jwt/src/JWT.php): failed to open stream: No such file or directory', 'C:\\xampp\\htdocs\\ACH\\application\\core\\MY_Controller.php', 13, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2018-12-24 11:58:01'),
(111, 2, 'Warning', 'include(): Failed opening \'C:\\xampp\\htdocs\\ACH\\application\\vendor/firebase/php-jwt/src/JWT.php\' for inclusion (include_path=\'C:\\xampp\\php\\PEAR\')', 'C:\\xampp\\htdocs\\ACH\\application\\core\\MY_Controller.php', 13, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2018-12-24 11:58:01'),
(112, 8192, 'Runtime Notice', 'The each() function is deprecated. This message will be suppressed on further calls', 'C:\\xampp\\htdocs\\ACH\\application\\third_party\\MX\\Modules.php', 82, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2018-12-24 11:58:01'),
(113, 2, 'Warning', 'include(C:\\xampp\\htdocs\\ACH\\application\\vendor/firebase/php-jwt/src/JWT.php): failed to open stream: No such file or directory', 'C:\\xampp\\htdocs\\ACH\\application\\core\\MY_Controller.php', 13, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2018-12-24 11:58:15'),
(114, 2, 'Warning', 'include(): Failed opening \'C:\\xampp\\htdocs\\ACH\\application\\vendor/firebase/php-jwt/src/JWT.php\' for inclusion (include_path=\'C:\\xampp\\php\\PEAR\')', 'C:\\xampp\\htdocs\\ACH\\application\\core\\MY_Controller.php', 13, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2018-12-24 11:58:15'),
(115, 0, '0', 'Call to undefined method MY_Loader::_ci_object_to_array()', 'C:\\xampp\\htdocs\\ACH\\application\\third_party\\MX\\Loader.php', 300, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2018-12-24 11:58:15'),
(116, 2, 'Warning', 'include(C:\\xampp\\htdocs\\ACH\\application\\vendor/firebase/php-jwt/src/JWT.php): failed to open stream: No such file or directory', 'C:\\xampp\\htdocs\\ACH\\application\\core\\MY_Controller.php', 13, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2018-12-24 11:58:25'),
(117, 2, 'Warning', 'include(): Failed opening \'C:\\xampp\\htdocs\\ACH\\application\\vendor/firebase/php-jwt/src/JWT.php\' for inclusion (include_path=\'C:\\xampp\\php\\PEAR\')', 'C:\\xampp\\htdocs\\ACH\\application\\core\\MY_Controller.php', 13, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2018-12-24 11:58:25'),
(118, 0, '0', 'Call to undefined method MY_Loader::_ci_object_to_array()', 'C:\\xampp\\htdocs\\ACH\\application\\third_party\\MX\\Loader.php', 300, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2018-12-24 11:58:25'),
(119, 2, 'Warning', 'include(C:\\xampp\\htdocs\\ACH\\application\\vendor/firebase/php-jwt/src/JWT.php): failed to open stream: No such file or directory', 'C:\\xampp\\htdocs\\ACH\\application\\core\\MY_Controller.php', 13, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2018-12-24 12:00:22'),
(120, 2, 'Warning', 'include(): Failed opening \'C:\\xampp\\htdocs\\ACH\\application\\vendor/firebase/php-jwt/src/JWT.php\' for inclusion (include_path=\'C:\\xampp\\php\\PEAR\')', 'C:\\xampp\\htdocs\\ACH\\application\\core\\MY_Controller.php', 13, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2018-12-24 12:00:22'),
(121, 0, '0', 'Call to undefined method MY_Loader::_ci_object_to_array()', 'C:\\xampp\\htdocs\\ACH\\application\\third_party\\MX\\Loader.php', 300, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2018-12-24 12:00:22'),
(122, 2, 'Warning', 'include(C:\\xampp\\htdocs\\ACH\\application\\vendor/firebase/php-jwt/src/JWT.php): failed to open stream: No such file or directory', 'C:\\xampp\\htdocs\\ACH\\application\\core\\MY_Controller.php', 13, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2018-12-24 12:00:31'),
(123, 2, 'Warning', 'include(): Failed opening \'C:\\xampp\\htdocs\\ACH\\application\\vendor/firebase/php-jwt/src/JWT.php\' for inclusion (include_path=\'C:\\xampp\\php\\PEAR\')', 'C:\\xampp\\htdocs\\ACH\\application\\core\\MY_Controller.php', 13, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2018-12-24 12:00:31'),
(124, 0, '0', 'Call to undefined method MY_Loader::_ci_object_to_array()', 'C:\\xampp\\htdocs\\ACH\\application\\third_party\\MX\\Loader.php', 300, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2018-12-24 12:00:31'),
(125, 2, 'Warning', 'include(C:\\xampp\\htdocs\\ACH\\application\\vendor/firebase/php-jwt/src/JWT.php): failed to open stream: No such file or directory', 'C:\\xampp\\htdocs\\ACH\\application\\core\\MY_Controller.php', 13, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2018-12-24 12:00:38'),
(126, 2, 'Warning', 'include(): Failed opening \'C:\\xampp\\htdocs\\ACH\\application\\vendor/firebase/php-jwt/src/JWT.php\' for inclusion (include_path=\'C:\\xampp\\php\\PEAR\')', 'C:\\xampp\\htdocs\\ACH\\application\\core\\MY_Controller.php', 13, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2018-12-24 12:00:38'),
(127, 0, '0', 'Call to undefined method MY_Loader::_ci_object_to_array()', 'C:\\xampp\\htdocs\\ACH\\application\\third_party\\MX\\Loader.php', 300, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2018-12-24 12:00:38'),
(128, 8192, 'Runtime Notice', 'The each() function is deprecated. This message will be suppressed on further calls', 'C:\\xampp\\htdocs\\ACH\\application\\third_party\\MX\\Modules.php', 82, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2018-12-24 12:00:57'),
(129, 8192, 'Runtime Notice', 'The each() function is deprecated. This message will be suppressed on further calls', 'C:\\xampp\\htdocs\\ACH\\application\\third_party\\MX\\Modules.php', 82, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2018-12-24 12:02:07'),
(130, 8192, 'Runtime Notice', 'The each() function is deprecated. This message will be suppressed on further calls', 'C:\\xampp\\htdocs\\ACH\\application\\third_party\\MX\\Modules.php', 82, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2018-12-24 12:02:39'),
(131, 0, '0', 'Call to undefined method MY_Loader::_ci_object_to_array()', 'C:\\xampp\\htdocs\\ACH\\application\\third_party\\MX\\Loader.php', 300, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2018-12-24 12:03:05'),
(132, 2, 'Warning', 'include(footer.php): failed to open stream: No such file or directory', 'C:\\xampp\\htdocs\\ACH\\application\\modules\\AchForm\\views\\AchForm.php', 242, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2018-12-24 12:15:27'),
(133, 2, 'Warning', 'include(): Failed opening \'footer.php\' for inclusion (include_path=\'C:\\xampp\\php\\PEAR\')', 'C:\\xampp\\htdocs\\ACH\\application\\modules\\AchForm\\views\\AchForm.php', 242, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2018-12-24 12:15:27'),
(134, 2, 'Warning', 'include(footer.php): failed to open stream: No such file or directory', 'C:\\xampp\\htdocs\\ACH\\application\\modules\\AchForm\\views\\AchForm.php', 242, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2018-12-24 12:15:30'),
(135, 2, 'Warning', 'include(): Failed opening \'footer.php\' for inclusion (include_path=\'C:\\xampp\\php\\PEAR\')', 'C:\\xampp\\htdocs\\ACH\\application\\modules\\AchForm\\views\\AchForm.php', 242, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2018-12-24 12:15:30'),
(136, 2, 'Warning', 'include(footer.php): failed to open stream: No such file or directory', 'C:\\xampp\\htdocs\\ACH\\application\\modules\\AchForm\\views\\AchForm.php', 242, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2018-12-24 12:15:46'),
(137, 2, 'Warning', 'include(): Failed opening \'footer.php\' for inclusion (include_path=\'C:\\xampp\\php\\PEAR\')', 'C:\\xampp\\htdocs\\ACH\\application\\modules\\AchForm\\views\\AchForm.php', 242, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2018-12-24 12:15:46'),
(138, 2, 'Warning', 'include(footer.php): failed to open stream: No such file or directory', 'C:\\xampp\\htdocs\\ACH\\application\\modules\\AchForm\\views\\AchForm.php', 242, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2018-12-24 12:15:46'),
(139, 2, 'Warning', 'include(): Failed opening \'footer.php\' for inclusion (include_path=\'C:\\xampp\\php\\PEAR\')', 'C:\\xampp\\htdocs\\ACH\\application\\modules\\AchForm\\views\\AchForm.php', 242, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2018-12-24 12:15:47'),
(140, 2, 'Warning', 'include(footer.php): failed to open stream: No such file or directory', 'C:\\xampp\\htdocs\\ACH\\application\\modules\\AchForm\\views\\AchForm.php', 242, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2018-12-24 12:16:00'),
(141, 2, 'Warning', 'include(): Failed opening \'footer.php\' for inclusion (include_path=\'C:\\xampp\\php\\PEAR\')', 'C:\\xampp\\htdocs\\ACH\\application\\modules\\AchForm\\views\\AchForm.php', 242, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2018-12-24 12:16:00'),
(142, 2, 'Warning', 'include(footer.php): failed to open stream: No such file or directory', 'C:\\xampp\\htdocs\\ACH\\application\\modules\\AchForm\\views\\AchForm.php', 242, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2018-12-24 12:16:07'),
(143, 2, 'Warning', 'include(): Failed opening \'footer.php\' for inclusion (include_path=\'C:\\xampp\\php\\PEAR\')', 'C:\\xampp\\htdocs\\ACH\\application\\modules\\AchForm\\views\\AchForm.php', 242, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2018-12-24 12:16:07'),
(144, 0, '0', 'Unable to locate the model you have specified: AchList_model', 'C:\\xampp\\htdocs\\ACH\\system\\core\\Loader.php', 348, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2018-12-24 13:03:04'),
(145, 8, 'Notice', 'Array to string conversion', 'C:\\xampp\\htdocs\\ACH-master\\api\\application\\modules\\Ach\\controllers\\Ach.php', 22, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2019-01-10 14:57:50'),
(146, 8, 'Notice', 'Array to string conversion', 'C:\\xampp\\htdocs\\ACH-master\\api\\application\\modules\\Ach\\controllers\\Ach.php', 22, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2019-01-10 14:58:08'),
(147, 8, 'Notice', 'Array to string conversion', 'C:\\xampp\\htdocs\\ACH-master\\api\\application\\modules\\Ach\\controllers\\Ach.php', 22, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2019-01-10 14:58:18'),
(148, 8, 'Notice', 'Array to string conversion', 'C:\\xampp\\htdocs\\ACH-master\\api\\application\\modules\\Ach\\controllers\\Ach.php', 22, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2019-01-10 15:10:50'),
(149, 8, 'Notice', 'Array to string conversion', 'C:\\xampp\\htdocs\\ACH-master\\api\\application\\modules\\Ach\\controllers\\Ach.php', 22, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2019-01-10 15:22:38'),
(150, 8, 'Notice', 'Array to string conversion', 'C:\\xampp\\htdocs\\ACH-master\\api\\application\\modules\\Ach\\controllers\\Ach.php', 22, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2019-01-10 15:28:45'),
(151, 8, 'Notice', 'Array to string conversion', 'C:\\xampp\\htdocs\\ACH-master\\api\\application\\modules\\Ach\\controllers\\Ach.php', 23, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2019-01-11 08:40:44'),
(152, 8, 'Notice', 'Array to string conversion', 'C:\\xampp\\htdocs\\ACH-master\\api\\application\\modules\\Ach\\controllers\\Ach.php', 24, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2019-01-11 08:57:31'),
(153, 8, 'Notice', 'Array to string conversion', 'C:\\xampp\\htdocs\\ACH-master\\api\\application\\modules\\Ach\\controllers\\Ach.php', 24, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2019-01-11 09:35:43'),
(154, 8, 'Notice', 'Array to string conversion', 'C:\\xampp\\htdocs\\ACH-master\\api\\application\\modules\\Ach\\controllers\\Ach.php', 24, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2019-01-11 09:47:18'),
(155, 8, 'Notice', 'Array to string conversion', 'C:\\xampp\\htdocs\\ACH-master\\api\\application\\modules\\Ach\\controllers\\Ach.php', 24, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2019-01-11 09:49:05'),
(156, 8, 'Notice', 'Array to string conversion', 'C:\\xampp\\htdocs\\ACH-master\\api\\application\\modules\\Ach\\controllers\\Ach.php', 24, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2019-01-11 09:49:49'),
(157, 8, 'Notice', 'Array to string conversion', 'C:\\xampp\\htdocs\\ACH-master\\api\\application\\modules\\Ach\\controllers\\Ach.php', 24, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2019-01-11 09:59:27'),
(158, 8, 'Notice', 'Array to string conversion', 'C:\\xampp\\htdocs\\ACH-master\\api\\application\\modules\\Ach\\controllers\\Ach.php', 24, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2019-01-11 11:50:15'),
(159, 8, 'Notice', 'Array to string conversion', 'C:\\xampp\\htdocs\\ACH-master\\api\\application\\modules\\Ach\\controllers\\Ach.php', 24, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2019-01-11 11:56:26'),
(160, 8, 'Notice', 'Array to string conversion', 'C:\\xampp\\htdocs\\ACH-master\\api\\application\\modules\\Ach\\controllers\\Ach.php', 24, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2019-01-11 13:01:03'),
(161, 8, 'Notice', 'Undefined variable: post_Department', 'C:\\xampp\\htdocs\\ACH-master\\api\\application\\modules\\Ach\\controllers\\Ach.php', 23, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2019-01-11 13:04:03'),
(162, 0, '0', 'Unable to locate the model you have specified: AchList_model', 'C:\\xampp\\htdocs\\ACH-master\\api\\system\\core\\Loader.php', 348, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2019-01-11 13:21:34');
INSERT INTO `logs` (`id`, `errno`, `errtype`, `errstr`, `errfile`, `errline`, `user_agent`, `ip_address`, `time`) VALUES
(163, 0, '0', 'Unable to locate the model you have specified: AchList_model', 'C:\\xampp\\htdocs\\ACH-master\\api\\system\\core\\Loader.php', 348, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2019-01-11 13:21:34'),
(164, 0, '0', 'Unable to locate the model you have specified: AchList_model', 'C:\\xampp\\htdocs\\ACH-master\\api\\system\\core\\Loader.php', 348, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2019-01-11 13:23:03'),
(165, 0, '0', 'Unable to locate the model you have specified: AchList_model', 'C:\\xampp\\htdocs\\ACH-master\\api\\system\\core\\Loader.php', 348, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2019-01-11 13:23:04'),
(166, 0, '0', 'Unable to locate the model you have specified: AchList_model', 'C:\\xampp\\htdocs\\ACH-master\\api\\system\\core\\Loader.php', 348, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2019-01-11 13:28:04'),
(167, 0, '0', 'Unable to locate the model you have specified: AchList_model', 'C:\\xampp\\htdocs\\ACH-master\\api\\system\\core\\Loader.php', 348, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2019-01-11 13:28:04'),
(168, 0, '0', 'syntax error, unexpected \'}\', expecting end of file', 'C:\\xampp\\htdocs\\ACH-master\\api\\application\\modules\\Ach\\models\\Ach_model.php', 56, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2019-01-11 13:30:12'),
(169, 0, '0', 'syntax error, unexpected \'}\', expecting end of file', 'C:\\xampp\\htdocs\\ACH-master\\api\\application\\modules\\Ach\\models\\Ach_model.php', 56, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2019-01-11 13:30:12'),
(170, 0, '0', 'syntax error, unexpected \'}\', expecting end of file', 'C:\\xampp\\htdocs\\ACH-master\\api\\application\\modules\\Ach\\models\\Ach_model.php', 56, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2019-01-11 13:31:14'),
(171, 0, '0', 'syntax error, unexpected \'}\', expecting end of file', 'C:\\xampp\\htdocs\\ACH-master\\api\\application\\modules\\Ach\\models\\Ach_model.php', 56, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2019-01-11 13:31:14'),
(172, 8, 'Notice', 'Undefined property: Ach::$Ach_model', 'C:\\xampp\\htdocs\\ACH-master\\api\\application\\modules\\Ach\\controllers\\Ach.php', 23, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2019-01-11 13:46:15'),
(173, 0, '0', 'Call to a member function InsertRecord() on null', 'C:\\xampp\\htdocs\\ACH-master\\api\\application\\modules\\Ach\\controllers\\Ach.php', 23, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2019-01-11 13:46:15'),
(174, 8, 'Notice', 'Undefined property: Ach::$Ach_model', 'C:\\xampp\\htdocs\\ACH-master\\api\\application\\modules\\Ach\\controllers\\Ach.php', 23, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2019-01-11 14:08:29'),
(175, 0, '0', 'Call to a member function InsertRecord() on null', 'C:\\xampp\\htdocs\\ACH-master\\api\\application\\modules\\Ach\\controllers\\Ach.php', 23, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2019-01-11 14:08:29'),
(176, 8, 'Notice', 'Undefined property: Ach::$Ach_model', 'C:\\xampp\\htdocs\\ACH-master\\api\\application\\modules\\Ach\\controllers\\Ach.php', 23, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2019-01-11 14:10:37'),
(177, 0, '0', 'Call to a member function InsertRecord() on null', 'C:\\xampp\\htdocs\\ACH-master\\api\\application\\modules\\Ach\\controllers\\Ach.php', 23, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2019-01-11 14:10:37'),
(178, 8, 'Notice', 'Undefined property: Ach::$Ach_model', 'C:\\xampp\\htdocs\\ACH-master\\api\\application\\modules\\Ach\\controllers\\Ach.php', 23, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2019-01-11 14:18:37'),
(179, 0, '0', 'Call to a member function InsertRecord() on null', 'C:\\xampp\\htdocs\\ACH-master\\api\\application\\modules\\Ach\\controllers\\Ach.php', 23, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2019-01-11 14:18:37'),
(180, 8, 'Notice', 'Undefined property: Ach::$Ach_model', 'C:\\xampp\\htdocs\\ACH-master\\api\\application\\modules\\Ach\\controllers\\Ach.php', 23, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2019-01-11 14:24:48'),
(181, 0, '0', 'Call to a member function InsertRecord() on null', 'C:\\xampp\\htdocs\\ACH-master\\api\\application\\modules\\Ach\\controllers\\Ach.php', 23, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2019-01-11 14:24:48'),
(182, 8, 'Notice', 'Undefined property: Ach::$Ach_model', 'C:\\xampp\\htdocs\\ACH-master\\api\\application\\modules\\Ach\\controllers\\Ach.php', 23, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2019-01-11 14:32:35'),
(183, 0, '0', 'Call to a member function InsertRecord() on null', 'C:\\xampp\\htdocs\\ACH-master\\api\\application\\modules\\Ach\\controllers\\Ach.php', 23, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2019-01-11 14:32:35'),
(184, 8, 'Notice', 'Undefined variable: result', 'C:\\xampp\\htdocs\\ACH-master\\api\\application\\modules\\Ach\\controllers\\Ach.php', 29, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2019-01-11 14:34:20'),
(185, 8, 'Notice', 'Undefined property: Ach::$Ach_model', 'C:\\xampp\\htdocs\\ACH-master\\api\\application\\modules\\Ach\\controllers\\Ach.php', 11, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2019-01-15 09:17:08'),
(186, 0, '0', 'Call to a member function go() on null', 'C:\\xampp\\htdocs\\ACH-master\\api\\application\\modules\\Ach\\controllers\\Ach.php', 11, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2019-01-15 09:17:08'),
(187, 8, 'Notice', 'Undefined property: Ach::$Ach_model', 'C:\\xampp\\htdocs\\ACH-master\\api\\application\\modules\\Ach\\controllers\\Ach.php', 16, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2019-01-15 09:19:32'),
(188, 0, '0', 'Call to a member function InsertRecord() on null', 'C:\\xampp\\htdocs\\ACH-master\\api\\application\\modules\\Ach\\controllers\\Ach.php', 16, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2019-01-15 09:19:32'),
(189, 8, 'Notice', 'Undefined property: Ach::$Ach_model', 'C:\\xampp\\htdocs\\ACH-master\\api\\application\\modules\\Ach\\controllers\\Ach.php', 16, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2019-01-15 09:23:49'),
(190, 0, '0', 'Call to a member function InsertRecord() on null', 'C:\\xampp\\htdocs\\ACH-master\\api\\application\\modules\\Ach\\controllers\\Ach.php', 16, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2019-01-15 09:23:49'),
(191, 8, 'Notice', 'Undefined property: Ach::$Ach_model', 'C:\\xampp\\htdocs\\ACH-master\\api\\application\\modules\\Ach\\controllers\\Ach.php', 16, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2019-01-15 09:25:45'),
(192, 0, '0', 'Call to a member function InsertRecord() on null', 'C:\\xampp\\htdocs\\ACH-master\\api\\application\\modules\\Ach\\controllers\\Ach.php', 16, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2019-01-15 09:25:45'),
(193, 8, 'Notice', 'Undefined property: Ach::$Ach_model', 'C:\\xampp\\htdocs\\ACH-master\\api\\application\\modules\\Ach\\controllers\\Ach.php', 16, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2019-01-15 09:27:37'),
(194, 0, '0', 'Call to a member function InsertRecord() on null', 'C:\\xampp\\htdocs\\ACH-master\\api\\application\\modules\\Ach\\controllers\\Ach.php', 16, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2019-01-15 09:27:37'),
(195, 8, 'Notice', 'Undefined property: Ach::$Ach_model', 'C:\\xampp\\htdocs\\ACH-master\\api\\application\\modules\\Ach\\controllers\\Ach.php', 16, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2019-01-15 10:38:08'),
(196, 0, '0', 'Call to a member function InsertRecord() on null', 'C:\\xampp\\htdocs\\ACH-master\\api\\application\\modules\\Ach\\controllers\\Ach.php', 16, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2019-01-15 10:38:08'),
(197, 0, '0', 'syntax error, unexpected \'}\', expecting end of file', 'C:\\xampp\\htdocs\\ACH-master\\api\\application\\modules\\Ach\\models\\Ach_model.php', 83, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2019-01-15 10:41:07'),
(198, 0, '0', 'syntax error, unexpected \'}\', expecting end of file', 'C:\\xampp\\htdocs\\ACH-master\\api\\application\\modules\\Ach\\models\\Ach_model.php', 83, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2019-01-15 10:41:08'),
(199, 8, 'Notice', 'Undefined index: homeAdress', 'C:\\xampp\\htdocs\\ACH-master\\api\\application\\modules\\Ach\\models\\Ach_model.php', 21, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2019-01-15 10:46:25'),
(200, 8, 'Notice', 'Undefined index: pancard', 'C:\\xampp\\htdocs\\ACH-master\\api\\application\\modules\\Ach\\models\\Ach_model.php', 24, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2019-01-15 10:46:25'),
(201, 8, 'Notice', 'Undefined index: addressproof', 'C:\\xampp\\htdocs\\ACH-master\\api\\application\\modules\\Ach\\models\\Ach_model.php', 25, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2019-01-15 10:46:25'),
(202, 8, 'Notice', 'Undefined index: actype', 'C:\\xampp\\htdocs\\ACH-master\\api\\application\\modules\\Ach\\models\\Ach_model.php', 30, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2019-01-15 10:46:25'),
(203, 8, 'Notice', 'Undefined index: homeAdress', 'C:\\xampp\\htdocs\\ACH-master\\api\\application\\modules\\Ach\\models\\Ach_model.php', 21, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2019-01-15 11:00:20'),
(204, 8, 'Notice', 'Undefined index: pancard', 'C:\\xampp\\htdocs\\ACH-master\\api\\application\\modules\\Ach\\models\\Ach_model.php', 24, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2019-01-15 11:00:20'),
(205, 8, 'Notice', 'Undefined index: addressproof', 'C:\\xampp\\htdocs\\ACH-master\\api\\application\\modules\\Ach\\models\\Ach_model.php', 25, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2019-01-15 11:00:20'),
(206, 8, 'Notice', 'Undefined index: actype', 'C:\\xampp\\htdocs\\ACH-master\\api\\application\\modules\\Ach\\models\\Ach_model.php', 30, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2019-01-15 11:00:20'),
(207, 8, 'Notice', 'Undefined index: homeAdress', 'C:\\xampp\\htdocs\\ACH-master\\api\\application\\modules\\Ach\\models\\Ach_model.php', 21, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2019-01-15 11:05:23'),
(208, 8, 'Notice', 'Undefined index: addressproof', 'C:\\xampp\\htdocs\\ACH-master\\api\\application\\modules\\Ach\\models\\Ach_model.php', 25, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2019-01-15 11:05:24'),
(209, 8, 'Notice', 'Undefined index: actype', 'C:\\xampp\\htdocs\\ACH-master\\api\\application\\modules\\Ach\\models\\Ach_model.php', 30, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2019-01-15 11:05:24'),
(210, 8, 'Notice', 'Undefined index: homeAdress', 'C:\\xampp\\htdocs\\ACH-master\\api\\application\\modules\\Ach\\models\\Ach_model.php', 21, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '::1', '2019-01-15 11:09:36');

-- --------------------------------------------------------

--
-- Table structure for table `tblbank`
--

CREATE TABLE `tblbank` (
  `BankId` int(11) NOT NULL,
  `BankName` varchar(255) NOT NULL,
  `BankIFSCCode` varchar(20) NOT NULL,
  `BankAddress` text NOT NULL,
  `BankPhoneNumber` varchar(12) NOT NULL,
  `IsActive` bit(1) NOT NULL,
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
  `FirstName` varchar(100) NOT NULL,
  `LastName` varchar(100) NOT NULL,
  `Address` text NOT NULL,
  `PhoneNumber` varchar(13) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `PanCard` text NOT NULL,
  `AddressProof` text NOT NULL,
  `IsActive` bit(1) NOT NULL,
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
  `ACHInfoId` int(11) NOT NULL,
  `ACHUserId` int(11) NOT NULL,
  `ACHBankId` int(11) NOT NULL,
  `BankAccountNo` varchar(20) NOT NULL,
  `AccountType` varchar(10) NOT NULL,
  `PercOfSalary` decimal(5,2) NOT NULL,
  `IsActive` bit(1) NOT NULL,
  `CreatedBy` int(11) NOT NULL,
  `CreatedOn` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UpdatedBy` int(11) NOT NULL,
  `UpdatedOn` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`id`,`ip_address`,`user_agent`);

--
-- Indexes for table `tblbank`
--
ALTER TABLE `tblbank`
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
  ADD PRIMARY KEY (`ACHInfoId`),
  ADD KEY `ACHUserId` (`ACHUserId`),
  ADD KEY `ACHBankId` (`ACHBankId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `logs`
--
ALTER TABLE `logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=211;

--
-- AUTO_INCREMENT for table `tblbank`
--
ALTER TABLE `tblbank`
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
  MODIFY `ACHInfoId` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbluserbank`
--
ALTER TABLE `tbluserbank`
  ADD CONSTRAINT `tbluserbank_ibfk_1` FOREIGN KEY (`ACHUserId`) REFERENCES `tbluser` (`UserId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbluserbank_ibfk_2` FOREIGN KEY (`ACHBankId`) REFERENCES `tblbank` (`BankId`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
