-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 02, 2021 at 12:14 PM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 7.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `anymedion`
--

-- DELIMITER $$
-- --
-- -- Procedures
-- --
-- CREATE DEFINER=`root`@`localhost` PROCEDURE `getproductname` (IN `orderNo` INT)  NO SQL
-- SELECT
--     op.order_no,
--     op.product_type_id,
--     op.qty,
--     op.amount,
--     al.name,
--     pt.name AS pdttype
-- FROM ordered_product op
-- JOIN allopathy_medicine al ON al.id = op.product_id
-- JOIN product_type pt ON pt.id = op.product_type_id
-- WHERE op.product_type_id = 1 AND op.order_no = orderNo
-- UNION ALL
-- SELECT
--     op.order_no,
--     op.product_type_id,
--     op.qty,
--     op.amount,
--     ay.name,
--     pt.name AS pdttype
-- FROM ordered_product op
-- JOIN `ayurvada-medicine` ay ON ay.id = op.product_id
-- JOIN product_type pt ON pt.id = op.product_type_id
-- WHERE op.product_type_id = 2 AND op.order_no = orderNo
-- UNION ALL
-- SELECT
--     op.order_no,
--     op.product_type_id,
--     op.qty,
--     op.amount,
--     ay.name,
--     pt.name AS pdttype
-- FROM ordered_product op
-- JOIN `veterinary_medicine` ay ON ay.id = op.product_id
-- JOIN product_type pt ON pt.id = op.product_type_id
-- WHERE op.product_type_id = 3 AND op.order_no = orderNo
-- UNION ALL
-- SELECT
--     op.order_no,
--     op.product_type_id,
--     op.qty,
--     op.amount,
--     ay.name,
--     pt.name AS pdttype
-- FROM ordered_product op
-- JOIN `fitness` ay ON ay.id = op.product_id
-- JOIN product_type pt ON pt.id = op.product_type_id
-- WHERE op.product_type_id = 4 AND op.order_no = orderNo
-- UNION ALL
-- SELECT
--     op.order_no,
--     op.product_type_id,
--     op.qty,
--     op.amount,
--     ay.name,
--     pt.name AS pdttype
-- FROM ordered_product op
-- JOIN `cosmetic` ay ON ay.id = op.product_id
-- JOIN product_type pt ON pt.id = op.product_type_id
-- WHERE op.product_type_id = 5 AND op.order_no = orderNo
-- UNION ALL
-- SELECT
--     op.order_no,
--     op.product_type_id,
--     op.qty,
--     op.amount,
--     ay.name,
--     pt.name AS pdttype
-- FROM ordered_product op
-- JOIN `sugical_products` ay ON ay.id = op.product_id
-- JOIN product_type pt ON pt.id = op.product_type_id
-- WHERE op.product_type_id = 6 AND op.order_no = orderNo
-- UNION ALL
-- SELECT
--     op.order_no,
--     op.product_type_id,
--     op.qty,
--     op.amount,
--     ay.name,
--     pt.name AS pdttype
-- FROM ordered_product op
-- JOIN `laboratory_products` ay ON ay.id = op.product_id
-- JOIN product_type pt ON pt.id = op.product_type_id
-- WHERE op.product_type_id = 7 AND op.order_no = orderNo
-- UNION ALL
-- SELECT
--     op.order_no,
--     op.product_type_id,
--     op.qty,
--     op.amount,
--     ay.name,
--     pt.name AS pdttype
-- FROM ordered_product op
-- JOIN `animal_food` ay ON ay.id = op.product_id
-- JOIN product_type pt ON pt.id = op.product_type_id
-- WHERE op.product_type_id = 8 AND op.order_no = orderNo$$

-- CREATE DEFINER=`root`@`localhost` PROCEDURE `getPuchaseList` (IN `type` INT(5))  NO SQL
-- BEGIN
  
--   SELECT * FROM vendor_order WHERE product_type = type;
    
-- END$$

-- CREATE DEFINER=`root`@`localhost` PROCEDURE `getSubcategory` (IN `cat_id` INT)  NO SQL
-- select  id 
-- from    (select * from category
--          order by parent_id, id) products_sorted,
--         (select @pv := cat_id) initialisation
-- where   find_in_set(parent_id, @pv)
-- and     length(@pv := concat(@pv, ',', id))$$

-- CREATE DEFINER=`root`@`localhost` PROCEDURE `getTable` ()  NO SQL
-- select * from category_product$$

-- CREATE DEFINER=`root`@`localhost` PROCEDURE `pc` (IN `type` INT, OUT `tblName` VARCHAR(40))  NO SQL
-- BEGIN

-- SELECT name INTO tblName FROM vendor_pdt_tbl_names WHERE id = type;


-- END$$

-- DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(80) NOT NULL,
  `salt` varchar(40) DEFAULT NULL,
  `email` varchar(254) NOT NULL,
  `activation_code` varchar(40) DEFAULT NULL,
  `forgotten_password_code` varchar(40) DEFAULT NULL,
  `forgotten_password_time` int(11) UNSIGNED DEFAULT NULL,
  `remember_code` varchar(40) DEFAULT NULL,
  `created_on` int(11) UNSIGNED NOT NULL,
  `last_login` int(11) UNSIGNED DEFAULT NULL,
  `active` tinyint(1) UNSIGNED DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `company` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `ip_address`, `username`, `password`, `salt`, `email`, `activation_code`, `forgotten_password_code`, `forgotten_password_time`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`, `company`, `phone`) VALUES
(1, '127.0.0.1', 'administrator', '$2y$08$48xF/sa/9atQn5X2yUdQserD66YzWy6l/0CRWPXURxlkDlVj5wXw2', '', 'anymedion@gmail.com', '', 'Z86EZwEkEEJBvA3jP4axMud2a612910214fc498f', 1617972420, '4j4wrKLGHAiDNWetEokuoe', 1268889823, 1635489928, 1, 'Admin', 'istrator', 'ADMIN', '0'),
(22, '::1', 'shalbin@gmail.com', '$2y$08$cwoMeCzw30nHsM5ktQw.3ediT/0n8DngLWBjCwWGxEphF8kfJyeqe', NULL, 'shalbin@gmail.com', NULL, NULL, NULL, NULL, 1616414162, 1616414790, 1, 'shalbin', 'shaju', NULL, '9090909090'),
(21, '::1', 'anymedxzvion@gmail.com', '$2y$08$Ki.iQ/KyDfBuysUIlsFn2upcNHz2ha9h/CEFgj/rnj/z.PThH8rGG', NULL, 'anymedxzvion@gmail.com', NULL, NULL, NULL, NULL, 1616413175, NULL, 1, 'zvz', 'vzxv', NULL, '9090909090'),
(20, '::1', 'anymediozxbn@gmail.com', '$2y$08$8/ehGj./R9T5vdsk/4IRGOg5.ukc0Y9314lyZstWUaaM2.Agpo4Xe', NULL, 'anymediozxbn@gmail.com', NULL, NULL, NULL, NULL, 1616413136, NULL, 1, 'xvz', 'bvbzx', NULL, '9090909090'),
(19, '::1', 'anymedion123@gmail.com', '$2y$08$RXAB1geKbI8gclTrEVWItu3s/7sLpvbHwc1mBREHrzkodXUjS3HjO', NULL, 'anymedion123@gmail.com', NULL, NULL, NULL, NULL, 1616412686, NULL, 1, 'nthing new', 'new', NULL, '9090909090'),
(23, '127.0.0.1', 'shinoy@gmail.com', '$2y$08$8zQQT4VsTHAGmn9CvBe4iudwfanpyZFXYN.1WrQQAiDoPZpEpccmm', NULL, 'shinoy@gmail.com', NULL, NULL, NULL, NULL, 1616494219, 1616494265, 1, 'shinoy', 'pb', NULL, '974568596'),
(24, '127.0.0.1', 'binoy@gmail.com', '$2y$08$uWns1gUw2L4O8bcwzEWWtOQHNvJCWf8CUHtgV9k3KLcdk7BWUYA.C', NULL, 'binoy@gmail.com', NULL, NULL, NULL, NULL, 1616575715, NULL, 1, 'binoy', 'ff', NULL, '3445566765'),
(25, '::1', 'tes@gmail.com', '$2y$08$nVpEtTBRTBXK1MYyZEK7ZOyqdST7jlAp8A9TXzED/6.q66WuJFMoO', NULL, 'tes@gmail.com', NULL, NULL, NULL, NULL, 1624099378, NULL, 1, 'test', 'testq', NULL, '7878987867'),
(26, '::1', 'new@gmail.com', '$2y$08$.dIIgVB.VZ.BW6oGynAER.BSlD4I59aAbWwirEby7k62Z/OfTrOgW', NULL, 'new@gmail.com', NULL, NULL, NULL, NULL, 1624099553, NULL, 1, 'test1', 'testq', NULL, '6545654534'),
(27, '::1', 'sivan@gmail.com', '$2y$08$EUNCZrSUiTvbuBblFbqEfuMVlnLhOHlLqPYAuor0/HPOPFX2t13UW', NULL, 'sivan@gmail.com', NULL, NULL, NULL, NULL, 1624100233, NULL, 1, 'sivan', 'testq', NULL, '6554655443'),
(28, '::1', 'ashiq@gmail.com', '$2y$08$suln8lJrDiNJnYjFQGwWTuPeJdh62nEfbm5sXpWutiBWFk4z1YQyW', NULL, 'ashiq@gmail.com', NULL, NULL, NULL, NULL, 1624100395, NULL, 1, 'ashiq', 'hamza', NULL, '8776786543');

-- --------------------------------------------------------

--
-- Table structure for table `admins_groups`
--

CREATE TABLE `admins_groups` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `admin_id` mediumint(8) UNSIGNED NOT NULL,
  `group_id` mediumint(8) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `admins_groups`
--

INSERT INTO `admins_groups` (`id`, `admin_id`, `group_id`) VALUES
(1, 1, 1),
(2, 1, 2),
(71, 22, 22),
(73, 19, 22),
(68, 21, 22),
(67, 20, 22),
(66, 20, 21),
(72, 19, 21),
(74, 23, 22),
(75, 24, 23),
(76, 25, 22),
(77, 26, 23),
(78, 27, 22),
(80, 28, 25),
(81, 28, 26);

-- --------------------------------------------------------

--
-- Table structure for table `advertisement`
--

CREATE TABLE `advertisement` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `advertisement`
--

INSERT INTO `advertisement` (`id`, `name`, `created_at`) VALUES
(1, 'Home Page Upper Fixed', '2021-05-17 16:46:31'),
(2, 'Home Page Upper Slider', '2021-05-17 16:46:31'),
(3, 'Home Page Lower Fixed', '2021-05-17 16:46:31'),
(4, 'Home Page Lower Slider', '2021-05-17 16:46:31'),
(5, 'List View Upper', '2021-05-17 16:46:31'),
(6, 'List View Lower', '2021-05-17 16:46:31'),
(7, 'Single View', '2021-05-17 16:46:31');

-- --------------------------------------------------------

--
-- Table structure for table `advertisement_image`
--

CREATE TABLE `advertisement_image` (
  `id` int(11) NOT NULL,
  `advtisement_id` int(11) NOT NULL,
  `image` varchar(100) NOT NULL,
  `position` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `advertisement_image`
--

INSERT INTO `advertisement_image` (`id`, `advtisement_id`, `image`, `position`, `created_at`) VALUES
(1, 7, 'b5a815b712e3134f55a83bb5c0e9695f.jpg', 1, '2021-05-19 15:40:39'),
(4, 2, '0ea66e2fbc90907c9d0c65777075b82d.jpg', 1, '2021-05-19 15:41:52'),
(6, 2, '2ec8c62830b16246f0667f1eede852bd.jpg', 2, '2021-05-19 15:41:52'),
(7, 3, 'e2283192105f62492470713cd9b4172e.jpg', 0, '2021-05-19 15:42:08'),
(8, 4, 'Ayurveda.jpeg', 0, '2021-05-19 15:42:33'),
(9, 4, '7dd400806af5a05883eb02be18c235ce.jpg', 0, '2021-05-19 15:42:33'),
(10, 4, '35e8496b83d0deb5948cf44d27d629ae.jpg', 0, '2021-05-19 15:42:33'),
(11, 5, '176f904d2c7ebf4487ea69cdb8016a7c.jpg', 0, '2021-05-19 15:43:00');

-- --------------------------------------------------------

--
-- Table structure for table `agroup`
--

CREATE TABLE `agroup` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Advertisement main groups';

--
-- Dumping data for table `agroup`
--

INSERT INTO `agroup` (`id`, `name`, `created_at`) VALUES
(1, 'Home Page', '2021-05-18 14:47:21'),
(2, 'List View', '2021-05-18 14:47:21'),
(3, 'Single View', '2021-05-18 14:47:21');

-- --------------------------------------------------------

--
-- Table structure for table `agroup_advertisement`
--

CREATE TABLE `agroup_advertisement` (
  `id` int(11) NOT NULL,
  `agroup_id` int(11) NOT NULL,
  `advertisement_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='conneting agroup table to advertisement table';

--
-- Dumping data for table `agroup_advertisement`
--

INSERT INTO `agroup_advertisement` (`id`, `agroup_id`, `advertisement_id`, `created_at`) VALUES
(1, 1, 1, '2021-05-18 14:50:27'),
(2, 1, 2, '2021-05-18 14:50:27'),
(3, 1, 3, '2021-05-18 14:50:27'),
(4, 1, 4, '2021-05-18 14:50:27'),
(5, 2, 5, '2021-05-18 14:50:50'),
(6, 2, 6, '2021-05-18 14:50:50'),
(7, 3, 7, '2021-05-18 14:51:27');

-- --------------------------------------------------------

--
-- Table structure for table `ambulance`
--

