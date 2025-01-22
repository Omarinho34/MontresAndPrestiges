-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : jeu. 09 jan. 2025 à 22:47
-- Version du serveur : 8.2.0
-- Version de PHP : 8.2.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `montres&prestiges`
--
CREATE DATABASE IF NOT EXISTS `montres&prestiges` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `montres&prestiges`;

-- --------------------------------------------------------

--
-- Structure de la table `adresses`
--

DROP TABLE IF EXISTS `adresses`;
CREATE TABLE IF NOT EXISTS `adresses` (
  `id` int NOT NULL AUTO_INCREMENT,
  `numero_rue` varchar(10) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `adresse_ligne1` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `adresse_ligne2` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ville` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `code_postal` varchar(10) COLLATE utf8mb4_general_ci NOT NULL,
  `is_default` tinyint(1) DEFAULT '0',
  `utilisateur_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `utilisateur_id` (`utilisateur_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `adresses`
--

INSERT INTO `adresses` (`id`, `numero_rue`, `adresse_ligne1`, `adresse_ligne2`, `ville`, `code_postal`, `is_default`, `utilisateur_id`) VALUES
(1, '10', '123 Rue Exemple', 'Appartement 2', 'Paris', '75001', 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `avis`
--

DROP TABLE IF EXISTS `avis`;
CREATE TABLE IF NOT EXISTS `avis` (
  `id` int NOT NULL AUTO_INCREMENT,
  `utilisateur_id` int NOT NULL,
  `montre_id` int NOT NULL,
  `etoiles` int DEFAULT NULL,
  `commentaire` text COLLATE utf8mb4_general_ci,
  PRIMARY KEY (`id`),
  KEY `utilisateur_id` (`utilisateur_id`),
  KEY `montre_id` (`montre_id`)
) ;

--
-- Déchargement des données de la table `avis`
--

INSERT INTO `avis` (`id`, `utilisateur_id`, `montre_id`, `etoiles`, `commentaire`) VALUES
(1, 1, 1, 5, 'Excellente montre, je suis ravi de mon achat.');

-- --------------------------------------------------------

--
-- Structure de la table `commandes`
--

DROP TABLE IF EXISTS `commandes`;
CREATE TABLE IF NOT EXISTS `commandes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `status` int NOT NULL,
  `date_commande` date NOT NULL,
  `payment_id` int DEFAULT NULL,
  `adresse_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `adresse_id` (`adresse_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `commandes`
--

INSERT INTO `commandes` (`id`, `status`, `date_commande`, `payment_id`, `adresse_id`) VALUES
(1, 1, '2024-12-24', NULL, 1);

-- --------------------------------------------------------

--
-- Structure de la table `commande_details`
--

DROP TABLE IF EXISTS `commande_details`;
CREATE TABLE IF NOT EXISTS `commande_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `commande_id` int NOT NULL,
  `montre_id` int NOT NULL,
  `quantite` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `commande_id` (`commande_id`),
  KEY `montre_id` (`montre_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `commande_details`
--

INSERT INTO `commande_details` (`id`, `commande_id`, `montre_id`, `quantite`) VALUES
(1, 1, 1, 2);

-- --------------------------------------------------------

--
-- Structure de la table `couleurs`
--

DROP TABLE IF EXISTS `couleurs`;
CREATE TABLE IF NOT EXISTS `couleurs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `libelle` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `couleurs`
--

INSERT INTO `couleurs` (`id`, `libelle`) VALUES
(1, 'Noir'),
(2, 'Argenté');

-- --------------------------------------------------------

--
-- Structure de la table `genres`
--

DROP TABLE IF EXISTS `genres`;
CREATE TABLE IF NOT EXISTS `genres` (
  `id` int NOT NULL AUTO_INCREMENT,
  `libelle` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `genres`
--

INSERT INTO `genres` (`id`, `libelle`) VALUES
(1, 'Homme'),
(2, 'Femme');

-- --------------------------------------------------------

--
-- Structure de la table `marques`
--

DROP TABLE IF EXISTS `marques`;
CREATE TABLE IF NOT EXISTS `marques` (
  `id` int NOT NULL AUTO_INCREMENT,
  `libelle` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `marques`
--

INSERT INTO `marques` (`id`, `libelle`) VALUES
(1, 'Rolex'),
(2, 'Seiko');

-- --------------------------------------------------------

--
-- Structure de la table `matieres`
--

DROP TABLE IF EXISTS `matieres`;
CREATE TABLE IF NOT EXISTS `matieres` (
  `id` int NOT NULL AUTO_INCREMENT,
  `libelle` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `matieres`
--

INSERT INTO `matieres` (`id`, `libelle`) VALUES
(1, 'Acier inoxydable'),
(2, 'Cuir');

-- --------------------------------------------------------

--
-- Structure de la table `montres`
--

DROP TABLE IF EXISTS `montres`;
CREATE TABLE IF NOT EXISTS `montres` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `description` text COLLATE utf8mb4_general_ci,
  `date_ajout` date NOT NULL,
  `quantite` int NOT NULL,
  `prix` decimal(10,2) NOT NULL,
  `genre_id` int NOT NULL,
  `type_id` int NOT NULL,
  `matiere_id` int NOT NULL,
  `couleur_id` int NOT NULL,
  `mouvement_id` int NOT NULL,
  `marque_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `genre_id` (`genre_id`),
  KEY `type_id` (`type_id`),
  KEY `matiere_id` (`matiere_id`),
  KEY `couleur_id` (`couleur_id`),
  KEY `mouvement_id` (`mouvement_id`),
  KEY `marque_id` (`marque_id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `montres`
--

INSERT INTO `montres` (`id`, `nom`, `description`, `date_ajout`, `quantite`, `prix`, `genre_id`, `type_id`, `matiere_id`, `couleur_id`, `mouvement_id`, `marque_id`) VALUES
(1, 'Montre Sport', 'Montre sportive en acier inoxydable avec bracelet en caoutchouc', '2024-12-24', 10, 250.00, 1, 1, 1, 1, 1, 1),
(2, 'Rolex Submariner', 'Montre de plongée en acier inoxydable avec lunette rotative et cadran noir', '2024-12-25', 5, 8900.00, 1, 1, 1, 1, 2, 1),
(3, 'Seiko Prospex Diver', 'Montre de plongée automatique avec cadran noir et bracelet en acier inoxydable', '2024-12-25', 15, 450.00, 1, 1, 1, 1, 2, 2),
(4, 'Omega Speedmaster', 'Chronographe emblématique avec cadran noir et bracelet en acier inoxydable', '2024-12-25', 8, 6500.00, 1, 2, 1, 1, 2, 1),
(5, 'Tag Heuer Monaco', 'Montre carrée iconique avec cadran bleu et chronographe', '2024-12-25', 6, 7000.00, 1, 2, 1, 2, 2, 2),
(6, 'Cartier Tank Must', 'Montre rectangulaire élégante avec bracelet en cuir et mouvement à quartz', '2024-12-25', 10, 3200.00, 2, 2, 2, 2, 1, 1),
(7, 'Breitling Navitimer', 'Montre pour aviateurs avec cadran noir et règle à calcul circulaire', '2024-12-25', 4, 8500.00, 1, 2, 1, 1, 2, 1),
(8, 'Casio G-Shock GA-2100', 'Montre robuste avec design moderne, résistante aux chocs et à l’eau', '2024-12-25', 50, 150.00, 1, 1, 1, 1, 1, 2),
(9, 'Tissot PRX Powermatic 80', 'Montre élégante avec mouvement automatique et bracelet en acier inoxydable', '2024-12-25', 20, 700.00, 1, 2, 1, 2, 2, 1);

-- --------------------------------------------------------

--
-- Structure de la table `mouvements`
--

DROP TABLE IF EXISTS `mouvements`;
CREATE TABLE IF NOT EXISTS `mouvements` (
  `id` int NOT NULL AUTO_INCREMENT,
  `libelle` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `mouvements`
--

INSERT INTO `mouvements` (`id`, `libelle`) VALUES
(1, 'Quartz'),
(2, 'Mécanique');

-- --------------------------------------------------------

--
-- Structure de la table `paniers`
--

DROP TABLE IF EXISTS `paniers`;
CREATE TABLE IF NOT EXISTS `paniers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `utilisateur_id` int NOT NULL,
  `montre_id` int NOT NULL,
  `quantite` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `utilisateur_id` (`utilisateur_id`),
  KEY `montre_id` (`montre_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `paniers`
--

INSERT INTO `paniers` (`id`, `utilisateur_id`, `montre_id`, `quantite`) VALUES
(1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `promotions`
--

DROP TABLE IF EXISTS `promotions`;
CREATE TABLE IF NOT EXISTS `promotions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `description` text COLLATE utf8mb4_general_ci,
  `date_debut` date NOT NULL,
  `date_fin` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `promotions`
--

INSERT INTO `promotions` (`id`, `nom`, `description`, `date_debut`, `date_fin`) VALUES
(1, 'Promotion de Noël', 'Réduction de 20% pour Noël', '2024-12-01', '2024-12-31');

-- --------------------------------------------------------

--
-- Structure de la table `reductions`
--

DROP TABLE IF EXISTS `reductions`;
CREATE TABLE IF NOT EXISTS `reductions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `montre_id` int NOT NULL,
  `promotion_id` int NOT NULL,
  `reduction` decimal(5,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `montre_id` (`montre_id`),
  KEY `promotion_id` (`promotion_id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `reductions`
--

INSERT INTO `reductions` (`id`, `montre_id`, `promotion_id`, `reduction`) VALUES
(1, 1, 1, 20.00),
(2, 2, 1, 30.00),
(3, 2, 1, 30.00),
(4, 4, 1, 20.00),
(5, 4, 1, 20.00),
(6, 5, 1, 30.00),
(7, 5, 1, 30.00);

-- --------------------------------------------------------

--
-- Structure de la table `roles`
--

DROP TABLE IF EXISTS `roles`;
CREATE TABLE IF NOT EXISTS `roles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `libelle` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `roles`
--

INSERT INTO `roles` (`id`, `libelle`) VALUES
(1, 'Admin'),
(2, 'Utilisateur');

-- --------------------------------------------------------

--
-- Structure de la table `types`
--

DROP TABLE IF EXISTS `types`;
CREATE TABLE IF NOT EXISTS `types` (
  `id` int NOT NULL AUTO_INCREMENT,
  `libelle` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `types`
--

INSERT INTO `types` (`id`, `libelle`) VALUES
(1, 'Sport'),
(2, 'Classique');

-- --------------------------------------------------------

--
-- Structure de la table `utilisateurs`
--

DROP TABLE IF EXISTS `utilisateurs`;
CREATE TABLE IF NOT EXISTS `utilisateurs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `telephone` varchar(15) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `role_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  KEY `role_id` (`role_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `utilisateurs`
--

INSERT INTO `utilisateurs` (`id`, `email`, `telephone`, `password`, `role_id`) VALUES
(1, 'user1@example.com', '0123456789', 'password123', 2);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
