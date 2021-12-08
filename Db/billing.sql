-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 08, 2021 at 05:15 PM
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
-- Database: `billing`
--
CREATE DATABASE IF NOT EXISTS `billing` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `billing`;

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `getproductname` (IN `orderNo` INT)  NO SQL
SELECT
    op.order_no,
    op.product_type_id,
    op.qty,
    op.amount,
    al.name,
    pt.name AS pdttype
FROM ordered_product op
JOIN allopathy_medicine al ON al.id = op.product_id
JOIN product_type pt ON pt.id = op.product_type_id
WHERE op.product_type_id = 1 AND op.order_no = orderNo
UNION ALL
SELECT
    op.order_no,
    op.product_type_id,
    op.qty,
    op.amount,
    ay.name,
    pt.name AS pdttype
FROM ordered_product op
JOIN `ayurvada-medicine` ay ON ay.id = op.product_id
JOIN product_type pt ON pt.id = op.product_type_id
WHERE op.product_type_id = 2 AND op.order_no = orderNo
UNION ALL
SELECT
    op.order_no,
    op.product_type_id,
    op.qty,
    op.amount,
    ay.name,
    pt.name AS pdttype
FROM ordered_product op
JOIN `veterinary_medicine` ay ON ay.id = op.product_id
JOIN product_type pt ON pt.id = op.product_type_id
WHERE op.product_type_id = 3 AND op.order_no = orderNo
UNION ALL
SELECT
    op.order_no,
    op.product_type_id,
    op.qty,
    op.amount,
    ay.name,
    pt.name AS pdttype
FROM ordered_product op
JOIN `fitness` ay ON ay.id = op.product_id
JOIN product_type pt ON pt.id = op.product_type_id
WHERE op.product_type_id = 4 AND op.order_no = orderNo
UNION ALL
SELECT
    op.order_no,
    op.product_type_id,
    op.qty,
    op.amount,
    ay.name,
    pt.name AS pdttype
FROM ordered_product op
JOIN `cosmetic` ay ON ay.id = op.product_id
JOIN product_type pt ON pt.id = op.product_type_id
WHERE op.product_type_id = 5 AND op.order_no = orderNo
UNION ALL
SELECT
    op.order_no,
    op.product_type_id,
    op.qty,
    op.amount,
    ay.name,
    pt.name AS pdttype
FROM ordered_product op
JOIN `sugical_products` ay ON ay.id = op.product_id
JOIN product_type pt ON pt.id = op.product_type_id
WHERE op.product_type_id = 6 AND op.order_no = orderNo
UNION ALL
SELECT
    op.order_no,
    op.product_type_id,
    op.qty,
    op.amount,
    ay.name,
    pt.name AS pdttype
FROM ordered_product op
JOIN `laboratory_products` ay ON ay.id = op.product_id
JOIN product_type pt ON pt.id = op.product_type_id
WHERE op.product_type_id = 7 AND op.order_no = orderNo
UNION ALL
SELECT
    op.order_no,
    op.product_type_id,
    op.qty,
    op.amount,
    ay.name,
    pt.name AS pdttype
FROM ordered_product op
JOIN `animal_food` ay ON ay.id = op.product_id
JOIN product_type pt ON pt.id = op.product_type_id
WHERE op.product_type_id = 8 AND op.order_no = orderNo$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getPuchaseList` (IN `type` INT(5))  NO SQL
BEGIN
  
  SELECT * FROM vendor_order WHERE product_type = type;
    
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getSubcategory` (IN `cat_id` INT)  NO SQL
select  id 
from    (select * from category
         order by parent_id, id) products_sorted,
        (select @pv := cat_id) initialisation
where   find_in_set(parent_id, @pv)
and     length(@pv := concat(@pv, ',', id))$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getTable` ()  NO SQL
select * from category_product$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `pc` (IN `type` INT, OUT `tblName` VARCHAR(40))  NO SQL
BEGIN

SELECT name INTO tblName FROM vendor_pdt_tbl_names WHERE id = type;


END$$

DELIMITER ;

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
(1, '127.0.0.1', 'administrator', '$2y$08$48xF/sa/9atQn5X2yUdQserD66YzWy6l/0CRWPXURxlkDlVj5wXw2', '', 'anymedion@gmail.com', '', 'Z86EZwEkEEJBvA3jP4axMud2a612910214fc498f', 1617972420, '4j4wrKLGHAiDNWetEokuoe', 1268889823, 1638979930, 1, 'Admin', 'istrator', 'ADMIN', '0'),
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
-- Table structure for table `invoice`
--

CREATE TABLE `invoice` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` int(11) NOT NULL,
  `tax` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `total` float NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `invoice`
--

INSERT INTO `invoice` (`id`, `name`, `price`, `tax`, `qty`, `total`, `created_at`) VALUES
(1, 'lux', 20, 5, 6, 126, '2021-12-08 21:41:24');

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
(1012, 'anymedion@gmail.com', '::1', '2021-10-29 12:15:28'),
(1013, 'anymedion@gmail.com', '::1', '2021-11-06 10:51:15'),
(1014, 'anymedion@gmail.com', '::1', '2021-12-06 21:05:55'),
(1015, 'anymedion@gmail.com', '::1', '2021-12-07 20:18:52'),
(1016, 'anymedion@gmail.com', '::1', '2021-12-08 21:42:10');

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
-- Indexes for table `ci_sessions`
--
ALTER TABLE `ci_sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ci_sessions_timestamp` (`timestamp`);

--
-- Indexes for table `firebase_tokens`
--
ALTER TABLE `firebase_tokens`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `invoice`
--
ALTER TABLE `invoice`
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
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permission_name` (`permission_name`);

--
-- Indexes for table `tax`
--
ALTER TABLE `tax`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
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
-- AUTO_INCREMENT for table `firebase_tokens`
--
ALTER TABLE `firebase_tokens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `groups`
--
ALTER TABLE `groups`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `invoice`
--
ALTER TABLE `invoice`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `login_attempts`
--
ALTER TABLE `login_attempts`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `login_history`
--
ALTER TABLE `login_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1017;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `tax`
--
ALTER TABLE `tax`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