CREATE TABLE `ambulance` (
  `id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `phone` bigint(20) NOT NULL,
  `place` varchar(30) NOT NULL,
  `zip` bigint(20) NOT NULL,
  `longitude` varchar(100) NOT NULL,
  `latitude` varchar(100) NOT NULL,
  `image` varchar(100) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ambulance`
--

INSERT INTO `ambulance` (`id`, `name`, `phone`, `place`, `zip`, `longitude`, `latitude`, `image`, `created_at`) VALUES
(1, '108', 54125412, 'thrissur', 5425854, '', '', '', '2021-05-01 14:34:19'),
(2, 'config descm', 9090909, 'Indian Oil Petrol Pump', 909999, '75.216273', '12.1086312', '171cc06353c82d5ad08b23a636daf460.jpeg', '2021-05-21 15:02:41');

-- --------------------------------------------------------

--
-- Table structure for table `area`
--

CREATE TABLE `area` (
  `id` int(11) NOT NULL,
  `zip` bigint(20) NOT NULL,
  `area_name` varchar(100) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `area`
--

INSERT INTO `area` (`id`, `zip`, `area_name`, `created_at`) VALUES
(1, 54, 'ddcv', '2021-05-13 16:10:10'),
(2, 54, 'ddcv', '2021-05-13 16:10:10'),
(3, 343212, 'www', '2021-05-13 16:10:10'),
(4, 985632, 'thrissur', '2021-05-13 16:10:10');

-- --------------------------------------------------------

--
-- Table structure for table `blood_donation_history`
--

CREATE TABLE `blood_donation_history` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `donated_date` datetime NOT NULL,
  `place` varchar(200) NOT NULL,
  `longitude` varchar(100) NOT NULL,
  `latitude` varchar(100) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blood_donation_history`
--

INSERT INTO `blood_donation_history` (`id`, `user_id`, `donated_date`, `place`, `longitude`, `latitude`, `created_at`) VALUES
(1, 18, '2021-03-25 00:00:00', 'thrissur', '', '0', '2021-03-29 16:12:13'),
(2, 18, '2021-03-23 00:00:00', 'chavakkad', '', '0', '2021-03-29 16:15:40'),
(3, 18, '2021-03-25 00:00:00', 'thirur', '', '0', '2021-03-29 16:58:27'),
(8, 8, '2021-03-25 00:00:00', 'thrissur', '', '0', '2021-04-15 17:27:13'),
(9, 23, '2021-03-25 00:00:00', 'thrissur', '73.4', '74.5', '2021-04-27 15:22:17');

-- --------------------------------------------------------

--
-- Table structure for table `blood_donor`
--

CREATE TABLE `blood_donor` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `blood_group` varchar(20) NOT NULL,
  `last_donation_date` datetime NOT NULL,
  `donation_count` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `location` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `blood_donor`
--

INSERT INTO `blood_donor` (`id`, `user_id`, `blood_group`, `last_donation_date`, `donation_count`, `created_at`, `location`) VALUES
(1, 4, '2', '2020-11-04 00:00:00', 3, '2020-12-22 00:00:00', ''),
(3, 18, '1', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', ''),
(8, 8, '1', '2021-03-25 00:00:00', 0, '2021-04-15 17:27:01', ''),
(9, 23, '2', '0000-00-00 00:00:00', 0, '2021-04-27 15:19:39', '');

-- --------------------------------------------------------

--
-- Table structure for table `blood_enquiry`
--

CREATE TABLE `blood_enquiry` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `blood_group` varchar(20) NOT NULL,
  `required_persons` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `phone` bigint(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `blood_enquiry`
--

INSERT INTO `blood_enquiry` (`id`, `user_id`, `blood_group`, `required_persons`, `created_at`, `phone`) VALUES
(1, 0, '1', 0, '0000-00-00 00:00:00', 0),
(2, 0, '1', 0, '0000-00-00 00:00:00', 0),
(3, 0, '1', 0, '0000-00-00 00:00:00', 0),
(4, 0, '1', 0, '0000-00-00 00:00:00', 0),
(5, 0, '1', 0, '0000-00-00 00:00:00', 0),
(6, 0, '1', 0, '0000-00-00 00:00:00', 0),
(7, 0, '1', 0, '0000-00-00 00:00:00', 0),
(8, 0, '1', 0, '0000-00-00 00:00:00', 0),
(9, 0, '1', 0, '0000-00-00 00:00:00', 0),
(10, 0, '1', 0, '0000-00-00 00:00:00', 0),
(11, 0, '1', 0, '0000-00-00 00:00:00', 0),
(12, 0, '1', 0, '0000-00-00 00:00:00', 0),
(13, 0, '1', 0, '0000-00-00 00:00:00', 0),
(14, 0, '1', 0, '0000-00-00 00:00:00', 0),
(15, 0, '1', 0, '0000-00-00 00:00:00', 0),
(16, 0, '1', 0, '0000-00-00 00:00:00', 0),
(17, 0, '1', 0, '0000-00-00 00:00:00', 0),
(18, 0, '1', 0, '0000-00-00 00:00:00', 0),
(19, 0, '1', 0, '0000-00-00 00:00:00', 0),
(20, 0, '1', 0, '0000-00-00 00:00:00', 0),
(21, 0, '1', 0, '0000-00-00 00:00:00', 0),
(22, 0, '1', 0, '0000-00-00 00:00:00', 0),
(23, 0, '1', 0, '0000-00-00 00:00:00', 0),
(24, 0, '1', 0, '0000-00-00 00:00:00', 0),
(25, 0, '1', 0, '2021-04-26 14:36:27', 8138881304),
(26, 3, '1', 0, '2021-04-26 14:42:20', 8138881304),
(27, 3, '1', 0, '2021-04-26 14:46:40', 8138881304),
(28, 3, '1', 0, '2021-04-26 14:51:10', 8138881304),
(29, 3, '2', 0, '2021-04-26 14:51:16', 8138881304),
(30, 3, '1', 0, '2021-04-26 14:51:28', 8138881304),
(31, 3, '2', 0, '2021-04-26 14:52:06', 8138881304),
(32, 3, '2', 0, '2021-04-26 14:58:37', 8138881304),
(33, 3, '1', 0, '2021-04-26 14:59:31', 8138881304),
(34, 3, '2', 0, '2021-04-26 14:59:50', 8138881304),
(35, 3, '1', 0, '2021-04-26 14:59:58', 8138881304);

-- --------------------------------------------------------

--
-- Table structure for table `blood_groups`
--

CREATE TABLE `blood_groups` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `blood_groups`
--

INSERT INTO `blood_groups` (`id`, `name`, `created_at`) VALUES
(1, 'O+', '2021-04-26 10:23:23'),
(2, 'O-', '2021-04-26 10:23:23'),
(3, 'A+', '2021-04-26 10:24:32'),
(4, 'A-', '2021-04-26 10:24:32'),
(5, 'B+', '2021-04-26 10:24:43'),
(6, 'B-', '2021-04-26 10:24:43'),
(7, 'AB+', '2021-04-26 10:25:11'),
(8, 'AB-', '2021-04-26 10:25:11');

-- --------------------------------------------------------

--
-- Table structure for table `blood_requests`
--

CREATE TABLE `blood_requests` (
  `id` int(11) NOT NULL,
  `requested_blood_group` varchar(50) NOT NULL,
  `request_from` int(11) NOT NULL COMMENT 'user_id of requestee',
  `request_to` int(11) NOT NULL COMMENT 'user_id of donor',
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `blood_requests`
--

INSERT INTO `blood_requests` (`id`, `requested_blood_group`, `request_from`, `request_to`, `created_at`) VALUES
(1, '0', 3, 8, '2021-04-26 12:22:12'),
(2, 'a', 3, 8, '2021-04-26 12:23:14'),
(3, 'B POSITIVE', 3, 18, '2021-04-26 12:24:41'),
(4, 'a', 3, 8, '2021-04-26 12:33:01'),
(5, 'B POSITIVE', 3, 18, '2021-04-26 12:33:01'),
(6, 'a', 3, 8, '2021-04-26 12:33:27'),
(7, 'B POSITIVE', 3, 18, '2021-04-26 12:33:27'),
(8, '1', 3, 18, '2021-04-26 12:38:29'),
(9, '1', 3, 8, '2021-04-26 12:38:42'),
(10, '1', 3, 18, '2021-04-26 12:38:42'),
(11, '1', 3, 8, '2021-04-26 14:36:27'),
(12, '1', 3, 18, '2021-04-26 14:36:27'),
(13, '1', 3, 8, '2021-04-26 14:42:20'),
(14, '1', 3, 18, '2021-04-26 14:42:20'),
(15, '1', 3, 8, '2021-04-26 14:46:40'),
(16, '1', 3, 18, '2021-04-26 14:46:40'),
(17, '1', 3, 8, '2021-04-26 14:51:10'),
(18, '1', 3, 18, '2021-04-26 14:51:10'),
(19, '1', 3, 8, '2021-04-26 14:51:28'),
(20, '1', 3, 18, '2021-04-26 14:51:28'),
(21, '2', 3, 18, '2021-04-26 14:52:06'),
(22, 'O+', 3, 8, '2021-04-26 14:59:32'),
(23, 'O+', 3, 18, '2021-04-26 14:59:32'),
(24, 'O+', 3, 8, '2021-04-26 15:00:00'),
(25, 'O+', 3, 18, '2021-04-26 15:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

CREATE TABLE `booking` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL COMMENT 'public user',
  `booking_user_id` int(11) NOT NULL COMMENT 'id of doc/lab/councilor user',
  `booking_user_type` int(11) NOT NULL COMMENT '4 =doctor,5=counsellor,3 = institution(lab)',
  `consultation_date` date NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `transaction_id` int(11) NOT NULL,
  `price` bigint(20) NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='doc/coun/lab booking table';

--
-- Dumping data for table `booking`
--

INSERT INTO `booking` (`id`, `user_id`, `booking_user_id`, `booking_user_type`, `consultation_date`, `start_time`, `end_time`, `transaction_id`, `price`, `status`, `created_at`) VALUES
(1, 2, 6, 4, '2021-05-17', '00:00:00', '00:00:00', 0, 0, 0, '2021-05-17 17:07:47'),
(2, 2, 6, 4, '2021-05-17', '00:00:00', '00:00:00', 0, 0, 0, '2021-05-17 17:08:30'),
(3, 23, 23, 2, '2021-05-17', '00:00:00', '00:00:00', 0, 0, 0, '2021-05-18 17:29:01'),
(4, 23, 23, 2, '2021-05-17', '00:00:00', '00:00:00', 0, 0, 0, '2021-05-19 17:09:58'),
(5, 23, 23, 2, '2021-05-17', '11:16:04', '12:16:04', 0, 0, 0, '2021-06-14 16:27:21'),
(6, 23, 23, 3, '2021-05-17', '11:16:04', '12:16:04', 0, 0, 0, '2021-06-14 16:32:25'),
(7, 23, 6, 4, '2021-05-17', '11:16:04', '12:16:04', 0, 0, 1, '2021-06-23 14:42:00');

-- --------------------------------------------------------

--
-- Table structure for table `booking_lab_pkg`
--

CREATE TABLE `booking_lab_pkg` (
  `id` int(11) NOT NULL,
  `booking_id` int(11) NOT NULL,
  `package_id` int(11) NOT NULL COMMENT 'lab pkg id',
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `booking_lab_pkg`
--

INSERT INTO `booking_lab_pkg` (`id`, `booking_id`, `package_id`, `created_at`) VALUES
(1, 6, 777, '2021-06-14 16:32:25'),
(2, 6, 888, '2021-06-14 16:32:25');

-- --------------------------------------------------------

--
-- Table structure for table `booking_lab_test`
--

CREATE TABLE `booking_lab_test` (
  `id` int(11) NOT NULL,
  `booking_id` int(11) NOT NULL,
  `test_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `booking_lab_test`
--

INSERT INTO `booking_lab_test` (`id`, `booking_id`, `test_id`, `created_at`) VALUES
(1, 6, 555, '2021-06-14 16:32:25'),
(2, 6, 666, '2021-06-14 16:32:25');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `rowid` varchar(400) NOT NULL COMMENT 'cart session row id ',
  `pdt_id` bigint(20) NOT NULL,
  `pdt_name` varchar(100) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `price` double NOT NULL,
  `qty` double NOT NULL,
  `sub_total` double NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `rowid`, `pdt_id`, `pdt_name`, `user_id`, `price`, `qty`, `sub_total`, `created_at`) VALUES
(7, '034d33ccc2ea06f8bc5e175d33fe4a31', 15, 'Mox 500', 23, 356, 19, 6764, '2021-10-15 10:09:14'),
(8, '66bf586770401e8c6476997e696b9d18', 12, 'liver kera', 23, 23, 1, 23, '2021-10-15 10:09:35'),
(9, '66bf586770401e8c6476997e696b9d18', 12, 'liver kera', 23, 23, 1, 23, '2021-10-26 17:45:43');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `image` varchar(400) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Scm admin table';

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`, `parent_id`, `image`, `created_at`) VALUES
(1, 'Allopathy', 0, 'c7f8eb1965203ab5249ba8cb790ac528.png', '2021-08-02 18:43:23'),
(2, 'Personal Care', 0, '', '2021-08-02 18:44:03'),
(3, 'Baby Care', 2, 'a62984c8da0f8b68b9e5909c33d0c262.png', '2021-08-02 18:44:19'),
(4, 'Diabetics Care', 2, 'c8230d48551cd3339560a5b87938316a.png', '2021-08-02 18:44:35'),
(5, 'Elderly Care', 2, 'd8059796a3fa1bfa82d140e80dfe835e.png', '2021-08-02 18:44:53'),
(6, 'Sexual Wellness', 2, '2cf759a461cb147131fdca2fec181578.png', '2021-08-02 18:45:06'),
(7, 'Skin Care', 2, '9b822693bab1ad1035b36b01e91e6ba9.png', '2021-08-02 18:45:23'),
(8, 'Vitamins And Supplements', 0, '', '2021-08-02 18:45:42'),
(9, 'Immunity Boosters', 8, 'ea6da4354273c4355ab0a2de26ae0b98.png', '2021-08-02 18:46:05'),
(10, 'Protein Suppliments', 8, '927d5d9059b86545f15c93103c347d26.png', '2021-08-02 18:46:26');

-- --------------------------------------------------------

--
-- Table structure for table `category_lab`
--

CREATE TABLE `category_lab` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `image` varchar(100) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category_lab`
--

INSERT INTO `category_lab` (`id`, `name`, `image`, `created_at`) VALUES
(1, 'womensss new', '', '0000-00-00 00:00:00'),
(2, 'new lab cathgoery', '', '2021-03-30 14:51:51');

-- --------------------------------------------------------

--
-- Table structure for table `category_product`
--

CREATE TABLE `category_product` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `categoryPdt_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `category_product`
--

INSERT INTO `category_product` (`id`, `product_id`, `categoryPdt_id`, `created_at`) VALUES
(2, 13, 2, '2021-06-24 14:58:22'),
(3, 15, 2, '2021-08-23 14:20:54'),
(4, 14, 3, '2021-08-23 14:21:16'),
(5, 12, 1, '2021-10-08 13:31:09');

-- --------------------------------------------------------

--
-- Table structure for table `catlab_pkglab`
--

CREATE TABLE `catlab_pkglab` (
  `id` int(11) NOT NULL,
  `category_lab_id` int(11) NOT NULL,
  `package_lab_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `catlab_pkglab`
--

INSERT INTO `catlab_pkglab` (`id`, `category_lab_id`, `package_lab_id`, `created_at`) VALUES
(2, 1, 1, '2021-04-28 15:53:28'),
(3, 1, 2, '2021-04-29 15:35:35'),
(4, 1, 3, '2021-05-03 15:23:24');

-- --------------------------------------------------------

--
-- Table structure for table `ci_sessions`
--

CREATE TABLE `ci_sessions` (
  `id` varchar(40) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `timestamp` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `data` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ci_sessions`
--

INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES
('5nqvcdbpd49o2g9fgita1ud21c5smr65', '127.0.0.1', 1630050573, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303035303536393b636172745f636f6e74656e74737c613a333a7b733a31303a22636172745f746f74616c223b643a36303b733a31313a22746f74616c5f6974656d73223b643a333b733a33323a226236666437343436326665326535663639313934303137356432643134356639223b613a373a7b733a323a226964223b733a323a223134223b733a353a227072696365223b643a32303b733a333a22717479223b643a333b733a343a226e616d65223b733a31303a226365646e6574656e6f78223b733a373a226f7074696f6e73223b613a313a7b733a373a22757365725f6964223b733a323a223233223b7d733a353a22726f776964223b733a33323a226236666437343436326665326535663639313934303137356432643134356639223b733a383a22737562746f74616c223b643a36303b7d7d),
('6i40cv2fbr7knovp2g1f8brks5553qla', '127.0.0.1', 1630052805, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303035323732343b636172745f636f6e74656e74737c613a333a7b733a31303a22636172745f746f74616c223b643a36303b733a31313a22746f74616c5f6974656d73223b643a333b733a33323a226236666437343436326665326535663639313934303137356432643134356639223b613a373a7b733a323a226964223b733a323a223134223b733a353a227072696365223b643a32303b733a333a22717479223b643a333b733a343a226e616d65223b733a31303a226365646e6574656e6f78223b733a373a226f7074696f6e73223b613a313a7b733a373a22757365725f6964223b733a323a223233223b7d733a353a22726f776964223b733a33323a226236666437343436326665326535663639313934303137356432643134356639223b733a383a22737562746f74616c223b643a36303b7d7d),
('77bbh128u6j1lank5nc33q2be60rg6pt', '127.0.0.1', 1630053863, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303035333836333b636172745f636f6e74656e74737c613a343a7b733a31303a22636172745f746f74616c223b643a3132303b733a31313a22746f74616c5f6974656d73223b643a363b733a33323a226236666437343436326665326535663639313934303137356432643134356639223b613a373a7b733a323a226964223b733a323a223134223b733a353a227072696365223b643a32303b733a333a22717479223b643a333b733a343a226e616d65223b733a31303a226365646e6574656e6f78223b733a373a226f7074696f6e73223b613a313a7b733a373a22757365725f6964223b733a323a223233223b7d733a353a22726f776964223b733a33323a226236666437343436326665326535663639313934303137356432643134356639223b733a383a22737562746f74616c223b643a36303b7d733a33323a223636626635383637373034303165386336343736393937653639366239643138223b613a373a7b733a323a226964223b733a323a223132223b733a353a227072696365223b643a32303b733a333a22717479223b643a333b733a343a226e616d65223b733a31303a226c69766572206b657261223b733a373a226f7074696f6e73223b613a313a7b733a373a22757365725f6964223b733a323a223233223b7d733a353a22726f776964223b733a33323a223636626635383637373034303165386336343736393937653639366239643138223b733a383a22737562746f74616c223b643a36303b7d7d),
('bpr22jej8sdlbakkae0ia8t11g34p9q6', '127.0.0.1', 1630054066, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303035343036353b),
('gmcfh4o503a4fmdsphf4m0l3a7mdfa2m', '127.0.0.1', 1630053780, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303035333738303b636172745f636f6e74656e74737c613a333a7b733a31303a22636172745f746f74616c223b643a36303b733a31313a22746f74616c5f6974656d73223b643a333b733a33323a226236666437343436326665326535663639313934303137356432643134356639223b613a373a7b733a323a226964223b733a323a223134223b733a353a227072696365223b643a32303b733a333a22717479223b643a333b733a343a226e616d65223b733a31303a226365646e6574656e6f78223b733a373a226f7074696f6e73223b613a313a7b733a373a22757365725f6964223b733a323a223233223b7d733a353a22726f776964223b733a33323a226236666437343436326665326535663639313934303137356432643134356639223b733a383a22737562746f74616c223b643a36303b7d7d),
('i82ar14dnsjiekhalmee8p3m8rdqh532', '127.0.0.1', 1630053840, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303035333834303b636172745f636f6e74656e74737c613a333a7b733a31303a22636172745f746f74616c223b643a36303b733a31313a22746f74616c5f6974656d73223b643a333b733a33323a226236666437343436326665326535663639313934303137356432643134356639223b613a373a7b733a323a226964223b733a323a223134223b733a353a227072696365223b643a32303b733a333a22717479223b643a333b733a343a226e616d65223b733a31303a226365646e6574656e6f78223b733a373a226f7074696f6e73223b613a313a7b733a373a22757365725f6964223b733a323a223233223b7d733a353a22726f776964223b733a33323a226236666437343436326665326535663639313934303137356432643134356639223b733a383a22737562746f74616c223b643a36303b7d7d),
('jis7vibuqpggq8lottbcgc4ptrdlffcs', '127.0.0.1', 1630054064, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303035343035343b636172745f636f6e74656e74737c613a333a7b733a31303a22636172745f746f74616c223b643a35303b733a31313a22746f74616c5f6974656d73223b643a323b733a33323a226134346561653366393437386531623361653566656535323539326465616162223b613a373a7b733a323a226964223b733a323a223133223b733a353a227072696365223b643a32353b733a333a22717479223b643a323b733a343a226e616d65223b733a363a226c65786f6e6f223b733a373a226f7074696f6e73223b613a313a7b733a373a22757365725f6964223b733a323a223233223b7d733a353a22726f776964223b733a33323a226134346561653366393437386531623361653566656535323539326465616162223b733a383a22737562746f74616c223b643a35303b7d7d),
('pi8ql364gcb8i4ljg8r39kg9ecfskjv7', '127.0.0.1', 1630055314, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303035353331343b),
('q5aq4299eo4ju8htn42md3lb97oibvag', '127.0.0.1', 1630054179, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303035343137313b636172745f636f6e74656e74737c613a333a7b733a31303a22636172745f746f74616c223b643a35303b733a31313a22746f74616c5f6974656d73223b643a323b733a33323a226134346561653366393437386531623361653566656535323539326465616162223b613a373a7b733a323a226964223b733a323a223133223b733a353a227072696365223b643a32353b733a333a22717479223b643a323b733a343a226e616d65223b733a363a226c65786f6e6f223b733a373a226f7074696f6e73223b613a313a7b733a373a22757365725f6964223b733a323a223233223b7d733a353a22726f776964223b733a33323a226134346561653366393437386531623361653566656535323539326465616162223b733a383a22737562746f74616c223b643a35303b7d7d),
('qe111t9jdjnpemv6o72gk35e3h73rumo', '127.0.0.1', 1630054961, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303035343936313b),
('qm7am79s9bj87tod9suse93ec2u9rdun', '127.0.0.1', 1630053967, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303035333836333b636172745f636f6e74656e74737c613a353a7b733a31303a22636172745f746f74616c223b643a3137303b733a31313a22746f74616c5f6974656d73223b643a383b733a33323a226236666437343436326665326535663639313934303137356432643134356639223b613a373a7b733a323a226964223b733a323a223134223b733a353a227072696365223b643a32303b733a333a22717479223b643a333b733a343a226e616d65223b733a31303a226365646e6574656e6f78223b733a373a226f7074696f6e73223b613a313a7b733a373a22757365725f6964223b733a323a223233223b7d733a353a22726f776964223b733a33323a226236666437343436326665326535663639313934303137356432643134356639223b733a383a22737562746f74616c223b643a36303b7d733a33323a223636626635383637373034303165386336343736393937653639366239643138223b613a373a7b733a323a226964223b733a323a223132223b733a353a227072696365223b643a32303b733a333a22717479223b643a333b733a343a226e616d65223b733a31303a226c69766572206b657261223b733a373a226f7074696f6e73223b613a313a7b733a373a22757365725f6964223b733a323a223233223b7d733a353a22726f776964223b733a33323a223636626635383637373034303165386336343736393937653639366239643138223b733a383a22737562746f74616c223b643a36303b7d733a33323a226134346561653366393437386531623361653566656535323539326465616162223b613a373a7b733a323a226964223b733a323a223133223b733a353a227072696365223b643a32353b733a333a22717479223b643a323b733a343a226e616d65223b733a363a226c65786f6e6f223b733a373a226f7074696f6e73223b613a313a7b733a373a22757365725f6964223b733a323a223233223b7d733a353a22726f776964223b733a33323a226134346561653366393437386531623361653566656535323539326465616162223b733a383a22737562746f74616c223b643a35303b7d7d),
('t1eogr7eogivv5h2kdcuht8u6d9moh76', '127.0.0.1', 1630053852, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303035333835323b636172745f636f6e74656e74737c613a343a7b733a31303a22636172745f746f74616c223b643a3132303b733a31313a22746f74616c5f6974656d73223b643a363b733a33323a226236666437343436326665326535663639313934303137356432643134356639223b613a373a7b733a323a226964223b733a323a223134223b733a353a227072696365223b643a32303b733a333a22717479223b643a333b733a343a226e616d65223b733a31303a226365646e6574656e6f78223b733a373a226f7074696f6e73223b613a313a7b733a373a22757365725f6964223b733a323a223233223b7d733a353a22726f776964223b733a33323a226236666437343436326665326535663639313934303137356432643134356639223b733a383a22737562746f74616c223b643a36303b7d733a33323a223636626635383637373034303165386336343736393937653639366239643138223b613a373a7b733a323a226964223b733a323a223132223b733a353a227072696365223b643a32303b733a333a22717479223b643a333b733a343a226e616d65223b733a31303a226c69766572206b657261223b733a373a226f7074696f6e73223b613a313a7b733a373a22757365725f6964223b733a323a223233223b7d733a353a22726f776964223b733a33323a223636626635383637373034303165386336343736393937653639366239643138223b733a383a22737562746f74616c223b643a36303b7d7d),
('thag3ikvhsineu60ba188vva5j38795l', '127.0.0.1', 1630054045, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303035343034343b);

-- --------------------------------------------------------

--
-- Table structure for table `consultation`
--

CREATE TABLE `consultation` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `symptoms` varchar(50) NOT NULL,
  `disease` varchar(50) NOT NULL,
  `lab_test` varchar(50) NOT NULL,
  `next_visit` date NOT NULL,
  `date_expire` date NOT NULL,
  `prescription` varchar(100) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `doc_coun_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `consultation_time_user`
--

CREATE TABLE `consultation_time_user` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `day` int(11) NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp() COMMENT 'this row created date'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='doc/coun/lab time slot table';

--
-- Dumping data for table `consultation_time_user`
--

INSERT INTO `consultation_time_user` (`id`, `user_id`, `day`, `start_time`, `end_time`, `created_at`) VALUES
(7, 6, 1, '17:29:00', '16:29:00', '0000-00-00 00:00:00'),
(12, 20, 1, '16:07:00', '17:08:00', '0000-00-00 00:00:00'),
(13, 20, 2, '16:07:00', '17:08:00', '0000-00-00 00:00:00'),
(14, 26, 1, '17:09:00', '16:09:00', '0000-00-00 00:00:00'),
(15, 26, 2, '17:09:00', '16:09:00', '0000-00-00 00:00:00'),
(16, 26, 3, '17:09:00', '16:09:00', '0000-00-00 00:00:00'),
(17, 26, 4, '17:09:00', '16:09:00', '0000-00-00 00:00:00'),
(18, 26, 5, '17:09:00', '16:09:00', '0000-00-00 00:00:00'),
(21, 27, 1, '16:11:00', '17:11:00', '0000-00-00 00:00:00'),
(22, 27, 3, '16:11:00', '17:11:00', '0000-00-00 00:00:00'),
(23, 27, 5, '16:11:00', '17:11:00', '0000-00-00 00:00:00'),
(24, 27, 4, '11:14:00', '17:14:00', '0000-00-00 00:00:00'),
(25, 26, 7, '13:55:00', '14:55:00', '0000-00-00 00:00:00'),
(26, 20, 1, '15:28:00', '15:30:00', '0000-00-00 00:00:00'),
(27, 20, 2, '15:28:00', '15:30:00', '0000-00-00 00:00:00'),
(29, 6, 5, '10:00:00', '11:00:00', '0000-00-00 00:00:00'),
(32, 7, 1, '16:40:00', '19:41:00', '0000-00-00 00:00:00'),
(33, 7, 2, '09:00:00', '10:00:00', '0000-00-00 00:00:00'),
(35, 7, 4, '16:42:00', '19:44:00', '2021-05-12 00:00:00'),
(36, 22, 1, '08:00:00', '12:30:00', '2021-05-12 00:00:00'),
(37, 22, 2, '08:00:00', '12:30:00', '2021-05-12 00:00:00'),
(43, 4, 1, '17:31:00', '20:32:00', '2021-05-12 00:00:00'),
(45, 4, 4, '19:32:00', '19:34:00', '2021-05-12 00:00:00'),
(46, 4, 5, '19:32:00', '19:34:00', '2021-05-12 00:00:00'),
(47, 29, 1, '17:31:00', '19:33:00', '2021-05-12 00:00:00'),
(48, 26, 1, '03:06:09', '02:06:09', '2021-06-23 15:47:41'),
(49, 26, 2, '04:08:09', '06:08:09', '2021-06-23 15:47:41');

-- --------------------------------------------------------

--
-- Table structure for table `counsellor`
--

CREATE TABLE `counsellor` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `reg_no` int(20) NOT NULL,
  `experience` varchar(50) NOT NULL,
  `education` varchar(50) NOT NULL,
  `department` varchar(50) NOT NULL,
  `image` varchar(400) NOT NULL,
  `about` varchar(500) NOT NULL,
  `fee` bigint(20) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `counsellor`
--

INSERT INTO `counsellor` (`id`, `user_id`, `reg_no`, `experience`, `education`, `department`, `image`, `about`, `fee`, `created_at`) VALUES
(1, 7, 33445, '3', 'Msc psychology', 'Family', 'fb18889fcfbfa55b0aabcd55628e24df.jpg', '', 0, '2020-12-22 00:00:00'),
(2, 22, 5436565, '5', 'mphill', 'childrens', '47e39186bb7c83d4d5c00a8f2bc99942.jpg', '', 0, '2021-03-31 01:05:10'),
(3, 40, 343434, '4', 'mbbs', 'kids', 'be04604dceba9f85c587f6751e0f90c5.jpg', '', 0, '2021-05-21 17:22:14');

-- --------------------------------------------------------

--
-- Table structure for table `counsellor_department`
--

CREATE TABLE `counsellor_department` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `counsellor_department`
--

INSERT INTO `counsellor_department` (`id`, `name`) VALUES
(1, 'childrens'),
(2, 'Family');

-- --------------------------------------------------------

--
-- Table structure for table `customer_details`
--

CREATE TABLE `customer_details` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `address` varchar(300) NOT NULL,
  `place` varchar(50) NOT NULL,
  `pincode` bigint(20) NOT NULL,
  `phone` varchar(100) NOT NULL,
  `state` varchar(50) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='This is for Billing functionality  , not for anymedion';

--
-- Dumping data for table `customer_details`
--

INSERT INTO `customer_details` (`id`, `name`, `address`, `place`, `pincode`, `phone`, `state`, `created_at`) VALUES
(1, 'evan', 'pulikkottil house, po elavally north', 'elavally', 680511, '9746530854', 'kerala', '2021-07-01 14:14:38'),
(2, 'jose', 'pulikkottil house, po elavally north', 'elavally', 680511, '9746530854', 'kerala', '2021-07-01 14:17:10'),
(3, 'jacky', 'pulikkottil house, po elavally north', 'elavally', 680511, '9746530854', 'kerala', '2021-07-01 14:19:32'),
(4, 'evan', 'pulikkottil house, po elavally north', 'elavally', 680511, '9746530854', 'kerala', '2021-07-01 14:47:36'),
(5, '', '', '', 0, '', '', '2021-07-01 14:49:07'),
(6, 'jose', 'pulikkottil house, po elavally north', 'elavally', 680511, '9746530854', 'kerala', '2021-07-01 14:51:07'),
(7, 'evan', 'pulikkottil house, po elavally north', 'elavally', 680511, '9746530854', 'kerala', '2021-07-01 14:57:34'),
(8, 'evan', 'pulikkottil house, po elavally north', 'elavally', 680511, '9746530854', 'kerala', '2021-07-01 14:58:13'),
(9, 'evan', 'pulikkottil house, po elavally north', 'elavally', 680511, '9746530854', 'kerala', '2021-07-01 15:00:16'),
(10, 'emma ', 'puthan veetil', 'chiyaram', 3434, '8547200425', 'dfdfdf', '2021-07-06 14:14:45'),
(11, 'Deena Titto', 'puthan veetil', 'chiyaram', 680005, '8547200425', 'kerala', '2021-07-06 17:21:38'),
(12, 'Deena Titto', 'puthan veetil', 'chiyaram', 680005, '8547200425', 'kerala', '2021-07-06 17:24:44'),
(13, 'Deena Titto', 'puthan veetil', 'chiyaram', 680005, '8547200425', 'kerala', '2021-07-06 17:30:01'),
(14, 'jenifer', 'pulikkottils', 'elavally', 680511, '8547200425', 'kerala', '2021-07-08 11:18:38'),
(15, 'jenifer', 'pulikkottils', 'elavally', 680511, '8547200425', 'kerala', '2021-07-08 11:53:32'),
(16, 'emma ', 'puthan veetil', 'elavally', 680511, '8547200425', 'kerala', '2021-07-08 11:54:09'),
(17, 'emma ', 'puthan veetil', 'elavally', 680511, '8547200425', 'kerala', '2021-07-08 11:55:03'),
(18, 'deepa', 'puthan veetil', 'elavally', 3434, '8547200425', 'kerala', '2021-07-08 14:14:39'),
(19, 'deepa', 'puthan veetil', 'elavally', 3434, '8547200425', 'kerala', '2021-07-08 14:16:58'),
(20, 'deepa', 'puthan veetil', 'elavally', 3434, '8547200425', 'kerala', '2021-07-08 14:23:38'),
(21, '', '', '', 0, '', '', '2021-07-10 20:26:30'),
(22, 'sinoy cusin', 'puthan veetil', 'chiyaram', 680005, '8547200425', '', '2021-07-19 16:03:41'),
(23, 'Deena Titto', 'puthan veetil', 'chiyaram', 680005, '8547200425', '', '2021-07-19 17:44:38'),
(24, 'Deena Titto', 'puthan veetil', 'chiyaram', 680005, '8547200425', '', '2021-07-19 17:46:17'),
(25, 'test name', 'puthan veetil', 'chiyaram', 680005, '8547200425', '', '2021-07-20 09:45:59'),
(26, 'Categories', 'puthan veetil', 'chiyaram', 680005, '34343', '', '2021-07-20 12:22:28'),
(27, 'Categories', 'puthan veetil', 'chiyaram', 680005, '34343', '', '2021-07-20 12:36:11'),
(28, 'emma ', 'pulikkottils', 'chiyaram', 680005, '434344', '', '2021-07-20 12:37:42'),
(29, 'emma ', 'pulikkottils', 'chiyaram', 680005, '434344', '', '2021-07-20 12:40:18'),
(30, 'Categories', 'puthan veetil', 'chiyaram', 3434, '8547200425', '', '2021-07-20 13:58:17'),
(31, 'Categories', 'puthan veetil', 'chiyaram', 3434, '8547200425', '', '2021-07-20 14:03:43'),
(32, 'Categories', 'puthan veetil', 'chiyaram', 3434, '8547200425', '', '2021-07-20 14:03:50'),
(33, 'Categories', 'puthan veetil', 'chiyaram', 3434, '8547200425', '', '2021-07-20 14:04:16'),
(34, 'Categories', 'puthan veetil', 'chiyaram', 3434, '8547200425', '', '2021-07-20 14:04:30'),
(35, 'Categories', 'puthan veetil', 'chiyaram', 3434, '8547200425', '', '2021-07-20 14:06:43'),
(36, 'Categories', 'puthan veetil', 'elavally', 3434, '8547200425', '', '2021-07-20 14:07:14'),
(37, 'Categories', 'puthan veetil', 'chiyaram', 680005, '34343', '', '2021-07-20 14:10:05'),
(38, 'Categories', 'puthan veetil', 'elavally', 3434, '8547200425', '', '2021-07-20 14:10:10'),
(39, 'Categories', 'puthan veetil', 'elavally', 3434, '8547200425', '', '2021-07-20 14:10:16'),
(40, 'Categories', ' fdfdf', 'chiyaram', 680005, '8547200425', '', '2021-07-20 14:11:40'),
(41, 'babu', 'puthan veetil', 'chiyaram', 680005, '8547200425', '', '2021-07-20 16:36:11'),
(42, 'Deena Titto', 'pulikkottils', 'elavally', 680511, '8547200425', '', '2021-07-20 16:40:36'),
(43, 'Deena Titto', 'pulikkottils', 'elavally', 680511, '8547200425', '', '2021-07-20 17:19:35'),
(44, 'Categories', 'puthan veetil', 'chiyaram', 680005, '8547200425', '', '2021-07-20 17:20:15'),
(45, 'Categories', 'puthan veetil', 'chiyaram', 680005, '8547200425', '', '2021-07-20 17:23:17'),
(46, 'Categories', 'puthan veetil', 'chiyaram', 680005, '8547200425', '', '2021-07-20 17:23:27'),
(47, 'Categories', 'puthan veetil', 'chiyaram', 680005, '8547200425', '', '2021-07-20 17:28:01'),
(48, 'Categories', 'puthan veetil', 'chiyaram', 680005, '8547200425', '', '2021-07-20 17:28:05'),
(49, 'dfdf', 'dfdfd', 'chiyaram', 680005, '8547200425', '', '2021-07-20 17:38:39'),
(50, 'dfdf', 'dfdfd', 'chiyaram', 680005, '8547200425', '', '2021-07-20 17:41:23'),
(51, 'gfgfgf', 'fgfgf', 'chiyaram', 680005, '8547200425', '', '2021-07-20 17:41:58'),
(52, 'gfgfgf', 'fgfgf', 'chiyaram', 680005, '8547200425', '', '2021-07-20 17:54:18'),
(53, 'Deepa rose', 'kilimamnpo', 'Mullassery', 680511, '9090909090', '', '2021-07-21 11:08:03'),
(54, 'jose', 'kidnagoor', 'Mullassery', 680511, '9746530854', '', '2021-07-21 11:53:41'),
(55, 'Deepa rose', 'pulikkottil house, po elavally north', 'elavally', 680511, '9746530854', '', '2021-07-21 12:01:41'),
(56, 'evan', 'pulikkottil house, po elavally north', 'elavally', 680511, '9746530854', '', '2021-07-21 12:05:08'),
(57, 'jose', 'pulikkottil house, po elavally north', 'Mullassery', 680511, '9746530854', '', '2021-07-21 12:12:29'),
(58, 'jose', 'pulikkottil house, po elavally north', 'Mullassery', 680511, '9746530854', '', '2021-07-21 12:24:53'),
(59, 'jose', 'pulikkottil house, po elavally north', 'Mullassery', 680511, '9746530854', '', '2021-07-21 12:25:22'),
(60, 'jose', 'pulikkottil house, po elavally north', 'Mullassery', 680511, '9746530854', '', '2021-07-21 12:25:32'),
(61, 'jose', 'pulikkottil house, po elavally north', 'Mullassery', 680511, '9746530854', '', '2021-07-21 12:25:43'),
(62, 'jose', 'pulikkottil house, po elavally north', 'Mullassery', 680511, '9746530854', '', '2021-07-21 12:25:59'),
(63, 'evan', 'pulikkottil house, po elavally north', 'elavally', 680511, '9746530854', '', '2021-07-21 12:29:25'),
(64, 'evan', 'pulikkottil house, po elavally north', 'elavally', 680511, '9746530854', '', '2021-07-21 12:30:17'),
(65, 'evan', 'pulikkottil house, po elavally north', 'elavally', 680511, '9746530854', '', '2021-07-21 12:31:09'),
(66, 'evan', 'pulikkottil house, po elavally north', 'elavally', 680511, '9746530854', '', '2021-07-21 12:31:31'),
(67, 'evan', 'pulikkottil house, po elavally north', 'elavally', 680511, '9746530854', '', '2021-07-21 12:31:49'),
(68, 'evan', 'pulikkottil house, po elavally north', 'elavally', 680511, '9746530854', '', '2021-07-21 12:33:12'),
(69, 'evan', 'pulikkottil house, po elavally north', 'elavally', 680511, '9746530854', '', '2021-07-21 12:33:34'),
(70, 'evan', 'pulikkottil house, po elavally north', 'elavally', 680511, '9746530854', '', '2021-07-21 12:33:45'),
(71, 'evan', 'pulikkottil house, po elavally north', 'elavally', 680511, '9746530854', '', '2021-07-21 12:34:26'),
(72, 'evan', 'pulikkottil house, po elavally north', 'elavally', 680511, '9746530854', '', '2021-07-21 12:39:31'),
(73, 'evan', 'pulikkottil house, po elavally north', 'elavally', 680511, '9746530854', '', '2021-07-21 12:39:54'),
(74, 'evan', 'pulikkottil house, po elavally north', 'elavally', 680511, '9746530854', '', '2021-07-21 12:40:04'),
(75, 'evan', 'pulikkottil house, po elavally north', 'elavally', 680511, '9746530854', '', '2021-07-21 12:40:17'),
(76, 'evan', 'pulikkottil house, po elavally north', 'elavally', 680511, '9746530854', '', '2021-07-21 12:40:26'),
(77, 'evan', 'pulikkottil house, po elavally north', 'elavally', 680511, '9746530854', '', '2021-07-21 12:40:34'),
(78, 'evan', 'pulikkottil house, po elavally north', 'elavally', 680511, '9746530854', '', '2021-07-21 12:40:43'),
(79, 'evan', 'pulikkottil house, po elavally north', 'elavally', 680511, '9746530854', '', '2021-07-21 12:40:55'),
(80, 'evan', 'pulikkottil house, po elavally north', 'elavally', 680511, '9746530854', '', '2021-07-21 12:41:09'),
(81, 'evan', 'pulikkottil house, po elavally north', 'elavally', 680511, '9746530854', '', '2021-07-21 12:41:29'),
(82, 'evan', 'pulikkottil house, po elavally north', 'elavally', 680511, '9746530854', '', '2021-07-21 12:43:30'),
(83, 'evan', 'pulikkottil house, po elavally north', 'elavally', 680511, '9746530854', '', '2021-07-21 12:43:49'),
(84, 'evan', 'pulikkottil house, po elavally north', 'elavally', 680511, '9746530854', '', '2021-07-21 12:46:46'),
(85, 'evan', 'pulikkottil house, po elavally north', 'elavally', 680511, '9746530854', '', '2021-07-21 13:33:46'),
(86, 'evan', 'pulikkottil house, po elavally north', 'elavally', 680511, '9746530854', '', '2021-07-21 13:42:16'),
(87, 'evan', 'pulikkottil house, po elavally north', 'elavally', 680511, '9746530854', '', '2021-07-21 13:42:31'),
(88, 'evan', 'pulikkottil house, po elavally north', 'elavally', 680511, '9746530854', '', '2021-07-21 13:42:48'),
(89, 'evan', 'pulikkottil house, po elavally north', 'elavally', 680511, '9746530854', '', '2021-07-21 13:42:55'),
(90, 'evan', 'pulikkottil house, po elavally north', 'elavally', 680511, '9746530854', '', '2021-07-21 13:43:24'),
(91, 'evan', 'pulikkottil house, po elavally north', 'elavally', 680511, '9746530854', '', '2021-07-21 13:49:45'),
(92, 'evan', 'pulikkottil house, po elavally north', 'elavally', 680511, '9746530854', '', '2021-07-21 13:50:00'),
(93, 'evan', 'pulikkottil house, po elavally north', 'elavally', 680511, '9746530854', '', '2021-07-21 13:50:49'),
(94, 'evan', 'pulikkottil house, po elavally north', 'elavally', 680511, '9746530854', '', '2021-07-21 13:51:36'),
(95, 'evan', 'pulikkottil house, po elavally north', 'elavally', 680511, '9746530854', '', '2021-07-21 13:52:25'),
(96, 'evan', 'pulikkottil house, po elavally north', 'elavally', 680511, '9746530854', '', '2021-07-21 13:52:50'),
(97, 'evan', 'pulikkottil house, po elavally north', 'elavally', 680511, '9746530854', '', '2021-07-21 13:53:24'),
(98, 'evan', 'pulikkottil house, po elavally north', 'elavally', 680511, '9746530854', '', '2021-07-21 13:53:47'),
(99, 'evan', 'pulikkottil house, po elavally north', 'elavally', 680511, '9746530854', '', '2021-07-21 14:00:41'),
(100, 'evan', 'pulikkottil house, po elavally north', 'elavally', 680511, '9746530854', '', '2021-07-21 14:01:13'),
(101, 'evan', 'pulikkottil house, po elavally north', 'elavally', 680511, '9746530854', '', '2021-07-21 14:01:37'),
(102, 'evan', 'pulikkottil house, po elavally north', 'elavally', 680511, '9746530854', '', '2021-07-21 14:02:21'),
(103, 'evan', 'pulikkottil house, po elavally north', 'elavally', 680511, '9746530854', '', '2021-07-21 14:02:40'),
(104, 'evan', 'pulikkottil house, po elavally north', 'elavally', 680511, '9746530854', '', '2021-07-21 14:03:42'),
(105, 'jose', 'pulikkottil house, po elavally north', 'elavally', 680511, '9746530854', '', '2021-07-21 17:40:36'),
(106, 'jose', 'pulikkottil house, po elavally north', 'elavally', 680511, '9746530854', '', '2021-07-21 17:43:57'),
(107, 'rtrtr', 'pulikkottil house, po elavally north', 'elavally', 680511, '9746530854', '', '2021-07-21 17:44:49'),
(108, 'rtrtr', 'pulikkottil house, po elavally north', 'elavally', 680511, '9746530854', '', '2021-07-21 17:45:09'),
(109, 'Taniya', 'Thevarikal house', 'elavally', 680511, '9878767656', '', '2021-07-23 10:22:54'),
(110, 'Taniya', 'Thevarikal house', 'elavally', 680511, '9878767656', '', '2021-07-23 10:41:55'),
(111, 'Manil ', 'thalkkodan house', 'elavally', 680511, '9746530854', '', '2021-07-23 10:42:55'),
(112, 'evan', 'pulikkottil house, po elavally north', 'elavally', 680511, '9746530854', '', '2021-07-23 11:44:53'),
(113, '', '', '', 0, '', '', '2021-07-23 11:46:21'),
(114, 'Krishnan', 'pulikkottil house, po elavally north', 'elavally', 680511, '9746530854', '', '2021-07-23 11:47:18'),
(115, 'evan', 'pulikkottil house, po elavally north', 'elavally', 680511, '9746530854', '', '2021-07-23 11:49:19'),
(116, 'evan', 'pulikkottil house, po elavally north', 'elavally', 680511, '9746530854', '', '2021-07-23 11:51:43'),
(117, 'evan', 'pulikkottil house, po elavally north', 'elavally', 680511, '9746530854', '', '2021-07-23 11:52:22'),
(118, 'evan', 'kidnagoor', 'elavally', 680511, '9746530854', '', '2021-07-23 11:53:27'),
(119, 'jose', 'Thevarikal house', 'Mullassery', 680511, '9746530854', '', '2021-07-23 11:55:39'),
(120, 'evan', 'pulikkottil house, po elavally north', 'elavally', 680511, '9746530854', '', '2021-07-23 12:02:55'),
(121, 'evan', 'pulikkottil house, po elavally north', 'elavally', 680511, '9746530854', '', '2021-07-23 12:03:51'),
(122, '', '', '', 0, '', '', '2021-07-23 12:04:21'),
(123, 'jose', 'pulikkottil house, po elavally north', 'elavally', 680511, '9746530854', '', '2021-07-23 12:05:01'),
(124, 'evan', 'kidnagoor', 'elavally', 680511, '9746530854', '', '2021-07-23 12:06:31'),
(125, 'evan', 'kidnagoor', 'elavally', 680511, '9746530854', '', '2021-07-23 12:08:47'),
(126, 'evan', 'pulikkottil house, po elavally north', 'elavally', 680511, '9746530854', '', '2021-07-23 12:12:22'),
(127, 'evan', 'kidnagoor', 'elavally', 680511, '9746530854', '', '2021-07-23 12:13:25'),
(128, 'evan', 'pulikkottil house, po elavally north', 'elavally', 680511, '9746530854', '', '2021-07-23 12:25:25'),
(129, 'evan', 'pulikkottil house, po elavally north', 'elavally', 680511, '9746530854', '', '2021-07-23 14:29:28'),
(130, 'evan', 'pulikkottil house, po elavally north', 'elavally', 680511, '9746530854', '', '2021-07-23 14:31:03'),
(131, 'evan', 'pulikkottil house, po elavally north', 'elavally', 680511, '9746530854', '', '2021-07-27 16:27:12'),
(132, 'evan', 'pulikkottil house, po elavally north', 'elavally', 680511, '9746530854', '', '2021-07-27 16:29:53'),
(133, 'evan', 'pulikkottil house, po elavally north', 'elavally', 680511, '9746530854', '', '2021-07-28 14:05:15'),
(134, 'Vanilla', 'Eravikulam', 'Elavally', 680511, '975865768', '', '2021-07-28 14:15:07'),
(135, '', '', '', 0, '', '', '2021-08-02 11:37:53'),
(136, '', '', '', 0, '', '', '2021-08-02 11:38:33'),
(137, '', '', '', 0, '', '', '2021-08-02 11:40:14'),
(138, '', '', '', 0, '', '', '2021-08-02 11:43:51'),
(139, '', '', '', 0, '', '', '2021-08-02 11:44:24'),
(140, '', '', '', 0, '', '', '2021-08-02 11:44:51'),
(141, '', '', '', 0, '', '', '2021-08-02 11:45:13'),
(142, '', '', '', 0, '', '', '2021-08-02 11:45:24'),
(143, '', '', '', 0, '', '', '2021-08-02 11:45:35'),
(144, '', '', '', 0, '', '', '2021-08-02 11:45:42'),
(145, '', '', '', 0, '', '', '2021-08-02 12:00:40'),
(146, 'jose', 'pulikkottil house, po elavally north', 'elavally', 680511, '9746530854', '', '2021-08-02 12:09:48'),
(147, 'jose', 'pulikkottil house, po elavally north', 'elavally', 680511, '9746530854', '', '2021-08-02 12:12:35'),
(148, 'Shalbin shaju', 'Palayoor hse', 'Thoyakavu', 680513, '9898787676', '', '2021-08-02 12:27:21'),
(149, 'shalbin', 'pulikkottil house, po elavally north', 'elavally', 680513, '9746530854', '', '2021-08-02 12:28:57'),
(150, 'shalbin', 'pulikkottil house, po elavally north', 'elavally', 680513, '9746530854', '', '2021-08-02 12:29:07'),
(151, 'Sajin ', 'pulikkottil house, po elavally north', 'elavally', 680511, '9746530854', '', '2021-08-02 12:51:28'),
(152, 'evan', 'pulikkottil house, po elavally north', 'Mullassery', 680511, '9746530854', '', '2021-08-02 12:52:10'),
(153, 'evan', 'pulikkottil house, po elavally north', 'Mullassery', 680511, '9746530854', '', '2021-08-02 12:53:35'),
(154, 'rtrtrt', 'rtrt', 'elavally', 680511, '9746530854', '', '2021-08-02 12:56:23'),
(155, 'evan', 'pulikkottil house, po elavally north', 'elavally', 680511, '9746530854', '', '2021-08-02 14:03:44'),
(156, 'evan', 'pulikkottil house, po elavally north', 'elavally', 680511, '9746530854', '', '2021-08-02 14:08:20'),
(157, 'evan', 'pulikkottil house, po elavally north', 'elavally', 680511, '9746530854', '', '2021-08-02 14:13:39'),
(158, 'evan', 'pulikkottil house, po elavally north', 'elavally', 680511, '9746530854', '', '2021-08-02 14:14:42'),
(159, 'evan', 'pulikkottil house, po elavally north', 'elavally', 680511, '9746530854', '', '2021-08-02 14:15:39'),
(160, 'evan', 'pulikkottil house, po elavally north', 'Mullassery', 680511, '9746530854', '', '2021-08-02 14:32:40'),
(161, 'jose', 'kidnagoor', 'elavally', 680511, '9746530854', '', '2021-08-02 14:35:06'),
(162, 'evan', 'kidnagoor', 'elavally', 680511, '9746530854', '', '2021-08-02 14:49:49'),
(163, 'evan', 'kidnagoor', 'elavally', 680511, '9746530854', '', '2021-08-02 14:53:55'),
(164, 'evan', 'pulikkottil house, po elavally north', 'elavally', 680511, '9878767656', '', '2021-08-02 14:54:20'),
(165, 'evan', 'pulikkottil house, po elavally north', 'elavally', 680511, '9746530854', '', '2021-08-02 15:08:12'),
(166, 'evan', 'pulikkottil house, po elavally north', 'elavally', 680511, '9746530854', '', '2021-08-02 15:23:28'),
(167, 'jose', 'pulikkottil house, po elavally north', 'elavally', 680513, '9746530854', '', '2021-08-02 15:30:06'),
(168, 'jose', 'pulikkottil house, po elavally north', 'elavally', 680513, '9746530854', '', '2021-08-02 15:36:58'),
(169, 'evan', 'pulikkottil house, po elavally north', 'elavally', 680511, '9746530854', '', '2021-08-02 15:39:15'),
(170, 'jose', 'kidnagoor', 'elavally', 680511, '9746530854', '', '2021-08-02 15:46:30'),
(171, 'jose', 'kidnagoor', 'elavally', 680511, '9746530854', '', '2021-08-02 15:47:02'),
(172, 'jose', 'kidnagoor', 'elavally', 680511, '9746530854', '', '2021-08-02 15:50:45'),
(173, 'gfgf', 'pulikkottil house, po elavally north', 'elavally', 680511, '9746530854', '', '2021-08-02 17:30:27'),
(174, 'gfgf', 'pulikkottil house, po elavally north', 'elavally', 680511, '9746530854', '', '2021-08-02 17:36:22'),
(175, 'gfgf', 'pulikkottil house, po elavally north', 'elavally', 680511, '9746530854', '', '2021-08-02 17:36:46'),
(176, 'gfgf', 'pulikkottil house, po elavally north', 'elavally', 680511, '9746530854', '', '2021-08-02 17:37:18'),
(177, 'gfgf', 'pulikkottil house, po elavally north', 'elavally', 680511, '9746530854', '', '2021-08-02 17:37:32'),
(178, 'gfgf', 'pulikkottil house, po elavally north', 'elavally', 680511, '9746530854', '', '2021-08-02 17:37:44'),
(179, 'gfgf', 'pulikkottil house, po elavally north', 'elavally', 680511, '9746530854', '', '2021-08-02 17:37:53'),
(180, 'gfgf', 'pulikkottil house, po elavally north', 'elavally', 680511, '9746530854', '', '2021-08-02 17:38:12'),
(181, 'gfgf', 'pulikkottil house, po elavally north', 'elavally', 680511, '9746530854', '', '2021-08-02 17:38:24'),
(182, 'gfgf', 'pulikkottil house, po elavally north', 'elavally', 680511, '9746530854', '', '2021-08-02 17:38:39'),
(183, 'gfgf', 'pulikkottil house, po elavally north', 'elavally', 680511, '9746530854', '', '2021-08-02 17:38:48'),
(184, 'gfgf', 'pulikkottil house, po elavally north', 'elavally', 680511, '9746530854', '', '2021-08-02 17:38:57'),
(185, 'gfgf', 'pulikkottil house, po elavally north', 'elavally', 680511, '9746530854', '', '2021-08-02 17:39:08'),
(186, 'gfgf', 'pulikkottil house, po elavally north', 'elavally', 680511, '9746530854', '', '2021-08-02 17:39:28'),
(187, 'gfgf', 'pulikkottil house, po elavally north', 'elavally', 680511, '9746530854', '', '2021-08-02 17:39:59'),
(188, 'gfgf', 'pulikkottil house, po elavally north', 'elavally', 680511, '9746530854', '', '2021-08-02 17:40:08'),
(189, 'gfgf', 'pulikkottil house, po elavally north', 'elavally', 680511, '9746530854', '', '2021-08-02 17:40:25'),
(190, 'gfgf', 'pulikkottil house, po elavally north', 'elavally', 680511, '9746530854', '', '2021-08-02 17:40:38'),
(191, 'gfgf', 'pulikkottil house, po elavally north', 'elavally', 680511, '9746530854', '', '2021-08-02 17:41:08'),
(192, 'Shinoy', 'pulikkottil house, po elavally north', 'elavally', 680511, '9746530854', '', '2021-08-02 18:07:34');

-- --------------------------------------------------------

--
-- Table structure for table `day`
--

CREATE TABLE `day` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `day`
--

INSERT INTO `day` (`id`, `name`) VALUES
(1, 'Monday'),
(2, 'Tuesday'),
(3, 'Wednesday'),
(4, 'Thursday'),
(5, 'Friday'),
(6, 'Saturday'),
(7, 'Sunday');

-- --------------------------------------------------------

--
-- Table structure for table `deivery_person`
--

CREATE TABLE `deivery_person` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `feedback` varchar(50) NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp(),
  `licence` varchar(50) NOT NULL,
  `id_proof` varchar(100) NOT NULL,
  `image` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `deivery_person`
--

INSERT INTO `deivery_person` (`id`, `user_id`, `feedback`, `date`, `licence`, `id_proof`, `image`) VALUES
(1, 8, 'verygood', '2020-12-22 00:00:00', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `delivery_pincode`
--

CREATE TABLE `delivery_pincode` (
  `id` int(11) NOT NULL,
  `delivery_person_id` int(11) NOT NULL,
  `pincode` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `delivery_pincode`
--

INSERT INTO `delivery_pincode` (`id`, `delivery_person_id`, `pincode`) VALUES
(1, 1, '0'),
(2, 1, '3'),
(3, 1, '4'),
(4, 1, '5'),
(5, 6, '0'),
(6, 6, '2'),
(7, 6, '4'),
(8, 6, '5');

-- --------------------------------------------------------

--
-- Table structure for table `districts`
--

CREATE TABLE `districts` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `districts`
--

INSERT INTO `districts` (`id`, `name`) VALUES
(1, 'Alappuzha'),
(2, 'Ernakulam'),
(3, 'Idukki'),
(4, 'Kannur'),
(5, 'Kasaragod'),
(6, 'Kollam'),
(7, 'Kottayam'),
(8, 'Kozhikode'),
(9, 'Malappuram'),
(10, 'Palakkad'),
(11, 'Pathanamthitta'),
(12, 'Thiruvananthapuram'),
(13, 'Thrissur'),
(14, 'Wayanad');

-- --------------------------------------------------------

--
-- Table structure for table `doctor`
--

CREATE TABLE `doctor` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `reg_no` int(11) NOT NULL,
  `experience` varchar(50) NOT NULL,
  `education` varchar(50) NOT NULL,
  `department` varchar(20) NOT NULL,
  `image` varchar(400) NOT NULL,
  `about` varchar(500) NOT NULL,
  `fee` bigint(20) NOT NULL,
  `consult_time_id` mediumint(9) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `doctor`
--

INSERT INTO `doctor` (`id`, `user_id`, `reg_no`, `experience`, `education`, `department`, `image`, `about`, `fee`, `consult_time_id`, `created_at`) VALUES
(1, 6, 0, '4', 'MBBS', 'Ent', 'be8452210d2c0892eb08c45b206b70be.jpg', 'fdsfd', 0, 170000, '2020-12-22 00:00:00'),
(6, 20, 65859, '3', 'mbbs', 'Pediatrician', '78795cebd96467ccf09a098e727ce72e.jpg', '', 0, 0, '0000-00-00 00:00:00'),
(7, 26, 680511, '8year', 'mbbs', 'Ent', '', '', 0, 0, '0000-00-00 00:00:00'),
(8, 27, 3434, '3', 'mbbs', 'Ent', '62b47785ef4d4c82f0baa714b9de1b36.jpg', 'abnout abot', 0, 0, '0000-00-00 00:00:00'),
(9, 35, 0, '4', 'MBBS', 'Ent', '0e5346c7005ebb1484a7f012aa964f3f.jpg', 'dfdfd', 0, 0, '2021-05-17 12:14:11'),
(10, 39, 34343, '4', 'mbbs', 'Ent', '02ac13f80a6e33c1109ca76d35654274.jpg', 'rrtrtrefrg', 0, 0, '2021-05-21 17:06:37');

-- --------------------------------------------------------

--
-- Table structure for table `doctor_department`
--

CREATE TABLE `doctor_department` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `doctor_department`
--

INSERT INTO `doctor_department` (`id`, `name`) VALUES
(1, 'Ent'),
(2, 'Pediatrician'),
(3, 'Neurologist'),
(4, 'Endocrinologist');

-- --------------------------------------------------------

--
-- Table structure for table `drug_shedules`
--

CREATE TABLE `drug_shedules` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(50) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='This is for Billing functionality , not for anymedion';

--
-- Dumping data for table `drug_shedules`
--

INSERT INTO `drug_shedules` (`id`, `name`, `description`, `created_at`) VALUES
(1, 'H', 'Description 1', '2021-07-17 16:50:47'),
(2, 'G', 'Description 2', '2021-07-17 16:50:47'),
(3, 'H1', 'Description 3', '2021-07-21 14:59:28'),
(4, 'X', 'Description  4', '2021-07-21 14:59:28');

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `feedback_note` varchar(150) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`id`, `user_id`, `feedback_note`, `created_at`) VALUES
(1, 1, 'Good service for buying medicine', '2021-02-20 11:31:49');

-- --------------------------------------------------------

--
-- Table structure for table `firebase_tokens`
--

CREATE TABLE `firebase_tokens` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `device_type` varchar(30) NOT NULL COMMENT 'android / iOS',
  `device_id` varchar(50) NOT NULL,
  `fcm_token` text NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `frequently_ask_questions`
--

CREATE TABLE `frequently_ask_questions` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `questions` varchar(150) NOT NULL,
  `answers` varchar(150) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `frequently_ask_questions`
--

INSERT INTO `frequently_ask_questions` (`id`, `product_id`, `questions`, `answers`, `created_at`) VALUES
(1, 32, '', '', '2021-04-28 17:01:07'),
(2, 32, '', '', '2021-04-28 17:03:04'),
(8, 33, 'test ', 'test ne s qefedf', '2021-04-28 17:54:18'),
(10, 37, 'This is anyiviral medicine or not', 'yes it is', '2021-05-21 11:05:15'),
(12, 29, 'Just test', 'just test answer\r\n', '2021-06-16 10:16:38'),
(13, 12, 'Hows this tablet works in body', 'NO idea', '2021-10-08 13:29:12');

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

CREATE TABLE `groups` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `name` varchar(20) NOT NULL,
  `description` varchar(100) NOT NULL,
  `permissions` text NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `groups`
--

INSERT INTO `groups` (`id`, `name`, `description`, `permissions`, `status`) VALUES
(1, 'super_admin', 'Super Admin', '', 0),
(2, 'admin', 'Administrator', '', 0),
(21, 'newgroup', 'newgroup', 'offer_management', 0),
(22, 'new', 'new', 'user_management,service_management,feedback_management,area_management', 0),
(23, 'front', 'for front offic employees', 'user_management,offer_management,order_management', 0),
(24, 'wewe', 'wewewee', 'category_management,wholesale_management', 0),
(25, 'hyhy', 'nnnnn', 'user_management,offer_management,order_management,service_management', 0),
(26, 'sivan', 'sivan gorup des', 'user_management,offer_management', 0);

-- --------------------------------------------------------

--
-- Table structure for table `health_workers`
--

CREATE TABLE `health_workers` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `reg_id` int(11) NOT NULL,
  `designation` varchar(30) NOT NULL,
  `experience` varchar(20) NOT NULL,
  `orgnization` varchar(100) NOT NULL,
  `organization_place` varchar(100) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `health_workers`
--

INSERT INTO `health_workers` (`id`, `user_id`, `reg_id`, `designation`, `experience`, `orgnization`, `organization_place`, `created_at`) VALUES
(1, 3, 2323, 'attender', '3', '', '', '2020-12-22 00:00:00'),
(2, 23, 7969, 'nurse', '', 'amala hospital', 'amala', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `homepage`
--

CREATE TABLE `homepage` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `homepage`
--

INSERT INTO `homepage` (`id`, `name`, `created_at`) VALUES
(1, 'Anymedion deals', '2021-05-04 15:58:56'),
(2, 'Featured products', '2021-05-04 17:31:02'),
(3, 'Deal of the day', '2021-05-06 16:02:14'),
(4, 'Popular deals', '2021-05-06 16:02:14'),
(5, 'Trending products', '2021-05-06 16:02:38'),
(6, 'Popular Categories', '2021-05-07 14:54:37');

-- --------------------------------------------------------

--
-- Table structure for table `homepage_product`
--

CREATE TABLE `homepage_product` (
  `id` int(11) NOT NULL,
  `pdt_cat_id` int(11) NOT NULL,
  `homepage_id` int(11) NOT NULL,
  `type` int(11) NOT NULL COMMENT '1=product,2=category',
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `homepage_product`
--

INSERT INTO `homepage_product` (`id`, `pdt_cat_id`, `homepage_id`, `type`, `created_at`) VALUES
(1, 1, 1, 1, '2021-05-06 16:04:30'),
(2, 2, 1, 1, '2021-05-06 16:04:30'),
(3, 5, 1, 1, '2021-05-06 16:04:30'),
(7, 23, 5, 1, '2021-05-06 16:05:02'),
(8, 2, 1, 1, '2021-05-07 14:32:29'),
(11, 4, 6, 2, '2021-05-07 16:56:50'),
(12, 2, 1, 1, '2021-05-07 16:59:32'),
(13, 1, 6, 2, '2021-05-20 14:05:53'),
(16, 3, 6, 2, '2021-05-20 14:28:08'),
(18, 4, 6, 2, '2021-05-20 14:58:39'),
(28, 2, 2, 1, '2021-05-20 17:51:09'),
(29, 6, 2, 1, '2021-05-20 17:51:09'),
(30, 1, 2, 1, '2021-05-20 17:51:09'),
(37, 1, 3, 1, '2021-05-25 09:52:40'),
(39, 2, 3, 1, '2021-05-25 09:53:54'),
(41, 6, 4, 1, '2021-05-25 11:07:24'),
(42, 5, 4, 1, '2021-05-25 11:07:24'),
(43, 2, 4, 1, '2021-05-25 11:20:36'),
(44, 5, 4, 1, '2021-05-25 11:21:11'),
(45, 5, 2, 1, '2021-05-25 11:44:11'),
(46, 6, 3, 1, '2021-05-25 11:45:36'),
(47, 5, 3, 1, '2021-05-25 11:45:36'),
(48, 6, 6, 2, '2021-05-25 11:47:57'),
(50, 2, 1, 1, '2021-06-02 06:49:41'),
(51, 12, 1, 1, '2021-08-02 18:46:51'),
(52, 13, 1, 1, '2021-08-02 18:46:51'),
(53, 14, 1, 1, '2021-08-02 18:46:51'),
(55, 16, 1, 1, '2021-08-02 18:46:51'),
(56, 12, 2, 1, '2021-08-02 18:47:08'),
(57, 13, 2, 1, '2021-08-02 18:47:08'),
(58, 14, 2, 1, '2021-08-02 18:47:08'),
(60, 16, 2, 1, '2021-08-02 18:47:08'),
(61, 12, 3, 1, '2021-08-02 18:47:26'),
(62, 13, 3, 1, '2021-08-02 18:47:26'),
(63, 14, 3, 1, '2021-08-02 18:47:26'),
(65, 16, 3, 1, '2021-08-02 18:47:26'),
(66, 16, 4, 1, '2021-08-02 18:47:39'),
(68, 14, 4, 1, '2021-08-02 18:47:39'),
(69, 13, 4, 1, '2021-08-02 18:47:39'),
(70, 12, 4, 1, '2021-08-02 18:47:39'),
(72, 16, 5, 1, '2021-08-02 18:47:54'),
(73, 14, 5, 1, '2021-08-02 18:47:54'),
(74, 12, 5, 1, '2021-08-02 18:47:54'),
(75, 13, 5, 1, '2021-08-02 18:47:54'),
(76, 5, 6, 2, '2021-08-02 18:48:38'),
(77, 10, 6, 2, '2021-08-02 18:48:38'),
(78, 9, 6, 2, '2021-08-02 18:48:38'),
(79, 18, 1, 1, '2021-08-13 14:04:26'),
(80, 18, 2, 1, '2021-08-13 14:04:41'),
(81, 18, 3, 1, '2021-08-13 14:04:54'),
(82, 18, 4, 1, '2021-08-13 14:05:08'),
(83, 18, 5, 1, '2021-08-13 14:05:19'),
(84, 19, 5, 1, '2021-08-13 14:05:19'),
(85, 19, 4, 1, '2021-08-13 14:05:39'),
(86, 19, 3, 1, '2021-08-13 14:05:53'),
(87, 19, 2, 1, '2021-08-13 14:06:05'),
(88, 19, 1, 1, '2021-08-13 14:06:24');

-- --------------------------------------------------------

--
-- Table structure for table `hospitals`
--

CREATE TABLE `hospitals` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `address_line_1` varchar(50) NOT NULL,
  `address_line_2` varchar(50) NOT NULL,
  `zip` bigint(20) NOT NULL,
  `place` varchar(20) NOT NULL,
  `longitude` varchar(100) NOT NULL,
  `latitude` varchar(100) NOT NULL,
  `image` varchar(100) NOT NULL,
  `state` varchar(20) NOT NULL,
  `country` varchar(20) NOT NULL,
  `phone1` bigint(20) NOT NULL,
  `phone2` bigint(20) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `hospitals`
--

INSERT INTO `hospitals` (`id`, `name`, `address_line_1`, `address_line_2`, `zip`, `place`, `longitude`, `latitude`, `image`, `state`, `country`, `phone1`, `phone2`, `created_at`) VALUES
(1, 'amal', 'amal', 'thr', 451254, 'thissur', '76.21', '10.52', '', 'keral', 'india', 5412548754, 5487548745, '2021-05-01 14:36:49'),
(2, 'tharakan hospital', 'elavally', 'pandarakkad', 680544, 'Payyanur, Kerala 670', '12.09720000', '12.09720000', '', 'kerala', 'india', 8767586785, 3434343, '2021-05-21 14:24:28'),
(3, 'next hospital', 'This is next hospital address', 'address2', 680544, 'Indian Oil Petrol Pu', '75.216273', '12.1086312', 'b1c4d225ed910ec5a09beb3d0920a964.jpg', 'kerala', 'india', 343434343, 3434343, '2021-05-21 14:29:15');

-- --------------------------------------------------------

--
-- Table structure for table `institution`
--

CREATE TABLE `institution` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `type` int(11) NOT NULL COMMENT 'Institution Types',
  `reg_no` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `reg_document` varchar(50) NOT NULL,
  `about` varchar(500) NOT NULL,
  `fee` bigint(20) NOT NULL,
  `image` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `institution`
--

INSERT INTO `institution` (`id`, `user_id`, `type`, `reg_no`, `created_at`, `reg_document`, `about`, `fee`, `image`) VALUES
(1, 4, 1, 33445, '2020-12-22 00:00:00', '', '', 0, ''),
(6, 29, 1, 555, '2021-04-22 16:38:15', '', '', 0, 'c66621206e3c6062419d344ab9710a0e.jpg'),
(7, 30, 1, 6, '2021-04-22 16:39:49', '', '', 0, ''),
(8, 31, 1, 3434, '2021-05-14 14:27:50', '', '', 0, ''),
(9, 32, 0, 680511, '2021-05-14 14:29:52', '', '', 0, ''),
(12, 36, 1, 4545, '2021-05-21 15:35:47', '', '', 0, '4c2b0238d54cf2b58812a63549b8caa6.jpg'),
(13, 37, 1, 343434, '2021-05-21 15:38:09', '', '', 0, 'a4a16b1eb513a24e8a2bd377a76344cb.jpg'),
(14, 38, 1, 4545, '2021-05-21 15:39:33', '', '', 0, '3a7c6d592aaaba51af02e296f461c14c.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `institution_labtest`
--

CREATE TABLE `institution_labtest` (
  `id` int(11) NOT NULL,
  `institution_id` int(11) NOT NULL,
  `labtest_id` int(11) NOT NULL,
  `price` bigint(20) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `institution_labtest`
--

INSERT INTO `institution_labtest` (`id`, `institution_id`, `labtest_id`, `price`, `created_at`) VALUES
(1, 4, 5, 500, '2021-01-08 11:32:05'),
(2, 29, 6, 2343, '2021-03-03 11:16:04'),
(3, 4, 6, 234234, '2021-03-03 11:16:04'),
(5, 4, 8, 399, '2021-04-30 06:38:25'),
(8, 29, 8, 33, '2021-04-30 08:22:54'),
(9, 4, 7, 400, '2021-04-30 08:56:59');

-- --------------------------------------------------------

--
-- Table structure for table `institution_types`
--

CREATE TABLE `institution_types` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `institution_types`
--

INSERT INTO `institution_types` (`id`, `name`, `created_at`) VALUES
(1, 'laboratory', '2021-05-14 09:29:52'),
(2, 'Medical Shop', '2021-05-14 10:36:56'),
(3, 'Clinic', '2021-05-14 10:36:56');

-- --------------------------------------------------------

--
-- Table structure for table `invoice`
--

CREATE TABLE `invoice` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `status` varchar(50) NOT NULL,
  `delivery_person_id` int(11) NOT NULL,
  `amt` bigint(100) NOT NULL,
  `tax` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `invoice_billing`
--

CREATE TABLE `invoice_billing` (
  `id` int(11) NOT NULL,
  `invoice_no` varchar(200) NOT NULL,
  `customer_id` bigint(20) NOT NULL COMMENT 'user_id of purchasee',
  `doctor` varchar(50) NOT NULL,
  `total` bigint(20) NOT NULL COMMENT 'total without discount with tax',
  `total_amount` double NOT NULL COMMENT 'bill amount',
  `totalDiscount` bigint(20) NOT NULL,
  `taxableAmount` bigint(20) NOT NULL COMMENT 'This is taxable amount, not include tax, with or without discount',
  `transaction_id` bigint(20) NOT NULL,
  `invoice_date` date NOT NULL,
  `invoice_time` varchar(100) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `total_gst` float NOT NULL,
  `total_cess` float NOT NULL,
  `round_off_amt` float NOT NULL COMMENT 'upto .49 eliminate, aboue .49 include \r\n'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='This is for Billing functionality  , not for anymedion';

--
-- Dumping data for table `invoice_billing`
--

INSERT INTO `invoice_billing` (`id`, `invoice_no`, `customer_id`, `doctor`, `total`, `total_amount`, `totalDiscount`, `taxableAmount`, `transaction_id`, `invoice_date`, `invoice_time`, `created_at`, `total_gst`, `total_cess`, `round_off_amt`) VALUES
(1, 'ANYMED0001', 192, 'diyake', 214, 204, 9, 177, 0, '2021-08-02', '06:07:02 PM', '2021-08-02 18:07:34', 26.94, 0, 0.94);

-- --------------------------------------------------------

--
-- Table structure for table `invoice_billing_products`
--

CREATE TABLE `invoice_billing_products` (
  `id` int(11) NOT NULL,
  `invoice_no` varchar(200) NOT NULL,
  `product_id` mediumint(9) NOT NULL,
  `hsn` varchar(50) NOT NULL,
  `mfr` varchar(50) NOT NULL,
  `qty` bigint(20) NOT NULL,
  `price` bigint(20) NOT NULL,
  `pureAmount` bigint(20) NOT NULL COMMENT 'qty * price',
  `gst` double NOT NULL,
  `discount` double NOT NULL,
  `batch_no` varchar(100) NOT NULL,
  `amount` double NOT NULL,
  `expiry` date NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='This is for Billing functionality , not for anymedion';

--
-- Dumping data for table `invoice_billing_products`
--

INSERT INTO `invoice_billing_products` (`id`, `invoice_no`, `product_id`, `hsn`, `mfr`, `qty`, `price`, `pureAmount`, `gst`, `discount`, `batch_no`, `amount`, `expiry`, `created_at`) VALUES
(1, 'ANYMED0001', 12, '3434', '3433', 2, 43, 86, 12, 4, '45', 91.84, '2021-07-31', '2021-08-02 18:07:34'),
(2, 'ANYMED0001', 14, '433', '3453', 2, 50, 100, 18, 5, '45', 112.1, '2021-08-08', '2021-08-02 18:07:34');

-- --------------------------------------------------------

--
-- Table structure for table `labtest_packages`
--

CREATE TABLE `labtest_packages` (
  `id` int(11) NOT NULL,
  `package_id` int(11) NOT NULL,
  `test_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='it connects packages to labtests(lab_tests table)';

--
-- Dumping data for table `labtest_packages`
--

INSERT INTO `labtest_packages` (`id`, `package_id`, `test_id`, `created_at`) VALUES
(2, 6, 1, '2021-01-04 07:08:07'),
(3, 6, 2, '2021-01-04 07:08:07'),
(4, 7, 2, '2021-01-04 07:46:38'),
(5, 7, 2, '2021-01-04 07:46:38'),
(6, 8, 1, '2021-01-04 07:47:46'),
(7, 8, 2, '2021-01-04 07:47:46'),
(8, 11, 1, '2021-01-06 04:57:05'),
(9, 11, 2, '2021-01-06 04:57:05'),
(10, 11, 2, '2021-01-06 04:57:05'),
(11, 12, 1, '2021-01-22 10:03:32'),
(12, 12, 4, '2021-01-22 10:03:32'),
(13, 26, 3, '2021-03-03 10:18:30'),
(14, 27, 2, '2021-03-03 10:20:14'),
(15, 27, 4, '2021-03-03 10:20:14'),
(16, 28, 1, '2021-03-30 10:48:53'),
(17, 28, 3, '2021-03-30 10:48:53'),
(18, 10, 3, '2021-05-01 02:12:17'),
(19, 30, 5, '2021-05-21 15:08:21'),
(20, 30, 4, '2021-05-21 15:08:21'),
(21, 31, 2, '2021-05-21 15:09:11'),
(22, 31, 4, '2021-05-21 15:09:11');

-- --------------------------------------------------------

--
-- Table structure for table `lab_custom`
--

CREATE TABLE `lab_custom` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `lab_custom`
--

INSERT INTO `lab_custom` (`id`, `name`, `created_at`) VALUES
(1, 'Full Body Check Up', '2021-06-04 10:44:48'),
(2, 'Categories', '2021-06-04 11:23:27'),
(3, 'Laboratories', '2021-06-04 11:23:42'),
(4, 'Tests', '2021-06-04 11:23:51');

-- --------------------------------------------------------

--
-- Table structure for table `lab_custom_assign`
--

CREATE TABLE `lab_custom_assign` (
  `id` int(11) NOT NULL,
  `lab_custom_id` int(11) NOT NULL,
  `assgn_id` int(11) NOT NULL,
  `type` int(11) NOT NULL COMMENT '1=pkg,2=category,3=laboratory,4=test',
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `lab_custom_assign`
--

INSERT INTO `lab_custom_assign` (`id`, `lab_custom_id`, `assgn_id`, `type`, `created_at`) VALUES
(5, 4, 3, 4, '2021-06-05 17:30:35'),
(7, 1, 2, 1, '2021-06-05 17:44:03'),
(9, 1, 31, 1, '2021-06-07 12:20:52'),
(10, 2, 2, 2, '2021-06-07 12:29:22'),
(11, 2, 1, 2, '2021-06-07 12:29:32'),
(12, 3, 36, 3, '2021-06-07 12:29:41'),
(13, 3, 37, 3, '2021-06-07 12:29:41'),
(14, 3, 36, 3, '2021-06-07 12:30:10'),
(15, 1, 3, 1, '2021-06-08 16:00:07');

-- --------------------------------------------------------

--
-- Table structure for table `lab_tests`
--

CREATE TABLE `lab_tests` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `cat_id` int(11) NOT NULL,
  `description` text NOT NULL,
  `gender` varchar(20) NOT NULL,
  `sample_type` varchar(20) NOT NULL,
  `image` varchar(100) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='It containes single lab test information ';

--
-- Dumping data for table `lab_tests`
--

INSERT INTO `lab_tests` (`id`, `name`, `cat_id`, `description`, `gender`, `sample_type`, `image`, `created_at`) VALUES
(1, 'Sugar_Test', 0, 'It is for insuli n test', 'male', 'oral sample', '', '2020-12-30 12:58:53'),
(2, 'cholestrol', 0, 'test description for cholestrol labtest', 'unisex', 'blood sample', '', '2020-12-31 11:22:35'),
(3, 'hemofelia', 0, 'for finding hemofelia', 'unisex', 'oral sample', '', '2021-01-08 11:31:39'),
(4, 'hemofelia', 0, 'for finding hemofelia', 'unisex', 'oral sample', '', '2021-01-08 11:31:42'),
(5, 'hemofelia', 0, 'for finding hemofelia', 'unisex', 'oral sample', '', '2021-01-08 11:32:05'),
(6, 'new lab test corona', 0, 'it i snew lab test', 'uisex', 'oral sample', '', '2021-03-03 11:16:04'),
(7, 'corona test new', 0, 'new corona test', 'Unisex', 'oral', '', '2021-04-30 08:59:14'),
(8, 'test shinoy', 0, 'new corona test', 'Unisex', 'oral', '', '2021-04-30 08:22:54');

-- --------------------------------------------------------

--
-- Table structure for table `login_attempts`
--

CREATE TABLE `login_attempts` (
  `id` int(11) UNSIGNED NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` int(11) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `login_history`
--

CREATE TABLE `login_history` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `ip_address` varchar(50) NOT NULL,
  `login_time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `login_history`
--

INSERT INTO `login_history` (`id`, `username`, `ip_address`, `login_time`) VALUES
(6, 'ogoentertainer@gmail.com', '43.229.89.112', '2020-02-13 17:38:06'),
(7, 'ogoentertainer@gmail.com', '43.229.88.243', '2020-02-14 10:00:06'),
(8, 'test456@gmail.com', '43.229.88.243', '2020-02-14 10:09:22'),
(9, 'ogoentertainer@gmail.com', '43.229.88.243', '2020-02-14 10:26:54'),
(10, 'ogoentertainer@gmail.com', '43.229.88.243', '2020-02-14 14:57:50'),
(11, 'ogoentertainer@gmail.com', '43.229.89.159', '2020-02-16 14:22:44'),
(12, 'ogoentertainer@gmail.com', '42.106.182.84', '2020-02-16 23:16:16'),
(13, 'ogoentertainer@gmail.com', '27.61.40.240', '2020-02-17 11:04:16'),
(14, 'ogoentertainer@gmail.com', '27.61.40.240', '2020-02-17 11:36:02'),
(15, 'ogoentertainer@gmail.com', '27.61.40.240', '2020-02-17 11:42:52'),
(16, 'ogoentertainer@gmail.com', '27.61.40.240', '2020-02-17 11:44:15'),
(17, 'ogoentertainer@gmail.com', '137.97.105.16', '2020-02-17 12:38:14'),
(18, 'ogoentertainer@gmail.com', '106.203.118.244', '2020-02-18 12:02:18'),
(19, 'ogoentertainer@gmail.com', '43.229.89.131', '2020-02-18 12:41:33'),
(20, 'ogoentertainer@gmail.com', '106.203.92.112', '2020-02-19 15:01:35'),
(21, 'ogoentertainerdoc@gmail.com', '106.203.92.112', '2020-02-19 15:06:00'),
(22, 'ogoentertainer@gmail.com', '106.203.92.112', '2020-02-19 15:06:51'),
(23, 'ogoentertainerdoc@gmail.com', '106.203.92.112', '2020-02-19 15:07:43'),
(24, 'ogoentertainer@gmail.com', '223.228.191.211', '2020-02-21 15:09:52'),
(25, 'ogoentertainer@gmail.com', '137.97.94.255', '2020-02-22 10:15:39'),
(26, 'ogoentertainer@gmail.com', '43.229.90.11', '2020-02-26 15:49:44'),
(27, 'ogoentertainer@gmail.com', '223.228.185.27', '2020-02-29 11:10:20'),
(28, 'ogoentertainer@gmail.com', '137.97.112.195', '2020-02-29 13:04:26'),
(29, 'ogoentertainer@gmail.com', '137.97.66.142', '2020-03-07 09:48:45'),
(30, 'ogoentertainer@gmail.com', '137.97.88.85', '2020-03-20 11:57:54'),
(31, 'ogoentertainer@gmail.com', '137.97.78.204', '2020-03-20 13:47:12'),
(32, 'ogoentertainer@gmail.com', '137.97.186.58', '2020-03-21 12:18:24'),
(33, 'ogoentertainer@gmail.com', '137.97.106.248', '2020-03-22 08:06:51'),
(34, 'ogoentertainer@gmail.com', '137.97.114.183', '2020-03-28 12:14:52'),
(35, 'ogoentertainer@gmail.com', '106.203.112.145', '2020-05-15 13:52:53'),
(36, 'ogoentertainer@gmail.com', '137.97.139.117', '2020-05-15 15:07:57'),
(37, 'ogoentertainer@gmail.com', '137.97.186.245', '2020-05-16 09:56:30'),
(38, 'ogoentertainer@gmail.com', '137.97.186.245', '2020-05-16 12:49:38'),
(39, 'ogoentertainer@gmail.com', '137.97.171.250', '2020-05-16 14:41:35'),
(40, 'ogoentertainer@gmail.com', '103.148.20.198', '2020-05-27 11:35:15'),
(41, 'ogoentertainer@gmail.com', '103.70.198.190', '2020-06-06 14:24:30'),
(42, 'ogoentertainer@gmail.com', '42.106.180.71', '2020-06-06 14:57:20'),
(43, 'ogoentertainer@gmail.com', '42.109.128.151', '2020-06-08 09:32:38'),
(44, 'ogoentertainer@gmail.com', '42.106.181.243', '2020-06-13 16:13:33'),
(45, 'ogoentertainer@gmail.com', '103.70.199.195', '2020-06-13 16:57:21'),
(46, 'ogoentertainer@gmail.com', '43.229.90.208', '2020-06-15 15:03:36'),
(47, 'ogoentertainer@gmail.com', '42.106.182.65', '2020-06-15 15:24:56'),
(48, 'ogoentertainer@gmail.com', '42.106.182.65', '2020-06-29 17:39:07'),
(49, 'ogoentertainer@gmail.com', '42.106.180.128', '2020-06-30 16:12:03'),
(50, 'ogoentertainer@gmail.com', '42.106.182.11', '2020-08-22 14:21:00'),
(51, 'ogoentertainer@gmail.com', '1.39.77.196', '2020-08-24 11:37:39'),
(52, 'ogoentertainer@gmail.com', '27.61.21.186', '2020-08-24 11:42:26'),
(53, 'ogoentertainer@gmail.com', '103.70.198.203', '2020-08-24 21:32:43'),
(54, 'ogoentertainer@gmail.com', '42.106.181.187', '2020-08-25 11:52:26'),
(55, 'ogoentertainer@gmail.com', '106.200.41.249', '2020-08-25 11:52:47'),
(56, 'ogoentertainer@gmail.com', '42.106.180.202', '2020-08-28 13:05:56'),
(57, 'ogoentertainer@gmail.com', '42.106.180.161', '2020-09-01 10:21:51'),
(58, 'ogoentertainer@gmail.com', '42.109.130.184', '2020-09-01 11:11:20'),
(59, 'ogoentertainer@gmail.com', '42.106.182.12', '2020-09-05 09:54:48'),
(60, 'ogoentertainerdoc@gmail.com', '103.148.20.78', '2020-09-05 13:04:10'),
(61, 'ogoentertainer@gmail.com', '42.106.181.251', '2020-09-12 14:26:20'),
(62, 'ogoentertainer@gmail.com', '42.106.181.11', '2020-09-13 18:27:47'),
(63, 'ogoentertainer@gmail.com', '42.106.180.237', '2020-09-26 14:36:53'),
(64, 'ogoentertainer@gmail.com', '103.99.204.168', '2020-10-02 16:23:27'),
(65, 'ogoentertainer@gmail.com', '42.106.181.29', '2020-10-02 16:25:08'),
(66, 'ogoentertainer@gmail.com', '103.70.197.167', '2020-10-03 13:25:20'),
(67, 'ogoentertainer@gmail.com', '103.70.197.167', '2020-10-03 14:38:15'),
(68, 'ogoentertainer@gmail.com', '103.99.204.22', '2020-10-03 16:12:38'),
(69, 'ogoentertainer@gmail.com', '103.99.204.22', '2020-10-03 16:17:10'),
(70, 'ogoentertainer@gmail.com', '42.106.181.29', '2020-10-03 16:31:36'),
(71, 'ogoentertainer@gmail.com', '103.70.197.59', '2020-10-03 17:35:59'),
(72, 'ogoentertainer@gmail.com', '103.70.197.59', '2020-10-03 17:47:56'),
(73, 'ogoentertainer@gmail.com', '103.70.197.168', '2020-10-03 18:36:48'),
(74, 'ogoentertainer@gmail.com', '103.70.197.168', '2020-10-03 22:20:57'),
(75, 'ogoentertainer@gmail.com', '103.99.204.221', '2020-10-04 12:24:30'),
(76, 'ogoentertainer@gmail.com', '103.70.196.163', '2020-10-04 12:28:29'),
(77, 'ogoentertainer@gmail.com', '42.106.180.89', '2020-10-04 15:57:07'),
(78, 'ogoentertainer@gmail.com', '103.99.205.165', '2020-10-04 18:04:55'),
(79, 'ogoentertainer@gmail.com', '103.99.204.176', '2020-10-05 13:42:20'),
(80, 'ogoentertainer@gmail.com', '42.106.180.88', '2020-10-07 10:57:56'),
(81, 'ogoentertainer@gmail.com', '42.109.143.169', '2020-10-07 18:09:52'),
(82, 'ogoentertainer@gmail.com', '1.39.78.252', '2020-10-07 19:29:46'),
(83, 'ogoentertainer@gmail.com', '103.70.197.173', '2020-10-07 21:57:16'),
(84, 'ogoentertainer@gmail.com', '1.39.78.252', '2020-10-07 22:08:01'),
(85, 'ogoentertainer@gmail.com', '202.83.56.62', '2020-10-07 23:13:39'),
(86, 'ogoentertainer@gmail.com', '1.39.75.108', '2020-10-08 10:26:14'),
(87, 'ogoentertainer@gmail.com', '103.70.196.149', '2020-10-08 12:22:56'),
(88, 'ogoentertainer@gmail.com', '1.39.78.252', '2020-10-08 13:11:55'),
(89, 'ogoentertainer@gmail.com', '42.109.148.217', '2020-10-08 20:15:32'),
(90, 'ogoentertainer@gmail.com', '103.70.196.253', '2020-10-10 15:57:08'),
(91, 'ogoentertainer@gmail.com', '103.70.196.253', '2020-10-10 19:45:36'),
(92, 'ogoentertainer@gmail.com', '157.46.219.115', '2020-10-11 08:13:41'),
(93, 'ogoentertainer@gmail.com', '157.46.219.115', '2020-10-11 12:47:30'),
(94, 'ogoentertainer@gmail.com', '157.46.217.179', '2020-10-11 14:59:40'),
(95, 'ogoentertainer@gmail.com', '42.106.181.57', '2020-10-11 15:15:10'),
(96, 'ogoentertainer@gmail.com', '103.99.205.38', '2020-10-11 15:44:36'),
(97, 'ogoentertainer@gmail.com', '27.61.39.247', '2020-10-11 17:15:34'),
(98, 'ogoentertainer@gmail.com', '157.46.132.248', '2020-10-11 18:22:52'),
(99, 'ogoentertainer@gmail.com', '42.111.238.231', '2020-10-11 18:52:19'),
(100, 'ogoentertainer@gmail.com', '1.39.78.118', '2020-10-11 19:14:05'),
(101, 'ogoentertainer@gmail.com', '157.46.132.248', '2020-10-11 19:59:18'),
(102, 'ogoentertainer@gmail.com', '157.46.132.248', '2020-10-11 20:32:36'),
(103, 'ogoentertainer@gmail.com', '1.39.78.118', '2020-10-11 22:54:47'),
(104, 'ogoentertainer@gmail.com', '157.44.174.117', '2020-10-12 09:40:25'),
(105, 'ogoentertainer@gmail.com', '157.44.166.33', '2020-10-12 23:15:41'),
(106, 'ogoentertainer@gmail.com', '157.44.166.33', '2020-10-13 01:46:58'),
(107, 'ogoentertainer@gmail.com', '157.44.166.33', '2020-10-13 02:59:17'),
(108, 'ogoentertainer@gmail.com', '42.109.144.31', '2020-10-13 07:18:10'),
(109, 'ogoentertainer@gmail.com', '106.200.63.176', '2020-10-13 07:39:47'),
(110, 'ogoentertainer@gmail.com', '157.44.176.170', '2020-10-13 10:14:08'),
(111, 'ogoentertainer@gmail.com', '42.109.146.22', '2020-10-13 18:56:29'),
(112, 'ogoentertainer@gmail.com', '157.44.221.47', '2020-10-14 08:18:51'),
(113, 'ogoentertainer@gmail.com', '157.44.209.234', '2020-10-14 20:04:00'),
(114, 'ogoentertainer@gmail.com', '157.44.192.112', '2020-10-14 23:28:13'),
(115, 'ogoentertainer@gmail.com', '157.44.192.112', '2020-10-15 00:15:48'),
(116, 'ogoentertainer@gmail.com', '157.44.219.18', '2020-10-15 09:30:04'),
(117, 'ogoentertainer@gmail.com', '1.39.78.169', '2020-10-15 10:05:25'),
(118, 'ogoentertainer@gmail.com', '42.106.180.239', '2020-10-15 17:34:22'),
(119, 'ogoentertainer@gmail.com', '157.44.147.37', '2020-10-15 18:05:18'),
(120, 'ogoentertainer@gmail.com', '157.44.147.37', '2020-10-15 18:30:55'),
(121, 'ogoentertainer@gmail.com', '42.106.180.84', '2020-10-16 09:03:10'),
(122, 'ogoentertainer@gmail.com', '42.109.150.219', '2020-10-16 12:54:24'),
(123, 'ogoentertainer@gmail.com', '157.44.154.8', '2020-10-16 17:41:03'),
(124, 'ogoentertainer@gmail.com', '42.111.254.57', '2020-10-16 17:52:55'),
(125, 'ogoentertainer@gmail.com', '42.109.150.219', '2020-10-16 19:53:34'),
(126, 'ogoentertainer@gmail.com', '1.39.76.135', '2020-10-16 20:45:45'),
(127, 'ogoentertainer@gmail.com', '157.44.192.56', '2020-10-17 09:57:26'),
(128, 'ogoentertainer@gmail.com', '103.70.196.61', '2020-10-17 12:23:03'),
(129, 'ogoentertainer@gmail.com', '42.106.180.151', '2020-10-17 12:52:35'),
(130, 'accounts@ogoentertainer.com', '42.106.180.151', '2020-10-17 12:57:45'),
(131, 'accounts@ogoentertainer.com', '42.106.180.151', '2020-10-17 14:37:59'),
(132, 'ogoentertainer@gmail.com', '42.106.180.151', '2020-10-17 23:21:12'),
(133, 'ogoentertainer@gmail.com', '157.44.190.23', '2020-10-18 09:51:02'),
(134, 'ogoentertainer@gmail.com', '157.44.206.103', '2020-10-18 14:46:32'),
(135, 'ogoentertainer@gmail.com', '157.44.206.103', '2020-10-18 18:32:15'),
(136, 'ogoentertainer@gmail.com', '42.111.246.162', '2020-10-18 18:36:07'),
(137, 'ogoentertainer@gmail.com', '157.46.133.51', '2020-10-19 11:08:56'),
(138, 'accounts@ogoentertainer.com', '157.46.133.51', '2020-10-19 11:09:23'),
(139, 'ogoentertainer@gmail.com', '157.46.141.214', '2020-10-19 13:29:24'),
(140, 'ogoentertainer@gmail.com', '42.106.181.240', '2020-10-20 10:47:58'),
(141, 'ogoentertainer@gmail.com', '42.106.181.240', '2020-10-20 11:28:01'),
(142, 'accounts@ogoentertainer.com', '157.44.214.242', '2020-10-20 12:38:37'),
(143, 'accounts@ogoentertainer.com', '157.44.222.69', '2020-10-20 15:56:37'),
(144, 'ogoentertainer@gmail.com', '157.44.191.229', '2020-10-21 10:02:12'),
(145, 'ogoentertainer@gmail.com', '157.44.191.229', '2020-10-21 10:03:56'),
(146, 'ogoentertainer@gmail.com', '157.44.191.229', '2020-10-21 11:14:36'),
(147, 'accounts@ogoentertainer.com', '157.44.168.84', '2020-10-21 15:50:38'),
(148, 'accounts@ogoentertainer.com', '157.44.218.226', '2020-10-22 09:56:21'),
(149, 'ogoentertainer@gmail.com', '157.44.218.226', '2020-10-22 10:07:26'),
(150, 'ogoentertainer@gmail.com', '157.44.218.226', '2020-10-22 12:02:37'),
(151, 'ogoentertainer@gmail.com', '157.44.218.226', '2020-10-22 12:18:21'),
(152, 'ogoentertainer@gmail.com', '157.44.200.174', '2020-10-22 15:27:25'),
(153, 'ogoentertainer@gmail.com', '157.44.138.93', '2020-10-23 09:56:18'),
(154, 'accounts@ogoentertainer.com', '157.44.138.93', '2020-10-23 11:16:24'),
(155, 'ogoentertainer@gmail.com', '157.44.146.235', '2020-10-23 15:08:44'),
(156, 'ogoentertainer@gmail.com', '42.106.180.146', '2020-10-23 16:55:03'),
(157, 'ben@ogoentertainer.com', '42.106.180.146', '2020-10-23 17:04:35'),
(158, 'ogoentertainer@gmail.com', '42.106.180.146', '2020-10-23 17:04:54'),
(159, 'ben@ogoentertainer.com', '42.106.180.146', '2020-10-23 17:05:49'),
(160, 'ben@ogoentertainer.com', '42.106.180.146', '2020-10-23 17:07:25'),
(161, 'ogoentertainer@gmail.com', '42.106.180.146', '2020-10-23 17:10:13'),
(162, 'ogoentertainer@gmail.com', '27.61.22.105', '2020-10-23 20:58:50'),
(163, 'ogoentertainer@gmail.com', '42.106.180.146', '2020-10-23 21:49:17'),
(164, 'ogoentertainer@gmail.com', '42.106.180.146', '2020-10-24 05:45:03'),
(165, 'ogoentertainer@gmail.com', '42.106.180.146', '2020-10-24 09:16:53'),
(166, 'ogoentertainer@gmail.com', '42.106.180.146', '2020-10-24 10:54:51'),
(167, 'ogoentertainer@gmail.com', '157.46.218.78', '2020-10-24 12:08:05'),
(168, 'ogoentertainer@gmail.com', '157.46.218.78', '2020-10-24 12:45:28'),
(169, 'ogoentertainer@gmail.com', '1.39.78.240', '2020-10-24 18:15:02'),
(170, 'ogoentertainer@gmail.com', '117.204.103.37', '2020-10-24 22:27:53'),
(171, 'ogoentertainer@gmail.com', '42.106.181.10', '2020-10-24 22:29:06'),
(172, 'ogoentertainer@gmail.com', '42.106.181.204', '2020-10-25 08:36:32'),
(173, 'ogoentertainer@gmail.com', '61.3.181.236', '2020-10-25 21:51:19'),
(174, 'ogoentertainer@gmail.com', '157.46.215.157', '2020-10-26 10:13:40'),
(175, 'accounts@ogoentertainer.com', '157.46.215.157', '2020-10-26 10:34:29'),
(176, 'ogoentertainer@gmail.com', '157.46.215.157', '2020-10-26 12:27:15'),
(177, 'accounts@ogoentertainer.com', '157.46.215.157', '2020-10-26 14:43:22'),
(178, 'accounts@ogoentertainer.com', '157.46.160.156', '2020-10-27 09:42:01'),
(179, 'ogoentertainer@gmail.com', '157.46.160.156', '2020-10-27 10:40:50'),
(180, 'accounts@ogoentertainer.com', '157.46.160.156', '2020-10-27 10:57:30'),
(181, 'ogoentertainer@gmail.com', '157.46.187.124', '2020-10-27 17:01:20'),
(182, 'ogoentertainer@gmail.com', '157.46.187.124', '2020-10-27 18:14:54'),
(183, 'ogoentertainer@gmail.com', '157.46.141.163', '2020-10-28 09:55:32'),
(184, 'accounts@ogoentertainer.com', '157.46.141.163', '2020-10-28 10:02:33'),
(185, 'ogoentertainer@gmail.com', '42.106.181.225', '2020-10-28 10:46:02'),
(186, 'accounts@ogoentertainer.com', '157.46.141.163', '2020-10-28 11:45:11'),
(187, 'ogoentertainer@gmail.com', '1.39.75.5', '2020-10-28 11:56:47'),
(188, 'accounts@ogoentertainer.com', '157.46.139.190', '2020-10-28 16:09:08'),
(189, 'ogoentertainer@gmail.com', '42.106.182.127', '2020-10-29 10:22:55'),
(190, 'ben@ogoentertainer.com', '42.106.182.127', '2020-10-29 10:41:58'),
(191, 'accounts@ogoentertainer.com', '157.44.218.198', '2020-10-29 13:48:14'),
(192, 'ben@ogoentertainer.com', '157.44.199.172', '2020-10-29 15:23:42'),
(193, 'accounts@ogoentertainer.com', '157.44.198.77', '2020-10-30 09:53:12'),
(194, 'ogoentertainer@gmail.com', '157.44.207.31', '2020-10-30 12:16:18'),
(195, 'accounts@ogoentertainer.com', '157.44.221.148', '2020-10-30 15:06:07'),
(196, 'ogoentertainer@gmail.com', '157.44.221.148', '2020-10-30 16:18:44'),
(197, 'ogoentertainer@gmail.com', '42.106.181.127', '2020-10-30 22:04:12'),
(198, 'ogoentertainer@gmail.com', '42.106.181.127', '2020-10-30 22:05:58'),
(199, 'accounts@ogoentertainer.com', '157.44.147.85', '2020-10-31 09:43:41'),
(200, 'ogoentertainer@gmail.com', '157.44.147.85', '2020-10-31 09:49:45'),
(201, 'ogoentertainer@gmail.com', '42.106.181.219', '2020-11-01 08:36:47'),
(202, 'ogoentertainer@gmail.com', '157.44.195.248', '2020-11-02 09:50:17'),
(203, 'accounts@ogoentertainer.com', '157.44.195.248', '2020-11-02 09:53:56'),
(204, 'accounts@ogoentertainer.com', '157.44.199.115', '2020-11-02 15:41:39'),
(205, 'ogoentertainer@gmail.com', '42.106.180.237', '2020-11-02 17:47:47'),
(206, 'accounts@ogoentertainer.com', '157.46.220.18', '2020-11-03 09:41:23'),
(207, 'accounts@ogoentertainer.com', '157.46.208.100', '2020-11-03 15:52:44'),
(208, 'accounts@ogoentertainer.com', '157.44.133.86', '2020-11-04 09:49:00'),
(209, 'ogoentertainer@gmail.com', '42.106.182.114', '2020-11-04 11:00:16'),
(210, 'accounts@ogoentertainer.com', '157.44.131.44', '2020-11-05 09:55:57'),
(211, 'ogoentertainer@gmail.com', '157.44.153.69', '2020-11-06 16:46:27'),
(212, 'ogoentertainer@gmail.com', '157.46.212.245', '2020-11-07 10:10:12'),
(213, 'ben@ogoentertainer.com', '157.46.212.245', '2020-11-07 12:08:26'),
(214, 'ben@ogoentertainer.com', '157.46.223.15', '2020-11-07 15:04:42'),
(215, 'ogoentertainer@gmail.com', '157.46.223.15', '2020-11-07 15:14:01'),
(216, 'ogoentertainer@gmail.com', '157.46.223.15', '2020-11-07 17:26:56'),
(217, 'ogoentertainer@gmail.com', '42.106.180.226', '2020-11-07 21:20:06'),
(218, 'ogoentertainer@gmail.com', '42.106.180.226', '2020-11-08 23:16:11'),
(219, 'ogoentertainer@gmail.com', '42.106.180.226', '2020-11-08 23:42:27'),
(220, 'ogoentertainer@gmail.com', '42.106.180.226', '2020-11-08 23:50:20'),
(221, 'accounts@ogoentertainer.com', '42.106.180.226', '2020-11-09 00:43:20'),
(222, 'ben@ogoentertainer.com', '42.106.180.226', '2020-11-09 00:45:01'),
(223, 'ben@ogoentertainer.com', '42.106.180.226', '2020-11-09 00:50:35'),
(224, 'ogoentertainer@gmail.com', '42.106.180.226', '2020-11-09 00:54:31'),
(225, 'ogoentertainer@gmail.com', '157.44.142.128', '2020-11-09 08:21:39'),
(226, 'ogoentertainer@gmail.com', '157.44.199.122', '2020-11-09 11:44:13'),
(227, 'ogoentertainer@gmail.com', '157.44.223.130', '2020-11-09 19:52:12'),
(228, 'ogoentertainer@gmail.com', '157.44.136.152', '2020-11-09 21:51:23'),
(229, 'ogoentertainer@gmail.com', '157.44.158.143', '2020-11-10 11:48:21'),
(230, 'ogoentertainer@gmail.com', '157.44.158.143', '2020-11-10 13:15:17'),
(231, 'ogoentertainer@gmail.com', '157.44.158.143', '2020-11-10 14:31:19'),
(232, 'ogoentertainer@gmail.com', '103.99.205.89', '2020-11-10 16:58:11'),
(233, 'ogoentertainer@gmail.com', '42.106.181.64', '2020-11-10 17:17:38'),
(234, 'ogoentertainer@gmail.com', '157.44.142.52', '2020-11-10 17:25:30'),
(235, 'ogoentertainer@gmail.com', '42.106.181.6', '2020-11-10 18:26:48'),
(236, 'ogoentertainer@gmail.com', '42.106.181.6', '2020-11-10 18:42:01'),
(237, 'ogoentertainer@gmail.com', '42.106.181.6', '2020-11-10 21:07:49'),
(238, 'ogoentertainer@gmail.com', '42.106.180.133', '2020-11-11 08:31:27'),
(239, 'ogoentertainer@gmail.com', '157.44.159.150', '2020-11-11 09:56:01'),
(240, 'ogoentertainer@gmail.com', '157.44.159.150', '2020-11-11 10:29:08'),
(241, 'ben@ogoentertainer.com', '157.44.159.150', '2020-11-11 10:44:21'),
(242, 'ben@ogoentertainer.com', '157.44.159.150', '2020-11-11 12:11:07'),
(243, 'ogoentertainer@gmail.com', '42.106.180.133', '2020-11-11 14:07:59'),
(244, 'ben@ogoentertainer.com', '157.44.129.90', '2020-11-11 17:17:55'),
(245, 'ogoentertainer@gmail.com', '42.106.180.133', '2020-11-11 17:18:14'),
(246, 'ben@ogoentertainer.com', '157.44.129.90', '2020-11-11 17:29:32'),
(247, 'ogoentertainer@gmail.com', '157.44.129.90', '2020-11-11 17:55:57'),
(248, 'ogoentertainer@gmail.com', '42.109.130.23', '2020-11-12 11:35:09'),
(249, 'ogoentertainer@gmail.com', '42.109.128.167', '2020-11-12 13:31:30'),
(250, 'ogoentertainer@gmail.com', '42.106.182.53', '2020-11-12 17:31:50'),
(251, 'ogoentertainer@gmail.com', '42.106.182.53', '2020-11-12 20:30:30'),
(252, 'ogoentertainer@gmail.com', '42.109.150.219', '2020-11-12 23:18:24'),
(253, 'ogoentertainer@gmail.com', '42.106.180.184', '2020-11-13 08:11:46'),
(254, 'ogoentertainer@gmail.com', '157.46.140.28', '2020-11-13 09:49:10'),
(255, 'ben@ogoentertainer.com', '157.46.140.28', '2020-11-13 10:25:23'),
(256, 'ogoentertainer@gmail.com', '42.106.180.184', '2020-11-13 16:05:41'),
(257, 'ogoentertainer@gmail.com', '157.44.175.47', '2020-11-13 18:19:11'),
(258, 'ogoentertainer@gmail.com', '42.106.180.184', '2020-11-13 19:40:42'),
(259, 'ogoentertainer@gmail.com', '42.106.182.56', '2020-11-13 20:28:06'),
(260, 'ogoentertainer@gmail.com', '42.106.182.56', '2020-11-13 20:28:35'),
(261, 'ogoentertainer@gmail.com', '42.106.182.56', '2020-11-13 21:10:10'),
(262, 'ogoentertainer@gmail.com', '42.106.181.115', '2020-11-14 09:20:50'),
(263, 'ogoentertainer@gmail.com', '157.44.223.100', '2020-11-14 10:48:22'),
(264, 'ogoentertainer@gmail.com', '42.106.181.115', '2020-11-14 12:06:12'),
(265, 'ogoentertainer@gmail.com', '42.106.181.115', '2020-11-14 12:34:32'),
(266, 'ogoentertainer@gmail.com', '42.106.181.115', '2020-11-14 13:41:40'),
(267, 'ogoentertainer@gmail.com', '157.44.217.61', '2020-11-14 16:34:47'),
(268, 'ogoentertainer@gmail.com', '157.46.136.197', '2020-11-15 16:18:07'),
(269, 'ogoentertainer@gmail.com', '157.46.136.197', '2020-11-15 18:05:20'),
(270, 'ogoentertainer@gmail.com', '157.46.136.197', '2020-11-15 18:06:02'),
(271, 'ogoentertainer@gmail.com', '42.106.182.124', '2020-11-15 23:50:08'),
(272, 'ogoentertainer@gmail.com', '42.106.182.124', '2020-11-16 00:17:08'),
(273, 'ben@ogoentertainer.com', '157.46.146.30', '2020-11-16 09:47:23'),
(274, 'ogoentertainer@gmail.com', '157.46.140.235', '2020-11-16 10:06:26'),
(275, 'ogoentertainer@gmail.com', '157.46.147.225', '2020-11-16 16:07:26'),
(276, 'ogoentertainer@gmail.com', '42.109.143.5', '2020-11-17 08:27:33'),
(277, 'ben@ogoentertainer.com', '157.44.137.160', '2020-11-17 10:12:17'),
(278, 'ogoentertainer@gmail.com', '157.44.137.160', '2020-11-17 10:14:10'),
(279, 'ogoentertainer@gmail.com', '42.106.181.22', '2020-11-17 16:10:27'),
(280, 'ogoentertainer@gmail.com', '157.44.154.70', '2020-11-17 18:32:29'),
(281, 'ogoentertainer@gmail.com', '42.106.181.18', '2020-11-18 08:42:39'),
(282, 'ogoentertainer@gmail.com', '157.46.156.39', '2020-11-18 11:04:37'),
(283, 'ogoentertainer@gmail.com', '27.61.4.164', '2020-11-18 21:16:41'),
(284, 'ogoentertainer@gmail.com', '42.109.128.58', '2020-11-18 21:17:29'),
(285, 'ogoentertainer@gmail.com', '42.109.128.58', '2020-11-18 21:17:59'),
(286, 'ogoentertainer@gmail.com', '157.44.214.107', '2020-11-19 10:24:16'),
(287, 'ogoentertainer@gmail.com', '42.109.131.236', '2020-11-19 11:46:50'),
(288, 'ogoentertainer@gmail.com', '42.106.180.62', '2020-11-20 10:12:10'),
(289, 'ogoentertainer@gmail.com', '157.44.207.254', '2020-11-21 10:26:29'),
(290, 'ogoentertainer@gmail.com', '1.39.77.121', '2020-11-21 11:21:02'),
(291, 'ogoentertainer@gmail.com', '1.39.77.121', '2020-11-21 11:22:12'),
(292, 'ogoentertainer@gmail.com', '103.70.196.218', '2020-11-21 13:06:04'),
(293, 'ogoentertainer@gmail.com', '42.109.149.137', '2020-11-21 13:46:22'),
(294, 'ogoentertainer@gmail.com', '42.109.149.137', '2020-11-21 14:40:45'),
(295, 'ogoentertainer@gmail.com', '42.109.149.137', '2020-11-21 14:53:56'),
(296, 'ogoentertainer@gmail.com', '42.109.149.137', '2020-11-21 14:57:27'),
(297, 'ogoentertainer@gmail.com', '42.106.181.235', '2020-11-21 18:20:51'),
(298, 'ogoentertainer@gmail.com', '42.109.131.186', '2020-11-21 22:37:08'),
(299, 'ogoentertainer@gmail.com', '42.106.180.49', '2020-11-22 11:16:43'),
(300, 'ogoentertainer@gmail.com', '42.106.180.49', '2020-11-22 13:02:55'),
(301, 'ogoentertainer@gmail.com', '42.106.180.49', '2020-11-22 14:30:39'),
(302, 'ogoentertainer@gmail.com', '103.99.204.42', '2020-11-22 15:45:58'),
(303, 'ogoentertainer@gmail.com', '103.99.204.42', '2020-11-22 15:46:20'),
(304, 'ogoentertainer@gmail.com', '157.46.140.4', '2020-11-22 17:24:26'),
(305, 'ogoentertainer@gmail.com', '42.106.180.177', '2020-11-22 21:52:00'),
(306, 'ogoentertainer@gmail.com', '1.39.78.134', '2020-11-23 11:10:33'),
(307, 'ogoentertainer@gmail.com', '103.70.196.71', '2020-11-23 13:15:43'),
(308, 'ogoentertainer@gmail.com', '42.109.151.78', '2020-11-23 15:27:55'),
(309, 'ogoentertainer@gmail.com', '42.109.151.78', '2020-11-23 16:42:04'),
(310, 'ogoentertainer@gmail.com', '42.106.182.91', '2020-11-23 20:14:58'),
(311, 'ogoentertainer@gmail.com', '157.46.157.64', '2020-11-24 10:41:22'),
(312, 'ogoentertainer@gmail.com', '42.106.182.56', '2020-11-24 12:58:50'),
(313, 'ogoentertainer@gmail.com', '42.106.182.56', '2020-11-24 15:51:32'),
(314, 'ogoentertainer@gmail.com', '42.106.182.47', '2020-11-25 09:38:38'),
(315, 'ben@ogoentertainer.com', '223.228.168.15', '2020-11-25 10:10:38'),
(316, 'ogoentertainer@gmail.com', '103.70.197.27', '2020-11-25 17:36:21'),
(317, 'ogoentertainer@gmail.com', '42.106.180.69', '2020-11-26 10:03:21'),
(318, 'ogoentertainer@gmail.com', '1.39.78.208', '2020-11-26 12:01:24'),
(319, 'ogoentertainer@gmail.com', '42.106.180.254', '2020-11-26 13:11:57'),
(320, 'ogoentertainer@gmail.com', '1.39.78.208', '2020-11-26 13:43:39'),
(321, 'ogoentertainer@gmail.com', '42.106.181.1', '2020-11-26 15:28:37'),
(322, 'ogoentertainer@gmail.com', '103.99.205.26', '2020-11-26 15:31:55'),
(323, 'ogoentertainer@gmail.com', '157.44.201.109', '2020-11-27 10:19:48'),
(324, 'ogoentertainer@gmail.com', '157.44.158.16', '2020-11-27 18:03:31'),
(325, 'ogoentertainer@gmail.com', '42.106.180.66', '2020-11-27 22:12:50'),
(326, 'ogoentertainer@gmail.com', '42.106.180.66', '2020-11-28 08:58:50'),
(327, 'ogoentertainer@gmail.com', '157.46.213.198', '2020-11-28 11:20:44'),
(328, 'ogoentertainer@gmail.com', '157.46.213.198', '2020-11-28 21:35:14'),
(329, 'ogoentertainer@gmail.com', '157.44.198.4', '2020-11-29 10:04:09'),
(330, 'ogoentertainer@gmail.com', '157.44.165.42', '2020-11-29 13:51:37'),
(331, 'ogoentertainer@gmail.com', '42.109.143.27', '2020-11-29 16:58:37'),
(332, 'ogoentertainer@gmail.com', '157.44.165.42', '2020-11-29 17:52:49'),
(333, 'ogoentertainer@gmail.com', '157.44.165.42', '2020-11-29 18:39:16'),
(334, 'accounts@ogoentertainer.com', '157.44.167.75', '2020-11-30 10:04:34'),
(335, 'ogoentertainer@gmail.com', '157.44.167.75', '2020-11-30 10:44:34'),
(336, 'ogoentertainer@gmail.com', '157.44.167.140', '2020-11-30 13:12:46'),
(337, 'ogoentertainer@gmail.com', '157.44.167.140', '2020-11-30 15:26:43'),
(338, 'ogoentertainer@gmail.com', '157.46.221.97', '2020-12-01 11:01:30'),
(339, 'ogoentertainer@gmail.com', '42.111.251.162', '2020-12-01 14:49:26'),
(340, 'ogoentertainer@gmail.com', '42.106.181.125', '2020-12-01 20:53:34'),
(341, 'accounts@ogoentertainer.com', '157.44.204.60', '2020-12-02 10:03:03'),
(342, 'ogoentertainer@gmail.com', '157.44.204.60', '2020-12-02 10:16:05'),
(343, 'accounts@ogoentertainer.com', '157.44.204.60', '2020-12-02 13:12:50'),
(344, 'ogoentertainer@gmail.com', '157.44.220.219', '2020-12-02 15:02:50'),
(345, 'ogoentertainer@gmail.com', '157.44.183.191', '2020-12-03 09:52:41'),
(346, 'accounts@ogoentertainer.com', '157.44.183.191', '2020-12-03 09:53:26'),
(347, 'ogoentertainer@gmail.com', '42.106.181.21', '2020-12-03 10:36:42'),
(348, 'ogoentertainer@gmail.com', '42.106.181.207', '2020-12-04 06:05:42'),
(349, 'accounts@ogoentertainer.com', '157.46.173.135', '2020-12-04 09:53:35'),
(350, 'ogoentertainer@gmail.com', '42.106.181.206', '2020-12-04 13:54:20'),
(351, 'accounts@ogoentertainer.com', '157.46.172.2', '2020-12-04 14:02:52'),
(352, 'ogoentertainer@gmail.com', '103.99.206.206', '2020-12-04 15:34:41'),
(353, 'ogoentertainer@gmail.com', '42.106.180.60', '2020-12-04 22:48:36'),
(354, 'accounts@ogoentertainer.com', '137.97.86.58', '2020-12-05 09:47:20'),
(355, 'ogoentertainer@gmail.com', '137.97.95.132', '2020-12-05 14:43:02'),
(356, 'ogoentertainer@gmail.com', '42.106.182.91', '2020-12-05 15:40:24'),
(357, 'ogoentertainer@gmail.com', '1.39.76.175', '2020-12-05 16:18:25'),
(358, 'ogoentertainer@gmail.com', '42.106.181.235', '2020-12-05 17:31:22'),
(359, 'ogoentertainer@gmail.com', '106.203.88.2', '2020-12-05 19:55:19'),
(360, 'ogoentertainer@gmail.com', '157.46.218.49', '2020-12-06 11:02:02'),
(361, 'ogoentertainer@gmail.com', '157.46.218.49', '2020-12-06 14:28:46'),
(362, 'ogoentertainer@gmail.com', '42.106.180.10', '2020-12-06 17:43:31'),
(363, 'ogoentertainer@gmail.com', '157.46.218.153', '2020-12-06 18:18:21'),
(364, 'ogoentertainer@gmail.com', '42.106.180.10', '2020-12-06 19:58:41'),
(365, 'ogoentertainer@gmail.com', '42.106.180.10', '2020-12-06 20:30:41'),
(366, 'ogoentertainer@gmail.com', '42.106.180.10', '2020-12-06 22:06:00'),
(367, 'ogoentertainer@gmail.com', '42.106.180.137', '2020-12-07 07:34:41'),
(368, 'accounts@ogoentertainer.com', '157.46.190.249', '2020-12-07 10:01:37'),
(369, 'ogoentertainer@gmail.com', '157.46.190.249', '2020-12-07 10:06:05'),
(370, 'ogoentertainer@gmail.com', '157.46.181.207', '2020-12-07 15:43:15'),
(371, 'accounts@ogoentertainer.com', '157.46.181.207', '2020-12-07 16:48:18'),
(372, 'ogoentertainer@gmail.com', '157.46.181.207', '2020-12-07 16:48:22'),
(373, 'ogoentertainer@gmail.com', '157.44.187.71', '2020-12-08 10:02:14'),
(374, 'accounts@ogoentertainer.com', '157.44.187.71', '2020-12-08 10:11:13'),
(375, 'ogoentertainer@gmail.com', '42.106.182.20', '2020-12-08 14:36:02'),
(376, 'ogoentertainer@gmail.com', '157.44.187.71', '2020-12-08 15:15:28'),
(377, 'accounts@ogoentertainer.com', '157.44.187.71', '2020-12-08 15:33:19'),
(378, 'ogoentertainer@gmail.com', '103.99.205.176', '2020-12-08 18:08:30'),
(379, 'ogoentertainer@gmail.com', '103.99.205.176', '2020-12-08 18:20:13'),
(380, 'ogoentertainer@gmail.com', '157.46.159.53', '2020-12-09 10:15:38'),
(381, 'ogoentertainer@gmail.com', '157.46.159.53', '2020-12-09 12:32:56'),
(382, 'ogoentertainer@gmail.com', '42.106.181.129', '2020-12-09 15:10:58'),
(383, 'ogoentertainer@gmail.com', '42.106.181.129', '2020-12-09 15:14:58'),
(384, 'ogoentertainer@gmail.com', '157.46.159.53', '2020-12-09 16:03:44'),
(385, 'ogoentertainer@gmail.com', '157.46.159.53', '2020-12-09 18:42:53'),
(386, 'ogoentertainer@gmail.com', '42.106.181.129', '2020-12-09 21:31:48'),
(387, 'ogoentertainer@gmail.com', '106.200.45.71', '2020-12-10 00:18:39'),
(388, 'ogoentertainer@gmail.com', '42.106.180.139', '2020-12-10 09:53:23'),
(389, 'ogoentertainer@gmail.com', '103.99.205.210', '2020-12-10 16:15:12'),
(390, 'ogoentertainer@gmail.com', '103.99.205.210', '2020-12-10 16:34:51'),
(391, 'ogoentertainer@gmail.com', '42.106.181.78', '2020-12-10 17:51:36'),
(392, 'ogoentertainer@gmail.com', '42.106.182.8', '2020-12-11 08:48:01'),
(393, 'ogoentertainer@gmail.com', '103.99.204.27', '2020-12-11 09:31:07'),
(394, 'accounts@ogoentertainer.com', '157.44.135.248', '2020-12-11 10:33:57'),
(395, 'accounts@ogoentertainer.com', '157.44.155.166', '2020-12-11 12:06:10'),
(396, 'ogoentertainer@gmail.com', '42.106.180.151', '2020-12-11 15:03:52'),
(397, 'ogoentertainer@gmail.com', '157.44.156.248', '2020-12-11 16:15:22'),
(398, 'ogoentertainer@gmail.com', '157.44.156.248', '2020-12-11 17:24:33'),
(399, 'ogoentertainer@gmail.com', '157.44.166.3', '2020-12-12 10:12:15'),
(400, 'ogoentertainer@gmail.com', '157.44.166.3', '2020-12-12 11:06:49'),
(401, 'accounts@ogoentertainer.com', '157.44.174.159', '2020-12-12 11:43:06'),
(402, 'ogoentertainer@gmail.com', '42.109.140.232', '2020-12-12 11:57:49'),
(403, 'ogoentertainer@gmail.com', '103.99.204.202', '2020-12-12 11:59:28'),
(404, 'ogoentertainer@gmail.com', '42.106.180.152', '2020-12-12 13:46:57'),
(405, 'ogoentertainer@gmail.com', '42.106.180.152', '2020-12-12 15:46:56'),
(406, 'ogoentertainer@gmail.com', '103.99.204.202', '2020-12-12 15:54:37'),
(407, 'ogoentertainer@gmail.com', '42.106.181.21', '2020-12-12 16:10:20'),
(408, 'ogoentertainer@gmail.com', '42.106.180.152', '2020-12-12 22:21:21'),
(409, 'ogoentertainer@gmail.com', '42.106.180.239', '2020-12-13 10:55:12'),
(410, 'ogoentertainer@gmail.com', '42.106.180.239', '2020-12-13 17:58:01'),
(411, 'ogoentertainer@gmail.com', '27.61.45.202', '2020-12-14 07:48:58'),
(412, 'ogoentertainer@gmail.com', '103.70.196.26', '2020-12-14 11:06:40'),
(413, 'ogoentertainer@gmail.com', '103.70.196.26', '2020-12-14 12:55:59'),
(414, 'ogoentertainer@gmail.com', '42.111.255.200', '2020-12-14 13:17:56'),
(415, 'ogoentertainer@gmail.com', '42.106.181.224', '2020-12-14 14:04:43'),
(416, 'ogoentertainer@gmail.com', '42.106.182.91', '2020-12-14 17:35:27'),
(417, 'ogoentertainer@gmail.com', '42.106.182.91', '2020-12-14 18:59:20'),
(418, 'ogoentertainer@gmail.com', '42.111.253.252', '2020-12-15 09:55:30'),
(419, 'ogoentertainer@gmail.com', '42.111.253.252', '2020-12-15 09:55:33'),
(420, 'ogoentertainer@gmail.com', '42.106.182.91', '2020-12-15 10:37:24'),
(421, 'ogoentertainer@gmail.com', '42.106.182.91', '2020-12-15 12:53:16'),
(422, 'ogoentertainer@gmail.com', '42.106.182.91', '2020-12-15 12:57:31'),
(423, 'ogoentertainer@gmail.com', '42.106.182.91', '2020-12-15 13:08:36'),
(424, 'ogoentertainer@gmail.com', '42.106.182.91', '2020-12-15 13:39:08'),
(425, 'ogoentertainer@gmail.com', '42.106.182.91', '2020-12-15 15:21:27'),
(426, 'ogoentertainer@gmail.com', '42.106.182.91', '2020-12-15 16:30:33'),
(427, 'ogoentertainer@gmail.com', '42.106.182.91', '2020-12-15 17:29:41'),
(428, 'ogoentertainer@gmail.com', '42.106.182.91', '2020-12-15 18:30:30'),
(429, 'ogoentertainer@gmail.com', '42.106.182.91', '2020-12-15 20:29:13'),
(430, 'ogoentertainer@gmail.com', '42.106.182.91', '2020-12-15 22:04:41'),
(431, 'ogoentertainer@gmail.com', '42.109.128.14', '2020-12-16 10:29:32'),
(432, 'ogoentertainer@gmail.com', '42.111.248.245', '2020-12-16 13:02:02'),
(433, 'ogoentertainer@gmail.com', '42.106.182.119', '2020-12-16 16:18:45'),
(434, 'ogoentertainer@gmail.com', '42.106.182.119', '2020-12-16 17:26:02'),
(435, 'ogoentertainer@gmail.com', '42.106.182.119', '2020-12-16 17:26:30'),
(436, 'ogoentertainer@gmail.com', '42.106.182.119', '2020-12-16 22:06:11'),
(437, 'ogoentertainer@gmail.com', '42.106.182.119', '2020-12-16 23:21:41'),
(438, 'ogoentertainer@gmail.com', '42.106.182.119', '2020-12-16 23:43:32'),
(439, 'ogoentertainer@gmail.com', '137.97.64.196', '2020-12-17 10:22:52'),
(440, 'ogoentertainer@gmail.com', '137.97.64.196', '2020-12-17 10:25:08'),
(441, 'ogoentertainer@gmail.com', '137.97.64.196', '2020-12-17 10:55:56'),
(442, 'ogoentertainer@gmail.com', '42.106.182.119', '2020-12-17 14:42:54'),
(443, 'ogoentertainer@gmail.com', '137.97.64.196', '2020-12-17 15:57:50'),
(444, 'ogoentertainer@gmail.com', '42.106.181.145', '2020-12-17 17:54:42'),
(445, 'ogoentertainer@gmail.com', '157.44.158.69', '2020-12-18 07:15:34'),
(446, 'ogoentertainer@gmail.com', '157.44.150.70', '2020-12-18 12:24:36'),
(447, 'ogoentertainer@gmail.com', '157.44.150.70', '2020-12-18 14:03:01'),
(448, 'ogoentertainer@gmail.com', '157.44.150.70', '2020-12-18 18:22:22'),
(449, 'ogoentertainer@gmail.com', '157.44.150.70', '2020-12-18 19:14:52'),
(450, 'ogoentertainer@gmail.com', '157.44.150.70', '2020-12-18 20:41:01'),
(451, 'ogoentertainer@gmail.com', '42.106.181.126', '2020-12-18 23:11:35'),
(452, 'ogoentertainer@gmail.com', '157.44.177.164', '2020-12-19 05:59:16'),
(453, 'ogoentertainer@gmail.com', '157.44.177.164', '2020-12-19 09:59:37'),
(454, 'ogoentertainer@gmail.com', '157.44.177.164', '2020-12-19 10:15:57'),
(455, 'ogoentertainer@gmail.com', '157.44.177.164', '2020-12-19 16:19:40'),
(456, 'ogoentertainer@gmail.com', '157.44.177.164', '2020-12-19 16:53:02'),
(457, 'ogoentertainer@gmail.com', '157.44.177.164', '2020-12-19 17:37:45'),
(458, 'ogoentertainer@gmail.com', '157.44.177.164', '2020-12-19 18:02:30'),
(459, 'ogoentertainer@gmail.com', '157.44.177.164', '2020-12-19 18:32:21'),
(460, 'ogoentertainer@gmail.com', '157.44.177.164', '2020-12-19 19:09:20'),
(461, 'ogoentertainer@gmail.com', '157.44.163.186', '2020-12-19 19:46:51'),
(462, 'ogoentertainer@gmail.com', '157.44.148.149', '2020-12-19 20:17:44'),
(463, 'ogoentertainer@gmail.com', '157.44.214.101', '2020-12-19 20:33:25'),
(464, 'ogoentertainer@gmail.com', '157.46.162.60', '2020-12-19 21:40:40'),
(465, 'ogoentertainer@gmail.com', '157.46.163.32', '2020-12-19 22:35:03'),
(466, 'ogoentertainer@gmail.com', '157.46.163.32', '2020-12-19 23:00:11'),
(467, 'ogoentertainer@gmail.com', '157.46.163.32', '2020-12-19 23:59:46'),
(468, 'ogoentertainer@gmail.com', '157.46.170.217', '2020-12-20 07:55:17'),
(469, 'ogoentertainer@gmail.com', '157.46.170.217', '2020-12-20 08:12:53'),
(470, 'ogoentertainer@gmail.com', '157.46.189.13', '2020-12-20 08:35:53'),
(471, 'ogoentertainer@gmail.com', '117.204.110.95', '2020-12-20 09:32:26'),
(472, 'ogoentertainer@gmail.com', '117.204.110.95', '2020-12-20 09:41:45'),
(473, 'ogoentertainer@gmail.com', '117.204.110.95', '2020-12-20 10:37:08'),
(474, 'ogoentertainer@gmail.com', '117.204.110.95', '2020-12-20 11:28:09'),
(475, 'ogoentertainer@gmail.com', '117.204.110.95', '2020-12-20 12:25:39'),
(476, 'ogoentertainer@gmail.com', '117.204.110.95', '2020-12-20 13:21:30'),
(477, 'ogoentertainer@gmail.com', '117.204.110.95', '2020-12-20 13:40:21'),
(478, 'ogoentertainer@gmail.com', '117.204.110.95', '2020-12-20 14:42:57'),
(479, 'ogoentertainer@gmail.com', '117.204.110.95', '2020-12-20 15:43:45'),
(480, 'ogoentertainer@gmail.com', '117.204.110.95', '2020-12-20 22:16:06'),
(481, 'ogoentertainer@gmail.com', '117.204.110.95', '2020-12-20 22:56:27'),
(482, 'ogoentertainer@gmail.com', '59.99.111.158', '2020-12-21 10:00:24'),
(483, 'ogoentertainer@gmail.com', '61.3.176.48', '2020-12-21 13:06:25'),
(484, 'ogoentertainer@gmail.com', '61.3.176.48', '2020-12-21 13:59:05'),
(485, 'ogoentertainer@gmail.com', '61.3.176.48', '2020-12-21 15:09:47'),
(486, 'ogoentertainer@gmail.com', '61.3.176.48', '2020-12-21 16:14:54'),
(487, 'ben@ogoentertainer.com', '223.227.48.21', '2020-12-21 16:16:48'),
(488, 'ogoentertainer@gmail.com', '61.3.176.48', '2020-12-21 16:19:40'),
(489, 'ogoentertainer@gmail.com', '61.3.176.48', '2020-12-21 17:44:54'),
(490, 'ogoentertainer@gmail.com', '61.3.176.48', '2020-12-21 17:50:08'),
(491, 'ogoentertainer@gmail.com', '61.3.176.48', '2020-12-21 18:00:21'),
(492, 'ogoentertainer@gmail.com', '61.3.176.48', '2020-12-21 18:01:41'),
(493, 'ogoentertainer@gmail.com', '61.3.176.48', '2020-12-21 19:59:48'),
(494, 'ogoentertainer@gmail.com', '61.3.176.48', '2020-12-21 21:16:44'),
(495, 'ogoentertainer@gmail.com', '61.3.176.48', '2020-12-21 21:23:38'),
(496, 'ogoentertainer@gmail.com', '61.3.181.209', '2020-12-22 09:52:59'),
(497, 'ogoentertainer@gmail.com', '42.111.232.186', '2020-12-22 10:11:54'),
(498, 'ogoentertainer@gmail.com', '61.3.181.209', '2020-12-22 10:34:57'),
(499, 'ogoentertainer@gmail.com', '61.3.181.209', '2020-12-22 11:31:31'),
(500, 'ogoentertainer@gmail.com', '61.3.181.209', '2020-12-22 11:39:21'),
(501, 'ogoentertainer@gmail.com', '61.3.181.209', '2020-12-22 12:50:06'),
(502, 'ogoentertainer@gmail.com', '61.3.181.209', '2020-12-22 13:48:07'),
(503, 'ogoentertainer@gmail.com', '61.3.181.209', '2020-12-22 14:10:21'),
(504, 'ogoentertainer@gmail.com', '117.204.111.150', '2020-12-22 18:25:27'),
(505, 'ogoentertainer@gmail.com', '61.3.176.144', '2020-12-22 20:51:42'),
(506, 'ogoentertainer@gmail.com', '61.3.176.144', '2020-12-22 21:18:43'),
(507, 'ogoentertainer@gmail.com', '157.44.154.69', '2020-12-23 00:32:30'),
(508, 'ogoentertainer@gmail.com', '157.44.147.144', '2020-12-23 10:21:55'),
(509, 'ogoentertainer@gmail.com', '157.44.147.144', '2020-12-23 10:54:44'),
(510, 'ogoentertainer@gmail.com', '157.44.147.144', '2020-12-23 11:20:30'),
(511, 'ogoentertainer@gmail.com', '157.44.147.144', '2020-12-23 11:45:12'),
(512, 'ogoentertainer@gmail.com', '157.44.147.144', '2020-12-23 12:08:55'),
(513, 'ogoentertainer@gmail.com', '42.106.181.89', '2020-12-23 14:07:48'),
(514, 'ogoentertainer@gmail.com', '157.44.151.238', '2020-12-23 15:15:32'),
(515, 'ogoentertainer@gmail.com', '157.44.151.238', '2020-12-23 16:35:46'),
(516, 'ogoentertainer@gmail.com', '157.44.151.238', '2020-12-23 18:44:39'),
(517, 'ogoentertainer@gmail.com', '157.44.151.238', '2020-12-23 20:19:04'),
(518, 'ogoentertainer@gmail.com', '157.44.151.238', '2020-12-23 21:14:12'),
(519, 'ogoentertainer@gmail.com', '42.106.180.187', '2020-12-23 22:21:25'),
(520, 'ogoentertainer@gmail.com', '157.44.151.238', '2020-12-23 22:25:00'),
(521, 'ogoentertainer@gmail.com', '157.44.151.238', '2020-12-23 22:27:40'),
(522, 'ben@ogoentertainer.com', '223.227.48.3', '2020-12-24 10:07:51'),
(523, 'ogoentertainer@gmail.com', '157.44.154.108', '2020-12-24 10:50:13'),
(524, 'ogoentertainer@gmail.com', '157.44.154.108', '2020-12-24 10:59:15'),
(525, 'ogoentertainer@gmail.com', '157.44.154.108', '2020-12-24 12:03:20'),
(526, 'ogoentertainer@gmail.com', '103.70.197.103', '2020-12-24 12:25:53'),
(527, 'ogoentertainer@gmail.com', '157.44.154.108', '2020-12-24 12:35:39'),
(528, 'ogoentertainer@gmail.com', '213.229.148.110', '2020-12-24 12:48:34'),
(529, 'ogoentertainer@gmail.com', '42.106.181.176', '2020-12-24 13:11:09'),
(530, 'ogoentertainer@gmail.com', '157.44.154.108', '2020-12-24 14:12:35'),
(531, 'ogoentertainer@gmail.com', '103.70.197.103', '2020-12-24 16:57:03'),
(532, 'ogoentertainer@gmail.com', '157.44.154.108', '2020-12-24 18:00:18'),
(533, 'ogoentertainer@gmail.com', '42.106.181.89', '2020-12-24 19:15:29'),
(534, 'ogoentertainer@gmail.com', '42.106.181.89', '2020-12-24 20:02:46'),
(535, 'ogoentertainer@gmail.com', '42.109.144.185', '2020-12-24 21:19:17'),
(536, 'ogoentertainer@gmail.com', '42.106.181.89', '2020-12-24 21:37:18'),
(537, 'ogoentertainer@gmail.com', '42.106.181.89', '2020-12-24 21:44:08'),
(538, 'ogoentertainer@gmail.com', '42.106.181.89', '2020-12-24 22:04:26'),
(539, 'ogoentertainer@gmail.com', '157.44.149.45', '2020-12-24 23:42:41'),
(540, 'ogoentertainer@gmail.com', '157.46.179.239', '2020-12-25 10:48:15'),
(541, 'ogoentertainer@gmail.com', '157.46.179.239', '2020-12-25 13:16:17'),
(542, 'ogoentertainer@gmail.com', '157.46.179.239', '2020-12-25 14:18:04'),
(543, 'ogoentertainer@gmail.com', '157.46.179.239', '2020-12-25 14:40:46'),
(544, 'ogoentertainer@gmail.com', '157.46.179.239', '2020-12-25 14:51:13'),
(545, 'ogoentertainer@gmail.com', '157.46.179.239', '2020-12-25 15:15:54'),
(546, 'ogoentertainer@gmail.com', '42.106.182.35', '2020-12-25 15:50:28'),
(547, 'ogoentertainer@gmail.com', '42.106.182.35', '2020-12-25 15:52:04'),
(548, 'ogoentertainer@gmail.com', '42.106.182.35', '2020-12-25 15:52:11'),
(549, 'ogoentertainer@gmail.com', '42.106.182.35', '2020-12-25 21:13:15'),
(550, 'ogoentertainer@gmail.com', '157.46.216.148', '2020-12-26 10:15:45'),
(551, 'ogoentertainer@gmail.com', '42.106.181.167', '2020-12-26 14:16:22'),
(552, 'ogoentertainer@gmail.com', '103.70.196.230', '2020-12-26 14:48:33'),
(553, 'ogoentertainer@gmail.com', '42.106.182.34', '2020-12-26 15:17:31'),
(554, 'ogoentertainer@gmail.com', '42.106.181.167', '2020-12-26 20:52:46'),
(555, 'ogoentertainer@gmail.com', '157.44.131.74', '2020-12-27 11:03:31'),
(556, 'ogoentertainer@gmail.com', '157.44.131.74', '2020-12-27 11:34:30'),
(557, 'ogoentertainer@gmail.com', '157.44.150.152', '2020-12-27 18:27:32'),
(558, 'ogoentertainer@gmail.com', '157.44.150.152', '2020-12-27 20:26:48'),
(559, 'ogoentertainer@gmail.com', '157.44.181.137', '2020-12-28 06:27:08'),
(560, 'ogoentertainer@gmail.com', '157.44.181.137', '2020-12-28 08:23:24'),
(561, 'ben@ogoentertainer.com', '223.227.112.14', '2020-12-28 11:13:42'),
(562, 'ogoentertainer@gmail.com', '42.106.180.247', '2020-12-28 14:55:22'),
(563, 'ogoentertainer@gmail.com', '157.44.179.94', '2020-12-28 16:00:14'),
(564, 'ogoentertainer@gmail.com', '42.106.181.186', '2020-12-28 23:22:47'),
(565, 'ogoentertainer@gmail.com', '157.46.217.203', '2020-12-29 10:22:33'),
(566, 'ogoentertainer@gmail.com', '157.46.217.203', '2020-12-29 10:23:56'),
(567, 'ogoentertainer@gmail.com', '157.46.223.244', '2020-12-29 10:52:50'),
(568, 'ogoentertainer@gmail.com', '157.46.211.26', '2020-12-29 13:34:19'),
(569, 'ogoentertainer@gmail.com', '157.46.210.200', '2020-12-29 15:56:53'),
(570, 'ogoentertainer@gmail.com', '42.109.128.0', '2020-12-29 19:45:44'),
(571, 'ogoentertainer@gmail.com', '157.44.196.158', '2020-12-30 09:36:20'),
(572, 'ogoentertainer@gmail.com', '157.44.196.158', '2020-12-30 09:43:32'),
(573, 'ogoentertainer@gmail.com', '157.44.196.158', '2020-12-30 09:48:06'),
(574, 'ogoentertainer@gmail.com', '157.44.196.158', '2020-12-30 09:52:32'),
(575, 'ogoentertainer@gmail.com', '42.111.240.191', '2020-12-30 10:27:06'),
(576, 'ogoentertainer@gmail.com', '103.70.197.33', '2020-12-30 11:34:43'),
(577, 'ogoentertainer@gmail.com', '157.44.196.158', '2020-12-30 11:35:00'),
(578, 'ogoentertainer@gmail.com', '157.44.196.158', '2020-12-30 11:46:18'),
(579, 'ogoentertainer@gmail.com', '157.44.196.158', '2020-12-30 12:44:28'),
(580, 'ogoentertainer@gmail.com', '42.109.129.192', '2020-12-30 13:58:39'),
(581, 'ogoentertainer@gmail.com', '42.106.182.77', '2020-12-31 09:48:09'),
(582, 'ogoentertainer@gmail.com', '157.46.148.97', '2020-12-31 11:29:56'),
(583, 'ogoentertainer@gmail.com', '157.46.148.97', '2020-12-31 11:32:19'),
(584, 'ogoentertainer@gmail.com', '103.70.196.59', '2020-12-31 15:20:47'),
(585, 'ogoentertainer@gmail.com', '103.70.196.59', '2020-12-31 15:27:54'),
(586, 'ogoentertainer@gmail.com', '157.46.148.97', '2020-12-31 15:56:49'),
(587, 'ogoentertainer@gmail.com', '103.70.196.59', '2020-12-31 16:00:28'),
(588, 'ogoentertainer@gmail.com', '157.46.148.97', '2020-12-31 16:10:29'),
(589, 'ogoentertainer@gmail.com', '42.106.182.95', '2020-12-31 18:14:46'),
(590, 'ogoentertainer@gmail.com', '42.106.182.95', '2020-12-31 18:21:27'),
(591, 'ogoentertainer@gmail.com', '42.106.182.95', '2020-12-31 18:24:45'),
(592, 'ogoentertainer@gmail.com', '157.46.141.7', '2020-12-31 21:13:37'),
(593, 'ogoentertainer@gmail.com', '42.106.181.48', '2020-12-31 23:00:54'),
(594, 'ogoentertainer@gmail.com', '157.46.158.63', '2021-01-01 00:24:38'),
(595, 'ogoentertainer@gmail.com', '137.97.87.159', '2021-01-01 10:08:49'),
(596, 'ogoentertainer@gmail.com', '137.97.87.159', '2021-01-01 10:53:45'),
(597, 'ogoentertainer@gmail.com', '42.106.181.149', '2021-01-01 17:24:05'),
(598, 'ogoentertainer@gmail.com', '157.44.153.30', '2021-01-01 21:18:34'),
(599, 'ogoentertainer@gmail.com', '42.106.181.149', '2021-01-01 21:28:14'),
(600, 'ogoentertainer@gmail.com', '42.106.181.149', '2021-01-01 21:41:48'),
(601, 'ogoentertainer@gmail.com', '157.44.156.148', '2021-01-02 09:08:30'),
(602, 'ogoentertainer@gmail.com', '157.44.156.148', '2021-01-02 09:14:48'),
(603, 'ogoentertainer@gmail.com', '157.44.156.148', '2021-01-02 09:39:28'),
(604, 'ogoentertainer@gmail.com', '157.44.156.148', '2021-01-02 10:12:13'),
(605, 'ogoentertainer@gmail.com', '157.44.156.148', '2021-01-02 10:34:01'),
(606, 'ben@ogoentertainer.com', '223.227.112.25', '2021-01-02 11:53:04'),
(607, 'ogoentertainer@gmail.com', '157.44.156.148', '2021-01-02 12:02:59'),
(608, 'ogoentertainer@gmail.com', '157.44.156.148', '2021-01-02 12:37:53'),
(609, 'ogoentertainer@gmail.com', '157.44.156.148', '2021-01-02 13:30:50'),
(610, 'ogoentertainer@gmail.com', '42.106.181.64', '2021-01-02 14:37:12'),
(611, 'ogoentertainer@gmail.com', '137.97.81.228', '2021-01-03 08:22:27'),
(612, 'ogoentertainer@gmail.com', '103.70.196.118', '2021-01-03 12:15:24'),
(613, 'ogoentertainer@gmail.com', '103.99.206.135', '2021-01-04 09:52:53'),
(614, 'ogoentertainer@gmail.com', '42.109.130.76', '2021-01-04 09:58:27'),
(615, 'ogoentertainer@gmail.com', '137.97.124.252', '2021-01-04 12:24:40'),
(616, 'ogoentertainer@gmail.com', '137.97.124.252', '2021-01-04 12:45:32'),
(617, 'ogoentertainer@gmail.com', '42.106.181.72', '2021-01-04 17:21:11'),
(618, 'ogoentertainer@gmail.com', '42.106.181.72', '2021-01-04 20:00:25'),
(619, 'ogoentertainer@gmail.com', '42.106.181.201', '2021-01-05 08:56:43'),
(620, 'ogoentertainer@gmail.com', '42.106.181.201', '2021-01-05 08:56:43'),
(621, 'ogoentertainer@gmail.com', '42.106.181.201', '2021-01-05 09:10:16'),
(622, 'ogoentertainer@gmail.com', '103.99.204.41', '2021-01-05 09:45:29'),
(623, 'ogoentertainer@gmail.com', '42.106.181.101', '2021-01-05 09:51:28'),
(624, 'ogoentertainer@gmail.com', '137.97.94.229', '2021-01-05 10:41:24'),
(625, 'ogoentertainer@gmail.com', '137.97.94.229', '2021-01-05 11:08:23'),
(626, 'ogoentertainer@gmail.com', '137.97.89.149', '2021-01-05 15:26:02'),
(627, 'ogoentertainer@gmail.com', '137.97.89.149', '2021-01-05 16:15:33'),
(628, 'ogoentertainer@gmail.com', '157.44.161.227', '2021-01-05 17:57:08'),
(629, 'ogoentertainer@gmail.com', '157.44.161.227', '2021-01-05 19:53:00'),
(630, 'ogoentertainer@gmail.com', '157.44.213.214', '2021-01-06 08:25:29'),
(631, 'ogoentertainer@gmail.com', '157.44.213.214', '2021-01-06 09:00:47'),
(632, 'ogoentertainer@gmail.com', '157.44.221.218', '2021-01-06 12:33:58'),
(633, 'ogoentertainer@gmail.com', '157.44.202.145', '2021-01-06 14:11:13'),
(634, 'ogoentertainer@gmail.com', '157.44.202.145', '2021-01-06 14:54:35'),
(635, 'ogoentertainer@gmail.com', '136.185.84.63', '2021-01-06 16:05:56'),
(636, 'ogoentertainer@gmail.com', '27.57.10.175', '2021-01-07 09:29:22'),
(637, 'ogoentertainer@gmail.com', '122.164.35.175', '2021-01-07 22:30:32'),
(638, 'ogoentertainer@gmail.com', '171.49.166.36', '2021-01-08 07:48:24'),
(639, 'ogoentertainer@gmail.com', '42.106.180.30', '2021-01-08 13:22:07'),
(640, 'ogoentertainer@gmail.com', '122.183.146.28', '2021-01-09 13:48:17'),
(641, 'ogoentertainer@gmail.com', '122.183.146.28', '2021-01-09 13:48:55'),
(642, 'ogoentertainer@gmail.com', '42.106.181.19', '2021-01-10 17:53:56'),
(643, 'ogoentertainer@gmail.com', '136.185.80.84', '2021-01-10 21:14:37'),
(644, 'ogoentertainer@gmail.com', '136.185.80.84', '2021-01-10 21:17:54'),
(645, 'ogoentertainer@gmail.com', '122.164.32.125', '2021-01-11 08:35:04'),
(646, 'ogoentertainer@gmail.com', '103.70.196.92', '2021-01-11 09:34:24'),
(647, 'ogoentertainer@gmail.com', '122.164.71.185', '2021-01-12 14:17:34'),
(648, 'ogoentertainer@gmail.com', '122.164.71.185', '2021-01-12 23:59:14'),
(649, 'ogoentertainer@gmail.com', '122.164.232.168', '2021-01-13 10:11:41'),
(650, 'ogoentertainer@gmail.com', '103.99.204.52', '2021-01-13 13:54:52'),
(651, 'ogoentertainer@gmail.com', '42.106.181.3', '2021-01-13 14:13:58'),
(652, 'ogoentertainer@gmail.com', '42.109.130.82', '2021-01-13 15:13:50'),
(653, 'ogoentertainer@gmail.com', '122.174.5.6', '2021-01-14 09:37:47'),
(654, 'ogoentertainer@gmail.com', '103.99.205.10', '2021-01-14 11:15:35'),
(655, 'ogoentertainer@gmail.com', '122.174.5.6', '2021-01-14 19:27:05'),
(656, 'ogoentertainer@gmail.com', '122.164.104.114', '2021-01-15 09:35:09'),
(657, 'ogoentertainer@gmail.com', '103.99.205.93', '2021-01-15 16:57:44'),
(658, 'ogoentertainer@gmail.com', '122.164.88.201', '2021-01-16 10:09:39'),
(659, 'ogoentertainer@gmail.com', '122.174.240.194', '2021-01-17 09:49:57'),
(660, 'ogoentertainer@gmail.com', '103.70.197.174', '2021-01-17 11:19:43'),
(661, 'ogoentertainer@gmail.com', '122.183.167.16', '2021-01-17 15:19:46'),
(662, 'ogoentertainer@gmail.com', '122.183.167.16', '2021-01-17 15:23:38'),
(663, 'ogoentertainer@gmail.com', '122.183.167.16', '2021-01-17 18:35:51'),
(664, 'ogoentertainer@gmail.com', '122.183.167.16', '2021-01-17 18:38:09'),
(665, 'ogoentertainer@gmail.com', '122.174.193.56', '2021-01-18 08:39:17'),
(666, 'ogoentertainer@gmail.com', '122.174.193.56', '2021-01-18 09:50:16'),
(667, 'ogoentertainer@gmail.com', '122.174.193.56', '2021-01-18 11:18:29'),
(668, 'ogoentertainer@gmail.com', '103.99.205.222', '2021-01-18 16:57:35'),
(669, 'ogoentertainer@gmail.com', '42.106.181.29', '2021-01-19 01:35:19'),
(670, 'ogoentertainer@gmail.com', '42.106.181.29', '2021-01-19 01:35:32'),
(671, 'ogoentertainer@gmail.com', '42.106.181.214', '2021-01-19 11:48:00'),
(672, 'ogoentertainer@gmail.com', '171.49.196.97', '2021-01-20 09:54:47'),
(673, 'ogoentertainer@gmail.com', '171.49.196.97', '2021-01-20 14:25:05'),
(674, 'ogoentertainer@gmail.com', '103.70.196.193', '2021-01-20 18:09:49'),
(675, 'ogoentertainer@gmail.com', '42.106.181.8', '2021-01-20 21:48:18'),
(676, 'ogoentertainer@gmail.com', '171.49.196.97', '2021-01-21 09:28:56'),
(677, 'ogoentertainer@gmail.com', '171.49.196.97', '2021-01-21 10:54:10'),
(678, 'ogoentertainer@gmail.com', '171.49.196.97', '2021-01-21 10:55:45'),
(679, 'ogoentertainer@gmail.com', '171.49.196.97', '2021-01-21 12:53:23'),
(680, 'ogoentertainer@gmail.com', '42.111.236.13', '2021-01-21 22:19:06'),
(681, 'ogoentertainer@gmail.com', '42.111.236.13', '2021-01-21 22:19:38'),
(682, 'ogoentertainer@gmail.com', '171.49.196.97', '2021-01-21 22:32:54'),
(683, 'ogoentertainer@gmail.com', '171.49.196.97', '2021-01-22 19:01:07'),
(684, 'ogoentertainer@gmail.com', '171.61.249.105', '2021-01-23 10:37:19'),
(685, 'ogoentertainer@gmail.com', '171.61.249.105', '2021-01-23 13:03:37');
INSERT INTO `login_history` (`id`, `username`, `ip_address`, `login_time`) VALUES
(686, 'ogoentertainer@gmail.com', '42.109.140.76', '2021-01-23 19:00:40'),
(687, 'ogoentertainer@gmail.com', '122.174.237.141', '2021-01-25 08:42:45'),
(688, 'ogoentertainer@gmail.com', '122.174.237.141', '2021-01-26 09:38:23'),
(689, 'ogoentertainer@gmail.com', '122.174.237.141', '2021-01-26 18:54:45'),
(690, 'ogoentertainer@gmail.com', '42.106.181.105', '2021-01-26 21:45:48'),
(691, 'ogoentertainer@gmail.com', '42.106.181.105', '2021-01-26 21:46:00'),
(692, 'ogoentertainer@gmail.com', '61.3.179.163', '2021-01-28 09:31:50'),
(693, 'ogoentertainer@gmail.com', '61.3.179.163', '2021-01-28 09:36:03'),
(694, 'ogoentertainer@gmail.com', '61.3.179.163', '2021-01-28 09:38:59'),
(695, 'ogoentertainer@gmail.com', '117.248.50.41', '2021-01-28 22:11:26'),
(696, 'ogoentertainer@gmail.com', '103.99.205.178', '2021-01-30 11:09:10'),
(697, 'ogoentertainer@gmail.com', '27.57.15.5', '2021-02-01 10:54:29'),
(698, 'ogoentertainer@gmail.com', '42.106.181.150', '2021-02-02 17:16:34'),
(699, 'ogoentertainer@gmail.com', '122.174.96.5', '2021-02-04 08:13:56'),
(700, 'ogoentertainer@gmail.com', '42.106.180.63', '2021-02-04 17:46:25'),
(701, 'ogoentertainer@gmail.com', '122.174.236.157', '2021-02-05 10:58:36'),
(702, 'ogoentertainer@gmail.com', '122.174.207.92', '2021-02-12 11:37:17'),
(703, 'ogoentertainer@gmail.com', '122.174.207.92', '2021-02-12 16:08:20'),
(704, 'ogoentertainer@gmail.com', '42.106.181.29', '2021-02-13 15:22:04'),
(705, 'ogoentertainer@gmail.com', '103.70.197.1', '2021-02-13 18:53:46'),
(706, 'ogoentertainer@gmail.com', '171.61.229.100', '2021-02-15 08:35:36'),
(707, 'ogoentertainer@gmail.com', '171.61.229.100', '2021-02-15 10:12:05'),
(708, 'ogoentertainer@gmail.com', '171.61.229.100', '2021-02-15 10:30:03'),
(709, 'ogoentertainer@gmail.com', '171.61.229.209', '2021-02-17 09:36:14'),
(710, 'ogoentertainer@gmail.com', '103.99.206.198', '2021-02-17 11:00:00'),
(711, 'ogoentertainer@gmail.com', '103.99.206.198', '2021-02-17 14:26:07'),
(712, 'ogoentertainer@gmail.com', '171.61.229.209', '2021-02-17 17:27:47'),
(713, 'ogoentertainer@gmail.com', '171.61.229.209', '2021-02-17 17:31:26'),
(714, 'ogoentertainer@gmail.com', '103.70.197.44', '2021-02-18 13:58:58'),
(715, 'ogoentertainer@gmail.com', '171.61.229.209', '2021-02-19 13:28:16'),
(716, 'ogoentertainer@gmail.com', '171.61.229.209', '2021-02-19 13:30:20'),
(717, 'ogoentertainer@gmail.com', '103.99.206.181', '2021-02-19 15:30:14'),
(718, 'ogoentertainer@gmail.com', '171.61.229.209', '2021-02-20 09:11:23'),
(719, 'ogoentertainer@gmail.com', '42.106.181.184', '2021-02-21 14:03:39'),
(720, 'ogoentertainer@gmail.com', '136.185.85.150', '2021-02-22 20:25:25'),
(721, 'ogoentertainer@gmail.com', '122.164.108.160', '2021-02-26 11:59:38'),
(722, 'ogoentertainer@gmail.com', '122.183.150.244', '2021-03-01 14:18:35'),
(723, 'ogoentertainer@gmail.com', '103.70.197.158', '2021-03-03 12:27:03'),
(724, 'ogoentertainer@gmail.com', '127.0.0.1', '2021-03-20 10:39:58'),
(725, 'ogoentertainer@gmail.com', '::1', '2021-03-20 16:47:18'),
(726, 'ogoentertainer@gmail.com', '::1', '2021-03-20 16:55:12'),
(727, 'ogoentertainer@gmail.com', '::1', '2021-03-20 16:58:24'),
(728, 'ogoentertainer@gmail.com', '::1', '2021-03-20 17:01:40'),
(729, 'ogoentertainer@gmail.com', '::1', '2021-03-20 17:05:18'),
(730, 'ogoentertainer@gmail.com', '::1', '2021-03-20 17:14:08'),
(731, 'ogoentertainer@gmail.com', '::1', '2021-03-20 17:23:58'),
(732, 'ogoentertainer@gmail.com', '::1', '2021-03-22 12:03:06'),
(733, 'ogoentertainer@gmail.com', '::1', '2021-03-22 12:04:02'),
(734, 'ogoentertainer@gmail.com', '::1', '2021-03-22 12:05:24'),
(735, 'ogoentertainer@gmail.com', '::1', '2021-03-22 16:24:45'),
(736, 'anymedion@gmail.com', '::1', '2021-03-22 16:35:56'),
(737, 'shalbin@gmail.com', '::1', '2021-03-22 17:27:56'),
(738, 'anymedion@gmail.com', '::1', '2021-03-22 17:32:11'),
(739, 'shalbin@gmail.com', '::1', '2021-03-22 17:36:30'),
(740, 'anymedion@gmail.com', '127.0.0.1', '2021-03-23 10:08:44'),
(741, 'anymedion@gmail.com', '127.0.0.1', '2021-03-23 11:11:58'),
(742, 'anymedion@gmail.com', '127.0.0.1', '2021-03-23 12:13:31'),
(743, 'anymedion@gmail.com', '127.0.0.1', '2021-03-23 15:33:30'),
(744, 'anymedion@gmail.com', '127.0.0.1', '2021-03-23 15:38:15'),
(745, 'shinoy@gmail.com', '127.0.0.1', '2021-03-23 15:41:05'),
(746, 'anymedion@gmail.com', '127.0.0.1', '2021-03-23 15:43:07'),
(747, 'anymedion@gmail.com', '127.0.0.1', '2021-03-24 12:17:05'),
(748, 'anymedion@gmail.com', '127.0.0.1', '2021-03-24 12:35:47'),
(749, 'anymedion@gmail.com', '127.0.0.1', '2021-03-24 14:26:15'),
(750, 'anymedion@gmail.com', '127.0.0.1', '2021-03-24 14:28:44'),
(751, 'anymedion@gmail.com', '127.0.0.1', '2021-03-25 09:48:10'),
(752, 'anymedion@gmail.com', '127.0.0.1', '2021-03-25 13:58:19'),
(753, 'anymedion@gmail.com', '127.0.0.1', '2021-03-25 14:57:41'),
(754, 'anymedion@gmail.com', '127.0.0.1', '2021-03-25 16:31:19'),
(755, 'anymedion@gmail.com', '127.0.0.1', '2021-03-25 17:59:41'),
(756, 'anymedion@gmail.com', '127.0.0.1', '2021-03-26 09:34:34'),
(757, 'anymedion@gmail.com', '127.0.0.1', '2021-03-26 13:32:37'),
(758, 'anymedion@gmail.com', '127.0.0.1', '2021-03-27 16:12:24'),
(759, 'anymedion@gmail.com', '127.0.0.1', '2021-03-29 09:44:14'),
(760, 'anymedion@gmail.com', '127.0.0.1', '2021-03-29 14:34:42'),
(761, 'anymedion@gmail.com', '127.0.0.1', '2021-03-30 11:56:04'),
(762, 'anymedion@gmail.com', '127.0.0.1', '2021-03-31 10:24:51'),
(763, 'anymedion@gmail.com', '127.0.0.1', '2021-03-31 17:13:59'),
(764, 'anymedion@gmail.com', '127.0.0.1', '2021-04-01 09:49:00'),
(765, 'anymedion@gmail.com', '127.0.0.1', '2021-04-01 12:39:35'),
(766, 'anymedion@gmail.com', '127.0.0.1', '2021-04-01 12:48:44'),
(767, 'anymedion@gmail.com', '127.0.0.1', '2021-04-01 16:54:26'),
(768, 'anymedion@gmail.com', '127.0.0.1', '2021-04-03 10:25:53'),
(769, 'anymedion@gmail.com', '127.0.0.1', '2021-04-03 14:01:45'),
(770, 'anymedion@gmail.com', '127.0.0.1', '2021-04-05 13:41:13'),
(771, 'anymedion@gmail.com', '127.0.0.1', '2021-04-05 14:08:37'),
(772, 'anymedion@gmail.com', '127.0.0.1', '2021-04-05 17:26:27'),
(773, 'anymedion@gmail.com', '::1', '2021-04-10 10:02:34'),
(774, 'anymedion@gmail.com', '::1', '2021-04-10 13:55:33'),
(775, 'anymedion@gmail.com', '::1', '2021-04-10 15:07:43'),
(776, 'anymedion@gmail.com', '::1', '2021-04-10 15:30:58'),
(777, 'anymedion@gmail.com', '::1', '2021-04-12 09:57:00'),
(778, 'anymedion@gmail.com', '::1', '2021-04-12 18:16:25'),
(779, 'anymedion@gmail.com', '::1', '2021-04-13 09:37:33'),
(780, 'anymedion@gmail.com', '::1', '2021-04-13 16:01:03'),
(781, 'anymedion@gmail.com', '::1', '2021-04-14 10:14:01'),
(782, 'anymedion@gmail.com', '::1', '2021-04-14 13:35:39'),
(783, 'anymedion@gmail.com', '::1', '2021-04-14 16:43:57'),
(784, 'anymedion@gmail.com', '::1', '2021-04-15 09:49:04'),
(785, 'anymedion@gmail.com', '::1', '2021-04-15 12:15:22'),
(786, 'anymedion@gmail.com', '::1', '2021-04-16 10:14:23'),
(787, 'anymedion@gmail.com', '::1', '2021-04-16 17:31:42'),
(788, 'anymedion@gmail.com', '::1', '2021-04-17 09:57:14'),
(789, 'anymedion@gmail.com', '::1', '2021-04-17 14:53:37'),
(790, 'anymedion@gmail.com', '::1', '2021-04-22 15:20:25'),
(791, 'anymedion@gmail.com', '::1', '2021-04-23 13:50:47'),
(792, 'anymedion@gmail.com', '::1', '2021-04-23 14:39:02'),
(793, 'anymedion@gmail.com', '::1', '2021-04-24 09:25:18'),
(794, 'anymedion@gmail.com', '::1', '2021-04-26 12:46:33'),
(795, 'anymedion@gmail.com', '::1', '2021-04-27 09:52:02'),
(796, 'anymedion@gmail.com', '::1', '2021-04-28 09:29:48'),
(797, 'anymedion@gmail.com', '::1', '2021-04-28 14:14:43'),
(798, 'anymedion@gmail.com', '::1', '2021-04-29 09:07:41'),
(799, 'anymedion@gmail.com', '::1', '2021-04-29 12:40:09'),
(800, 'anymedion@gmail.com', '::1', '2021-04-30 09:21:24'),
(801, 'anymedion@gmail.com', '::1', '2021-04-30 14:36:54'),
(802, 'anymedion@gmail.com', '::1', '2021-05-01 09:42:34'),
(803, 'anymedion@gmail.com', '::1', '2021-05-01 15:10:52'),
(804, 'anymedion@gmail.com', '::1', '2021-05-03 11:58:01'),
(805, 'anymedion@gmail.com', '::1', '2021-05-03 11:58:01'),
(806, 'anymedion@gmail.com', '::1', '2021-05-03 14:46:00'),
(807, 'anymedion@gmail.com', '::1', '2021-05-04 09:34:58'),
(808, 'anymedion@gmail.com', '::1', '2021-05-04 14:31:45'),
(809, 'anymedion@gmail.com', '::1', '2021-05-04 15:37:57'),
(810, 'anymedion@gmail.com', '::1', '2021-05-05 09:15:54'),
(811, 'anymedion@gmail.com', '::1', '2021-05-06 09:36:07'),
(812, 'anymedion@gmail.com', '::1', '2021-05-06 14:19:21'),
(813, 'anymedion@gmail.com', '::1', '2021-05-06 18:10:03'),
(814, 'anymedion@gmail.com', '::1', '2021-05-07 09:59:32'),
(815, 'anymedion@gmail.com', '::1', '2021-05-07 14:29:15'),
(816, 'anymedion@gmail.com', '::1', '2021-05-08 09:12:34'),
(817, 'anymedion@gmail.com', '::1', '2021-05-08 14:14:56'),
(818, 'anymedion@gmail.com', '::1', '2021-05-10 10:03:36'),
(819, 'anymedion@gmail.com', '::1', '2021-05-10 14:25:17'),
(820, 'anymedion@gmail.com', '::1', '2021-05-10 14:56:18'),
(821, 'anymedion@gmail.com', '::1', '2021-05-10 15:18:22'),
(822, 'anymedion@gmail.com', '::1', '2021-05-11 09:26:36'),
(823, 'anymedion@gmail.com', '::1', '2021-05-11 14:40:45'),
(824, 'anymedion@gmail.com', '::1', '2021-05-12 09:19:59'),
(825, 'anymedion@gmail.com', '::1', '2021-05-12 14:57:46'),
(826, 'anymedion@gmail.com', '::1', '2021-05-12 14:57:46'),
(827, 'anymedion@gmail.com', '::1', '2021-05-13 10:24:20'),
(828, 'anymedion@gmail.com', '::1', '2021-05-14 09:14:44'),
(829, 'anymedion@gmail.com', '::1', '2021-05-14 14:20:25'),
(830, 'anymedion@gmail.com', '::1', '2021-05-15 09:23:59'),
(831, 'anymedion@gmail.com', '::1', '2021-05-17 09:16:13'),
(832, 'anymedion@gmail.com', '::1', '2021-05-17 16:20:56'),
(833, 'anymedion@gmail.com', '::1', '2021-05-17 16:24:24'),
(834, 'anymedion@gmail.com', '::1', '2021-05-17 20:18:00'),
(835, 'anymedion@gmail.com', '::1', '2021-05-18 14:41:16'),
(836, 'anymedion@gmail.com', '::1', '2021-05-19 10:15:01'),
(837, 'anymedion@gmail.com', '::1', '2021-05-20 09:47:25'),
(838, 'anymedion@gmail.com', '::1', '2021-05-21 09:46:25'),
(839, 'anymedion@gmail.com', '::1', '2021-05-22 09:30:07'),
(840, 'anymedion@gmail.com', '::1', '2021-05-22 14:34:33'),
(841, 'anymedion@gmail.com', '::1', '2021-05-23 14:05:01'),
(842, 'anymedion@gmail.com', '::1', '2021-05-24 09:05:43'),
(843, 'anymedion@gmail.com', '::1', '2021-05-24 16:31:43'),
(844, 'anymedion@gmail.com', '::1', '2021-05-25 10:17:10'),
(845, 'anymedion@gmail.com', '103.99.206.119', '2021-05-25 13:43:14'),
(846, 'anymedion@gmail.com', '::1', '2021-05-26 10:49:24'),
(847, 'anymedion@gmail.com', '::1', '2021-05-29 09:01:43'),
(848, 'anymedion@gmail.com', '::1', '2021-05-31 15:53:19'),
(849, 'anymedion@gmail.com', '103.70.197.125', '2021-05-31 16:31:34'),
(850, 'anymedion@gmail.com', '103.99.206.201', '2021-05-31 16:35:32'),
(851, 'anymedion@gmail.com', '42.109.129.158', '2021-06-01 11:28:25'),
(852, 'anymedion@gmail.com', '42.109.129.158', '2021-06-01 15:31:14'),
(853, 'anymedion@gmail.com', '42.106.180.113', '2021-06-01 17:32:40'),
(854, 'anymedion@gmail.com', '42.109.129.2', '2021-06-02 11:05:21'),
(855, 'anymedion@gmail.com', '::1', '2021-06-03 16:36:34'),
(856, 'anymedion@gmail.com', '::1', '2021-06-04 09:42:43'),
(857, 'anymedion@gmail.com', '::1', '2021-06-04 14:09:32'),
(858, 'anymedion@gmail.com', '::1', '2021-06-05 09:29:36'),
(859, 'anymedion@gmail.com', '::1', '2021-06-05 14:33:47'),
(860, 'anymedion@gmail.com', '::1', '2021-06-07 09:10:25'),
(861, 'anymedion@gmail.com', '::1', '2021-06-07 12:20:33'),
(862, 'anymedion@gmail.com', '::1', '2021-06-07 15:15:19'),
(863, 'anymedion@gmail.com', '::1', '2021-06-08 09:29:30'),
(864, 'anymedion@gmail.com', '::1', '2021-06-08 15:43:14'),
(865, 'anymedion@gmail.com', '::1', '2021-06-08 16:55:38'),
(866, 'anymedion@gmail.com', '::1', '2021-06-09 16:05:18'),
(867, 'anymedion@gmail.com', '::1', '2021-06-10 11:05:53'),
(868, 'anymedion@gmail.com', '::1', '2021-06-10 11:11:05'),
(869, 'anymedion@gmail.com', '::1', '2021-06-10 12:20:42'),
(870, 'anymedion@gmail.com', '::1', '2021-06-11 09:27:28'),
(871, 'anymedion@gmail.com', '::1', '2021-06-11 11:37:37'),
(872, 'anymedion@gmail.com', '::1', '2021-06-14 10:22:13'),
(873, 'anymedion@gmail.com', '::1', '2021-06-14 14:20:14'),
(874, 'anymedion@gmail.com', '::1', '2021-06-15 11:24:13'),
(875, 'anymedion@gmail.com', '::1', '2021-06-15 12:30:08'),
(876, 'anymedion@gmail.com', '::1', '2021-06-15 14:44:36'),
(877, 'anymedion@gmail.com', '::1', '2021-06-16 09:41:07'),
(878, 'anymedion@gmail.com', '::1', '2021-06-16 13:41:37'),
(879, 'anymedion@gmail.com', '::1', '2021-06-16 13:45:45'),
(880, 'anymedion@gmail.com', '::1', '2021-06-16 17:00:38'),
(881, 'anymedion@gmail.com', '::1', '2021-06-17 09:33:19'),
(882, 'anymedion@gmail.com', '::1', '2021-06-18 09:14:20'),
(883, 'anymedion@gmail.com', '::1', '2021-06-19 09:31:46'),
(884, 'anymedion@gmail.com', '::1', '2021-06-19 15:13:58'),
(885, 'anymedion@gmail.com', '::1', '2021-06-19 15:28:58'),
(886, 'anymedion@gmail.com', '::1', '2021-06-21 09:32:37'),
(887, 'anymedion@gmail.com', '::1', '2021-06-21 14:15:45'),
(888, 'anymedion@gmail.com', '::1', '2021-06-22 09:17:04'),
(889, 'anymedion@gmail.com', '::1', '2021-06-22 16:37:56'),
(890, 'anymedion@gmail.com', '::1', '2021-06-23 10:40:52'),
(891, 'anymedion@gmail.com', '::1', '2021-06-23 12:03:59'),
(892, 'anymedion@gmail.com', '::1', '2021-06-23 12:04:00'),
(893, 'anymedion@gmail.com', '::1', '2021-06-24 09:58:41'),
(894, 'anymedion@gmail.com', '::1', '2021-06-24 11:06:05'),
(895, 'anymedion@gmail.com', '::1', '2021-06-24 11:36:07'),
(896, 'anymedion@gmail.com', '::1', '2021-06-24 11:52:07'),
(897, 'anymedion@gmail.com', '::1', '2021-06-25 09:17:28'),
(898, 'anymedion@gmail.com', '::1', '2021-06-25 11:57:33'),
(899, 'anymedion@gmail.com', '::1', '2021-06-25 13:51:42'),
(900, 'anymedion@gmail.com', '::1', '2021-06-25 14:15:57'),
(901, 'anymedion@gmail.com', '::1', '2021-06-26 09:44:35'),
(902, 'anymedion@gmail.com', '::1', '2021-06-28 10:08:44'),
(903, 'anymedion@gmail.com', '::1', '2021-06-28 14:32:24'),
(904, 'anymedion@gmail.com', '::1', '2021-06-29 10:17:51'),
(905, 'anymedion@gmail.com', '::1', '2021-06-30 10:00:58'),
(906, 'anymedion@gmail.com', '::1', '2021-06-30 15:04:40'),
(907, 'anymedion@gmail.com', '::1', '2021-07-01 10:01:32'),
(908, 'anymedion@gmail.com', '::1', '2021-07-03 17:48:02'),
(909, 'anymedion@gmail.com', '::1', '2021-07-03 21:27:39'),
(910, 'anymedion@gmail.com', '::1', '2021-07-06 09:51:26'),
(911, 'anymedion@gmail.com', '::1', '2021-07-06 11:54:11'),
(912, 'anymedion@gmail.com', '::1', '2021-07-06 12:02:49'),
(913, 'anymedion@gmail.com', '::1', '2021-07-06 12:53:16'),
(914, 'anymedion@gmail.com', '::1', '2021-07-06 14:10:57'),
(915, 'anymedion@gmail.com', '::1', '2021-07-06 14:11:08'),
(916, 'anymedion@gmail.com', '::1', '2021-07-08 09:23:47'),
(917, 'anymedion@gmail.com', '::1', '2021-07-10 08:59:56'),
(918, 'anymedion@gmail.com', '::1', '2021-07-10 15:42:33'),
(919, 'anymedion@gmail.com', '::1', '2021-07-10 20:25:45'),
(920, 'anymedion@gmail.com', '::1', '2021-07-12 09:38:27'),
(921, 'anymedion@gmail.com', '::1', '2021-07-12 13:34:16'),
(922, 'anymedion@gmail.com', '::1', '2021-07-13 09:27:49'),
(923, 'anymedion@gmail.com', '::1', '2021-07-13 14:43:53'),
(924, 'anymedion@gmail.com', '::1', '2021-07-13 16:44:28'),
(925, 'anymedion@gmail.com', '::1', '2021-07-15 14:53:53'),
(926, 'anymedion@gmail.com', '::1', '2021-07-16 09:31:10'),
(927, 'anymedion@gmail.com', '::1', '2021-07-17 09:23:31'),
(928, 'anymedion@gmail.com', '::1', '2021-07-19 09:40:08'),
(929, 'anymedion@gmail.com', '::1', '2021-07-20 09:24:17'),
(930, 'anymedion@gmail.com', '::1', '2021-07-20 16:35:35'),
(931, 'anymedion@gmail.com', '::1', '2021-07-23 10:11:05'),
(932, 'anymedion@gmail.com', '::1', '2021-07-27 10:14:24'),
(933, 'anymedion@gmail.com', '::1', '2021-07-27 13:20:00'),
(934, 'anymedion@gmail.com', '::1', '2021-07-27 14:32:46'),
(935, 'anymedion@gmail.com', '::1', '2021-07-28 10:03:06'),
(936, 'anymedion@gmail.com', '::1', '2021-07-28 17:18:19'),
(937, 'anymedion@gmail.com', '::1', '2021-07-29 09:59:23'),
(938, 'anymedion@gmail.com', '::1', '2021-07-30 10:15:31'),
(939, 'anymedion@gmail.com', '::1', '2021-07-30 14:48:45'),
(940, 'anymedion@gmail.com', '::1', '2021-08-02 09:57:08'),
(941, 'anymedion@gmail.com', '::1', '2021-08-03 10:06:30'),
(942, 'anymedion@gmail.com', '::1', '2021-08-03 11:13:23'),
(943, 'anymedion@gmail.com', '::1', '2021-08-03 15:01:09'),
(944, 'anymedion@gmail.com', '::1', '2021-08-04 11:51:04'),
(945, 'anymedion@gmail.com', '::1', '2021-08-05 09:46:45'),
(946, 'anymedion@gmail.com', '::1', '2021-08-06 11:17:29'),
(947, 'anymedion@gmail.com', '::1', '2021-08-06 17:43:26'),
(948, 'anymedion@gmail.com', '::1', '2021-08-07 11:47:25'),
(949, 'anymedion@gmail.com', '::1', '2021-08-07 13:57:08'),
(950, 'anymedion@gmail.com', '::1', '2021-08-10 13:56:00'),
(951, 'anymedion@gmail.com', '::1', '2021-08-11 10:24:13'),
(952, 'anymedion@gmail.com', '::1', '2021-08-11 12:56:19'),
(953, 'anymedion@gmail.com', '::1', '2021-08-12 10:22:21'),
(954, 'anymedion@gmail.com', '::1', '2021-08-12 15:19:31'),
(955, 'anymedion@gmail.com', '::1', '2021-08-13 10:17:02'),
(956, 'anymedion@gmail.com', '::1', '2021-08-13 12:25:10'),
(957, 'anymedion@gmail.com', '::1', '2021-08-13 17:19:26'),
(958, 'anymedion@gmail.com', '::1', '2021-08-16 12:41:54'),
(959, 'anymedion@gmail.com', '::1', '2021-08-16 18:24:54'),
(960, 'anymedion@gmail.com', '::1', '2021-08-17 10:33:37'),
(961, 'anymedion@gmail.com', '::1', '2021-08-17 15:15:00'),
(962, 'anymedion@gmail.com', '::1', '2021-08-17 18:14:20'),
(963, 'anymedion@gmail.com', '::1', '2021-08-18 09:53:31'),
(964, 'anymedion@gmail.com', '::1', '2021-08-18 12:32:47'),
(965, 'anymedion@gmail.com', '::1', '2021-08-19 10:17:50'),
(966, 'anymedion@gmail.com', '::1', '2021-08-23 10:34:07'),
(967, 'anymedion@gmail.com', '::1', '2021-08-23 14:20:27'),
(968, 'anymedion@gmail.com', '::1', '2021-08-24 10:15:52'),
(969, 'anymedion@gmail.com', '::1', '2021-08-25 18:03:43'),
(970, 'anymedion@gmail.com', '::1', '2021-08-26 09:50:12'),
(971, 'anymedion@gmail.com', '::1', '2021-08-31 15:17:05'),
(972, 'anymedion@gmail.com', '::1', '2021-09-01 10:20:24'),
(973, 'anymedion@gmail.com', '::1', '2021-09-02 10:16:01'),
(974, 'anymedion@gmail.com', '::1', '2021-09-03 10:05:04'),
(975, 'anymedion@gmail.com', '::1', '2021-09-04 10:06:00'),
(976, 'anymedion@gmail.com', '::1', '2021-09-07 17:02:36'),
(977, 'anymedion@gmail.com', '::1', '2021-09-08 10:15:25'),
(978, 'anymedion@gmail.com', '::1', '2021-09-10 10:33:09'),
(979, 'anymedion@gmail.com', '::1', '2021-09-10 15:50:15'),
(980, 'anymedion@gmail.com', '::1', '2021-09-11 10:00:46'),
(981, 'anymedion@gmail.com', '::1', '2021-09-11 16:53:56'),
(982, 'anymedion@gmail.com', '::1', '2021-09-13 15:22:45'),
(983, 'anymedion@gmail.com', '::1', '2021-09-15 09:56:00'),
(984, 'anymedion@gmail.com', '::1', '2021-09-15 16:09:27'),
(985, 'anymedion@gmail.com', '::1', '2021-09-16 12:01:15'),
(986, 'anymedion@gmail.com', '::1', '2021-09-16 12:03:13'),
(987, 'anymedion@gmail.com', '::1', '2021-09-16 12:23:45'),
(988, 'anymedion@gmail.com', '::1', '2021-09-16 15:20:21'),
(989, 'anymedion@gmail.com', '::1', '2021-09-16 15:23:57'),
(990, 'anymedion@gmail.com', '::1', '2021-09-16 22:49:11'),
(991, 'anymedion@gmail.com', '::1', '2021-09-17 11:26:38'),
(992, 'anymedion@gmail.com', '::1', '2021-09-17 12:23:36'),
(993, 'anymedion@gmail.com', '::1', '2021-09-17 12:28:04'),
(994, 'anymedion@gmail.com', '::1', '2021-09-18 09:54:01'),
(995, 'anymedion@gmail.com', '::1', '2021-09-20 12:01:05'),
(996, 'anymedion@gmail.com', '::1', '2021-09-22 10:37:43'),
(997, 'anymedion@gmail.com', '::1', '2021-09-23 17:14:00'),
(998, 'anymedion@gmail.com', '::1', '2021-09-27 11:38:15'),
(999, 'anymedion@gmail.com', '::1', '2021-09-28 16:34:21'),
(1000, 'anymedion@gmail.com', '::1', '2021-09-29 09:02:55'),
(1001, 'anymedion@gmail.com', '::1', '2021-10-04 11:12:44'),
(1002, 'anymedion@gmail.com', '::1', '2021-10-06 14:34:18'),
(1003, 'anymedion@gmail.com', '::1', '2021-10-07 11:48:27'),
(1004, 'anymedion@gmail.com', '::1', '2021-10-09 15:42:38'),
(1005, 'anymedion@gmail.com', '::1', '2021-10-13 15:18:40'),
(1006, 'anymedion@gmail.com', '::1', '2021-10-14 14:15:29'),
(1007, 'anymedion@gmail.com', '::1', '2021-10-14 14:56:58'),
(1008, 'anymedion@gmail.com', '::1', '2021-10-15 09:16:26'),
(1009, 'anymedion@gmail.com', '::1', '2021-10-15 09:16:26'),
(1010, 'anymedion@gmail.com', '::1', '2021-10-25 14:42:26'),
(1011, 'anymedion@gmail.com', '::1', '2021-10-28 12:21:02'),
(1012, 'anymedion@gmail.com', '::1', '2021-10-29 12:15:28');

-- --------------------------------------------------------

--
-- Table structure for table `manufacturer`
--

CREATE TABLE `manufacturer` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `address` varchar(100) NOT NULL,
  `phone` bigint(50) NOT NULL,
  `country-origin` varchar(20) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `manufacturer`
--

INSERT INTO `manufacturer` (`id`, `name`, `address`, `phone`, `country-origin`, `created_at`) VALUES
(1, 'sun pharmasutical', 'pulikkottil house', 9745625232, 'india', '2020-12-24 12:08:36'),
(2, 'cipla', 'Insuctrial building telengana', 9745625232, 'india', '2020-12-24 12:13:00');

-- --------------------------------------------------------

--
-- Table structure for table `medicine_category`
--

CREATE TABLE `medicine_category` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='tablet, liquid, drop etc. For billing ';

--
-- Dumping data for table `medicine_category`
--

INSERT INTO `medicine_category` (`id`, `name`, `created_at`) VALUES
(1, 'NIL', '2021-07-21 16:15:05'),
(2, 'TABLET', '2021-07-21 16:15:05'),
(3, 'LOTION', '2021-07-21 16:15:25'),
(4, 'FACE CREAM', '2021-07-21 16:15:25');

-- --------------------------------------------------------

--
-- Table structure for table `notification`
--

CREATE TABLE `notification` (
  `id` int(11) NOT NULL,
  `subject` varchar(50) NOT NULL,
  `description` varchar(500) NOT NULL,
  `image` varchar(100) NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `notification`
--

INSERT INTO `notification` (`id`, `subject`, `description`, `image`, `status`, `created_at`) VALUES
(1, 'Giveaway Alert', 'Win Samsung a10, Participate Now!', '1602819545noti1 copy.jpg', 1, '2020-10-16 09:09:05'),
(2, 'Giveaway Alert', 'Win Samsung A10', '1602819621Samsung Give Away.jpg', 1, '2020-10-16 09:10:21'),
(3, 'Give Away', 'Give Away', '1602859259WhatsApp Image 2020-10-16 at 6.59.45 PM.jpeg', 1, '2020-10-16 20:10:59'),
(4, 'giveaway', 'desc', '160286176370178253880dc88da1754959bd095ca3.jpg', 1, '2020-10-16 20:52:43'),
(5, 'Give Away', 'Give Away', '28ec7542aaecec215d096ae50a035594.jpeg', 1, '2020-10-16 22:05:17'),
(6, 'Book It Now', 'Let\'s safe journey begins', '93e62428bfb4622ecadf4ba739b2525d.JPG', 0, '2020-10-20 12:06:58'),
(7, 'New Brand Alert !', 'Now enjoy Great deals on Ikkas Restaurant and 20% Flat Discount for OGOCLUB Members!', 'a36e161dad227cf9c8361635a8aa1884.JPG', 1, '2020-11-10 17:38:21'),
(8, 'New Brand Alert !', 'Now enjoy Great deals on Ikkas Restaurant and 20% Flat Discount', 'adb0a381f4686f914caa7d5f992c08bf.jpg', 0, '2020-11-10 17:41:37'),
(9, 'New Brand Alert !', 'Now enjoy Great deals on BIG FAT MOMO,  Try It Now', '58d05212f2c8cfc21f7660ac0ef53257.jpg', 0, '2020-11-11 18:34:10'),
(10, 'New Brand Alert! MeltU', 'Now enjoy Great deals on MeltU, Try It Now', 'be3138af3b15b0b14772ef10f9fd4e22.jpg', 0, '2020-11-14 12:17:08'),
(11, 'Celebrate !', 'Celebrate light at Diwali with OGO Entertainer', '2121b98dbe1e3a547fbf094acd9bfe7b.jpg', 0, '2020-11-14 12:35:10'),
(12, 'Great Value Combo @ 199', 'Limited period Deal,  Get It Now !', 'fd00ad5dee5c63859211d2ef3d8cc67f.JPG', 0, '2020-11-22 13:21:06'),
(13, 'Get It Now!', '1KG Cake at just 450', '4ce20b177db572e8c45b00f4ace59f9a.JPG', 0, '2020-11-22 18:46:01'),
(14, 'Double Your Meal', 'Buy 1 Get 1 Pizza', 'e9ae9de081f19f5adb4b23792d2eabc0.JPG', 0, '2020-12-14 11:16:23'),
(15, 'Double Your Meal', 'Buy 1 Get 1 Pizza', '02b17d2487196b721d53855181d963bb.JPG', 0, '2020-12-14 12:57:37'),
(16, 'Double Your Meal', 'Buy 1 Get 1 BBQ at Grill N Chill', '1a9161c7b7ddb618bde39cacf403a2db.jpg', 0, '2020-12-14 13:18:47'),
(17, 'Double Your Meal', 'Buy 1 Get 1 Pasta or Pizza at Mash Resto Cafe', '60cc70cf4f67f092d200d5cdf017d055.JPG', 0, '2020-12-17 17:57:19'),
(18, 'Brand Alert ! - Burgeria', 'Now enjoy 25% Flat Discount at Burgeria', 'cb55d4b80eb1b9eee9be8454ea6cffaf.jpg', 1, '2020-12-23 21:55:30'),
(19, 'Brand Alert ! - Burgeria', 'Now enjoy 25% Flat Discount at Burgeria', '0d400bb6b20e9bf336beb2583ecf8216.jpg', 0, '2020-12-24 11:01:58'),
(20, 'Brand Alert ! - Burgeria', 'Now enjoy 25% Flat Discount at Burgeria', 'e48a2ca7ee69502568a9e1e429f6b48f.jpg', 1, '2020-12-24 13:17:39'),
(21, 'Brand Alert ! - Burgeria', 'Now enjoy 25% Flat Discount at Burgeria', '0b416785f846273034e7a50552caa3cc.jpg', 1, '2020-12-24 16:58:01'),
(22, 'Brand Alert ! - Burgeria', 'Now enjoy 25% Flat Discount at Burgeria', 'cfcb02d08257e97c24a2a2e33315a112.jpg', 1, '2020-12-24 21:25:05'),
(23, 'Ho! Ho! Ho! Marry Xmas ????', 'Get Up to 50% Off on your favorite eatout  places. Enjoy!', 'a1307e6744a6c3f2513c4a4c8a9b885e.jpg', 0, '2020-12-25 10:54:33'),
(24, '????GIFTMAS GIVEAWAY ! ????', 'Get ?1000 Food Voucher, Participate Now!', 'b0735a50236ef96c42271e2d2fcb4a66.jpg', 0, '2020-12-25 13:12:08'),
(25, 'Discover Kochi', 'Discover Kochi With OGO. Open The App You\'ll Find IT', '1f78b98c6de699051bf67753baed871f.jpg', 0, '2020-12-25 15:09:43'),
(26, 'New year Deals On!', 'Good Morning ! Make everyday amazing with OGO!', '4db4b356fc2baf50ed6b57137f56b8ae.JPG', 0, '2020-12-29 10:30:49'),
(27, 'happy new year !', 'Enjoy Unlimited Chicken Mandi + Milk Shake + pastry at just 199 @ ikkas Restaurant MG Road', '850e3d26fafae35e9d8f26ebe846f01f.JPG', 0, '2020-12-31 16:15:08'),
(28, 'HAPPY OGO YEAR ....!!!', 'OGO Celebration begins here...!', 'c7cd53d41ccc825edbd459bdeee7a2cf.JPG', 0, '2021-01-01 00:28:10'),
(29, 'Fragrance Deals On..!  Get It Today', 'Buy 2 Get 1 Free from MYOP Perfume - Centre Square Mall & Lulu mall', 'fa578953ec3d5c674d839a095ddfe828.jpg', 0, '2021-01-02 09:45:28'),
(30, 'Eat Out Sunday !! Lets OGO IT', 'Get Your Great Deals', 'a3da5cd60ab7c1bd73e859c6f6735655.jpg', 0, '2021-01-17 15:22:58'),
(31, 'test subject shinoyw', 'shinoiy description', '', 0, '2021-04-05 18:01:45');

-- --------------------------------------------------------

--
-- Table structure for table `offer`
--

CREATE TABLE `offer` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `percentage` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `ordered_product`
--

CREATE TABLE `ordered_product` (
  `id` int(11) NOT NULL,
  `order_no` varchar(100) NOT NULL,
  `product_id` int(11) NOT NULL COMMENT 'product of any type',
  `qty` bigint(20) NOT NULL,
  `amount` bigint(20) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='order product from font end ';

--
-- Dumping data for table `ordered_product`
--

INSERT INTO `ordered_product` (`id`, `order_no`, `product_id`, `qty`, `amount`, `created_at`) VALUES
(1, 'ANYORD0001', 13, 2, 110, '2021-09-10 15:39:20'),
(2, 'ANYORD0002', 13, 26, 110, '2021-09-15 10:40:21'),
(3, 'ANYORD0002', 12, 4, 200, '2021-09-15 10:40:21'),
(4, 'ANYORD0002', 12, 4, 400, '2021-09-15 10:40:21'),
(5, 'ANYORD0003', 13, 120, 110, '2021-09-22 15:46:36'),
(6, 'ANYORD0004', 13, 19, 665, '2021-10-02 10:18:30');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `order_no` varchar(100) NOT NULL,
  `order_date` date NOT NULL,
  `customer_id` int(11) NOT NULL COMMENT 'userid of purchasee',
  `delivery_address` varchar(400) NOT NULL COMMENT 'selected from user address',
  `pincode` bigint(20) NOT NULL,
  `phone` bigint(20) NOT NULL COMMENT 'number of customer',
  `total_amt` double NOT NULL,
  `transaction_id` bigint(20) NOT NULL COMMENT 'id from transaction \r\n table',
  `prescription_img` varchar(100) NOT NULL,
  `voice_msg` varchar(100) NOT NULL,
  `text_note` text NOT NULL,
  `prescription` int(11) NOT NULL COMMENT '1=yes, 0=no',
  `order_type` varchar(100) NOT NULL COMMENT '1=service,2=product',
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='The Users make pdt order through front end , that information resids here.  ';

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `order_no`, `order_date`, `customer_id`, `delivery_address`, `pincode`, `phone`, `total_amt`, `transaction_id`, `prescription_img`, `voice_msg`, `text_note`, `prescription`, `order_type`, `created_at`) VALUES
(1, 'ANYORD0001', '0000-00-00', 23, 'new address', 0, 7896325685, 110, 0, 'f03bafc539c81728273589f101e4c173.pdf', 'a67a19dd724454283891babc7753efe5.MP3', '', 1, 'prescription', '2021-09-10 15:39:20'),
(2, 'ANYORD0002', '0000-00-00', 23, 'new address', 0, 7896325685, 710, 0, '67f3242fdf978dbefa700e2e898f667d.jpg', '1ffb54920fef71b3bc3932b25f123ff7.mp3', 'dfdvdvdfvdfgrfgd', 1, 'prescription', '2021-09-15 10:40:21'),
(3, 'ANYORD0003', '0000-00-00', 23, 'new address', 0, 7896325685, 110, 0, '7526f3d2d430928775ab71603180e2fc.jpg', '50a5df248d7f032fa72e49aa92443f02.mp3', 'dfdvdvdfvdfgrfgd', 1, 'medicine', '2021-09-22 15:46:36'),
(4, 'ANYORD0004', '0000-00-00', 41, '', 0, 0, 665, 0, 'adb3b3b2c631613da08e255b3affccd7.JPG', '9965c08184f2d5d028be4c57efdbf2cd.mp3', 'new test', 1, 'medicine', '2021-10-02 10:18:30');

-- --------------------------------------------------------

--
-- Table structure for table `order_deliveryboy`
--

CREATE TABLE `order_deliveryboy` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL COMMENT 'fk',
  `delivery_persion_id` int(11) NOT NULL COMMENT 'fk',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `order_status`
--

CREATE TABLE `order_status` (
  `id` int(11) NOT NULL,
  `order_no` varchar(11) NOT NULL,
  `status` int(11) NOT NULL COMMENT '1=placed, 2=completed,',
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `order_status`
--

INSERT INTO `order_status` (`id`, `order_no`, `status`, `created_at`) VALUES
(1, 'ANYORD0001', 1, '2021-09-13 15:47:01'),
(2, 'ANYORD0002', 1, '2021-09-29 16:00:09'),
(3, 'ANYORD0003', 1, '2021-10-01 15:25:26'),
(4, 'ANYORD0004', 1, '2021-10-02 10:18:30');

-- --------------------------------------------------------

--
-- Table structure for table `package`
--

CREATE TABLE `package` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `offer_percentage` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `package`
--

INSERT INTO `package` (`id`, `name`, `description`, `offer_percentage`) VALUES
(1, 'silver', 'its silver card', 0),
(2, 'gold', 'its gold card', 0),
(3, 'platinum', 'its platinam card.', 0),
(4, 'sillver', 'theris istest', 34);

-- --------------------------------------------------------

--
-- Table structure for table `package_lab`
--

CREATE TABLE `package_lab` (
  `id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `description` text NOT NULL,
  `image` varchar(100) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='contains pakages of lab tests';

--
-- Dumping data for table `package_lab`
--

INSERT INTO `package_lab` (`id`, `name`, `description`, `image`, `created_at`) VALUES
(1, 'winter special new', 'just testing a new pkg', '0', '2021-01-02 07:51:09'),
(2, 'new', 'new1', '0', '2021-01-02 12:37:03'),
(3, 'new', 'new1', '0', '2021-01-02 12:37:03'),
(4, 'new pgk', 'for testing the insertied id get', '0', '2021-01-04 07:04:02'),
(5, 'new pgk', 'for testing the insertied id get', '0', '2021-01-04 07:06:52'),
(6, 'winter package', 'for winter season testing', '0', '2021-01-04 07:08:07'),
(7, 'corona pkg ', 'full corona test', '0', '2021-01-04 07:46:38'),
(8, 'anemia', 'test anemia', '0', '2021-01-04 07:47:46'),
(9, 'date', 'storeage in cool place', '0', '2021-01-05 07:04:57'),
(10, 'date new  shinoy', 'storeage in cool place', '0', '2021-05-01 02:12:52'),
(11, 'january pkg', 'januvary cold pkg', '0', '2021-01-06 04:57:05'),
(12, 'dffdfd', 'ffdfd', '0', '2021-01-22 10:03:32'),
(13, 'corona care new', 'this is  new corona care', '0', '2021-03-03 08:36:22'),
(14, 'TEST PACKAE', 'test package descrioption', '0', '2021-03-03 08:53:12'),
(15, 'TEST PACKAE', 'test package descrioption', '0', '2021-03-03 08:53:49'),
(16, 'TEST PACKAE', 'test package descrioption', '0', '2021-03-03 08:55:18'),
(17, 'test new pakg2', 'just a description', '0', '2021-03-03 09:59:31'),
(18, 'lab test new 21', 'storeage in cool placedfdefdfd', '0', '2021-03-03 10:02:32'),
(19, 'lab test new 21', 'storeage in cool placedfdefdfd', '0', '2021-03-03 10:06:53'),
(20, 'lab test new 21', 'storeage in cool placedfdefdfd', '0', '2021-03-03 10:12:03'),
(21, 'another test ', 'this is another test description', '0', '2021-03-03 10:12:44'),
(22, 'another test ', 'this is another test description', '0', '2021-03-03 10:14:57'),
(23, 'another test ', 'this is another test description', '0', '2021-03-03 10:17:02'),
(24, 'another test ', 'this is another test description', '0', '2021-03-03 10:17:16'),
(25, 'another test ', 'this is another test description', '0', '2021-03-03 10:17:24'),
(26, 'another test ', 'this is another test description', '0', '2021-03-03 10:18:30'),
(27, 'shalbin lab pkg teest', 'dtes ahdowlemmv', '0', '2021-03-03 10:20:14'),
(28, 'new summer pakg', 'its neeww', '0', '2021-03-30 10:48:53'),
(29, 'gift pkg', 'this is for good', '', '2021-05-21 15:07:57'),
(30, 'gift pkg', 'this is for good', '', '2021-05-21 15:08:20'),
(31, 'lab ne ', 'nothing', 'ebbfc07cf65413402ece58f07dfcc9d4.jpg', '2021-05-21 15:09:11');

-- --------------------------------------------------------

--
-- Table structure for table `package_lab_institution`
--

CREATE TABLE `package_lab_institution` (
  `id` int(11) NOT NULL,
  `package_id` int(11) NOT NULL,
  `institution_id` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='(labtest)packeges connects to institutioin';

--
-- Dumping data for table `package_lab_institution`
--

INSERT INTO `package_lab_institution` (`id`, `package_id`, `institution_id`, `price`, `created_at`) VALUES
(1, 7, 1, 60, '2021-05-13 16:39:46'),
(2, 8, 1, 5000, '2021-05-13 16:39:46'),
(3, 9, 1, 5000, '2021-05-13 16:39:46'),
(5, 11, 1, 850, '2021-05-13 16:39:46'),
(6, 12, 1, 343, '2021-05-13 16:39:46'),
(7, 26, 2, 234234, '2021-05-13 16:39:46'),
(8, 26, 1, 234234, '2021-05-13 16:39:46'),
(9, 27, 2, 3434, '2021-05-13 16:39:46'),
(10, 27, 1, 3434, '2021-05-13 16:39:46'),
(11, 28, 2, 300, '2021-05-13 16:39:46'),
(12, 10, 29, 300, '2021-05-13 16:39:46'),
(15, 29, 30, 456, '2021-05-21 15:07:57'),
(16, 30, 30, 456, '2021-05-21 15:08:21'),
(17, 31, 29, 4545, '2021-05-21 15:09:11');

-- --------------------------------------------------------

--
-- Table structure for table `packing`
--

CREATE TABLE `packing` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `packing`
--

INSERT INTO `packing` (`id`, `name`) VALUES
(1, 'Strip'),
(2, 'Bottle'),
(3, 'Sachet'),
(4, 'Box'),
(5, 'Vial'),
(6, 'Tube');

-- --------------------------------------------------------

--
-- Table structure for table `packing_info`
--

CREATE TABLE `packing_info` (
  `id` int(11) NOT NULL,
  `number` int(11) NOT NULL,
  `description` varchar(100) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `packing_info`
--

INSERT INTO `packing_info` (`id`, `number`, `description`, `created_at`) VALUES
(1, 1, '1\'S', '2021-08-18 12:33:28'),
(2, 2, '2\'S', '2021-08-18 12:33:37'),
(3, 3, '3\'S', '2021-08-18 12:33:45'),
(4, 4, '4\'S', '2021-08-18 12:33:54'),
(5, 5, '5\'S', '2021-08-18 12:34:02'),
(6, 6, '6\'S', '2021-08-18 12:34:07'),
(7, 7, '7\'S', '2021-08-18 12:34:11'),
(8, 8, '8\'S', '2021-08-19 13:46:41'),
(9, 9, '9\'S', '2021-08-19 13:49:46'),
(10, 10, '10\'S', '2021-08-19 15:23:47');

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` int(11) NOT NULL,
  `permission_name` varchar(50) NOT NULL,
  `description` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `permission_name`, `description`) VALUES
(1, 'user_management', '<p><strong>User Management</strong></p>'),
(2, 'offer_management', '<p><strong>Offer Management</strong></p>'),
(21, 'order_management', '<p><strong>Order Management</strong></p>'),
(22, 'service_management', '<p><strong>Service Management</strong></p>'),
(23, 'category_management', '<p><strong>category_management</strong></p>'),
(24, 'wholesale_management', '<p><strong>wholesale_management</strong></p>'),
(25, 'package_management', '<p><strong>package_managementt</strong></p>'),
(26, 'homepage_customization', '<p><strong>homepage_customization</strong></p>'),
(27, 'feedback_management', '<p><strong>feedback_management</strong></p>'),
(28, 'area_management', '<p><strong>area_management</strong></p>');

-- --------------------------------------------------------

--
-- Table structure for table `pincodes`
--

CREATE TABLE `pincodes` (
  `id` int(11) NOT NULL,
  `place` varchar(500) NOT NULL,
  `district_id` int(11) NOT NULL,
  `pincode` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pincodes`
--

INSERT INTO `pincodes` (`id`, `place`, `district_id`, `pincode`) VALUES
(1, 'Adat	', 13, '680551'),
(2, 'Agalad	', 13, '680518'),
(3, 'Akathiyur	', 13, '680519'),
(4, 'Akkikavu	', 13, '680519'),
(5, 'Alagappanagar	', 13, '680302'),
(6, 'Alapad	', 13, '680641'),
(7, 'Alathur	', 13, '680741'),
(8, 'Alur Mattom	', 13, '680602'),
(9, 'Alur-Kalletumkara	', 13, '680683'),
(10, 'Amalanagar	', 13, '680555'),
(11, 'Ammadam	', 13, '680563'),
(12, 'Anandapuram	', 13, '680305'),
(13, 'Anapuzha	', 13, '680667'),
(14, 'Anchery	', 13, '680006'),
(15, 'Andathode	', 13, '679564'),
(16, 'Anjur Mundur	', 13, '680541'),
(17, 'Anjur-kunnamkulam	', 13, '680523'),
(18, 'Annakara	', 13, '680508'),
(19, 'Annallur	', 13, '680731'),
(20, 'Annamanada	', 13, '680741'),
(21, 'Annanad	', 13, '680309'),
(22, 'Anthikad	', 13, '680641'),
(23, 'Aranattukara	', 13, '680618'),
(24, 'Arangottukara	', 13, '679532'),
(25, 'Arattupuzha	', 13, '680562'),
(26, 'Arimpur	', 13, '680620'),
(27, 'Aripalam	', 13, '680688'),
(28, 'Ariyannur	', 13, '680102'),
(29, 'Arthat	', 13, '680521'),
(30, 'Asarikkad	', 13, '680751'),
(31, 'Ashtamichira	', 13, '680731'),
(32, 'Athani Thrissur	', 13, '680581'),
(33, 'Attur	', 13, '680583'),
(34, 'Avanisseri	', 13, '680306'),
(35, 'Avanur	', 13, '680541'),
(36, 'Avittathur	', 13, '680683'),
(37, 'Ayyanthole North	', 13, '680003'),
(38, 'Ayyanthole	', 13, '680003'),
(39, 'Ayyappankavu	', 13, '680751'),
(40, 'Azhikode Jetty	', 13, '680666'),
(41, 'Azhikode-Thrissur	', 13, '680666'),
(42, 'Blangad	', 13, '680506'),
(43, 'Brahmakulam	', 13, '680104'),
(44, 'Chaipankuzhi	', 13, '680724'),
(45, 'Chakkarappadam	', 13, '680686'),
(46, 'Chakkumkandam	', 13, '680522'),
(47, 'Chalakudi	', 13, '680307'),
(48, 'Chalakudi R S	', 13, '680722'),
(49, 'Chalakudi South	', 13, '680307'),
(50, 'Chalakudi Town	', 13, '680307'),
(51, 'Chalingad	', 13, '680681'),
(52, 'Chamakkala	', 13, '680687'),
(53, 'Chammannur	', 13, '679561'),
(54, 'Chattikulam	', 13, '680721'),
(55, 'Chavakkad	', 13, '680506'),
(56, 'Chazhur	', 13, '680571'),
(57, 'Chelakkara	', 13, '680586'),
(58, 'Chelakode	', 13, '680587'),
(59, 'Chelur	', 13, '680121'),
(60, 'Chembuchira	', 13, '680684'),
(61, 'Chemmannur	', 13, '680517'),
(62, 'Chemmanthatta	', 13, '680501'),
(63, 'Chengallur	', 13, '680312'),
(64, 'Chennaipara	', 13, '680653'),
(65, 'Chentrappinni East	', 13, '680687'),
(66, 'Chentrappinni	', 13, '680687'),
(67, 'Cherpu Padinjattumuri	', 13, '680561'),
(68, 'Cherpu	', 13, '680561'),
(69, 'Cherur	', 13, '680008'),
(70, 'Cheruthuruthy	', 13, '679531'),
(71, 'Cheruvallur	', 13, '680308'),
(72, 'Chettupuzha	', 13, '680012'),
(73, 'Chimoni Dam	', 13, '680304'),
(74, 'Chiramanangad	', 13, '680604'),
(75, 'Chiranellur	', 13, '680501'),
(76, 'Chittanda	', 13, '680585'),
(77, 'Chittanjur	', 13, '680523'),
(78, 'Chittattukara	', 13, '680511'),
(79, 'Chittilapilly	', 13, '680551'),
(80, 'Chittissery	', 13, '680301'),
(81, 'Chiyyaram	', 13, '680026'),
(82, 'Chokkana	', 13, '680699'),
(83, 'Choolissery	', 13, '680541'),
(84, 'Choondal	', 13, '680502'),
(85, 'Chottupara	', 13, '680581'),
(86, 'Chovvur	', 13, '680027'),
(87, 'Chowannur	', 13, '680517'),
(88, 'Chulur	', 13, '680567'),
(89, 'Chuvannamannu	', 13, '680652'),
(90, 'Desamangalam	', 13, '679532'),
(91, 'Edakkalathur	', 13, '680552'),
(92, 'Edakkaliyur	', 13, '680515'),
(93, 'Edakkara-Thrissur	', 13, '680518'),
(94, 'Edakulam	', 13, '680688'),
(95, 'Edamuttam	', 13, '680568'),
(96, 'Edassery	', 13, '680569'),
(97, 'Edathirinji	', 13, '680122'),
(98, 'Edathuruthy	', 13, '680703'),
(99, 'Edavilangu	', 13, '680671'),
(100, 'Elanad	', 13, '680586'),
(101, 'Elavally	', 13, '680511'),
(102, 'Elavally South	', 13, '680511'),
(103, 'Elinjipra	', 13, '680721'),
(104, 'Elthuruth	', 13, '680611'),
(105, 'Enamakkal	', 13, '680510'),
(106, 'Engandiyur	', 13, '680615'),
(107, 'Enkakad	', 13, '680589'),
(108, 'Eranellur	', 13, '680501'),
(109, 'Eravathur	', 13, '680734'),
(110, 'Eravimangalam	', 13, '680751'),
(111, 'Eravu	', 13, '680620'),
(112, 'Erayamkudi	', 13, '680308'),
(113, 'Eriyad	', 13, '680666'),
(114, 'Erumapetty	', 13, '680584'),
(115, 'Eyyal	', 13, '680501'),
(116, 'Guruvayur	', 13, '680101'),
(117, 'Guruvayur Temple	', 13, '680101'),
(118, 'Inchakundu	', 13, '680312'),
(119, 'Inchamudy	', 13, '680564'),
(120, 'Iranikulam	', 13, '680734'),
(121, 'Iringapuram	', 13, '680103'),
(122, 'Irinjalakuda	', 13, '680121'),
(123, 'Irinjalakuda Mkt	', 13, '680121'),
(124, 'Irinjalakuda North	', 13, '680125'),
(125, 'Irunilamcode	', 13, '680583'),
(126, 'Kadappuram	', 13, '680514'),
(127, 'Kadavallur	', 13, '680543'),
(128, 'Kadukutty	', 13, '680309'),
(129, 'Kaduppassery South	', 13, '680683'),
(130, 'Kaduppassery	', 13, '680683'),
(131, 'Kainoor	', 13, '680014'),
(132, 'Kaipamangalam Beach	', 13, '680681'),
(133, 'Kaipamangalam	', 13, '680681'),
(134, 'Kaiparamba	', 13, '680546'),
(135, 'Kakkassery	', 13, '680511'),
(136, 'Kalimbram	', 13, '680568'),
(137, 'Kaliyarode	', 13, '680586'),
(138, 'Kallepadam	', 13, '680587'),
(139, 'Kallettumkara	', 13, '680683'),
(140, 'Kallur	', 13, '680317'),
(141, 'Kallur-Vadakkekkad	', 13, '679562'),
(142, 'Kalparamba	', 13, '680662'),
(143, 'Kanakamala	', 13, '680689'),
(144, 'Kanattukara	', 13, '680011'),
(145, 'Kandamkulam	', 13, '680669'),
(146, 'Kandanassery	', 13, '680102'),
(147, 'Kandassankadavu	', 13, '680613'),
(148, 'Kanimangalam	', 13, '680027'),
(149, 'Kanippayur	', 13, '680517'),
(150, 'Kaniyarkod	', 13, '680594'),
(151, 'Kanjani	', 13, '680612'),
(152, 'Kanjirakode	', 13, '680590'),
(153, 'Kanjirappilly-TCR	', 13, '680721'),
(154, 'Kannampallipuram	', 13, '680687'),
(155, 'Kannara	', 13, '680652'),
(156, 'Kannikulangara	', 13, '680682'),
(157, 'Kannoth	', 13, '680510'),
(158, 'Kara	', 13, '680671'),
(159, 'Karalam	', 13, '680711'),
(160, 'Karanchira	', 13, ''),
(161, 'Karayamvattam	', 13, '680567'),
(162, 'Karikkad	', 13, '680519'),
(163, 'Karumathra	', 13, '680123'),
(164, 'Karumathra	', 13, '680589'),
(165, 'Karupadanna	', 13, '680670'),
(166, 'Karur	', 13, '680697'),
(167, 'Karuvannur	', 13, '680711'),
(168, 'Kathikkudam	', 13, '680308'),
(169, 'Kattakampal	', 13, '680544'),
(170, 'Kattilapoovam	', 13, '680028'),
(171, 'Kattoor	', 13, '680702'),
(172, 'Katungode	', 13, '680584'),
(173, 'Kavida	', 13, '680505'),
(174, 'Kecheri	', 13, '680501'),
(175, 'Kerala Agri-university	', 13, '680656'),
(176, 'Kilakkummuri	', 13, '680571'),
(177, 'Killimangalam	', 13, '680591'),
(178, 'Kinfra Park Koratti	', 13, '680309'),
(179, 'Kiralur	', 13, '680601'),
(180, 'Kizhupillikkara	', 13, '680702'),
(181, 'Kizhur	', 13, '680523'),
(182, 'Kochannur	', 13, '679562'),
(183, 'Kodakara	', 13, '680684'),
(184, 'Kodannur	', 13, '680563'),
(185, 'Kodassery	', 13, '680721'),
(186, 'Kodungallur	', 13, '680664'),
(187, 'Kolazhi RM	', 13, '680010'),
(188, 'Kombathukadavu	', 13, '680682'),
(189, 'Konathukunnu	', 13, '680123'),
(190, 'Kondazhi	', 13, '679106'),
(191, 'Konikara	', 13, '680306'),
(192, 'Konnakuzhy	', 13, '680721'),
(193, 'Koolimuttam	', 13, '680691'),
(194, 'Koonamoochi	', 13, '680504'),
(195, 'Koorikuzhi	', 13, '680681'),
(196, 'Kootala-Thrissur	', 13, '680652'),
(197, 'Koovakkattukunnu	', 13, '680311'),
(198, 'Koratti Kizhakkumuri	', 13, '680308'),
(199, 'Koratti	', 13, '680308'),
(200, 'Koratti South	', 13, '680308'),
(201, 'Korattikkara	', 13, '680543'),
(202, 'Kothaparamba	', 13, '680668'),
(203, 'Kottamuri	', 13, '680732'),
(204, 'Kottanallur	', 13, '680662'),
(205, 'Kottappadi	', 13, '680505'),
(206, 'Kottappuram	', 13, '680667'),
(207, 'Kottappuram Wri	', 13, '680584'),
(208, 'Kottat	', 13, '680731'),
(209, 'Kozhukully	', 13, '680751'),
(210, 'Krishnankotta	', 13, '680733'),
(211, 'Kumaranellur TC	', 13, '680590'),
(212, 'Kumarappanal	', 13, '680585'),
(213, 'Kumbalacode	', 13, '680587'),
(214, 'Kundaliyur	', 13, '680616'),
(215, 'Kundannur	', 13, '680590'),
(216, 'Kundukad	', 13, '680028'),
(217, 'Kundur	', 13, '680734'),
(218, 'Kunnamkulam City	', 13, '680523'),
(219, 'Kunnamkulam	', 13, '680503'),
(220, 'Kunnappilly	', 13, '680311'),
(221, 'Kuranniyur	', 13, '680506'),
(222, 'Kuriachira	', 13, '680006'),
(223, 'Kurkancheri	', 13, '680007'),
(224, 'Kuruchikkara	', 13, '680028'),
(225, 'Kurumal	', 13, '680601'),
(226, 'Kurumala	', 13, '680586'),
(227, 'Kurumbilavu	', 13, '680564'),
(228, 'Kuruvilassery	', 13, '680732'),
(229, 'Kuthampilly	', 13, '680594'),
(230, 'Kuttamangalam	', 13, '680703'),
(231, 'Kuttanchery	', 13, '680584'),
(232, 'Kuttanellur	', 13, '680014'),
(233, 'Kuttichira	', 13, '680724'),
(234, 'Kuttikkad	', 13, '680724'),
(235, 'Kuttur	', 13, '680013'),
(236, 'Kuzhikkattussery	', 13, '680697'),
(237, 'Kuzhur	', 13, '680734'),
(238, 'Lokamaleswaram North	', 13, '680664'),
(239, 'Madakkathara	', 13, '680651'),
(240, 'Madathumpady	', 13, '680733'),
(241, 'Madavana	', 13, '680666'),
(242, 'Madayikonam	', 13, '680712'),
(243, 'Madu	', 13, '680512'),
(244, 'Mala-thrissur	', 13, '680732'),
(245, 'Malakkapara	', 13, '680721'),
(246, 'Malavattom	', 13, '680588'),
(247, 'Malesamangalam	', 13, '680588'),
(248, 'Mambra	', 13, '680308'),
(249, 'Manakkodi	', 13, '680012'),
(250, 'Manakulangara	', 13, '680684'),
(251, 'Manalithara	', 13, '680589'),
(252, 'Manalur HS	', 13, '680617'),
(253, 'Manalur	', 13, '680617'),
(254, 'Mangad	', 13, '680542'),
(255, 'Mannalamkunnu	', 13, '680518'),
(256, 'Mannamangalam	', 13, '680014'),
(257, 'Mannuthy	', 13, '680651'),
(258, 'Marathakkara	', 13, '680306'),
(259, 'Marottichal	', 13, '680014'),
(260, 'Maruthancode	', 13, '680604'),
(261, 'Maruthayur	', 13, '680507'),
(262, 'Mathilakam	', 13, '680685'),
(263, 'Mattathur	', 13, '680684'),
(264, 'Mattathurkkunnu	', 13, '680684'),
(265, 'Mattom	', 13, '680602'),
(266, 'Mayannur	', 13, '679105'),
(267, 'Melur	', 13, '680311'),
(268, 'Methala	', 13, '680669'),
(269, 'Minalur	', 13, '680581'),
(270, 'Moorkkanad	', 13, '680711'),
(271, 'Mothirakkanni	', 13, '680724'),
(272, 'Mulagunnathukavu	', 13, '680581'),
(273, 'Mulayam	', 13, '680751'),
(274, 'Mullassery	', 13, '680509'),
(275, 'Mullurkkara	', 13, '680583'),
(276, 'Mundathicode	', 13, '680601'),
(277, 'Mundathicode West	', 13, '680623'),
(278, 'Mundur-TC	', 13, '680541'),
(279, 'Mupliyam	', 13, '680312'),
(280, 'Murikkungal	', 13, '680699'),
(281, 'Muringoor Vadakkummuri	', 13, '680309'),
(282, 'Muriyad	', 13, '680683'),
(283, 'Muttithadi	', 13, '680317'),
(284, 'Nadathara	', 13, '680751'),
(285, 'Nadavaramba	', 13, '680661'),
(286, 'Naduvilkkara	', 13, '680614'),
(287, 'Nalukettu	', 13, '680308'),
(288, 'Nambazhikad	', 13, '680602'),
(289, 'Nandikkara	', 13, '680301'),
(290, 'Nandipulam	', 13, '680312'),
(291, 'Nattika	', 13, '680566'),
(292, 'Nattikabeach	', 13, '680566'),
(293, 'Nedupuzha	', 13, '680007'),
(294, 'Nehrunagar	', 13, '680006'),
(295, 'Nellayi-thrissur	', 13, '680305'),
(296, 'Nellikunnu	', 13, '680005'),
(297, 'Nelluvaya	', 13, '680584'),
(298, 'Nemmini	', 13, '680104'),
(299, 'Nenmenikkara	', 13, '680301'),
(300, 'Nettissery	', 13, '680651'),
(301, 'Netumpura	', 13, '679531'),
(302, 'Nhamanghat	', 13, '679563'),
(303, 'Ollukkara	', 13, '680655'),
(304, 'Ollur North	', 13, '680306'),
(305, 'Ollur	', 13, '680306'),
(306, 'Ollur Thaikkattussery	', 13, '680306'),
(307, 'Orumanayur	', 13, '680512'),
(308, 'Padinjare Vemballur	', 13, '680671'),
(309, 'Padiyam	', 13, '680641'),
(310, 'Padiyur	', 13, '680688'),
(311, 'Padoor	', 13, '680524'),
(312, 'Pady	', 13, '680699'),
(313, 'Painkulam	', 13, '679531'),
(314, 'Palappilly	', 13, '680304'),
(315, 'Palayamparambu	', 13, '680741'),
(316, 'Palayur	', 13, '680506'),
(317, 'Palissery	', 13, '680027'),
(318, 'Pallam Kottambathur	', 13, '679532'),
(319, 'Pallipuram	', 13, '680732'),
(320, 'Pallur	', 13, '679532'),
(321, 'Paluvai	', 13, '680522'),
(322, 'Pampady East	', 13, '680588'),
(323, 'Pampady West	', 13, '680588'),
(324, 'Panamkulam	', 13, '680711'),
(325, 'Panangad	', 13, '680665'),
(326, 'Panangattukara	', 13, '680623'),
(327, 'Pangarappally	', 13, '680586'),
(328, 'Panjal	', 13, '679531'),
(329, 'Paralam	', 13, '680563'),
(330, 'Parappukkara	', 13, '680310'),
(331, 'Parappur	', 13, '680552'),
(332, 'Pariyaram	', 13, '680721'),
(333, 'Parlikkad	', 13, '680623'),
(334, 'Pathazhakkad	', 13, '680668'),
(335, 'Pathiyarkulangara	', 13, '680552'),
(336, 'Pattikkad TC	', 13, '680652'),
(337, 'Pattiparambu	', 13, '680588'),
(338, 'Pavaratty	', 13, '680507'),
(339, 'Pazhanji	', 13, '680542'),
(340, 'Pazhayannur	', 13, '680587'),
(341, 'Pazhayi	', 13, '680301'),
(342, 'Pazhuvil	', 13, '680564'),
(343, 'Pazhuvil West	', 13, '680564'),
(344, 'Peechi	', 13, '680653'),
(345, 'Pengamuck	', 13, '680544'),
(346, 'Perakam	', 13, '680506'),
(347, 'Peramangalam	', 13, '680545'),
(348, 'Perambra-thrissur	', 13, '680689'),
(349, 'Perinchery	', 13, '680306'),
(350, 'Peringandur	', 13, '680581'),
(351, 'Peringavu	', 13, '680008'),
(352, 'Peringottukara	', 13, '680565'),
(353, 'Perinjanam	', 13, '680686'),
(354, 'Perinjanam West	', 13, '680686'),
(355, 'Perumpilavu	', 13, '680519'),
(356, 'Perumthuruthy	', 13, '680542'),
(357, 'Peruvallur	', 13, '680508'),
(358, 'Ponjanam	', 13, '680702'),
(359, 'Ponnore	', 13, '680552'),
(360, 'Ponnukkara	', 13, '680306'),
(361, 'Pookode	', 13, '680505'),
(362, 'Poomala	', 13, '680581'),
(363, 'Pooppathy	', 13, '680733'),
(364, 'Pootharakkal	', 13, '680561'),
(365, 'Poothole	', 13, '680004'),
(366, 'Poovanchira	', 13, '680652'),
(367, 'Poovathussery	', 13, '680741'),
(368, 'Porathissery	', 13, '680125'),
(369, 'Poringalkuthu	', 13, '680721'),
(370, 'Porkolangad	', 13, '680517'),
(371, 'Porkulam	', 13, '680542'),
(372, 'Potta	', 13, '680722'),
(373, 'Pottore	', 13, '680581'),
(374, 'Poyya	', 13, '680733'),
(375, 'Pudukad	', 13, '680301'),
(376, 'Puduruthy	', 13, '680623'),
(377, 'Pulakkad	', 13, '680585'),
(378, 'Pulakode	', 13, '680586'),
(379, 'Pullazhi	', 13, '680012'),
(380, 'Pullu	', 13, '680641'),
(381, 'Pullur	', 13, '680683'),
(382, 'Pullut North	', 13, '680663'),
(383, 'Pullut	', 13, '680663'),
(384, 'Punkunnu	', 13, '680002'),
(385, 'Punnayur	', 13, '679562'),
(386, 'Punnayurkulam	', 13, '679561'),
(387, 'Puranattukara	', 13, '680551'),
(388, 'Puthanpalli	', 13, '680103'),
(389, 'Puthenchira Kizhakkummuri	', 13, '680682'),
(390, 'Puthenchira	', 13, '680682'),
(391, 'Puthenchira Thekkummuri	', 13, '680682'),
(392, 'Puthenpeedika	', 13, '680642'),
(393, 'Puthur-Thrissur	', 13, '680014'),
(394, 'Puvathur	', 13, '680508'),
(395, 'Puzhakkal	', 13, '680553'),
(396, 'Ramavarmapuram	', 13, '680631'),
(397, 'Santhipuram	', 13, '680668'),
(398, 'South Kondazhi	', 13, '679106'),
(399, 'Srinngapuram	', 13, '680664'),
(400, 'Tali	', 13, '680585'),
(401, 'Talikulam	', 13, '680569'),
(402, 'Thaikkad	', 13, '680104'),
(403, 'Thalakkottukara	', 13, '680501'),
(404, 'Thalassery	', 13, '679532'),
(405, 'Thalore	', 13, '680306'),
(406, 'Thamarayur	', 13, '680505'),
(407, 'Thampankadavu	', 13, '680569'),
(408, 'Thangalur	', 13, '680596'),
(409, 'Thanissery	', 13, '680701'),
(410, 'Thayyur	', 13, '680584'),
(411, 'Thazhekkad	', 13, '680697'),
(412, 'Thekkumkara	', 13, '680589'),
(413, 'Thichur	', 13, '680584'),
(414, 'Thippilissery	', 13, '680519'),
(415, 'Thirunellur	', 13, '680508'),
(416, 'Thiruvambady TSR	', 13, '680022'),
(417, 'Thiruvanchikulam	', 13, '680664'),
(418, 'Thiruvenkitam	', 13, '680101'),
(419, 'Thiruvilwamala	', 13, '680588'),
(420, 'Thonnurkkara	', 13, '680586'),
(421, 'Thottippal	', 13, '680310'),
(422, 'Thozhiyur	', 13, '680520'),
(423, 'Thozhupadam	', 13, '680586'),
(424, 'Thrissur Central	', 13, '680001'),
(425, 'Thrissur City	', 13, '680020'),
(426, 'Thrissur East	', 13, '680005'),
(427, 'Thrissur Engg College	', 13, '680009'),
(428, 'Thrissur	', 13, '680001'),
(429, 'Thrissur Medical College	', 13, '680596'),
(430, 'Thrissur R S	', 13, '680021'),
(431, 'Thumbur	', 13, '680662'),
(432, 'Tirur	', 13, '680581'),
(433, 'Tiruvatra	', 13, '680516'),
(434, 'Tolur-parappur	', 13, '680552'),
(435, 'Toyakkavu	', 13, '680513'),
(436, 'Trikkur	', 13, '680306'),
(437, 'Triprayar	', 13, '680567'),
(438, 'Trithallur	', 13, '680619'),
(439, 'Trithallur West	', 13, '680619'),
(440, 'Urakam	', 13, '680562'),
(441, 'Vadakkekad	', 13, '679562'),
(442, 'Vadakkethara	', 13, '680587'),
(443, 'Vadakkummuri	', 13, '680570'),
(444, 'Vadama	', 13, '680732'),
(445, 'Vadookkara	', 13, '680007'),
(446, 'Vaka	', 13, '680602'),
(447, 'Valapad Beach	', 13, '680567'),
(448, 'Valapad	', 13, '680567'),
(449, 'Vallachira	', 13, '680562'),
(450, 'Vallivattam	', 13, '680123'),
(451, 'Vaniampara	', 13, '680652'),
(452, 'Varakara	', 13, '680302'),
(453, 'Varandarappilly	', 13, '680303'),
(454, 'Varavur	', 13, '680585'),
(455, 'Vatanapally Beach	', 13, '680614'),
(456, 'Vatanappally	', 13, '680614'),
(457, 'Vattanathara	', 13, '680302'),
(458, 'Vattekkad	', 13, '680512'),
(459, 'Vayilathur	', 13, '679563'),
(460, 'Vazhani	', 13, '680589'),
(461, 'Vellanchira	', 13, '680697'),
(462, 'Vellangallur	', 13, '680662'),
(463, 'Vellani	', 13, '680701'),
(464, 'Vellanikkara	', 13, '680654'),
(465, 'Vellarakad	', 13, '680584'),
(466, 'Vellattanjur	', 13, '680601'),
(467, 'Vellikulangara	', 13, '680699'),
(468, 'Velupadam	', 13, '680303'),
(469, 'Velur Bazar	', 13, '680601'),
(470, 'Velur Thrissur	', 13, '680601'),
(471, 'Veluthur	', 13, '680012'),
(472, 'Vemmanad	', 13, '680507'),
(473, 'Venganellur	', 13, '680586'),
(474, 'Venkitangu	', 13, '680510'),
(475, 'Vennur	', 13, '680587'),
(476, 'Vettikkattiri R.S', 13, '679531'),
(477, 'Vettilappara	', 13, '680721'),
(478, 'Vettukad	', 13, '680014'),
(479, 'Vijayaraghavapuram	', 13, '680722'),
(480, 'Viyyur	', 13, '680010'),
(481, 'Vyasagiri	', 13, '680623'),
(482, 'Wadakanchery-TC	', 13, '680582'),
(483, 'Wadakkancheri-Thrissur RS	', 13, '680623'),
(484, 'West Fort	', 13, '680004');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `product_type` int(11) NOT NULL,
  `company` varchar(200) NOT NULL,
  `salt_composition` varchar(200) NOT NULL,
  `salt synonyms` varchar(100) NOT NULL,
  `storage` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `hsn` varchar(100) NOT NULL,
  `mfr` varchar(100) NOT NULL,
  `image` varchar(400) NOT NULL,
  `prescription` int(11) NOT NULL COMMENT '1= prescription , 0 = no prescription',
  `shedule` varchar(50) NOT NULL,
  `expiry` date NOT NULL,
  `price` bigint(20) NOT NULL,
  `gst` int(11) NOT NULL COMMENT 'sgst + cgst',
  `cess` int(11) NOT NULL,
  `anymedion_price` bigint(20) DEFAULT NULL,
  `discount_price` bigint(20) DEFAULT NULL,
  `vendor_id` mediumint(9) NOT NULL COMMENT 'identify who is vendor of pdt',
  `verify` int(11) NOT NULL COMMENT '1 = view in front end, ',
  `status` int(11) NOT NULL COMMENT '1 =active, 0=inactive',
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='products for ecommerce public usage';

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `product_type`, `company`, `salt_composition`, `salt synonyms`, `storage`, `description`, `hsn`, `mfr`, `image`, `prescription`, `shedule`, `expiry`, `price`, `gst`, `cess`, `anymedion_price`, `discount_price`, `vendor_id`, `verify`, `status`, `created_at`) VALUES
(12, 'liver kera', 1, 'cipla', 'Amoxilin ', 'Acetaminophen', 'cool and dry place', 'Baby mask , Device Etc', '3434', '3433', 'fd7693a890ba4420dcebbd4e90928d95.png', 1, '', '2021-07-31', 40, 12, 1, 50, 43, 1, 1, 0, '2021-07-17 15:58:13'),
(13, 'lexono', 1, 'cipla', 'Amoxilin ', 'Acetaminophen', 'cool and dry place', 'Medicines', '676', '2323', '1e11553fdeee5dbc887ee621a58652c7.jpg', 1, '', '2021-08-08', 34, 18, 1, 45, 38, 0, 1, 0, '2021-07-17 17:05:21'),
(14, 'cednetenox', 1, 'sun pharmacuticals', 'Amoxilin ', 'Amoxicillin', 'cool and dry place', 'Cosmetics', '433', '3453', '7d986e3ecc2de9c2734bc579c9427f75.png', 1, '1', '2021-08-08', 34, 18, 1, 60, 50, 0, 1, 0, '2021-07-17 17:06:56'),
(15, 'Mox 500', 1, 'cipla', 'amoxiline', 'Acetaminophen', 'cool and dry place', 'Its an antibitic', '4343', '6767', '302ad20f05a7b8026fd8cece04057655.jpeg', 1, '1', '2021-08-08', 44, 0, 0, 55, 49, 0, 1, 0, '2021-07-30 14:50:58'),
(16, 'Jelusilin', 1, 'cipla', 'paracetamol', 'Acetaminophen', 'storage under 27 c ', 'Its for cold and cough', '987', '3456', '6a07bb118ed8618489ecc21171f50f17.png', 1, '1', '2021-10-16', 23, 12, 1, 26, 24, 0, 1, 0, '2021-08-02 18:20:19'),
(17, 'Avil 10mg', 1, 'cipla', 'paracetamol', 'Acetaminophen', 'Dry place', 'Its for cold and cough', '5492', '1073', '74e71a1b5a266056cb10d333fd4024a3.png', 1, '1', '2021-10-22', 44, 12, 0, 55, 49, 0, 1, 0, '2021-08-04 12:10:27'),
(18, 'supradyn', 1, 'cipla', 'paracetamol', 'Amoxicillin', 'Dry place', 'It is multivitamin tablet', '676', '787', 'QWERTYUIOP098.jpg', 0, '2', '2021-12-04', 44, 12, 0, 55, 49, 0, 1, 0, '2021-08-13 12:28:56'),
(19, 'Almox 500', 1, 'sun pharma', 'amoxiline', 'Amoxicillin', 'Dry place', 'Its for bacterial infection', '676', '787', 'ASDFGHJK3456ERTY.jpg', 1, '1', '2021-10-17', 30, 12, 0, 55, 40, 0, 1, 0, '2021-08-13 14:02:45'),
(20, 'Follihair', 1, 'cipla', 'paracetamol', '', '', 'For hair growth ', '343', '787', '', 0, '2', '2021-10-23', 44, 12, 0, 60, 50, 0, 1, 0, '2021-08-19 15:24:14'),
(21, 'Follihair', 1, 'cipla', 'paracetamol', '', '', 'For hair growth ', '343', '787', '', 0, '2', '2021-10-23', 44, 12, 0, 60, 50, 0, 1, 0, '2021-08-19 15:25:42'),
(22, 'shelvis', 1, 'cipla', 'vitamin', '', '', 'For body strenght', '', '', '', 0, '', '2025-05-26', 30, 0, 0, NULL, NULL, 1, 1, 1, '2021-09-02 11:20:25'),
(23, 'cimvocin', 1, 'sun pharma', 'antibiotics', '', '', 'For infection', '', '', '', 1, '', '2026-09-15', 57, 0, 0, NULL, NULL, 1, 1, 1, '2021-09-02 11:20:25'),
(1021, 'ciplovoc', 1, 'cipla', 'vitamin', '', '', 'For vitamin deficiency', '', '', '', 1, '', '2036-05-12', 250, 0, 0, NULL, NULL, 2, 1, 1, '2021-09-02 12:52:57'),
(1022, 'rercenve', 1, 'sun', 'antibiotic', '', '', 'For infection', '', '', '', 0, '', '2025-02-12', 52, 0, 0, NULL, NULL, 2, 1, 1, '2021-09-02 12:52:57'),
(2020, 'ciplovoc', 1, 'cipla', 'vitamin', '', '', 'For vitamin deficiency', '', '', '', 1, '', '2036-05-12', 250, 0, 0, NULL, NULL, 1, 1, 1, '2021-09-02 14:41:23'),
(2021, 'rercenve', 1, 'sun', 'antibiotic', '', '', 'For infection', '', '', '', 0, '', '2025-02-12', 52, 0, 0, NULL, NULL, 1, 1, 1, '2021-09-02 14:41:23'),
(2022, 'ciplovoc', 1, 'cipla', 'vitamin', '', '', 'For vitamin deficiency', '525', '525', '', 1, 'H', '2036-05-12', 250, 12, 0, NULL, NULL, 2, 1, 1, '2021-09-02 14:59:17'),
(2023, 'liver kera', 1, 'sun', 'antibiotic', '', '', 'For infection', '7878', '6776', '', 1, 'G', '2025-02-12', 52, 12, 0, NULL, NULL, 2, 0, 1, '2021-09-02 14:59:17');

-- --------------------------------------------------------

--
-- Table structure for table `product_images`
--

CREATE TABLE `product_images` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `image` varchar(400) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product_images`
--

INSERT INTO `product_images` (`id`, `product_id`, `image`, `created_at`) VALUES
(4, 10, '0212f4a1dfc8718bc6073b429b555fc9.jpg', '2021-03-31 12:33:35'),
(5, 10, 'dab0efb0b8f9a42336eaa4f651a3ec23.jpg', '2021-03-31 12:33:35'),
(11, 15, '9ac6e7b734b9d90a2ac05c1d94f202aa.png', '2021-03-31 15:04:00'),
(14, 18, '1_37.jpg', '2021-03-31 15:18:46'),
(15, 19, '1_37.jpg', '2021-03-31 15:20:47'),
(16, 20, 'ee423e044c098809d38a16313be8969b.jpg', '2021-03-31 15:29:16'),
(17, 21, '1mb.jpg', '2021-03-31 15:37:51'),
(18, 22, '08de0f9ba06d17f12d73a9ffbc106bb3.jpg', '2021-03-31 15:41:55'),
(21, 25, '7f1bf3e85454e94b1b9434d5e6bf08ce.jpg', '2021-03-31 16:01:48'),
(35, 6, '3f32340bf3a66c6049b4349b9669a0bb.jpg', '2021-04-28 10:20:44'),
(36, 6, '881d4225c907ae595420d81435ce5063.jpg', '2021-04-28 10:20:44'),
(39, 11, '28194c85449d8b88bdd60f9eca156625.jpg', '2021-04-28 10:29:38'),
(40, 11, 'dd041aa23de9640b2bc309c74746e7bb.jpg', '2021-04-28 10:29:38'),
(41, 3, '', '2021-04-28 10:51:06'),
(52, 30, '', '2021-04-28 16:04:18'),
(53, 31, '', '2021-04-28 16:04:26'),
(83, 33, '', '2021-04-28 17:54:18'),
(85, 35, '', '2021-04-28 18:01:39'),
(89, 37, '', '2021-05-21 11:05:14'),
(90, 38, '', '2021-05-21 11:06:08'),
(94, 39, '', '2021-05-21 11:38:02'),
(98, 36, '', '2021-05-21 13:30:57'),
(99, 34, '', '2021-05-25 11:12:16'),
(104, 40, '', '2021-06-10 15:10:02'),
(111, 5, '', '2021-06-10 15:43:27'),
(113, 2, '', '2021-06-10 16:36:16'),
(114, 28, '', '2021-06-10 16:38:11'),
(119, 54, '', '2021-06-11 17:05:29'),
(120, 1, '', '2021-06-13 16:22:14'),
(121, 7, '', '2021-06-15 16:34:36'),
(127, 41, '', '2021-06-15 17:12:40'),
(129, 29, '', '2021-06-16 10:16:38'),
(130, 23, '', '2021-06-16 10:29:31'),
(131, 24, '', '2021-06-16 10:42:20'),
(132, 26, '', '2021-06-16 10:47:35'),
(133, 27, '', '2021-06-16 11:11:52'),
(134, 84, '', '2021-06-16 11:21:25'),
(135, 85, '', '2021-06-16 11:27:50'),
(139, 15, '', '2021-07-30 14:50:58'),
(142, 13, '', '2021-08-02 18:37:28'),
(143, 14, '', '2021-08-02 18:37:47'),
(144, 16, '', '2021-08-02 18:38:14'),
(146, 17, '', '2021-08-04 12:11:24'),
(147, 18, '', '2021-08-13 12:28:56'),
(148, 19, '', '2021-08-13 14:02:45'),
(149, 21, '', '2021-08-19 15:25:42'),
(151, 12, '', '2021-10-08 13:31:09');

-- --------------------------------------------------------

--
-- Table structure for table `product_inventory`
--

CREATE TABLE `product_inventory` (
  `id` int(11) NOT NULL,
  `quantity` mediumint(9) NOT NULL,
  `batch_no` int(11) NOT NULL,
  `price` float NOT NULL,
  `expiry` date NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `product_packing`
--

CREATE TABLE `product_packing` (
  `id` int(11) NOT NULL,
  `pdt_id` int(11) NOT NULL,
  `packing_id` int(11) NOT NULL COMMENT ' from packing table',
  `product_info_id` int(11) NOT NULL COMMENT 'from packing_info table',
  `qty` int(11) NOT NULL COMMENT 'For displaying in product single view',
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='connects pdt with packing and packing_info table';

--
-- Dumping data for table `product_packing`
--

INSERT INTO `product_packing` (`id`, `pdt_id`, `packing_id`, `product_info_id`, `qty`, `created_at`) VALUES
(1, 13, 1, 7, 20, '2021-08-18 17:49:19'),
(2, 21, 1, 10, 0, '2021-08-19 15:25:42');

-- --------------------------------------------------------

--
-- Table structure for table `product_type`
--

CREATE TABLE `product_type` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product_type`
--

INSERT INTO `product_type` (`id`, `name`) VALUES
(1, 'Allopathy'),
(2, 'Ayurveda'),
(3, 'Veterinary'),
(4, 'Fitness'),
(5, 'Cosmetics'),
(6, 'Surgical Items'),
(7, 'Laboratory Items'),
(8, 'Animal food');

-- --------------------------------------------------------

--
-- Table structure for table `purchase`
--

CREATE TABLE `purchase` (
  `id` int(11) NOT NULL,
  `order_no` varchar(100) NOT NULL,
  `order_date` date NOT NULL,
  `vendor_id` bigint(20) NOT NULL,
  `status` datetime NOT NULL COMMENT '0= draft, 1= placed, 2=received ,3 = canceled.',
  `total_amount` double NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='purchase product from supplier ';

-- --------------------------------------------------------

--
-- Table structure for table `purchase_produts`
--

CREATE TABLE `purchase_produts` (
  `id` int(11) NOT NULL,
  `order_no` bigint(20) NOT NULL,
  `product_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='connects produts with purchase table';

-- --------------------------------------------------------

--
-- Table structure for table `tax`
--

CREATE TABLE `tax` (
  `id` int(11) NOT NULL,
  `tax` int(11) NOT NULL,
  `cess` int(11) NOT NULL,
  `description` varchar(50) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='This is for Billing functionality , not for anymedion';

--
-- Dumping data for table `tax`
--

INSERT INTO `tax` (`id`, `tax`, `cess`, `description`, `created_at`) VALUES
(1, 0, 0, 'contraseptives', '2021-07-17 12:06:13'),
(2, 5, 0, 'Pharmaceutical Products ', '2021-07-17 15:20:46'),
(3, 12, 0, 'Medicines', '2021-07-17 15:21:15'),
(4, 18, 0, 'Baby mask , Device Etc', '2021-07-17 15:21:46'),
(5, 28, 0, 'Cosmetics', '2021-07-17 15:22:09');

-- --------------------------------------------------------

--
-- Table structure for table `test_institution`
--

CREATE TABLE `test_institution` (
  `id` int(11) NOT NULL,
  `institution_id` int(11) NOT NULL,
  `test_id` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='connecting institution and tests and define price';

-- --------------------------------------------------------

--
-- Table structure for table `transaction`
--

CREATE TABLE `transaction` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL COMMENT 'generated from pay gatway',
  `amount` bigint(20) NOT NULL,
  `status` int(11) NOT NULL COMMENT '0:pending,1:Success,2 Failed',
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(100) NOT NULL,
  `firstName` varchar(20) NOT NULL,
  `lastName` varchar(20) NOT NULL,
  `phone` bigint(50) NOT NULL,
  `address_line_1` varchar(50) NOT NULL,
  `address_line_2` varchar(30) NOT NULL,
  `place` varchar(30) NOT NULL,
  `longitude` varchar(100) NOT NULL,
  `latitude` varchar(100) NOT NULL,
  `state` varchar(30) NOT NULL,
  `country` varchar(20) NOT NULL,
  `zip` int(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `otp` int(11) NOT NULL,
  `exp_otp` datetime NOT NULL,
  `gender` varchar(20) NOT NULL,
  `user_type` int(20) NOT NULL,
  `status` int(30) NOT NULL,
  `package-id` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstName`, `lastName`, `phone`, `address_line_1`, `address_line_2`, `place`, `longitude`, `latitude`, `state`, `country`, `zip`, `email`, `password`, `otp`, `exp_otp`, `gender`, `user_type`, `status`, `package-id`, `created_at`) VALUES
(1, 'shinoy', 'pb', 6756565, 'pulikkottl', 'elavally', 'thrissur', '76.21125391560756', '10.505664816845675', 'kerala', 'india', 680511, 'pbshinoy@gmail.com', 'admin', 64154, '2021-03-25 12:11:08', 'male', 1, 0, 1, '0000-00-00 00:00:00'),
(2, 'binoy', 'pb', 3434343, 'pulikkottl', 'elavally', 'thrissur', '76.21125391560756', '10.505664816845675', 'kerala', 'india', 680511, 'pulikkottilshinoy@gmail.com', 'indian', 40555, '2021-05-17 17:09:09', 'male', 0, 0, 1, '0000-00-00 00:00:00'),
(3, 'deepa', 'techxform', 9878764567, 'thaivalpil', 'thrissur', 'thrissur', '76.21125391560756', '10.505664816845675', 'kerala', 'india', 680511, 'pbshinoy@gmail.com', 'admin', 88274, '2021-06-25 10:10:21', 'female', 2, 0, 3, '0000-00-00 00:00:00'),
(4, 'arun n nair', 'ms', 6756565, 'thaivalpil', 'thrissur', 'thrissur', '76.21125391560756', '10.505664816845675', 'kerala', 'india', 680511, 'pulikkottilshinoy@gmail.com', 'same', 0, '0000-00-00 00:00:00', 'male', 3, 1, 1, '0000-00-00 00:00:00'),
(5, 'shalbin', 'pb', 6756565, 'pulikkottl', 'thrissur', 'thrissur', '76.21125391560756', '10.505664816845675', 'kerala', 'india', 680511, 'pbshinoy@gmail.com', 'admin1', 0, '0000-00-00 00:00:00', 'male', 0, 0, 1, '0000-00-00 00:00:00'),
(6, 'nimisha', 'ms', 6756565, 'pulikkottl', 'thrissur', 'thrissur', '76.21125391560756', '10.505664816845675', 'kerala', 'india', 680511, 'pbshinoy@gmail.com', 'dfdf', 0, '0000-00-00 00:00:00', 'female', 4, 1, 1, '0000-00-00 00:00:00'),
(7, 'mahe', 'pb', 6756565, 'pulikkottl', 'thrissur', 'thrissur', '76.21125391560756', '10.505664816845675', 'kerala', 'india', 680511, 'pbshinoy@gmail.com', 'xcsdfd', 0, '0000-00-00 00:00:00', 'male', 5, 1, 1, '0000-00-00 00:00:00'),
(8, 'milan', 'milan last name', 999999, 'milan first address', 'milan second address', 'thrissur', '76.2144349', '10.5276416', 'canada', 'amarica', 52525, 'admin@admin.com', '123', 26450, '2021-04-15 17:29:25', 'male', 6, 0, 1, '2020-12-30 07:36:19'),
(9, 'date', 'ka', 3434343434, 'asasas', 'this is my test ', 'torento', '76.21125391560756', '10.505664816845675', 'canada', 'indian', 680511, 'kavitha@kavitha.com', 'admin', 0, '0000-00-00 00:00:00', 'male', 0, 0, 1, '2020-12-30 07:49:29'),
(10, 'menon ', 'kp', 3434343434, 'this is my test', 'this is my test ', 'thrissur', '', '', 'canada', 'indian', 52525, 'kavitha@kavitha.com', '123', 0, '0000-00-00 00:00:00', 'male', 0, 0, 1, '2021-01-08 12:45:04'),
(11, 'menon ', 'kp', 3434343434, 'this is my test', 'this is my test ', 'thrissur', '76.09085796393596', '10.53998546611558', 'canada', 'indian', 52525, 'kavitha@kavitha.com', '123', 0, '0000-00-00 00:00:00', 'male', 0, 0, 1, '2021-01-08 12:57:33'),
(12, 'jyothi lab', 'dd', 8989878909, 'chittattukara', 'elavally', 'thrissur', '76.09085796393596', '10.53998546611558', 'kerala', 'india', 680511, 'pulikkottil@gmail.com', 'packageTest', 98982, '2021-04-22 15:34:10', '', 0, 0, 2, '2021-03-03 13:18:02'),
(13, 'keratra lab', '', 34343, 'milan first address', 'this is my test ', 'thrissur', '76.09085796393596', '10.53998546611558', 'keral', 'indian', 52525, 'kavitha@kavitha.com', 'admin', 0, '0000-00-00 00:00:00', '', 0, 0, 1, '2021-03-03 12:15:49'),
(14, 'latest institution', '', 8989667755, 'address 1', 'address 2', 'thrissur', '76.09085796393596', '10.53998546611558', 'keral', 'india', 854854, 'pn@gmail.com', '4355', 53143, '2021-04-15 16:21:59', '', 0, 1, 1, '2021-03-23 11:24:54'),
(15, 'mubeen ', '', 34534343, 'dfgdfgdfgd', 'dfdfd', 'fdfd', '76.09085796393596', '10.53998546611558', 'dfdfdf', 'dfd', 3434, 'test@gmail.com', 'dfdf34', 92438, '2021-03-27 17:07:44', '', 0, 0, 1, '2021-03-23 11:04:26'),
(16, '', '', 1, '', '', '', '76.09085796393596', '10.53998546611558', '', '', 0, '', '', 51440, '2021-03-27 17:07:06', '', 0, 0, 0, '0000-00-00 00:00:00'),
(17, '', '', 9746530854, '', '', '', '76.09085796393596', '10.53998546611558', '', '', 0, '', '', 46804, '2021-03-29 10:31:49', '', 0, 0, 0, '0000-00-00 00:00:00'),
(18, 'shalbin', '', 9495360615, '', '', 'vengidangu', '76.21125391560756', '10.505664816845675', '', '', 0, '9495360615', '', 58516, '2021-04-15 15:50:19', '', 1, 1, 0, '0000-00-00 00:00:00'),
(19, 'new doctor', 'new', 3434343, 'rfrtgyh', 'fderere', 'thrissur', '76.21125391560756', '10.505664816845675', 'kerala', 'india', 680520, 'pbshinoy@gmail.com', 'indiia', 0, '0000-00-00 00:00:00', 'male', 4, 0, 1, '2021-03-31 12:56:00'),
(20, 'new doctor', 'new', 3434343, 'rfrtgyh', 'fderere', 'thrissur', '76.21125391560756', '10.505664816845675', 'kerala', 'india', 680520, 'pbshinoy@gmail.com', 'indiia', 0, '0000-00-00 00:00:00', 'male', 4, 0, 1, '2021-03-31 12:56:37'),
(21, 'this is test counsel', 'tp to p', 34343422, 'fdfdf', 'dfdfdf', 'guruvaryuur', '76.21125391560756', '10.505664816845675', 'kerala', 'indian', 859652, 'pbshinoy@gmail.com', 'rtrttrt', 0, '0000-00-00 00:00:00', 'female', 5, 0, 1, '2021-03-31 01:04:34'),
(22, 'this is test counsel', 'tp to p', 8138138132, 'fdfdf', 'dfdfdf', 'guruvaryuur', '76.21125391560756', '10.505664816845675', 'kerala', 'indian', 859652, 'pbshinoy@gmail.com', 'rtrttrt', 41654, '2021-04-17 11:28:15', 'female', 5, 0, 1, '2021-03-31 01:05:10'),
(23, 'amal', '', 7896325685, 'new address', '', 'kerala', '76.21125391560756', '10.505664816845675', '', '', 0, 'amal@gmail.com', '', 99507, '2021-09-16 13:25:16', 'male', 2, 1, 0, '2021-04-10 10:56:17'),
(24, '', '', 343434, 'new address', '', '', '76.21125391560756', '10.505664816845675', '', '', 0, '', '', 87642, '2021-04-12 11:31:14', '', 0, 0, 0, '2021-04-12 11:21:14'),
(25, '', '', 78964256345, '', '', '', '76.21125391560756', '10.505664816845675', '', '', 0, '', '', 19434, '2021-04-12 11:31:24', '', 0, 0, 0, '2021-04-12 11:21:24'),
(26, 'varun', 'texchxform', 8586958657, 'olarikara', 'thrissur', 'thrissur city', '12.09720000', '12.09720000', 'kerala', 'indian', 680522, 'anymedion@gmail.com', 'indian', 26200, '2021-06-23 15:54:52', 'male', 4, 0, 1, '2021-04-16 08:49:44'),
(27, 'test', 'tres1', 748589658, 'fgfgfdg', 'fgfg', 'fgfg', '88.36389500000001', '22.572646', 'fgfg', 'fgfg', 454, 'anymedion@gmail.com', 'fdfd', 21765, '2021-04-16 14:22:57', 'male', 4, 0, 1, '2021-04-16 09:04:15'),
(28, 'amal', '', 9744618860, '', '', 'kerala', '', '', '', '', 0, 'newamala@gmail.com', '', 0, '0000-00-00 00:00:00', 'male', 3, 1, 0, '2021-04-22 16:37:30'),
(29, 'amal', '', 9744618860, 'olarikara', '', 'kerala', '76.3', '10.57', 'kerala', 'fgfg', 0, 'newamala@gmail.com', 'dfdfdfd', 0, '0000-00-00 00:00:00', 'male', 3, 1, 1, '2021-04-22 16:38:15'),
(30, 'amal', '', 9744618550, '', '', 'kerala', '', '', '', '', 0, 'newamala@gmail.com', '', 0, '0000-00-00 00:00:00', 'male', 3, 1, 0, '2021-04-22 16:39:49'),
(31, 'fgfgfgdfd', '', 343434, 'olarikara', 'thrissur', 'thrissur city', '', '', 'kerala', 'indian', 680522, 'anymedion@gmail.com', 'indian', 0, '0000-00-00 00:00:00', '', 3, 1, 1, '2021-05-14 14:27:49'),
(32, 'elavally dispensory', '', 8848146521, 'dddfdfd', 'thrissur', 'thrissur city', '', '', 'kerala', 'indian', 680522, 'anymedion@gmail.com', 'indian', 0, '0000-00-00 00:00:00', '', 3, 1, 1, '2021-05-14 14:29:52'),
(35, 'nimisha', 'ms', 6756565, 'pulikkottl', 'thrissur', 'thrissur', '88.36389500000001', '22.572646', 'kerala', 'india', 680511, 'pbshinoy@gmail.com', 'dddd', 0, '0000-00-00 00:00:00', 'female', 4, 1, 1, '2021-05-17 12:14:11'),
(36, 'good surgical ', '', 9090909, 'pavaratyy', 'guruvatyur', 'Payyanur, Kerala 670307, India', '', '', 'kerala', 'india', 680544, 'anymedion@gmail.com', 'ffgfgf', 0, '0000-00-00 00:00:00', '', 3, 1, 1, '2021-05-21 15:35:47'),
(37, 'siva', '', 9090909, 'pavaratyy', 'guruvatyur', 'Indian Bank', '', '', 'kerala', 'india', 909999, 'siva@', 'ffgfgf', 0, '0000-00-00 00:00:00', '', 3, 1, 1, '2021-05-21 15:38:09'),
(38, 'descm', '', 9090909, 'pavaratyy', 'pandarakkad', 'Thrissur', '76.2144349', '10.5276416', 'kerala', 'india', 680544, 'siva@', 'ffgfgf', 0, '0000-00-00 00:00:00', '', 3, 1, 1, '2021-05-21 15:39:33'),
(39, 'New doctor', 'its last doctor', 3434323, 'pavaratyy', 'pandarakkad', 'Elavally', '76.0885011', '10.5699541', 'kerala', 'india', 909999, 'anymedion@gmail.com', 'ffgfgf', 0, '0000-00-00 00:00:00', 'male', 4, 1, 1, '2021-05-21 17:06:37'),
(40, 'first counsellor', 'its last doctor', 9090909, 'pavaratyy', 'guruvatyur', 'Payyanur, Kerala 670307, India', '12.09720000', '12.09720000', 'kerala', 'india', 680544, 'anymedion@gmail.com', 'ffgfgf', 0, '0000-00-00 00:00:00', 'male', 5, 0, 1, '2021-05-21 17:22:14');

-- --------------------------------------------------------

--
-- Table structure for table `user_address`
--

CREATE TABLE `user_address` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `phone` bigint(20) NOT NULL,
  `pincode` bigint(20) NOT NULL,
  `place` varchar(100) NOT NULL,
  `address_line_1` varchar(300) NOT NULL,
  `address_line_2` varchar(300) NOT NULL,
  `state` varchar(100) NOT NULL,
  `country` varchar(100) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_address`
--

INSERT INTO `user_address` (`id`, `user_id`, `name`, `phone`, `pincode`, `place`, `address_line_1`, `address_line_2`, `state`, `country`, `created_at`) VALUES
(1, 0, 'veeru', 8900000000, 680533, 'kerala', 'melepurakkal hose', 'punnathoor road', 'kera', 'india', '2021-06-24 17:11:34'),
(2, 3, 'veeru', 8900000000, 680533, 'kerala', 'melepurakkal hose', 'punnathoor road', 'kera', 'india', '2021-06-24 17:12:46'),
(3, 3, 'veeru', 8900000000, 680533, 'kerala', 'melepurakkal hose', 'punnathoor road', 'kera', 'india', '2021-06-24 17:13:38');

-- --------------------------------------------------------

--
-- Table structure for table `user_type`
--

CREATE TABLE `user_type` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_type`
--

INSERT INTO `user_type` (`id`, `name`, `date`) VALUES
(1, 'public', '2021-03-29 17:38:49'),
(2, 'health workers', '2021-03-29 17:38:49'),
(3, 'Institution', '2021-03-30 15:43:17'),
(4, 'Doctor', '2021-03-30 15:43:43'),
(5, 'Counseller', '2021-03-30 15:43:43'),
(6, 'Delivery Boy', '2021-03-30 15:43:58');

-- --------------------------------------------------------

--
-- Table structure for table `vendor`
--

CREATE TABLE `vendor` (
  `id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `address_line_1` varchar(50) NOT NULL,
  `address_line_2` varchar(50) NOT NULL,
  `city` varchar(30) NOT NULL,
  `state` varchar(20) NOT NULL,
  `country` varchar(20) NOT NULL,
  `zip` bigint(20) NOT NULL,
  `phone` bigint(20) NOT NULL,
  `reg_no` bigint(20) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `vendor`
--

INSERT INTO `vendor` (`id`, `name`, `address_line_1`, `address_line_2`, `city`, `state`, `country`, `zip`, `phone`, `reg_no`, `created_at`) VALUES
(1, 'shinoy', 'pulikkottl', 'thrissur', 'thrissur', 'kerala', 'india', 680511, 6756565, 33445, '2020-12-26 17:57:39'),
(2, 'medilab', 'asasas', 'asasasa', 'thrissur', 'keral', 'indian', 52525, 32523632, 7777, '2020-12-28 06:21:38');

-- --------------------------------------------------------

--
-- Table structure for table `vendor_category`
--

CREATE TABLE `vendor_category` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `parent_id` mediumint(9) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `vendor_category`
--

INSERT INTO `vendor_category` (`id`, `name`, `parent_id`, `created_at`) VALUES
(1, 'allopathy', 0, '2021-02-19 10:59:30'),
(2, 'ayurveda', 0, '2021-02-19 07:00:35'),
(3, 'Anti Viral', 1, '2021-02-19 07:02:00'),
(4, 'anti inflamation', 1, '2021-03-11 12:48:20');

-- --------------------------------------------------------

--
-- Table structure for table `vendor_category_assign`
--

CREATE TABLE `vendor_category_assign` (
  `id` int(11) NOT NULL,
  `vendor_product_id` mediumint(9) NOT NULL,
  `vendor_cat_id` mediumint(9) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `vendor_category_assign`
--

INSERT INTO `vendor_category_assign` (`id`, `vendor_product_id`, `vendor_cat_id`, `created_at`) VALUES
(1, 1, 1, '2021-02-19 13:05:01'),
(2, 1, 2, '2021-02-19 13:05:01'),
(3, 1, 1, '2021-03-11 13:13:52'),
(4, 1, 2, '2021-03-11 13:13:52'),
(5, 1, 3, '2021-03-11 13:13:52'),
(6, 2, 4, '2021-03-11 13:26:33'),
(7, 1, 3, '2021-03-30 11:20:29'),
(8, 1, 1, '2021-04-10 13:22:30');

-- --------------------------------------------------------

--
-- Table structure for table `vendor_lab_pdt`
--

CREATE TABLE `vendor_lab_pdt` (
  `id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `manufacturer_id` int(11) NOT NULL,
  `price` mediumint(9) NOT NULL,
  `vendor_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `expiry` date NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `vendor_order`
--

CREATE TABLE `vendor_order` (
  `id` int(11) NOT NULL,
  `order_no` varchar(100) NOT NULL,
  `vendor_id` mediumint(9) NOT NULL,
  `product_id` mediumint(9) NOT NULL COMMENT 'pdt_id of any pdt type',
  `price` double NOT NULL DEFAULT 0,
  `qty` double NOT NULL DEFAULT 0,
  `amt` double NOT NULL DEFAULT 0,
  `stock` bigint(20) NOT NULL DEFAULT 0,
  `stock_status` varchar(50) NOT NULL COMMENT 'pending , received,dispatched,delivered',
  `category_id` mediumint(9) NOT NULL COMMENT 'allopathy or ayur or etc',
  `amount_paid` double NOT NULL DEFAULT 0,
  `carry_forward` double NOT NULL DEFAULT 0,
  `amount_to_pay` double NOT NULL DEFAULT 0,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `vendor_order`
--

INSERT INTO `vendor_order` (`id`, `order_no`, `vendor_id`, `product_id`, `price`, `qty`, `amt`, `stock`, `stock_status`, `category_id`, `amount_paid`, `carry_forward`, `amount_to_pay`, `created_at`) VALUES
(1, '12', 1, 2, 10, 3, 30, 0, '', 0, 0, 0, 0, '2021-03-12 16:47:30'),
(2, '12', 2, 2, 15, 2, 30, 0, '', 0, 0, 0, 0, '2021-03-12 16:52:18'),
(3, '13', 1, 2, 10, 2, 20, 0, '', 0, 0, 0, 0, '2021-03-16 16:17:25'),
(4, '12', 1, 2, 10, 5, 50, 0, '', 0, 0, 0, 0, '2021-03-17 18:06:51'),
(5, '12', 1, 2, 10, 2, 20, 0, '', 0, 0, 0, 0, '2021-03-23 15:35:25'),
(6, '12', 1, 2, 10, 3, 30, 0, '', 0, 0, 0, 0, '2021-03-24 15:43:18'),
(7, '12', 1, 2, 10, 3, 30, 0, '', 0, 0, 0, 0, '2021-04-10 16:49:36'),
(8, '14', 2, 2, 15, 6, 90, 0, '', 0, 0, 0, 0, '2021-04-10 16:50:31'),
(9, '13', 1, 2, 10, 3, 30, 0, '', 0, 0, 0, 0, '2021-05-04 18:18:49'),
(10, '13', 1, 2, 10, 2, 20, 0, '', 0, 0, 0, 0, '2021-06-18 14:14:31'),
(11, '13', 1, 2, 10, 3, 30, 0, '', 0, 0, 0, 0, '2021-06-18 14:52:14'),
(12, '13', 1, 2, 10, 3, 30, 0, '', 0, 0, 0, 0, '2021-06-18 14:52:14'),
(13, '0', 1, 12, 40, 3, 120, 0, '', 0, 0, 0, 0, '2021-09-17 12:29:41'),
(14, '0', 1, 2021, 52, 3, 156, 0, '', 0, 0, 0, 0, '2021-09-17 12:29:41'),
(15, 'ANYORD0001', 1, 12, 40, 3, 120, 0, '', 0, 0, 0, 0, '2021-09-17 12:31:03'),
(16, 'ANYORD0001', 2, 1021, 250, 8, 2000, 0, '', 0, 0, 0, 0, '2021-09-17 12:31:04'),
(17, 'ANYORD0001', 1, 12, 40, 3, 120, 0, '', 0, 0, 0, 0, '2021-09-18 11:49:32'),
(18, 'ANYORD0001', 2, 2022, 250, 3, 750, 0, '', 0, 0, 0, 0, '2021-09-18 11:57:17'),
(19, 'ANYORD0001', 1, 12, 40, 2, 80, 0, '', 0, 0, 0, 0, '2021-09-28 16:34:46'),
(20, 'ANYORD0001', 1, 12, 40, 2, 80, 0, '', 0, 0, 0, 0, '2021-09-29 10:19:34'),
(21, 'ANYORD0002', 1, 12, 40, 3, 120, 0, '', 0, 0, 0, 0, '2021-09-29 15:46:24'),
(22, 'ANYORD0002', 1, 12, 40, 4, 160, 0, '', 0, 0, 0, 0, '2021-09-29 16:00:29'),
(23, 'ANYORD0003', 1, 23, 57, 2, 114, 0, '', 0, 0, 0, 0, '2021-10-01 15:40:27'),
(24, 'ANYORD0003', 1, 12, 40, 3, 120, 0, '', 0, 0, 0, 0, '2021-10-02 11:58:27'),
(25, 'ANYORD0003', 2, 2022, 250, 2, 500, 0, '', 0, 0, 0, 0, '2021-10-02 12:01:00');

-- --------------------------------------------------------

--
-- Table structure for table `vendor_products`
--

CREATE TABLE `vendor_products` (
  `id` int(11) NOT NULL,
  `vendor_id` mediumint(9) NOT NULL,
  `product_id` bigint(20) NOT NULL,
  `price` bigint(20) NOT NULL,
  `batch_no` varchar(100) NOT NULL,
  `qty` int(11) NOT NULL,
  `expiry` date NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `vendor_products`
--

INSERT INTO `vendor_products` (`id`, `vendor_id`, `product_id`, `price`, `batch_no`, `qty`, `expiry`, `created_at`) VALUES
(1, 1, 12, 40, '564543', 0, '0000-00-00', '2021-09-15 15:07:46'),
(2, 2, 12, 45, '7878', 0, '0000-00-00', '2021-09-15 15:08:27');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admins_groups`
--
ALTER TABLE `admins_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `advertisement`
--
ALTER TABLE `advertisement`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `advertisement_image`
--
ALTER TABLE `advertisement_image`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `agroup`
--
ALTER TABLE `agroup`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `agroup_advertisement`
--
ALTER TABLE `agroup_advertisement`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ambulance`
--
ALTER TABLE `ambulance`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `area`
--
ALTER TABLE `area`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blood_donation_history`
--
ALTER TABLE `blood_donation_history`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blood_donor`
--
ALTER TABLE `blood_donor`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blood_enquiry`
--
ALTER TABLE `blood_enquiry`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blood_groups`
--
ALTER TABLE `blood_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blood_requests`
--
ALTER TABLE `blood_requests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `booking_lab_pkg`
--
ALTER TABLE `booking_lab_pkg`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `booking_lab_test`
--
ALTER TABLE `booking_lab_test`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category_lab`
--
ALTER TABLE `category_lab`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category_product`
--
ALTER TABLE `category_product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `catlab_pkglab`
--
ALTER TABLE `catlab_pkglab`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ci_sessions`
--
ALTER TABLE `ci_sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ci_sessions_timestamp` (`timestamp`);

--
-- Indexes for table `consultation`
--
ALTER TABLE `consultation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `consultation_time_user`
--
ALTER TABLE `consultation_time_user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `counsellor`
--
ALTER TABLE `counsellor`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `counsellor_department`
--
ALTER TABLE `counsellor_department`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer_details`
--
ALTER TABLE `customer_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `day`
--
ALTER TABLE `day`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `deivery_person`
--
ALTER TABLE `deivery_person`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `delivery_pincode`
--
ALTER TABLE `delivery_pincode`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `districts`
--
ALTER TABLE `districts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `doctor`
--
ALTER TABLE `doctor`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `doctor_department`
--
ALTER TABLE `doctor_department`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `drug_shedules`
--
ALTER TABLE `drug_shedules`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `firebase_tokens`
--
ALTER TABLE `firebase_tokens`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `frequently_ask_questions`
--
ALTER TABLE `frequently_ask_questions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `health_workers`
--
ALTER TABLE `health_workers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `homepage`
--
ALTER TABLE `homepage`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `homepage_product`
--
ALTER TABLE `homepage_product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hospitals`
--
ALTER TABLE `hospitals`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `institution`
--
ALTER TABLE `institution`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `institution_labtest`
--
ALTER TABLE `institution_labtest`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `institution_types`
--
ALTER TABLE `institution_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `invoice`
--
ALTER TABLE `invoice`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `invoice_billing`
--
ALTER TABLE `invoice_billing`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `invoice_billing_products`
--
ALTER TABLE `invoice_billing_products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `labtest_packages`
--
ALTER TABLE `labtest_packages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lab_custom`
--
ALTER TABLE `lab_custom`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lab_custom_assign`
--
ALTER TABLE `lab_custom_assign`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lab_tests`
--
ALTER TABLE `lab_tests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `login_attempts`
--
ALTER TABLE `login_attempts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `login_history`
--
ALTER TABLE `login_history`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `manufacturer`
--
ALTER TABLE `manufacturer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `medicine_category`
--
ALTER TABLE `medicine_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notification`
--
ALTER TABLE `notification`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `offer`
--
ALTER TABLE `offer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ordered_product`
--
ALTER TABLE `ordered_product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_status`
--
ALTER TABLE `order_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `package`
--
ALTER TABLE `package`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `package_lab`
--
ALTER TABLE `package_lab`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `package_lab_institution`
--
ALTER TABLE `package_lab_institution`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `packing`
--
ALTER TABLE `packing`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `packing_info`
--
ALTER TABLE `packing_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permission_name` (`permission_name`);

--
-- Indexes for table `pincodes`
--
ALTER TABLE `pincodes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_images`
--
ALTER TABLE `product_images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_inventory`
--
ALTER TABLE `product_inventory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_packing`
--
ALTER TABLE `product_packing`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_type`
--
ALTER TABLE `product_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `purchase`
--
ALTER TABLE `purchase`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `purchase_produts`
--
ALTER TABLE `purchase_produts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tax`
--
ALTER TABLE `tax`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `test_institution`
--
ALTER TABLE `test_institution`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transaction`
--
ALTER TABLE `transaction`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_address`
--
ALTER TABLE `user_address`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_type`
--
ALTER TABLE `user_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vendor`
--
ALTER TABLE `vendor`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vendor_category`
--
ALTER TABLE `vendor_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vendor_category_assign`
--
ALTER TABLE `vendor_category_assign`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vendor_lab_pdt`
--
ALTER TABLE `vendor_lab_pdt`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vendor_order`
--
ALTER TABLE `vendor_order`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vendor_products`
--
ALTER TABLE `vendor_products`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `admins_groups`
--
ALTER TABLE `admins_groups`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;

--
-- AUTO_INCREMENT for table `advertisement`
--
ALTER TABLE `advertisement`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `advertisement_image`
--
ALTER TABLE `advertisement_image`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `agroup`
--
ALTER TABLE `agroup`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `agroup_advertisement`
--
ALTER TABLE `agroup_advertisement`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `ambulance`
--
ALTER TABLE `ambulance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `area`
--
ALTER TABLE `area`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `blood_donation_history`
--
ALTER TABLE `blood_donation_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `blood_donor`
--
ALTER TABLE `blood_donor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `blood_enquiry`
--
ALTER TABLE `blood_enquiry`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `blood_groups`
--
ALTER TABLE `blood_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `blood_requests`
--
ALTER TABLE `blood_requests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `booking`
--
ALTER TABLE `booking`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `booking_lab_pkg`
--
ALTER TABLE `booking_lab_pkg`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `booking_lab_test`
--
ALTER TABLE `booking_lab_test`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `category_lab`
--
ALTER TABLE `category_lab`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `category_product`
--
ALTER TABLE `category_product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `catlab_pkglab`
--
ALTER TABLE `catlab_pkglab`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `consultation`
--
ALTER TABLE `consultation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `consultation_time_user`
--
ALTER TABLE `consultation_time_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `counsellor`
--
ALTER TABLE `counsellor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `counsellor_department`
--
ALTER TABLE `counsellor_department`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `customer_details`
--
ALTER TABLE `customer_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=193;

--
-- AUTO_INCREMENT for table `day`
--
ALTER TABLE `day`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `deivery_person`
--
ALTER TABLE `deivery_person`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `delivery_pincode`
--
ALTER TABLE `delivery_pincode`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `districts`
--
ALTER TABLE `districts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `doctor`
--
ALTER TABLE `doctor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `doctor_department`
--
ALTER TABLE `doctor_department`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `drug_shedules`
--
ALTER TABLE `drug_shedules`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `firebase_tokens`
--
ALTER TABLE `firebase_tokens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `frequently_ask_questions`
--
ALTER TABLE `frequently_ask_questions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `groups`
--
ALTER TABLE `groups`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `health_workers`
--
ALTER TABLE `health_workers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `homepage`
--
ALTER TABLE `homepage`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `homepage_product`
--
ALTER TABLE `homepage_product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=89;

--
-- AUTO_INCREMENT for table `hospitals`
--
ALTER TABLE `hospitals`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `institution`
--
ALTER TABLE `institution`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `institution_labtest`
--
ALTER TABLE `institution_labtest`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `institution_types`
--
ALTER TABLE `institution_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `invoice`
--
ALTER TABLE `invoice`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invoice_billing`
--
ALTER TABLE `invoice_billing`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `invoice_billing_products`
--
ALTER TABLE `invoice_billing_products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `labtest_packages`
--
ALTER TABLE `labtest_packages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `lab_custom`
--
ALTER TABLE `lab_custom`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `lab_custom_assign`
--
ALTER TABLE `lab_custom_assign`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `lab_tests`
--
ALTER TABLE `lab_tests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `login_attempts`
--
ALTER TABLE `login_attempts`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `login_history`
--
ALTER TABLE `login_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1013;

--
-- AUTO_INCREMENT for table `manufacturer`
--
ALTER TABLE `manufacturer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `medicine_category`
--
ALTER TABLE `medicine_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `notification`
--
ALTER TABLE `notification`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `offer`
--
ALTER TABLE `offer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ordered_product`
--
ALTER TABLE `ordered_product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `order_status`
--
ALTER TABLE `order_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `package`
--
ALTER TABLE `package`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `package_lab`
--
ALTER TABLE `package_lab`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `package_lab_institution`
--
ALTER TABLE `package_lab_institution`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `packing`
--
ALTER TABLE `packing`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `packing_info`
--
ALTER TABLE `packing_info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `pincodes`
--
ALTER TABLE `pincodes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=485;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2024;

--
-- AUTO_INCREMENT for table `product_images`
--
ALTER TABLE `product_images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=152;

--
-- AUTO_INCREMENT for table `product_inventory`
--
ALTER TABLE `product_inventory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_packing`
--
ALTER TABLE `product_packing`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `product_type`
--
ALTER TABLE `product_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `purchase`
--
ALTER TABLE `purchase`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `purchase_produts`
--
ALTER TABLE `purchase_produts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tax`
--
ALTER TABLE `tax`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `test_institution`
--
ALTER TABLE `test_institution`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transaction`
--
ALTER TABLE `transaction`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `user_address`
--
ALTER TABLE `user_address`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user_type`
--
ALTER TABLE `user_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `vendor`
--
ALTER TABLE `vendor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `vendor_category`
--
ALTER TABLE `vendor_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `vendor_category_assign`
--
ALTER TABLE `vendor_category_assign`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `vendor_lab_pdt`
--
ALTER TABLE `vendor_lab_pdt`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vendor_order`
--
ALTER TABLE `vendor_order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `vendor_products`
--
ALTER TABLE `vendor_products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
