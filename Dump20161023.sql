CREATE DATABASE  IF NOT EXISTS `polyforum` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `polyforum`;
-- MySQL dump 10.13  Distrib 5.6.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: polyforum
-- ------------------------------------------------------
-- Server version	5.5.32

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `candidat`
--

DROP TABLE IF EXISTS `candidat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `candidat` (
  `id_candidat` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(32) NOT NULL,
  `prenom` varchar(32) DEFAULT NULL,
  `trouve` tinyint(1) DEFAULT NULL,
  `present` tinyint(1) DEFAULT NULL,
  `login` varchar(32) DEFAULT NULL,
  `password` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id_candidat`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `candidat`
--

LOCK TABLES `candidat` WRITE;
/*!40000 ALTER TABLE `candidat` DISABLE KEYS */;
INSERT INTO `candidat` VALUES (1,'penas','olivier',1,1,'olivier','penas'),(2,'billon','Guillaume',1,1,'guillaume','billon'),(3,'benraba','Ylan',1,1,'ylan','benraba'),(4,'combes','joris',1,1,'combes','combes2500'),(5,'groleau','Justine',1,1,'justine','groleau'),(6,'Balligand','Nicolas',1,1,'Nicolas','Balligand');
/*!40000 ALTER TABLE `candidat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `choix_candidat`
--

DROP TABLE IF EXISTS `choix_candidat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `choix_candidat` (
  `id_candidat` int(11) NOT NULL,
  `id_entreprise` int(11) NOT NULL,
  `priorite` int(11) NOT NULL,
  PRIMARY KEY (`id_candidat`,`id_entreprise`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `choix_candidat`
--

LOCK TABLES `choix_candidat` WRITE;
/*!40000 ALTER TABLE `choix_candidat` DISABLE KEYS */;
INSERT INTO `choix_candidat` VALUES (1,1,3),(1,4,4),(2,1,1),(2,2,2),(2,3,3),(2,4,4),(3,1,4),(3,2,2),(3,3,3),(3,4,1);
/*!40000 ALTER TABLE `choix_candidat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `choix_entreprise`
--

DROP TABLE IF EXISTS `choix_entreprise`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `choix_entreprise` (
  `id_entreprise` int(11) NOT NULL,
  `id_candidat` int(11) NOT NULL,
  `temps_voulu` int(11) NOT NULL,
  `priorite` int(11) NOT NULL,
  PRIMARY KEY (`id_entreprise`,`id_candidat`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `choix_entreprise`
--

LOCK TABLES `choix_entreprise` WRITE;
/*!40000 ALTER TABLE `choix_entreprise` DISABLE KEYS */;
INSERT INTO `choix_entreprise` VALUES (1,1,30,3),(1,3,40,5),(1,5,15,4),(1,6,20,6),(2,2,30,4),(2,3,30,5),(2,6,20,6),(3,1,30,6),(3,2,30,5),(3,3,30,4),(3,4,30,3),(4,3,20,4),(4,4,30,5),(4,5,30,6);
/*!40000 ALTER TABLE `choix_entreprise` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entreprise`
--

DROP TABLE IF EXISTS `entreprise`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entreprise` (
  `id_entreprise` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(32) NOT NULL,
  `nom_representant` varchar(32) DEFAULT NULL,
  `present` tinyint(1) DEFAULT NULL,
  `login` varchar(32) DEFAULT NULL,
  `password` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id_entreprise`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entreprise`
--

LOCK TABLES `entreprise` WRITE;
/*!40000 ALTER TABLE `entreprise` DISABLE KEYS */;
INSERT INTO `entreprise` VALUES (1,'worldline','olivier',1,'worldline@test.fr','worldline'),(2,'CGI','Guillaume',1,'cgi','cgi'),(3,'Volvo','Ylan',1,'volvo','volvo'),(4,'Sopra','Joris',1,'sopra','sopra5243');
/*!40000 ALTER TABLE `entreprise` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entretien`
--

DROP TABLE IF EXISTS `entretien`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entretien` (
  `id_entreprise` int(11) NOT NULL,
  `id_candidat` int(11) NOT NULL,
  `heure` time NOT NULL,
  `heure_fin` time NOT NULL,
  `id_salle` varchar(32) DEFAULT NULL,
  `present` tinyint(1) DEFAULT NULL,
  `retard` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id_entreprise`,`id_candidat`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entretien`
--

LOCK TABLES `entretien` WRITE;
/*!40000 ALTER TABLE `entretien` DISABLE KEYS */;
INSERT INTO `entretien` VALUES (1,1,'16:20:00','16:50:00','15',1,0),(1,3,'14:00:00','14:40:00','15',1,0),(1,5,'16:50:00','17:05:00','15',1,0),(1,6,'16:00:00','16:20:00','15',1,0),(2,2,'16:00:00','16:30:00','15',1,0),(2,3,'15:10:00','15:40:00','15',1,0),(2,6,'15:40:00','16:00:00','15',1,0),(3,1,'15:10:00','15:40:00','16',1,0),(3,2,'14:00:00','14:30:00','16',1,0),(3,3,'14:40:00','15:10:00','16',1,0),(3,4,'15:40:00','16:10:00','16',1,0),(4,3,'15:40:00','16:00:00','20',1,0),(4,4,'14:30:00','15:00:00','20',1,0),(4,5,'14:00:00','14:30:00','20',1,0);
/*!40000 ALTER TABLE `entretien` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salle`
--

DROP TABLE IF EXISTS `salle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `salle` (
  `id_salle` int(11) NOT NULL AUTO_INCREMENT,
  `disponible` tinyint(1) DEFAULT NULL,
  `capacite` int(11) NOT NULL,
  PRIMARY KEY (`id_salle`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salle`
--

LOCK TABLES `salle` WRITE;
/*!40000 ALTER TABLE `salle` DISABLE KEYS */;
INSERT INTO `salle` VALUES (15,1,99999),(16,1,0),(20,1,0),(24,1,0);
/*!40000 ALTER TABLE `salle` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-10-23 15:40:42
