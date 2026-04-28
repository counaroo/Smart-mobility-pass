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
-- Base de données : `users_db`
--

-- --------------------------------------------------------

--
-- Structure de la table `mobility_passes`
--

CREATE TABLE `mobility_passes` (
  `id` bigint(20) NOT NULL,
  `expires_at` date DEFAULT NULL,
  `issued_at` datetime(6) DEFAULT NULL,
  `pass_number` varchar(255) NOT NULL,
  `pass_type` enum('PREMIUM','STANDARD') DEFAULT NULL,
  `qr_code` text DEFAULT NULL,
  `status` enum('ACTIVE','EXPIRED','SUSPENDED') DEFAULT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `mobility_passes`
--

INSERT INTO `mobility_passes` (`id`, `expires_at`, `issued_at`, `pass_number`, `pass_type`, `qr_code`, `status`, `user_id`) VALUES
(4, NULL, '2026-02-25 23:22:18.000000', 'MP-84055784', 'STANDARD', NULL, 'ACTIVE', 4),
(5, NULL, '2026-02-25 23:23:55.000000', 'MP-EA1E2736', 'STANDARD', NULL, 'ACTIVE', 5),
(7, NULL, '2026-02-26 13:27:46.000000', 'MP-1D209AF4', 'STANDARD', NULL, 'ACTIVE', 7);

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `role` enum('ADMIN','USER') DEFAULT NULL,
  `status` enum('ACTIVE','SUSPENDED') DEFAULT NULL,
  `total_trips` int(11) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `uuid` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `created_at`, `email`, `first_name`, `last_name`, `password_hash`, `phone`, `role`, `status`, `total_trips`, `updated_at`, `uuid`) VALUES
(4, '2026-02-25 23:22:18.000000', 'khadija.mohamed@esmt.sn', 'Khadija', 'Sadji', '$2a$10$p8TeILGjdqesxTVIC5SYbOMBjtBEA8u5PdOMmR9GxYbAsR2O0brX6', '771234567', 'USER', 'ACTIVE', 0, '2026-02-25 23:22:18.000000', '9fcd3458-b761-4d1f-82f8-46901f5d851b'),
(5, '2026-02-25 23:23:55.000000', 'fatima@gmail.com', 'Fatimaa', 'Sadji', '$2a$10$MpwJYv4u04d4qtNNVMtGJe5HC2GvEGqhnKzTsbykOMrH3G3anFc7K', '775564329', 'USER', 'ACTIVE', 1, '2026-02-26 16:08:11.000000', 'e9cb000b-be1a-4399-ac75-bf9d4267aa96'),
(7, '2026-02-26 13:27:46.000000', 'couro@gmail.com', 'Couro', 'Wane', '$2a$10$D.vtDJ5yF23esBoYaMzN9.bROirP4RWDqnIZzd.TzqOHQ0ON1gaIK', '776543212', 'USER', 'ACTIVE', 7, '2026-02-27 09:42:10.000000', '44dd9a7d-4005-4c6b-b1f8-7ee60838824e');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `mobility_passes`
--
ALTER TABLE `mobility_passes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UKfp7vsyxvormn4vo7p38eer5mq` (`pass_number`),
  ADD UNIQUE KEY `UK3ok1rnvdt6lsjcbk0skjlt6wj` (`user_id`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK6dotkott2kjsp8vw4d0m25fb7` (`email`),
  ADD UNIQUE KEY `UK6km2m9i3vjuy36rnvkgj1l61s` (`uuid`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `mobility_passes`
--
ALTER TABLE `mobility_passes`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `mobility_passes`
--
ALTER TABLE `mobility_passes`
  ADD CONSTRAINT `FKgk1est3s64qkctpb38426g883` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
