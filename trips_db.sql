-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3307
-- Généré le : sam. 28 fév. 2026 à 21:16
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
-- Base de données : `trips_db`
--

-- --------------------------------------------------------

--
-- Structure de la table `trips`
--

CREATE TABLE `trips` (
  `id` bigint(20) NOT NULL,
  `amount_charged` decimal(10,2) DEFAULT NULL,
  `destination` varchar(255) NOT NULL,
  `end_time` datetime(6) DEFAULT NULL,
  `is_fallback_fare` bit(1) DEFAULT NULL,
  `origin` varchar(255) NOT NULL,
  `start_time` datetime(6) DEFAULT NULL,
  `status` enum('CANCELLED','COMPLETED','FAILED','PENDING') DEFAULT NULL,
  `transaction_id` varchar(255) DEFAULT NULL,
  `transport_type` enum('BRT','BUS','TER') NOT NULL,
  `trip_ref` varchar(255) NOT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `trips`
--

INSERT INTO `trips` (`id`, `amount_charged`, `destination`, `end_time`, `is_fallback_fare`, `origin`, `start_time`, `status`, `transaction_id`, `transport_type`, `trip_ref`, `user_id`) VALUES
(7, 500.00, 'Diamniadio', '2026-02-25 23:44:17.000000', b'1', 'Dakar', '2026-02-25 23:44:17.000000', 'COMPLETED', 'TXN-067DFE5A', 'TER', 'TR-CCA2FCD6', 4),
(9, 500.00, 'Diamniadio', '2026-02-26 00:05:29.000000', b'1', 'Dakar', '2026-02-26 00:05:29.000000', 'COMPLETED', 'TXN-3C1CF77F', 'TER', 'TR-0C0A90FF', 4),
(12, 500.00, 'Diamniadio', '2026-02-26 00:12:26.000000', b'1', 'Dakar', '2026-02-26 00:12:26.000000', 'COMPLETED', 'TXN-6D84F901', 'TER', 'TR-FB5DF1B0', 4),
(14, 200.00, 'Grand Dakar', '2026-02-26 08:49:07.000000', b'1', 'Point E', '2026-02-26 08:49:04.000000', 'COMPLETED', 'TXN-A8AF1362', 'BUS', 'TR-EA7925B7', 4),
(15, 200.00, 'Grand Dakar', '2026-02-26 08:49:09.000000', b'1', 'Point E', '2026-02-26 08:49:09.000000', 'COMPLETED', 'TXN-40C4BB9C', 'BUS', 'TR-3ECA6301', 4),
(17, 500.00, 'Point E', '2026-02-26 15:56:36.000000', b'1', 'Grand Dakar', '2026-02-26 15:56:34.000000', 'COMPLETED', 'TXN-283C3039', 'BRT', 'TR-ECB7E515', 7),
(18, 800.00, 'Diamniadio', '2026-02-26 15:58:24.000000', b'1', 'Dakar', '2026-02-26 15:58:24.000000', 'COMPLETED', 'TXN-A9AC0224', 'TER', 'TR-0A3BF101', 7),
(19, 200.00, 'Derkle', '2026-02-26 16:08:11.000000', b'1', 'Liberte6', '2026-02-26 16:08:11.000000', 'COMPLETED', 'TXN-E16C8205', 'BUS', 'TR-4FD54C20', 5),
(20, 200.00, 'Lib5', '2026-02-27 09:36:36.000000', b'1', 'Lib6', '2026-02-27 09:36:35.000000', 'COMPLETED', 'TXN-FBDED799', 'BUS', 'TR-BF5EB849', 7),
(21, 200.00, 'Lib5', '2026-02-27 09:36:52.000000', b'1', 'Lib6', '2026-02-27 09:36:51.000000', 'COMPLETED', 'TXN-5FF6CD2E', 'BUS', 'TR-353E1AD5', 7),
(22, 800.00, 'Dakar', '2026-02-27 09:37:17.000000', b'1', 'Diamniadio', '2026-02-27 09:37:17.000000', 'COMPLETED', 'TXN-22C22DC9', 'TER', 'TR-59979019', 7),
(23, 500.00, 'petersen', '2026-02-27 09:42:10.000000', b'1', 'grd yoff', '2026-02-27 09:42:10.000000', 'COMPLETED', 'TXN-54327ADE', 'BRT', 'TR-CAEB3115', 7);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `trips`
--
ALTER TABLE `trips`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UKrseuy8v5yyiw1yi8axshyc9ih` (`trip_ref`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `trips`
--
ALTER TABLE `trips`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
