-- phpMyAdmin SQL Dump
-- version 4.1.12
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Dim 13 Novembre 2016 à 16:17
-- Version du serveur :  5.6.16
-- Version de PHP :  5.5.11

CREATE DATABASE  IF NOT EXISTS `polyforum`;
USE `polyforum`;



--
-- Base de données :  `polyforum`
--

-- --------------------------------------------------------

--
-- Structure de la table `candidat`
--

DROP TABLE IF EXISTS `CANDIDAT`;
CREATE TABLE IF NOT EXISTS `CANDIDAT` (
  `id_candidat` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(32) NOT NULL,
  `prenom` varchar(32) DEFAULT NULL,
  `trouve` tinyint(1) DEFAULT NULL,
  `present` tinyint(1) DEFAULT NULL,
  `login` varchar(32) DEFAULT NULL,
  `password` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id_candidat`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=27 ;

--
-- Contenu de la table `candidat`
--

INSERT INTO `CANDIDAT` (`id_candidat`, `nom`, `prenom`, `trouve`, `present`, `login`, `password`) VALUES
(8, 'audebert', 'florentin', 1, 1, 'olivier.penas@stoop.com', 'audebert0556'),
(9, 'Balligand', 'nicolas', 1, 1, 'olivier.penas@stoop.com', 'balligand7344'),
(10, 'gauthier', 'robin', 1, 1, 'olivier.penas@stoop.com', 'gauthier4372'),
(11, 'penas', 'olivier', 1, 1, 'olivier.penas@stoop.com', 'penas3735'),
(12, 'benrabaa', 'ylan', 1, 1, 'olivier.penas@stoop.com', 'benrabaa5645'),
(13, 'billon', 'guillaume', 1, 1, 'guillaume .billon@stoop.com', 'billon0543'),
(14, 'groleau', 'justine', 1, 1, 'guillaume.billon@stoop.com', 'groleau6121'),
(15, 'gomez', 'gwendoline', 1, 1, 'guillaume.billon@stoop.com', 'gomez3476'),
(16, 'ruelle', 'benedicte', 1, 1, 'guillaume.billon@stoop.com', 'ruelle6623'),
(17, 'minard', 'clement', 1, 1, 'guillaume.billon@stoop.com', 'minard5773'),
(18, 'pommel', 'maxence', 1, 1, 'guillaume.billon@stoop.com', 'pommel7755'),
(19, 'roger', 'virgil', 1, 1, 'guillaume.billon@stoop.com', 'roger5100'),
(20, 'nguyen', 'aisi', 1, 1, 'guillaume.billon@stoop.com', 'nguyen4405'),
(21, 'chemier', 'baptiste', 1, 1, 'guillaume.billon@stoop.com', 'chemier2346'),
(22, 'thomas', 'gauvain', 1, 1, 'guillaume.billon@stoop.com', 'thomas5721'),
(23, 'leur', 'franck', 1, 1, 'guillaume.billon@stoop.com', 'leur1114'),
(24, 'carlig', 'erwan', 1, 1, 'guillaume.billon@stoop.com', 'carlig7207'),
(25, 'wils', 'aurelien', 1, 1, 'guillaume.billon@stoop.com', 'wils5371'),
(26, 'combes', 'joris', 1, 1, 'joris0994@gmail.com', 'combes4336');

-- --------------------------------------------------------

--
-- Structure de la table `choix_candidat`
--

DROP TABLE IF EXISTS `CHOIX_CANDIDAT`;
CREATE TABLE IF NOT EXISTS `CHOIX_CANDIDAT` (
  `id_candidat` int(11) NOT NULL,
  `id_entreprise` int(11) NOT NULL,
  `priorite` int(11) NOT NULL,
  PRIMARY KEY (`id_candidat`,`id_entreprise`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `choix_candidat`
--

INSERT INTO `CHOIX_CANDIDAT` (`id_candidat`, `id_entreprise`, `priorite`) VALUES
(8, 5, 1),
(8, 11, 2),
(8, 14, 3),
(9, 8, 2),
(9, 9, 1),
(9, 12, 3),
(9, 13, 4),
(10, 6, 4),
(10, 7, 2),
(10, 9, 3),
(10, 14, 5),
(10, 15, 1),
(11, 5, 3),
(11, 10, 4),
(11, 11, 2),
(11, 13, 1),
(12, 5, 6),
(12, 6, 4),
(12, 7, 3),
(12, 8, 5),
(12, 11, 7),
(12, 12, 2),
(12, 15, 1),
(13, 6, 1),
(13, 7, 2),
(13, 11, 3),
(13, 15, 4),
(14, 5, 2),
(14, 9, 1),
(14, 12, 4),
(14, 14, 3),
(15, 5, 1),
(15, 6, 2),
(15, 11, 3),
(15, 15, 4),
(16, 7, 1),
(16, 8, 3),
(16, 9, 2),
(16, 10, 5),
(16, 14, 4),
(17, 5, 3),
(17, 6, 4),
(17, 12, 2),
(17, 13, 1),
(18, 9, 1),
(18, 10, 2),
(19, 11, 5),
(19, 12, 4),
(19, 13, 3),
(19, 14, 2),
(19, 15, 1),
(20, 6, 1),
(21, 7, 2),
(21, 8, 5),
(21, 9, 4),
(21, 12, 1),
(21, 13, 3),
(22, 7, 4),
(22, 8, 2),
(22, 9, 6),
(22, 11, 3),
(22, 14, 5),
(22, 15, 1),
(23, 5, 1),
(23, 6, 2),
(23, 13, 3),
(23, 14, 4),
(24, 5, 4),
(24, 6, 3),
(24, 7, 5),
(24, 8, 2),
(24, 9, 1),
(24, 15, 6),
(25, 5, 4),
(25, 6, 2),
(25, 7, 5),
(25, 8, 1),
(25, 9, 7),
(25, 10, 6),
(25, 12, 3),
(25, 14, 8);

-- --------------------------------------------------------

--
-- Structure de la table `choix_entreprise`
--

DROP TABLE IF EXISTS `CHOIX_ENTREPRISE`;
CREATE TABLE IF NOT EXISTS `CHOIX_ENTREPRISE` (
  `id_entreprise` int(11) NOT NULL,
  `id_candidat` int(11) NOT NULL,
  `temps_voulu` int(11) NOT NULL,
  `priorite` int(11) NOT NULL,
  PRIMARY KEY (`id_entreprise`,`id_candidat`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `choix_entreprise`
--

INSERT INTO `CHOIX_ENTREPRISE` (`id_entreprise`, `id_candidat`, `temps_voulu`, `priorite`) VALUES
(5, 9, 30, 1),
(5, 13, 20, 2),
(5, 14, 20, 3),
(5, 15, 15, 4),
(5, 20, 20, 5),
(5, 22, 30, 6),
(5, 25, 35, 7),
(6, 8, 20, 6),
(6, 9, 20, 5),
(6, 10, 40, 4),
(6, 11, 20, 3),
(6, 12, 20, 7),
(6, 17, 20, 1),
(6, 22, 20, 2),
(6, 24, 30, 8),
(7, 10, 20, 1),
(7, 11, 20, 2),
(7, 12, 20, 3),
(7, 17, 20, 4),
(7, 20, 20, 6),
(7, 25, 20, 5),
(8, 13, 30, 3),
(8, 14, 30, 2),
(8, 21, 20, 1),
(9, 16, 20, 2),
(9, 17, 30, 1),
(10, 19, 30, 1),
(10, 25, 30, 2),
(11, 11, 40, 1),
(11, 20, 20, 2),
(11, 21, 20, 4),
(11, 22, 30, 3),
(12, 15, 30, 2),
(12, 25, 30, 1),
(13, 10, 40, 2),
(13, 19, 40, 1),
(14, 10, 20, 1),
(14, 11, 20, 4),
(14, 14, 20, 3),
(14, 15, 20, 2),
(14, 16, 20, 6),
(14, 19, 20, 5),
(14, 21, 20, 7),
(14, 23, 20, 8),
(15, 9, 25, 1),
(15, 10, 25, 2),
(15, 12, 25, 3),
(15, 17, 25, 4),
(15, 20, 25, 5),
(15, 24, 25, 7),
(15, 25, 25, 8);

-- --------------------------------------------------------

--
-- Structure de la table `entreprise`
--

DROP TABLE IF EXISTS `ENTREPRISE`;
CREATE TABLE IF NOT EXISTS `ENTREPRISE` (
  `id_entreprise` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(32) NOT NULL,
  `nom_representant` varchar(32) DEFAULT NULL,
  `present` tinyint(1) DEFAULT NULL,
  `login` varchar(32) DEFAULT NULL,
  `password` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id_entreprise`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=16 ;

--
-- Contenu de la table `entreprise`
--

INSERT INTO `ENTREPRISE` (`id_entreprise`, `nom`, `nom_representant`, `present`, `login`, `password`) VALUES
(5, 'Sopra', 'Joris', 1, 'guillaume.billon@entreprise.com', 'sopra0424'),
(6, 'CGI', 'Olivier', 1, 'guillaume.billon@entreprise.com', 'cgi5505'),
(7, 'Atos', 'Olivier', 1, 'guillaume.billon@entreprise.com', 'atos4451'),
(8, 'Volvo', 'Ylan', 1, 'guillaume.billon@entreprise.com', 'volvo5576'),
(9, 'Google', 'bene', 1, 'guillaume.billon@entreprise.com', 'google0631'),
(10, 'Skilvioo', 'Virigl', 1, 'guillaume.billon@entreprise.com', 'skilvioo3446'),
(11, 'Orange', 'maxence', 1, 'guillaume.billon@entreprise.com', 'orange5063'),
(12, 'Solutec', 'Robin', 1, 'guillaume.billon@entreprise.com', 'solutec7133'),
(13, 'SFR', 'Aisi', 1, 'guillaume.billon@entreprise.com', 'sfr6116'),
(14, 'Steria', 'Thomas', 1, 'guillaume.billon@entreprise.com', 'steria3560'),
(15, 'wordline', 'clement', 1, 'guillaume.billon@entreprise.com', 'wordline2163');

-- --------------------------------------------------------

--
-- Structure de la table `entretien`
--

DROP TABLE IF EXISTS `ENTRETIEN`;
CREATE TABLE IF NOT EXISTS `ENTRETIEN` (
  `id_entreprise` int(11) NOT NULL,
  `id_candidat` int(11) NOT NULL,
  `heure` time NOT NULL,
  `heure_fin` time NOT NULL,
  `id_salle` varchar(32) DEFAULT NULL,
  `present` tinyint(1) DEFAULT NULL,
  `retard` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id_entreprise`,`id_candidat`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `entretien`
--

INSERT INTO `ENTRETIEN` (`id_entreprise`, `id_candidat`, `heure`, `heure_fin`, `id_salle`, `present`, `retard`) VALUES
(5, 9, '16:35:00', '17:05:00', '15', 1, 0),
(5, 13, '16:00:00', '16:20:00', '15', 1, 0),
(5, 14, '15:40:00', '16:00:00', '15', 1, 0),
(5, 15, '15:25:00', '15:40:00', '15', 1, 0),
(5, 20, '15:05:00', '15:25:00', '15', 1, 0),
(5, 22, '14:35:00', '15:05:00', '15', 1, 0),
(5, 25, '14:00:00', '14:35:00', '15', 1, 0),
(6, 8, '15:35:00', '15:55:00', '16', 1, 0),
(6, 9, '16:15:00', '16:35:00', '16', 1, 0),
(6, 10, '14:55:00', '15:35:00', '16', 1, 0),
(6, 11, '17:00:00', '17:20:00', '16', 1, 0),
(6, 12, '14:00:00', '14:20:00', '16', 1, 0),
(6, 17, '15:55:00', '16:15:00', '16', 1, 0),
(6, 22, '16:35:00', '16:55:00', '16', 1, 0),
(6, 24, '14:25:00', '14:55:00', '16', 1, 0),
(7, 10, '16:13:00', '16:33:00', '20', 1, 0),
(7, 11, '17:20:00', '17:40:00', '20', 1, 0),
(7, 12, '14:55:00', '15:15:00', '20', 1, 0),
(7, 17, '16:40:00', '17:00:00', '20', 1, 0),
(7, 20, '14:00:00', '14:20:00', '20', 1, 0),
(7, 25, '14:35:00', '14:55:00', '20', 1, 0),
(8, 13, '14:20:00', '14:50:00', '24', 1, 0),
(8, 14, '16:00:00', '16:30:00', '24', 1, 0),
(8, 21, '14:00:00', '14:20:00', '24', 1, 0),
(9, 16, '14:00:00', '14:20:00', '31', 1, 0),
(9, 17, '17:00:00', '17:30:00', '31', 1, 0),
(10, 19, '15:50:00', '16:20:00', '32', 1, 0),
(10, 25, '15:20:00', '15:50:00', '32', 1, 0),
(11, 11, '16:20:00', '17:00:00', '33', 1, 0),
(11, 20, '15:25:00', '15:45:00', '33', 1, 0),
(11, 21, '15:00:00', '15:20:00', '33', 1, 0),
(11, 22, '14:00:00', '14:30:00', '33', 1, 0),
(12, 15, '14:00:00', '14:30:00', '34', 1, 0),
(12, 25, '15:50:00', '16:20:00', '34', 1, 0),
(13, 10, '17:05:00', '17:45:00', '35', 1, 0),
(13, 19, '14:00:00', '14:40:00', '35', 1, 0),
(14, 10, '15:40:00', '16:00:00', '36', 1, 0),
(14, 11, '16:00:00', '16:20:00', '36', 1, 0),
(14, 14, '15:20:00', '15:40:00', '36', 1, 0),
(14, 15, '16:20:00', '16:40:00', '36', 1, 0),
(14, 16, '14:20:00', '14:40:00', '36', 1, 0),
(14, 19, '15:00:00', '15:20:00', '36', 1, 0),
(14, 21, '14:40:00', '15:00:00', '36', 1, 0),
(14, 23, '14:00:00', '14:20:00', '36', 1, 0),
(15, 9, '17:05:00', '17:30:00', '37', 1, 0),
(15, 10, '16:40:00', '17:05:00', '37', 1, 0),
(15, 12, '15:20:00', '15:45:00', '37', 1, 0),
(15, 17, '16:15:00', '16:40:00', '37', 1, 0),
(15, 20, '14:25:00', '14:50:00', '37', 1, 0),
(15, 24, '14:00:00', '14:25:00', '37', 1, 0),
(15, 25, '14:55:00', '15:20:00', '37', 1, 0);

-- --------------------------------------------------------

--
-- Structure de la table `salle`
--

DROP TABLE IF EXISTS `SALLE`;
CREATE TABLE IF NOT EXISTS `SALLE` (
  `id_salle` int(11) NOT NULL AUTO_INCREMENT,
  `disponible` tinyint(1) DEFAULT NULL,
  `capacite` int(11) NOT NULL,
  `capacite_totale` int(11) NOT NULL,
  PRIMARY KEY (`id_salle`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=55 ;

--
-- Contenu de la table `salle`
--

INSERT INTO `SALLE` (`id_salle`, `disponible`, `capacite`, `capacite_totale`) VALUES
(15, 1, 0, 1),
(16, 1, 0, 1),
(20, 1, 0, 1),
(24, 1, 0, 1),
(31, 1, 0, 1),
(32, 1, 0, 1),
(33, 1, 0, 1),
(34, 1, 0, 1),
(35, 1, 0, 1),
(36, 1, 0, 1),
(37, 1, 0, 1),
(38, 1, 1, 1),
(39, 1, 1, 1),
(40, 1, 1, 1),
(50, 1, 1, 1),
(51, 1, 1, 1),
(52, 1, 1, 1),
(53, 1, 1, 1),
(54, 1, 1, 1);

