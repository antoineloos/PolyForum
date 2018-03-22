-- phpMyAdmin SQL Dump
-- version 4.4.14
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Mer 21 Mars 2018 à 20:06
-- Version du serveur :  5.6.26
-- Version de PHP :  5.5.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `polyforum`
--

-- --------------------------------------------------------

--
-- Structure de la table `candidat`
--

CREATE TABLE IF NOT EXISTS `candidat` (
  `id_candidat` int(11) NOT NULL,
  `nom` varchar(32) NOT NULL,
  `prenom` varchar(32) DEFAULT NULL,
  `trouve` tinyint(1) DEFAULT NULL,
  `present` tinyint(1) DEFAULT NULL,
  `login` varchar(32) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;

--
-- Contenu de la table `candidat`
--

INSERT INTO `candidat` (`id_candidat`, `nom`, `prenom`, `trouve`, `present`, `login`, `password`) VALUES
(8, 'audebert', 'florentin', 1, 1, 'olivier.penas@stoop.com', 'audebert0556'),
(9, 'Balligand', 'nicolas', 1, 1, 'olivier.penas@stoop.com', 'balligand7344'),
(10, 'gauthier', 'robin', 1, 1, 'olivier.penas@stoop.com', 'gauthier4372'),
(11, 'penas', 'olivier', 1, 1, 'olivier.penas@stoop.com', 'penas3735'),
(12, 'benrabaa', 'ylan', 1, 1, 'olivier.penas@stoop.com', 'benrabaa5645'),
(13, 'billon', 'guillaume', 1, 1, 'guillaume .billon@stoop.com', 'billon0543'),
(14, 'groleau', 'justine', 1, 1, 'guillaume.billon@stoop.com', 'groleau6121'),
(16, 'ruelle', 'benedicte', 1, 1, 'guillaume.billon@stoop.com', 'ruelle6623'),
(17, 'minard', 'clement', 1, 1, 'guillaume.billon@stoop.com', 'minard5773'),
(18, 'Pommel', 'Maxence', 1, 1, 'max.pommel@gmail.com', '6f3be1a98bb7e59632ed3c0810a66e8a047eec4bdcdaf32e597cd88f9b2d15a173913217c1d937cda2a699eb1546648c54ed97a310ceacca1697cb88c07765bd'),
(19, 'roger', 'virgil', 1, 1, 'guillaume.billon@stoop.com', 'roger5100'),
(20, 'nguyen', 'aisi', 1, 1, 'guillaume.billon@stoop.com', 'nguyen4405'),
(21, 'chemier', 'baptiste', 1, 1, 'guillaume.billon@stoop.com', 'chemier2346'),
(22, 'thomas', 'gauvain', 1, 1, 'guillaume.billon@stoop.com', 'thomas5721'),
(23, 'leur', 'franck', 1, 1, 'guillaume.billon@stoop.com', 'leur1114'),
(25, 'wils', 'aurelien', 1, 1, 'guillaume.billon@stoop.com', 'wils5371'),
(26, 'combes', 'joris', 1, 1, 'joris0994@gmail.com', 'combes4336');

-- --------------------------------------------------------

--
-- Structure de la table `choix_candidat`
--

CREATE TABLE IF NOT EXISTS `choix_candidat` (
  `id_candidat` int(11) NOT NULL,
  `id_entreprise` int(11) NOT NULL,
  `priorite` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `choix_candidat`
--

INSERT INTO `choix_candidat` (`id_candidat`, `id_entreprise`, `priorite`) VALUES
(8, 5, 3),
(8, 11, 4),
(9, 8, 4),
(9, 9, 3),
(9, 12, 5),
(9, 13, 6),
(10, 6, 6),
(10, 7, 4),
(10, 9, 5),
(11, 5, 5),
(11, 10, 6),
(11, 11, 4),
(11, 13, 3),
(12, 5, 8),
(12, 6, 6),
(12, 7, 5),
(12, 8, 7),
(12, 11, 9),
(12, 12, 4),
(13, 6, 3),
(13, 7, 4),
(13, 11, 5),
(14, 5, 4),
(14, 9, 3),
(14, 12, 6),
(16, 7, 3),
(16, 8, 5),
(16, 9, 4),
(16, 10, 7),
(17, 5, 5),
(17, 6, 6),
(17, 12, 4),
(17, 13, 3),
(18, 7, 8),
(18, 9, 3),
(18, 11, 9),
(19, 11, 7),
(19, 12, 6),
(19, 13, 5),
(20, 6, 3),
(21, 7, 4),
(21, 8, 7),
(21, 9, 6),
(21, 12, 3),
(21, 13, 5),
(22, 7, 6),
(22, 8, 4),
(22, 9, 8),
(22, 11, 5),
(23, 5, 3),
(23, 6, 4),
(23, 13, 5),
(25, 5, 6),
(25, 6, 4),
(25, 7, 7),
(25, 8, 3),
(25, 9, 9),
(25, 10, 8),
(25, 12, 5);

-- --------------------------------------------------------

--
-- Structure de la table `choix_entreprise`
--

CREATE TABLE IF NOT EXISTS `choix_entreprise` (
  `id_entreprise` int(11) NOT NULL,
  `id_candidat` int(11) NOT NULL,
  `temps_voulu` int(11) NOT NULL,
  `priorite` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `choix_entreprise`
--

INSERT INTO `choix_entreprise` (`id_entreprise`, `id_candidat`, `temps_voulu`, `priorite`) VALUES
(5, 9, 30, 3),
(5, 13, 20, 4),
(5, 14, 20, 5),
(5, 20, 20, 7),
(5, 22, 30, 8),
(5, 25, 35, 9),
(6, 8, 20, 8),
(6, 9, 20, 7),
(6, 10, 40, 6),
(6, 11, 20, 5),
(6, 12, 20, 9),
(6, 17, 20, 3),
(6, 22, 20, 4),
(7, 10, 20, 3),
(7, 11, 20, 4),
(7, 12, 20, 5),
(7, 17, 20, 6),
(7, 20, 20, 8),
(7, 25, 20, 7),
(8, 13, 30, 5),
(8, 14, 30, 4),
(8, 21, 20, 3),
(9, 16, 20, 4),
(9, 17, 30, 3),
(10, 19, 30, 3),
(10, 25, 30, 4),
(11, 9, 20, 17),
(11, 10, 20, 16),
(11, 11, 40, 12),
(11, 18, 40, 17),
(11, 21, 20, 15),
(11, 22, 30, 14),
(12, 25, 30, 3),
(13, 10, 40, 4),
(13, 19, 40, 3);

-- --------------------------------------------------------

--
-- Structure de la table `entreprise`
--

CREATE TABLE IF NOT EXISTS `entreprise` (
  `id_entreprise` int(11) NOT NULL,
  `nom` varchar(32) NOT NULL,
  `nom_representant` varchar(32) DEFAULT NULL,
  `present` tinyint(1) DEFAULT NULL,
  `login` varchar(32) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

--
-- Contenu de la table `entreprise`
--

INSERT INTO `entreprise` (`id_entreprise`, `nom`, `nom_representant`, `present`, `login`, `password`) VALUES
(5, 'Sopra', 'Joris', 1, 'guillaume.billon@entreprise.com', 'sopra0424'),
(6, 'CGI', 'Olivier', 1, 'guillaume.billon@entreprise.com', 'cgi5505'),
(7, 'Atos', 'Olivier', 1, 'guillaume.billon@entreprise.com', 'atos4451'),
(8, 'Volvo', 'Ylan', 1, 'guillaume.billon@entreprise.com', 'volvo5576'),
(9, 'Google', 'bene', 1, 'guillaume.billon@entreprise.com', 'google0631'),
(10, 'Skilvioo', 'Virigl', 1, 'guillaume.billon@entreprise.com', 'skilvioo3446'),
(11, 'Orange', 'Pommel Maxence', 1, 'maxpo69@live.fr', '6f3be1a98bb7e59632ed3c0810a66e8a047eec4bdcdaf32e597cd88f9b2d15a173913217c1d937cda2a699eb1546648c54ed97a310ceacca1697cb88c07765bd'),
(12, 'Solutec', 'Robin', 1, 'guillaume.billon@entreprise.com', 'solutec7133'),
(13, 'SFR', 'Aisi', 1, 'guillaume.billon@entreprise.com', 'sfr6116');

-- --------------------------------------------------------

--
-- Structure de la table `entretien`
--

CREATE TABLE IF NOT EXISTS `entretien` (
  `id_entreprise` int(11) NOT NULL,
  `id_candidat` int(11) NOT NULL,
  `heure` time NOT NULL,
  `heure_fin` time NOT NULL,
  `id_salle` int(11) NOT NULL DEFAULT '0',
  `present` tinyint(1) DEFAULT NULL,
  `retard` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `entretien`
--

INSERT INTO `entretien` (`id_entreprise`, `id_candidat`, `heure`, `heure_fin`, `id_salle`, `present`, `retard`) VALUES
(5, 9, '16:20:00', '16:50:00', 15, NULL, NULL),
(5, 13, '16:00:00', '16:20:00', 15, NULL, NULL),
(5, 14, '14:35:00', '14:55:00', 15, NULL, NULL),
(5, 20, '15:40:00', '16:00:00', 15, NULL, NULL),
(5, 22, '15:10:00', '15:40:00', 15, NULL, NULL),
(5, 25, '14:00:00', '14:35:00', 15, NULL, NULL),
(6, 8, '17:10:00', '17:30:00', 16, NULL, NULL),
(6, 9, '15:30:00', '15:50:00', 16, NULL, NULL),
(6, 10, '16:30:00', '17:10:00', 16, NULL, NULL),
(6, 11, '16:10:00', '16:30:00', 16, NULL, NULL),
(6, 12, '14:00:00', '14:20:00', 16, NULL, NULL),
(6, 17, '14:20:00', '14:40:00', 16, NULL, NULL),
(6, 22, '17:30:00', '17:50:00', 16, NULL, NULL),
(7, 10, '17:10:00', '17:30:00', 20, NULL, NULL),
(7, 11, '16:30:00', '16:50:00', 20, NULL, NULL),
(7, 12, '14:55:00', '15:15:00', 20, NULL, NULL),
(7, 17, '15:15:00', '15:35:00', 20, NULL, NULL),
(7, 20, '14:00:00', '14:20:00', 20, NULL, NULL),
(7, 25, '14:35:00', '14:55:00', 20, NULL, NULL),
(8, 13, '14:20:00', '14:50:00', 24, NULL, NULL),
(8, 14, '14:55:00', '15:25:00', 24, NULL, NULL),
(8, 21, '14:00:00', '14:20:00', 24, NULL, NULL),
(9, 16, '14:00:00', '14:20:00', 31, NULL, NULL),
(9, 17, '14:40:00', '15:10:00', 31, NULL, NULL),
(10, 19, '15:25:00', '15:55:00', 32, NULL, NULL),
(10, 25, '14:55:00', '15:25:00', 32, NULL, NULL),
(11, 9, '15:10:00', '15:30:00', 33, NULL, NULL),
(11, 10, '16:10:00', '16:30:00', 33, NULL, NULL),
(11, 11, '15:30:00', '16:10:00', 33, NULL, NULL),
(11, 18, '14:00:00', '14:40:00', 33, NULL, NULL),
(11, 21, '16:30:00', '16:50:00', 33, NULL, NULL),
(11, 22, '14:40:00', '15:10:00', 33, NULL, NULL),
(12, 25, '15:25:00', '15:55:00', 34, NULL, NULL),
(13, 10, '17:30:00', '18:10:00', 35, NULL, NULL),
(13, 19, '14:00:00', '14:40:00', 35, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `salle`
--

CREATE TABLE IF NOT EXISTS `salle` (
  `id_salle` int(11) NOT NULL,
  `nom` varchar(32) DEFAULT NULL,
  `disponible` tinyint(1) DEFAULT NULL,
  `capacite` int(11) NOT NULL,
  `capacite_totale` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=latin1;

--
-- Contenu de la table `salle`
--

INSERT INTO `salle` (`id_salle`, `nom`, `disponible`, `capacite`, `capacite_totale`) VALUES
(15, '15', 1, 0, 1),
(16, '16', 1, 0, 1),
(20, '20', 1, 0, 1),
(24, '24', 1, 0, 1),
(31, '31', 1, 0, 1),
(32, '32', 1, 0, 1),
(33, '33', 1, 0, 1),
(34, '34', 1, 0, 1),
(35, '35', 1, 0, 1),
(36, '36', 1, 1, 1),
(37, '37', 1, 1, 1),
(38, '38', 1, 1, 1),
(39, '39', 1, 1, 1),
(40, '40', 1, 1, 1),
(50, '50', 1, 1, 1),
(51, '51', 1, 1, 1),
(52, '52', 1, 1, 1);

--
-- Index pour les tables exportées
--

--
-- Index pour la table `candidat`
--
ALTER TABLE `candidat`
  ADD PRIMARY KEY (`id_candidat`);

--
-- Index pour la table `choix_candidat`
--
ALTER TABLE `choix_candidat`
  ADD PRIMARY KEY (`id_candidat`,`id_entreprise`),
  ADD KEY `FK_Choix_Candidat_Entreprise` (`id_entreprise`);

--
-- Index pour la table `choix_entreprise`
--
ALTER TABLE `choix_entreprise`
  ADD PRIMARY KEY (`id_entreprise`,`id_candidat`),
  ADD KEY `PK_Choix_Entreprise_Candidat` (`id_candidat`);

--
-- Index pour la table `entreprise`
--
ALTER TABLE `entreprise`
  ADD PRIMARY KEY (`id_entreprise`);

--
-- Index pour la table `entretien`
--
ALTER TABLE `entretien`
  ADD PRIMARY KEY (`id_entreprise`,`id_candidat`,`id_salle`),
  ADD KEY `PK_Entretien_Candidat` (`id_candidat`),
  ADD KEY `PK_Entretien_Salle` (`id_salle`);

--
-- Index pour la table `salle`
--
ALTER TABLE `salle`
  ADD PRIMARY KEY (`id_salle`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `candidat`
--
ALTER TABLE `candidat`
  MODIFY `id_candidat` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=27;
--
-- AUTO_INCREMENT pour la table `entreprise`
--
ALTER TABLE `entreprise`
  MODIFY `id_entreprise` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT pour la table `salle`
--
ALTER TABLE `salle`
  MODIFY `id_salle` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=58;
--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `choix_candidat`
--
ALTER TABLE `choix_candidat`
  ADD CONSTRAINT `FK_Choix_Candidat_Candidat` FOREIGN KEY (`id_candidat`) REFERENCES `candidat` (`id_candidat`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_Choix_Candidat_Entreprise` FOREIGN KEY (`id_entreprise`) REFERENCES `entreprise` (`id_entreprise`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `choix_entreprise`
--
ALTER TABLE `choix_entreprise`
  ADD CONSTRAINT `PK_Choix_Entreprise_Candidat` FOREIGN KEY (`id_candidat`) REFERENCES `candidat` (`id_candidat`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `PK_Choix_Entreprise_Entreprise` FOREIGN KEY (`id_entreprise`) REFERENCES `entreprise` (`id_entreprise`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `entretien`
--
ALTER TABLE `entretien`
  ADD CONSTRAINT `PK_Entretien_Candidat` FOREIGN KEY (`id_candidat`) REFERENCES `candidat` (`id_candidat`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `PK_Entretien_Entreprise` FOREIGN KEY (`id_entreprise`) REFERENCES `entreprise` (`id_entreprise`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `PK_Entretien_Salle` FOREIGN KEY (`id_salle`) REFERENCES `salle` (`id_salle`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
