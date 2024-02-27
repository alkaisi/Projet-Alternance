-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: db:3306
-- Generation Time: Feb 27, 2024 at 02:34 PM
-- Server version: 8.3.0
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
-- Table structure for table `00_Choisir_la_table`
--

CREATE TABLE `00_Choisir_la_table` (
  `id` int NOT NULL,
  `nom_client` varchar(255) DEFAULT NULL,
  `adresse_ip` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `4G`
--

CREATE TABLE `4G` (
  `id` int NOT NULL,
  `nom_client` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `adresse_ip` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `4G`
--

INSERT INTO `4G` (`id`, `nom_client`, `adresse_ip`) VALUES
(1, '(AW54514-13547) Vétérinaire du seuil de caux', ''),
(2, '(AW79822-13531) VETAPHARMA', ''),
(3, '(AW77970-13438) MON VETO Morsang', ''),
(4, '(AW79221-13436) MON VETO CHATOU SARAIL', ''),
(5, '(AW79980-13410) MON VETO STE GENEVIEVE DES BOIS 2', ''),
(6, '(AW71327-13017) MON VETO VETEVREUX NAVARRE', ''),
(7, '(AW77989-12848) MON VETO CARQUEFOU', ''),
(8, '(AW77557-12801) MON VETO COGOLIN', ''),
(9, '(AW77112-12291) MON VETO CHATELAILLON', ''),
(10, '(AW67726-12214) VP AUTO', ''),
(11, '(AW76838-12191) MON VETO FRONTON', ''),
(12, '(AW69388-11393) Hitechelec', ''),
(13, '(AW66941-9462) Laugui concept', ''),
(14, '(AW47057-7393) Dr Begarin', '');

-- --------------------------------------------------------

--
-- Table structure for table `ADSL`
--

CREATE TABLE `ADSL` (
  `id` int NOT NULL,
  `nom_client` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `adresse_ip` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `A_FTTB`
--

CREATE TABLE `A_FTTB` (
  `id` int NOT NULL,
  `nom_client` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `adresse_ip` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `FIBRE_FTTE`
--

CREATE TABLE `FIBRE_FTTE` (
  `id` int NOT NULL,
  `nom_client` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `adresse_ip` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `FIBRE_FTTE`
--

INSERT INTO `FIBRE_FTTE` (`id`, `nom_client`, `adresse_ip`) VALUES
(1, '(AW50423-6175) Asso Essor', '185.62.227.154');

-- --------------------------------------------------------

--
-- Table structure for table `FIBRE_OPTIQUE`
--

CREATE TABLE `FIBRE_OPTIQUE` (
  `id` int NOT NULL,
  `nom_client` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `adresse_ip` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `FIBRE_OPTIQUE`
--

INSERT INTO `FIBRE_OPTIQUE` (`id`, `nom_client`, `adresse_ip`) VALUES
(1, '(AW68251-10002) MON VETO VELIZY', ''),
(2, '(AW69279-9140) MON VETO CLINIQUE VETERINAIRE DU CAOU', '185.144.27.200'),
(3, '(AW52453-9028) IME Le clos Samson', '185.144.26.231'),
(4, '(AW46507-7979) DSL Network', '185.144.24.193');

-- --------------------------------------------------------

--
-- Table structure for table `FO_ASYMETRIQUE`
--

CREATE TABLE `FO_ASYMETRIQUE` (
  `id` int NOT NULL,
  `nom_client` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `adresse_ip` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `FO_NOIRE`
--

CREATE TABLE `FO_NOIRE` (
  `id` int NOT NULL,
  `nom_client` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `adresse_ip` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `FTTB`
--

CREATE TABLE `FTTB` (
  `id` int NOT NULL,
  `nom_client` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `adresse_ip` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `FTTH`
--

CREATE TABLE `FTTH` (
  `id` int NOT NULL,
  `nom_client` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `adresse_ip` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `FTTH`
--

INSERT INTO `FTTH` (`id`, `nom_client`, `adresse_ip`) VALUES
(1, '(AW76722-13757) MON VETO VILLEMUR', '46.19.106.86'),
(2, '(AW79980-13411) MON VETO STE GENVIEVE DES BOIS 2', ''),
(3, '(AW68271-13391) ASSOCIATION SAINT ONUPHRE ', ''),
(4, '(AW79822-13345) VETAPHARMA', '46.19.107.51'),
(5, '(AW79221-13072) MON VETO CHATOU SARAIL', '46.19.106.204'),
(6, '(AW78590-12923) MON VETO AUMALE', ''),
(7, '(AW71649-12800) Setico', '46.19.106.75'),
(8, '(AW77989-12656) MON VETO CARQUEFOU', '46.19.106.10'),
(9, '(AW77557-12653) MON VETO COGOLIN', '46.19.106.8'),
(10, '(AW77970-12639) MON VETO Morsang', '46.19.105.247'),
(11, '(AW67892-12638) Mon Veto Montrouge', '46.19.106.11'),
(12, '(AW77875-12609) LECOUP ET FILS', '46.19.105.235'),
(13, '(AW77112-12290) MON VETO CHATELAILLON', '46.19.105.94'),
(14, '(AW72169-12274) MON VETO APVET MALLEMORT', '46.19.105.86'),
(15, '(AW67726-12213) VP Auto', ''),
(16, '(AW76838-12190) MON VETO FRONTON', '46.19.105.89'),
(17, '(AW46508-12115) Malub', '46.19.105.31'),
(18, '(AW76346-12000) MON VETO PARIS JEAN JAURES', '185.144.26.248'),
(19, '(AW48665-11999) Sofap', '185.144.26.245'),
(20, '(AW66070-11994) Mon veto Dormans', '185.144.26.179'),
(21, '(AW75955-11791) MON VETO ATHIS MONS', '185.62.227.41'),
(22, '(AW48682-11721) OPAER', '91.227.39.164'),
(23, '(AW75439-11607) MON VETO RAMBOUILLET', '185.217.203.230'),
(24, '(AW75015-11411) MON VETO GRENADE', '194.13.67.107'),
(25, '(AW69388-11301) Hitechelec', '194.13.64.100'),
(26, '(AW74180-11031) MON VETO REIMS', '91.227.39.181'),
(27, '(AW74178-11030) MON VETO WITRY LES REIMS', '91.227.39.182'),
(28, '(AW13818-10818) BOUTEL COUVERTURE', '91.227.39.31'),
(29, '(AW72886-10543) MON VETO NORDMAN PONT SAINT MARTIN', '91.227.38.164'),
(30, '(AW72569-10399) MON VETO LA FOURRAGERE ROQUEVAIRE', '91.227.38.60'),
(31, '(AW72434-10342) MON VETO VETELIS LE RHEU', '91.227.38.4'),
(32, '(AW51660-10230) Syndicat mixte du bassin versant austhreberte', '91.227.37.168'),
(33, '(AW64136-10171) Norglass', '91.227.37.162'),
(34, '(AW71976-10127) MON VETO IDF OUEST ORBEC', '91.227.37.126'),
(35, '(AW71670-10051) MON VETO PARC CLUB ROUSSET', '91.227.37.84'),
(36, '(AW71327-9894) MON VETO VETEVREUX NAVARRE', '91.227.36.204'),
(37, '(AW71247-9867) MON VETO VETELIOS', '91.227.36.190'),
(38, '(AW70638-9735) Desbo', '91.227.36.127'),
(39, '(AW69912-9414) MON VETO VET URGENTYS', '185.144.27.190'),
(40, '(AW68589-9242) Lycée Clément Ader', '185.144.27.88'),
(41, '(AW69025-9191) MON VETO MVA PONTOISE', '185.144.27.54'),
(42, '(AW69025-9032) MON VETO MVA BEAUMONT SUR OISE', '185.144.26.232'),
(43, '(AW68364-9031) SARL M&K', '5.42.200.220'),
(44, '(AW52453-9030) IME Le clos Samson', '185.144.26.250'),
(45, '(AW57077-9027) Clinique Vétérinaire de Gravigny', '185.144.26.251'),
(46, '(AW68258-8816) MON VETO MONTROUGE REPUBLIQUE', '185.144.26.135'),
(47, '(AW68106-8680) MON VETO Chaponnay', '185.144.26.72'),
(48, '(AW67892-8611) Mon Veto Montrouge', '185.144.26.10'),
(49, '(AW67949-8610) Mon veto MERY SUR OISE', '185.144.26.9'),
(50, '(AW67554-8450) MON VETO CARRIERE SOUS POISSY', '185.144.25.151'),
(51, '(AW66233-8397) RC Services', '185.217.200.23'),
(52, '(AW67104-8292) MON VETO LOUVIER VICTOR HUGO', '185.144.25.104'),
(53, '(AW66179-7948) MON VETO Grasse', '185.144.24.181'),
(54, '(AW66098-7929) MON VETO FEYZIN', '185.144.24.169'),
(55, '(AW64218-7891) MON VETO BARBET PLAINCHAMP', '185.144.24.44'),
(56, '(AW49103-7521) Association etennemare', '5.42.200.57'),
(57, '(AW61779-7158) SELARL HUON SARFATI', '185.217.202.72'),
(58, '(AW62971-6604) MON VETO Paris Gambetta', '185.73.206.168'),
(59, '(AW59753-6410) MON VETO Bonsecours', '185.73.206.7'),
(60, '(AW62512-6386) SCI Joana', '185.62.227.158'),
(61, '(AW62512-6386) SCI Joana', '91.233.66.129'),
(62, '(AW62455-6379) MON VET UNIVETIS', '185.62.227.142'),
(63, '(AW47684-6329) Greta Elbeuf', '185.62.227.78'),
(64, '(AW61201-6211) B2patrimoine', '185.62.226.226'),
(65, '(AW60376-5731) MON VETO Paris 20', '185.62.224.176'),
(66, '(AW59359-5513) MON VETO Paris Caillaux', '185.62.224.41'),
(67, '(AW47057-5076) Dr Begarin', '194.13.67.125'),
(68, '(AW49871-4894) Greta Eure', '100.74.3.64'),
(69, '(AW54514-4624) Vétérinaire du Seuil de Caux Maromme', '194.13.64.229'),
(70, '(AW54514-4396) Vétérinaire du Seuil de Caux Pavilly', ''),
(71, '(AW54514-4395) Vétérinaire du Seuil de Caux Barentin', ''),
(72, '(AW55509-4347) Magenta Immo', ''),
(73, '(AW48891-3912) Caldea ELBEUF', '45.155.231.98'),
(74, '(AW48891-3902) Caldea LE NEUBOURG', '45.155.231.92'),
(75, '(AW48891-3901) Caldea VERNON', '45.155.231.102'),
(76, '(AW47684-2526) Greta Elbeuf', '45.85.133.150');

-- --------------------------------------------------------

--
-- Table structure for table `GTR`
--

CREATE TABLE `GTR` (
  `id` int NOT NULL,
  `nom_client` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `adresse_ip` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `PAIRE_FO_NOIRE`
--

CREATE TABLE `PAIRE_FO_NOIRE` (
  `id` int NOT NULL,
  `nom_client` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `adresse_ip` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `SDLS_EFM`
--

CREATE TABLE `SDLS_EFM` (
  `id` int NOT NULL,
  `nom_client` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `adresse_ip` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `SDSL_ATM`
--

CREATE TABLE `SDSL_ATM` (
  `id` int NOT NULL,
  `nom_client` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `adresse_ip` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `VDSL`
--

CREATE TABLE `VDSL` (
  `id` int NOT NULL,
  `nom_client` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `adresse_ip` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `VDSL`
--

INSERT INTO `VDSL` (`id`, `nom_client`, `adresse_ip`) VALUES
(1, '(AW13818-6350) BOUTEL COUVERTURE', '185.62.227.114'),
(2, '(AW55509-4346) Magenta Immo', ''),
(3, '(AW48891-3913) Caldea GRAND BOURGTHEROULDE', '45.155.231.100'),
(4, '(AW48682-2853) OPAER', '45.85.134.172');

-- --------------------------------------------------------

--
-- Table structure for table `WIFI`
--

CREATE TABLE `WIFI` (
  `id` int NOT NULL,
  `nom_client` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `adresse_ip` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `00_Choisir_la_table`
--
ALTER TABLE `00_Choisir_la_table`
  ADD PRIMARY KEY (`id`);

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
-- AUTO_INCREMENT for table `00_Choisir_la_table`
--
ALTER TABLE `00_Choisir_la_table`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `4G`
--
ALTER TABLE `4G`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `ADSL`
--
ALTER TABLE `ADSL`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `A_FTTB`
--
ALTER TABLE `A_FTTB`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `FIBRE_FTTE`
--
ALTER TABLE `FIBRE_FTTE`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `FIBRE_OPTIQUE`
--
ALTER TABLE `FIBRE_OPTIQUE`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `FO_ASYMETRIQUE`
--
ALTER TABLE `FO_ASYMETRIQUE`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `FO_NOIRE`
--
ALTER TABLE `FO_NOIRE`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `FTTB`
--
ALTER TABLE `FTTB`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `FTTH`
--
ALTER TABLE `FTTH`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;

--
-- AUTO_INCREMENT for table `GTR`
--
ALTER TABLE `GTR`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `PAIRE_FO_NOIRE`
--
ALTER TABLE `PAIRE_FO_NOIRE`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `SDLS_EFM`
--
ALTER TABLE `SDLS_EFM`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `SDSL_ATM`
--
ALTER TABLE `SDSL_ATM`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `VDSL`
--
ALTER TABLE `VDSL`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `WIFI`
--
ALTER TABLE `WIFI`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
