-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: mariadb
-- Generation Time: Feb 07, 2024 at 01:26 PM
-- Server version: 10.6.16-MariaDB-1:10.6.16+maria~ubu2004
-- PHP Version: 8.2.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `links`
--

-- --------------------------------------------------------

--
-- Table structure for table `4G`
--

CREATE TABLE `4G` (
  `id` int(11) NOT NULL,
  `nom_client` varchar(255) DEFAULT NULL,
  `adresse_ip` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `4G`
--

INSERT INTO `4G` (`id`, `nom_client`, `adresse_ip`) VALUES
(1, 'Vétérinaire du seuil de caux', ''),
(2, 'VETAPHARMA', ''),
(3, 'MON VETO Morsang', ''),
(4, 'MON VETO CHATOU SARAIL', ''),
(5, 'MON VETO STE GENEVIEVE DES BOIS 2', ''),
(6, 'MON VETO VETEVREUX NAVARRE', ''),
(7, 'MON VETO CARQUEFOU', ''),
(8, 'MON VETO COGOLIN', ''),
(9, 'MON VETO CHATELAILLON', ''),
(10, 'VP AUTO', ''),
(11, 'MON VETO FRONTON', ''),
(12, 'Hitechelec', ''),
(13, 'Laugui concept', ''),
(14, 'Dr Begarin', '');

-- --------------------------------------------------------

--
-- Table structure for table `ADSL`
--

CREATE TABLE `ADSL` (
  `id` int(11) NOT NULL,
  `nom_client` varchar(255) DEFAULT NULL,
  `adresse_ip` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `A_FTTB`
--

CREATE TABLE `A_FTTB` (
  `id` int(11) NOT NULL,
  `nom_client` varchar(255) DEFAULT NULL,
  `adresse_ip` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `FIBRE_FTTE`
--

CREATE TABLE `FIBRE_FTTE` (
  `id` int(11) NOT NULL,
  `nom_client` varchar(255) DEFAULT NULL,
  `adresse_ip` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `FIBRE_FTTE`
--

INSERT INTO `FIBRE_FTTE` (`id`, `nom_client`, `adresse_ip`) VALUES
(1, 'Asso Essor', '185.62.227.154');

-- --------------------------------------------------------

--
-- Table structure for table `FIBRE_OPTIQUE`
--

CREATE TABLE `FIBRE_OPTIQUE` (
  `id` int(11) NOT NULL,
  `nom_client` varchar(255) DEFAULT NULL,
  `adresse_ip` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `FIBRE_OPTIQUE`
--

INSERT INTO `FIBRE_OPTIQUE` (`id`, `nom_client`, `adresse_ip`) VALUES
(1, 'MON VETO VELIZY', ''),
(2, 'MON VETO CLINIQUE VETERINAIRE DU CAOU', '185.144.27.200'),
(3, 'IME Le clos Samson', '185.144.26.231'),
(4, 'DSL Network', '185.144.24.193');

-- --------------------------------------------------------

--
-- Table structure for table `FO_ASYMETRIQUE`
--

CREATE TABLE `FO_ASYMETRIQUE` (
  `id` int(11) NOT NULL,
  `nom_client` varchar(255) DEFAULT NULL,
  `adresse_ip` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `FO_NOIRE`
--

CREATE TABLE `FO_NOIRE` (
  `id` int(11) NOT NULL,
  `nom_client` varchar(255) DEFAULT NULL,
  `adresse_ip` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `FTTB`
--

CREATE TABLE `FTTB` (
  `id` int(11) NOT NULL,
  `nom_client` varchar(255) DEFAULT NULL,
  `adresse_ip` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `FTTH`
--

CREATE TABLE `FTTH` (
  `id` int(11) NOT NULL,
  `nom_client` varchar(255) DEFAULT NULL,
  `adresse_ip` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `GTR`
--

CREATE TABLE `GTR` (
  `id` int(11) NOT NULL,
  `nom_client` varchar(255) DEFAULT NULL,
  `adresse_ip` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `PAIRE_FO_NOIRE`
--

CREATE TABLE `PAIRE_FO_NOIRE` (
  `id` int(11) NOT NULL,
  `nom_client` varchar(255) DEFAULT NULL,
  `adresse_ip` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `SDLS_EFM`
--

CREATE TABLE `SDLS_EFM` (
  `id` int(11) NOT NULL,
  `nom_client` varchar(255) DEFAULT NULL,
  `adresse_ip` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `SDSL_ATM`
--

CREATE TABLE `SDSL_ATM` (
  `id` int(11) NOT NULL,
  `nom_client` varchar(255) DEFAULT NULL,
  `adresse_ip` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `VDSL`
--

CREATE TABLE `VDSL` (
  `id` int(11) NOT NULL,
  `nom_client` varchar(255) DEFAULT NULL,
  `adresse_ip` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `WIFI`
--

CREATE TABLE `WIFI` (
  `id` int(11) NOT NULL,
  `nom_client` varchar(255) DEFAULT NULL,
  `adresse_ip` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `4G`
--
ALTER TABLE `4G`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ADSL`
--
ALTER TABLE `ADSL`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `A_FTTB`
--
ALTER TABLE `A_FTTB`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `FIBRE_FTTE`
--
ALTER TABLE `FIBRE_FTTE`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `FIBRE_OPTIQUE`
--
ALTER TABLE `FIBRE_OPTIQUE`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `FO_ASYMETRIQUE`
--
ALTER TABLE `FO_ASYMETRIQUE`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `FO_NOIRE`
--
ALTER TABLE `FO_NOIRE`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `FTTB`
--
ALTER TABLE `FTTB`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `FTTH`
--
ALTER TABLE `FTTH`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `GTR`
--
ALTER TABLE `GTR`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `PAIRE_FO_NOIRE`
--
ALTER TABLE `PAIRE_FO_NOIRE`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `SDLS_EFM`
--
ALTER TABLE `SDLS_EFM`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `SDSL_ATM`
--
ALTER TABLE `SDSL_ATM`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `VDSL`
--
ALTER TABLE `VDSL`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `WIFI`
--
ALTER TABLE `WIFI`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `4G`
--
ALTER TABLE `4G`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `ADSL`
--
ALTER TABLE `ADSL`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `A_FTTB`
--
ALTER TABLE `A_FTTB`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `FIBRE_FTTE`
--
ALTER TABLE `FIBRE_FTTE`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `FIBRE_OPTIQUE`
--
ALTER TABLE `FIBRE_OPTIQUE`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `FO_ASYMETRIQUE`
--
ALTER TABLE `FO_ASYMETRIQUE`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `FO_NOIRE`
--
ALTER TABLE `FO_NOIRE`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `FTTB`
--
ALTER TABLE `FTTB`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `FTTH`
--
ALTER TABLE `FTTH`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `GTR`
--
ALTER TABLE `GTR`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `PAIRE_FO_NOIRE`
--
ALTER TABLE `PAIRE_FO_NOIRE`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `SDLS_EFM`
--
ALTER TABLE `SDLS_EFM`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `SDSL_ATM`
--
ALTER TABLE `SDSL_ATM`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `VDSL`
--
ALTER TABLE `VDSL`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `WIFI`
--
ALTER TABLE `WIFI`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

