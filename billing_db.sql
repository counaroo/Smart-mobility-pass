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
-- Base de données : `billing_db`
--

-- --------------------------------------------------------

--
-- Structure de la table `accounts`
--

CREATE TABLE `accounts` (
  `id` bigint(20) NOT NULL,
  `balance` decimal(12,2) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `daily_spent` decimal(10,2) DEFAULT NULL,
  `last_reset_date` date DEFAULT NULL,
  `status` enum('ACTIVE','CLOSED','FROZEN') DEFAULT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `accounts`
--

INSERT INTO `accounts` (`id`, `balance`, `created_at`, `daily_spent`, `last_reset_date`, `status`, `user_id`) VALUES
(1, 11800.00, '2026-02-25 23:44:08.000000', 2700.00, '2026-02-26', 'ACTIVE', 4),
(2, 5500.00, '2026-02-26 15:55:02.000000', 1700.00, '2026-02-27', 'ACTIVE', 7),
(3, 5000.00, '2026-02-26 16:01:39.000000', 0.00, NULL, 'ACTIVE', 8),
(4, 14800.00, '2026-02-26 16:02:08.000000', 200.00, '2026-02-26', 'ACTIVE', 5);

-- --------------------------------------------------------

--
-- Structure de la table `transactions`
--

CREATE TABLE `transactions` (
  `id` bigint(20) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `balance_after` decimal(12,2) DEFAULT NULL,
  `balance_before` decimal(12,2) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `is_fallback` bit(1) DEFAULT NULL,
  `status` enum('FAILED','PENDING','SUCCESS') DEFAULT NULL,
  `trip_ref` varchar(255) DEFAULT NULL,
  `txn_ref` varchar(255) NOT NULL,
  `type` enum('CREDIT','DEBIT','REFUND') NOT NULL,
  `account_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `transactions`
--

INSERT INTO `transactions` (`id`, `amount`, `balance_after`, `balance_before`, `created_at`, `is_fallback`, `status`, `trip_ref`, `txn_ref`, `type`, `account_id`) VALUES
(1, 500.00, 4500.00, 5000.00, '2026-02-25 23:44:17.000000', b'0', 'SUCCESS', 'TR-CCA2FCD6', 'TXN-067DFE5A', 'DEBIT', 1),
(2, 500.00, 4000.00, 4500.00, '2026-02-26 00:05:29.000000', b'0', 'SUCCESS', 'TR-0C0A90FF', 'TXN-3C1CF77F', 'DEBIT', 1),
(3, 500.00, 3500.00, 4000.00, '2026-02-26 00:09:58.000000', b'0', 'SUCCESS', 'TR-6D3EC8C0', 'TXN-97C20FC9', 'DEBIT', 1),
(4, 500.00, 3000.00, 3500.00, '2026-02-26 00:12:26.000000', b'0', 'SUCCESS', 'TR-FB5DF1B0', 'TXN-6D84F901', 'DEBIT', 1),
(5, 800.00, 2200.00, 3000.00, '2026-02-26 08:36:26.000000', b'0', 'SUCCESS', 'TR-FB7ED56B', 'TXN-F24F7645', 'DEBIT', 1),
(6, 200.00, 2000.00, 2200.00, '2026-02-26 08:49:07.000000', b'0', 'SUCCESS', 'TR-EA7925B7', 'TXN-A8AF1362', 'DEBIT', 1),
(7, 200.00, 1800.00, 2000.00, '2026-02-26 08:49:09.000000', b'0', 'SUCCESS', 'TR-3ECA6301', 'TXN-40C4BB9C', 'DEBIT', 1),
(8, 10000.00, 11800.00, 1800.00, '2026-02-26 08:51:15.000000', b'0', 'SUCCESS', NULL, 'TXN-BA25F4B3', 'CREDIT', 1),
(9, 500.00, 4500.00, 5000.00, '2026-02-26 15:56:35.000000', b'0', 'SUCCESS', 'TR-ECB7E515', 'TXN-283C3039', 'DEBIT', 2),
(10, 800.00, 3700.00, 4500.00, '2026-02-26 15:58:24.000000', b'0', 'SUCCESS', 'TR-0A3BF101', 'TXN-A9AC0224', 'DEBIT', 2),
(11, 200.00, 14800.00, 15000.00, '2026-02-26 16:08:11.000000', b'0', 'SUCCESS', 'TR-4FD54C20', 'TXN-E16C8205', 'DEBIT', 4),
(12, 2000.00, 5700.00, 3700.00, '2026-02-26 16:18:49.000000', b'0', 'SUCCESS', NULL, 'TXN-22A93F9A', 'CREDIT', 2),
(13, 500.00, 6200.00, 5700.00, '2026-02-26 16:18:56.000000', b'0', 'SUCCESS', NULL, 'TXN-AE56DA97', 'CREDIT', 2),
(14, 1000.00, 7200.00, 6200.00, '2026-02-26 16:29:53.000000', b'0', 'SUCCESS', NULL, 'TXN-981B5910', 'CREDIT', 2),
(15, 200.00, 7000.00, 7200.00, '2026-02-27 09:36:36.000000', b'0', 'SUCCESS', 'TR-BF5EB849', 'TXN-FBDED799', 'DEBIT', 2),
(16, 200.00, 6800.00, 7000.00, '2026-02-27 09:36:52.000000', b'0', 'SUCCESS', 'TR-353E1AD5', 'TXN-5FF6CD2E', 'DEBIT', 2),
(17, 800.00, 6000.00, 6800.00, '2026-02-27 09:37:17.000000', b'0', 'SUCCESS', 'TR-59979019', 'TXN-22C22DC9', 'DEBIT', 2),
(18, 500.00, 5500.00, 6000.00, '2026-02-27 09:42:10.000000', b'0', 'SUCCESS', 'TR-CAEB3115', 'TXN-54327ADE', 'DEBIT', 2);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UKe4w4av1wrhanry7t6mxt42nou` (`user_id`);

--
-- Index pour la table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UKg1pd4x3503x424htj46rvnq9m` (`txn_ref`),
  ADD KEY `FK20w7wsg13u9srbq3bd7chfxdh` (`account_id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `accounts`
--
ALTER TABLE `accounts`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `FK20w7wsg13u9srbq3bd7chfxdh` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
