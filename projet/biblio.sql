-- phpMyAdmin SQL Dump
-- version 5.2.1deb3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 01, 2025 at 10:03 PM
-- Server version: 8.0.42-0ubuntu0.24.04.1
-- PHP Version: 8.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `biblio`
--

-- --------------------------------------------------------

--
-- Table structure for table `auteur`
--

CREATE TABLE `auteur` (
  `id` int NOT NULL,
  `nom` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `biographie` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `date_de_naissance` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `auteur`
--

INSERT INTO `auteur` (`id`, `nom`, `biographie`, `date_de_naissance`) VALUES
(2, 'Eiichiro Oda ', 'Eiichiro Oda (Japanese: 尾田 栄一郎, Hepburn: Oda Eiichirō, born January 1, 1975) is a Japanese manga artist and the creator of the series One Piece', '2025-05-21'),
(3, 'Hajime Isayama', 'Attack on Titan is written and illustrated by Hajime Isayama. The series began in the first-ever issue of Kodansha\'s monthly publication Bessatsu Shōnen Magazine, released on September 9, 2009.', '2025-05-10'),
(4, 'Kentaro Miura ', 'Kentaro Miura (Japanese: 三浦 建太郎, Hepburn: Miura Kentarō, July 11, 1966 – May 6, 2021) was a Japanese manga artist. ', '2025-05-21'),
(5, 'Takehiko Inoue', 'Takehiko Inoue (井上 雄彦, Inoue Takehiko, born 12 January 1967) is a Japanese manga artist. He is best known for the basketball series Slam Dunk (1990–1996), and the jidaigeki manga Vagabond, ', '2025-05-30'),
(6, 'Masashi Kishimoto ', 'Masashi Kishimoto (岸本 斉史, Kishimoto Masashi, born November 8, 1974) is a Japanese manga artist', '2025-05-26'),
(7, 'George R. R. Martin', 'American author', '2020-01-29');

-- --------------------------------------------------------

--
-- Table structure for table `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20250513120652', '2025-05-13 12:07:09', 318);

-- --------------------------------------------------------

--
-- Table structure for table `emprunt`
--

CREATE TABLE `emprunt` (
  `id` int NOT NULL,
  `livre_id` int NOT NULL,
  `utilisateur_id` int NOT NULL,
  `date_emprunt` date NOT NULL,
  `date_retour` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `emprunt`
--

INSERT INTO `emprunt` (`id`, `livre_id`, `utilisateur_id`, `date_emprunt`, `date_retour`) VALUES
(15, 22, 25, '2025-05-17', '2025-05-27'),
(17, 22, 6, '2025-05-20', '2025-05-29'),
(18, 22, 28, '2025-05-20', '2025-05-24'),
(19, 22, 6, '2025-05-20', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `genre`
--

CREATE TABLE `genre` (
  `id` int NOT NULL,
  `nom` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `genre`
--

INSERT INTO `genre` (`id`, `nom`, `description`) VALUES
(1, 'narratif', 'naratif'),
(2, 'science fiction', 'science fiction'),
(4, 'life story', 'life story'),
(5, 'drama', 'drama'),
(6, 'manga', 'manga\r\n');

-- --------------------------------------------------------

--
-- Table structure for table `livre`
--

CREATE TABLE `livre` (
  `id` int NOT NULL,
  `auteur_id` int NOT NULL,
  `genre_id` int NOT NULL,
  `titre` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `isbn` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `disponible` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `livre`
--

INSERT INTO `livre` (`id`, `auteur_id`, `genre_id`, `titre`, `isbn`, `disponible`) VALUES
(22, 5, 6, 'vagabond', '423', 0),
(28, 2, 6, 'one piece', '1', 1),
(29, 3, 6, 'Attack on titan', '123', 0),
(30, 5, 6, 'berserk', '121', 1),
(31, 6, 6, 'naruto', '125-52-62', 1),
(32, 7, 2, 'song of ice and fire', '125-855-99', 1),
(33, 7, 2, 'fire and blood', '252', 1),
(34, 5, 5, 'testing', '111', 1);

-- --------------------------------------------------------

--
-- Table structure for table `messenger_messages`
--

CREATE TABLE `messenger_messages` (
  `id` bigint NOT NULL,
  `body` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `headers` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue_name` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `available_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `delivered_at` datetime DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `utilisateur`
--

CREATE TABLE `utilisateur` (
  `id` int NOT NULL,
  `nom` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` json NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `utilisateur`
--

INSERT INTO `utilisateur` (`id`, `nom`, `email`, `password`, `roles`) VALUES
(6, 'maram', 'gomri@gmail.com', '$2y$13$jP7d5r8celoigUdAdgm1AOnluIj3Gx4FmLipTI/9ESuQPbIT5ATza', '[\"ROLE_USER\"]'),
(13, 'test', 'test@gamil.com', '$2y$13$e7oL0QIZQfM2O2Z7AVcCveVJlOuLKccKIkBSaTL4fkD6m8qbCu5AS', '[\"ROLE_USER\"]'),
(22, 'admin', 'admin@gamil.com', '$2y$13$fnuu5w3wECvB1HGwG2q7oOS9ZBJR58LN6A/X02D0E26TDwy/p85Xq', '[\"ROLE_ADMIN\"]'),
(23, 'agents', 'agents@gamil.com', '$2y$13$cc31VTUwXXoLG1hbFVnSSe7MuccjjodLwGbXmDQwWLFAVosTECmuK', '[\"ROLE_AGENT\"]'),
(25, 'utilisateur', 'utilisateur@gamil.com', '$2y$13$ZsWMl0SqkFka3fNHrHSYZ.I3Pwns8nMachpabZwDgu0FAcF6qiNGq', '[\"ROLE_USER\"]'),
(27, 'teste', 'teste@gamil.com', '$2y$13$7WnV.2L3w0lJTnn8p95y2uYE/vpVoBz8YSNPlfMaj/QeLpGgIa7Iu', '[\"ROLE_USER\"]'),
(28, 'khalil', 'khalil@gamil.com', '$2y$13$x/iqFxpV1E.us4jnf4ogPO7itoNtNHVcCCX9xDpcOu.xkP14tTyZ6', '[\"ROLE_USER\"]'),
(29, 'firas', 'benarousfiras011@gmail.com', '$2y$13$PBRhJMAoELkKBV1n3jWnL.66yYzdbyZ4.2AzzdrGL1w39SI2o99su', '[\"ROLE_USER\", \"ROLE_AGENT\"]'),
(30, 'mehdii', 'mehdirokbani4@gmail.com', '$2y$13$Mhv1mVnlUeVeUEaxOpNgleDCvE2f.bBdgqBGUzWw.QThyg2s.XlTG', '[\"ROLE_ADMIN\"]'),
(31, 'mohtadi', 'mohtadi@gmail.com', '$2y$13$skrU4K6uRfDXToWUs3goZO3DCakenS2LemvhAbHfcihfJNqHB4wz2', '[\"ROLE_AGENT\"]'),
(32, 'test', 'test00@gmail.com', '$2y$13$a5uDs1i8KmNV0wImlTs.I.MxFDrybtOaHMaSPmpfAiwDV.bGdL.fi', '[\"ROLE_USER\"]');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auteur`
--
ALTER TABLE `auteur`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Indexes for table `emprunt`
--
ALTER TABLE `emprunt`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_364071D737D925CB` (`livre_id`),
  ADD KEY `IDX_364071D7FB88E14F` (`utilisateur_id`);

--
-- Indexes for table `genre`
--
ALTER TABLE `genre`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `livre`
--
ALTER TABLE `livre`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_AC634F9960BB6FE6` (`auteur_id`),
  ADD KEY `IDX_AC634F994296D31F` (`genre_id`);

--
-- Indexes for table `messenger_messages`
--
ALTER TABLE `messenger_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_75EA56E0FB7336F0` (`queue_name`),
  ADD KEY `IDX_75EA56E0E3BD61CE` (`available_at`),
  ADD KEY `IDX_75EA56E016BA31DB` (`delivered_at`);

--
-- Indexes for table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_1D1C63B3E7927C74` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auteur`
--
ALTER TABLE `auteur`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `emprunt`
--
ALTER TABLE `emprunt`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `genre`
--
ALTER TABLE `genre`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `livre`
--
ALTER TABLE `livre`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `messenger_messages`
--
ALTER TABLE `messenger_messages`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `utilisateur`
--
ALTER TABLE `utilisateur`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `emprunt`
--
ALTER TABLE `emprunt`
  ADD CONSTRAINT `FK_364071D7EC470631` FOREIGN KEY (`livre_id`) REFERENCES `livre` (`id`),
  ADD CONSTRAINT `FK_364071D7FB88E14F` FOREIGN KEY (`utilisateur_id`) REFERENCES `utilisateur` (`id`);

--
-- Constraints for table `livre`
--
ALTER TABLE `livre`
  ADD CONSTRAINT `FK_AC634F9975F8742E` FOREIGN KEY (`auteur_id`) REFERENCES `auteur` (`id`),
  ADD CONSTRAINT `FK_AC634F99C2428192` FOREIGN KEY (`genre_id`) REFERENCES `genre` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
