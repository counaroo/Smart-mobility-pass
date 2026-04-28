-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3307
-- Généré le : sam. 28 fév. 2026 à 21:15
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `pricing_db`
--

-- --------------------------------------------------------

--
-- Structure de la table `fare_calculations`
--

CREATE TABLE `fare_calculations` (
  `id` bigint(20) NOT NULL,
  `base_fare` decimal(8,2) DEFAULT NULL,
  `calculated_at` datetime(6) DEFAULT NULL,
  `final_amount` decimal(8,2) NOT NULL,
  `is_fallback` bit(1) DEFAULT NULL,
  `loyalty_discount_amt` decimal(8,2) DEFAULT NULL,
  `off_peak_discount_amt` decimal(8,2) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `pricing_rules`
--

CREATE TABLE `pricing_rules` (
  `id` bigint(20) NOT NULL,
  `active` bit(1) NOT NULL,
  `base_fare` decimal(8,2) NOT NULL,
  `daily_cap` decimal(8,2) DEFAULT NULL,
  `loyalty_discount` decimal(4,2) DEFAULT NULL,
  `loyalty_threshold` int(11) DEFAULT NULL,
  `off_peak_discount` decimal(4,2) DEFAULT NULL,
  `off_peak_end` time DEFAULT NULL,
  `off_peak_start` time DEFAULT NULL,
  `transport_type` enum('BRT','BUS','TER') NOT NULL,
  `valid_from` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `pricing_rules`
--

INSERT INTO `pricing_rules` (`id`, `active`, `base_fare`, `daily_cap`, `loyalty_discount`, `loyalty_threshold`, `off_peak_discount`, `off_peak_end`, `off_peak_start`, `transport_type`, `valid_from`) VALUES
(1, b'1', 800.00, 3000.00, 10.00, 10, 20.00, NULL, NULL, 'TER', NULL),
(2, b'1', 500.00, 2000.00, 5.00, 15, 15.00, NULL, NULL, 'BRT', NULL),
(3, b'1', 200.00, 1000.00, 0.00, 20, 10.00, NULL, NULL, 'BUS', NULL);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `fare_calculations`
--
ALTER TABLE `fare_calculations`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `pricing_rules`
--
ALTER TABLE `pricing_rules`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UKu56wr76w1myfpjjcel07stvw` (`transport_type`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `fare_calculations`
--
ALTER TABLE `fare_calculations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `pricing_rules`
--
ALTER TABLE `pricing_rules`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
