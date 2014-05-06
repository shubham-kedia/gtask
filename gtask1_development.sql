-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: May 07, 2014 at 01:44 AM
-- Server version: 5.5.37-0ubuntu0.14.04.1
-- PHP Version: 5.5.9-1ubuntu4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `gtask1_development`
--

-- --------------------------------------------------------

--
-- Table structure for table `barcharts`
--

CREATE TABLE IF NOT EXISTS `barcharts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `jodhpur` float DEFAULT NULL,
  `bikaner` float DEFAULT NULL,
  `jaipur` float DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=39 ;

--
-- Dumping data for table `barcharts`
--

INSERT INTO `barcharts` (`id`, `date`, `jodhpur`, `bikaner`, `jaipur`, `created_at`, `updated_at`) VALUES
(1, 'Jul/13/2013', 63.4, 62.7, 72.2, NULL, NULL),
(2, 'Aug/13/2013', 58, 59.9, 67.7, NULL, NULL),
(3, 'Sep/13/2013', 53.3, 59.1, 69.4, NULL, NULL),
(4, 'Oct/13/2013', 55.7, 58.8, 68, NULL, NULL),
(5, 'Nov/13/2013', 64.2, 58.7, 72.4, NULL, NULL),
(6, 'Dec/13/2013', 58.8, 57, 77, NULL, NULL),
(7, 'Jan/13/2014', 57, 56.5, 82, NULL, NULL),
(8, 'Feb/13/2014', 61.8, 56.8, 78.9, NULL, NULL),
(9, 'Mar/13/2014', 69.3, 56.7, 68.8, NULL, NULL),
(11, 'Apr/13/2014', 68.7, 61.1, 70.3, NULL, NULL),
(12, 'May/13/2014', 61.8, 61.5, 75.3, NULL, NULL),
(13, 'Jun/13/2014', 63, 64.3, 76.6, NULL, NULL),
(14, 'Jul/13/2014', 66.9, 67.1, 66.6, NULL, NULL),
(15, 'Aug/13/2014', 61.7, 64.6, 68, NULL, NULL),
(16, 'Sep/13/2014', 61.8, 61.6, 70.6, NULL, NULL),
(17, 'Oct/13/2014', 62.8, 61.1, 71.1, NULL, NULL),
(18, 'Nov/13/2014', 60.8, 59.2, 70, NULL, NULL),
(19, 'Dec/13/2014', 60.8, 70, 58.9, NULL, NULL),
(20, 'Jan/13/2015', 62.1, 58.9, 61.6, NULL, NULL),
(21, 'Feb/13/2015', 65.1, 57.2, 57.4, NULL, NULL),
(22, 'Mar/13/2015', 55.6, 56.4, 64.3, NULL, NULL),
(23, 'Apr/13/2015', 54.4, 73.4, 71, NULL, NULL),
(24, 'May/13/2015', 54.4, 50.1, 54.4, NULL, NULL),
(25, 'Jun/13/2015', 71, 54.6, 38.6, NULL, NULL),
(26, 'Jul/13/2015', 73, 44.2, 57.9, NULL, NULL),
(27, 'Aug/13/2015', 62.6, 50.1, 62.6, NULL, NULL),
(28, 'Sep/13/2015', 50.1, 54.4, 42.5, NULL, NULL),
(29, 'Oct/13/2015', 73.4, 71, 44.2, NULL, NULL),
(30, 'Nov/13/2015', 38.6, 73, 54.6, NULL, NULL),
(31, 'Dec/13/2015', 62.6, 44.2, 40, NULL, NULL),
(32, 'Jan/13/2016', 54.6, 49.6, 73, NULL, NULL),
(33, 'Feb/13/2016', 42.5, 30.9, 38.6, NULL, NULL),
(34, 'Mar/13/2016', 54.4, 43.8, 65.1, NULL, NULL),
(35, 'Apr/13/2016', 49.6, 67.2, 47.3, NULL, NULL),
(36, 'May/13/2016', 30.9, 65.1, 67.2, NULL, NULL),
(37, 'Jun/13/2016', 47.3, 30.9, 43.8, NULL, NULL),
(38, 'Jul/13/2016', 65.1, 67.2, 49.6, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `multilinecharts`
--

CREATE TABLE IF NOT EXISTS `multilinecharts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `month` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `expenses` float DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=13 ;

--
-- Dumping data for table `multilinecharts`
--

INSERT INTO `multilinecharts` (`id`, `month`, `expenses`, `created_at`, `updated_at`) VALUES
(1, 'Jul/13/2014', 33.9, NULL, NULL),
(2, 'Aug/13/2014', 58.2, NULL, NULL),
(3, 'Sep/13/2014', 79.4, NULL, NULL),
(4, 'Oct/13/2014', 65.5, NULL, NULL),
(5, 'Nov/13/2014', 76.06, NULL, NULL),
(6, 'Dec/13/2014', 71.99, NULL, NULL),
(7, 'Jan/14/2014', 80.9, NULL, NULL),
(8, 'Feb/14/2014', 80.98, NULL, NULL),
(9, 'Mar/14/2014', 73, NULL, NULL),
(10, 'Apr/14/2014', 81.2, NULL, NULL),
(11, 'May/14/2014', 93.8, NULL, NULL),
(12, 'Jun/14/2014', 80.5, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `piecharts`
--

CREATE TABLE IF NOT EXISTS `piecharts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

--
-- Dumping data for table `piecharts`
--

INSERT INTO `piecharts` (`id`, `label`, `value`, `created_at`, `updated_at`) VALUES
(1, 'one', 20, NULL, NULL),
(2, 'two', 30, NULL, NULL),
(3, 'three', 20, NULL, NULL),
(4, 'four', 10, NULL, NULL),
(5, 'five', 20, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `schema_migrations`
--

CREATE TABLE IF NOT EXISTS `schema_migrations` (
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `schema_migrations`
--

INSERT INTO `schema_migrations` (`version`) VALUES
('20140503173719'),
('20140503173735'),
('20140506195807');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
