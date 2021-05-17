-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Apr 06, 2021 at 07:05 AM
-- Server version: 5.7.24
-- PHP Version: 7.3.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ajax_football`
--

-- --------------------------------------------------------

--
-- Table structure for table `city`
--

DROP TABLE IF EXISTS `city`;
CREATE TABLE IF NOT EXISTS `city` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `city_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `country_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `country_name` (`country_name`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `city`
--

INSERT INTO `city` (`id`, `city_name`, `country_name`) VALUES
(1, 'Beograd', 'Serbia'),
(2, 'Novi Sad', 'Serbia'),
(3, 'Madrid', 'Spain'),
(4, 'Barcelona', 'Spain'),
(5, 'London', 'England'),
(6, 'Manchester', 'England'),
(7, 'Liverpool', 'England'),
(8, 'Paris', 'France'),
(9, 'Munich', 'Germany'),
(10, 'Dortmund', 'Germany'),
(11, 'Rome', 'Italy'),
(12, 'Milano', 'Italy'),
(13, 'Turin', 'Italy'),
(14, 'Naples', 'Italy');

-- --------------------------------------------------------

--
-- Table structure for table `clubs`
--

DROP TABLE IF EXISTS `clubs`;
CREATE TABLE IF NOT EXISTS `clubs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `club_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `id_city` int(11) NOT NULL,
  `stadium` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `year_of_foundation` int(11) NOT NULL,
  `nick` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_city` (`id_city`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `clubs`
--

INSERT INTO `clubs` (`id`, `club_name`, `id_city`, `stadium`, `year_of_foundation`, `nick`) VALUES
(1, 'Partizan', 1, 'JNA', 1945, 'Grobari'),
(2, 'Crvena Zvezda', 1, 'Marakana-Rajko Mitic', 1945, 'Delije'),
(3, 'Vojvodina', 2, 'Karadjordje', 1914, 'Firmasi'),
(4, 'Real Madrid', 3, 'Santiago Bernabéu', 1902, 'Madridistas'),
(5, 'Atletico de Madrid', 3, 'Wanda Metropolitano', 1903, 'Colchoneros'),
(6, 'Rayo Vallecano', 3, 'Campo de Fútbol de Vallecas', 1924, 'Franjirrojos'),
(7, 'FC Barcelona', 4, 'Camp Nou', 1899, 'Cules'),
(8, 'RCD Espanyol', 4, 'RCDE Stadium\r\n', 1900, 'Blanquiazules'),
(9, 'Arsenal', 5, 'Emirates', 1886, 'The Gunners'),
(10, 'Chelsea', 5, 'Stamford Bridge', 1905, 'The Pensioners'),
(11, 'Fulham', 5, 'Craven Cottage', 1879, 'The Cottagers'),
(12, 'Tottenham', 5, 'Tottenham Hotspur Stadium', 1882, 'The Spurs'),
(13, 'Manchester UTD', 6, 'Old Trafford', 1878, 'The Red Devils'),
(14, 'Manchester City', 6, 'City of Manchester Stadium', 1880, 'The Citizens'),
(15, 'Liverpool', 7, 'Anfield', 1892, 'The Reds'),
(16, 'A.S. Roma', 11, 'Stadio Olimpico', 1927, 'Giallorossi'),
(17, 'S.S. Lazio', 11, 'Stadio Olimpico', 1900, 'Biancocelesti'),
(18, 'Inter Milan', 12, 'San Siro', 1908, 'Nerazzurri '),
(19, 'A.C. Milan', 12, 'San Siro', 1899, 'Rosoneri'),
(20, 'Juventus F.C.\r\n', 13, 'Juventus Stadium', 1897, 'Bianconeri'),
(21, 'S.S.C. Napoli', 14, 'Stadio San Paolo', 1926, 'Partenopei'),
(22, 'FC Bayern Munich\r\n', 9, 'Allianz Arena', 1900, 'Die Roten'),
(23, 'Borussia Dortmund', 10, 'Westfalenstadion', 1909, 'Die Schwarzgelben');

-- --------------------------------------------------------

--
-- Table structure for table `country`
--

DROP TABLE IF EXISTS `country`;
CREATE TABLE IF NOT EXISTS `country` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `country_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `country_name` (`country_name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `country`
--

INSERT INTO `country` (`id`, `country_name`) VALUES
(2, 'England'),
(6, 'France'),
(5, 'Germany'),
(4, 'Italy'),
(1, 'Serbia'),
(3, 'Spain');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `city`
--
ALTER TABLE `city`
  ADD CONSTRAINT `city_ibfk_1` FOREIGN KEY (`country_name`) REFERENCES `country` (`country_name`);

--
-- Constraints for table `clubs`
--
ALTER TABLE `clubs`
  ADD CONSTRAINT `clubs_ibfk_1` FOREIGN KEY (`id_city`) REFERENCES `city` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
