-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  mar. 03 oct. 2017 à 09:19
-- Version du serveur :  5.7.19
-- Version de PHP :  5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `snapat`
--

-- --------------------------------------------------------

--
-- Structure de la table `besoin`
--

DROP TABLE IF EXISTS `besoin`;
CREATE TABLE IF NOT EXISTS `besoin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(150) NOT NULL,
  `contactName` varchar(150) NOT NULL,
  `dateCreation` date NOT NULL,
  `fullDescription` varchar(200) NOT NULL,
  `duration` int(2) NOT NULL,
  `durationFrequence` int(2) NOT NULL,
  `startAtTheLatest` date NOT NULL,
  `location` varchar(150) NOT NULL,
  `rate` varchar(150) NOT NULL,
  `status` varchar(30) NOT NULL,
  `id_client` int(11) NOT NULL,
  `id_commercial` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_besoin_id_client` (`id_client`),
  KEY `FK_besoin_id_commercial` (`id_commercial`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `besoin`
--

INSERT INTO `besoin` (`id`, `title`, `contactName`, `dateCreation`, `fullDescription`, `duration`, `durationFrequence`, `startAtTheLatest`, `location`, `rate`, `status`, `id_client`, `id_commercial`) VALUES
(1, 'application mobile ', 'goedehaud valentin', '2017-10-03', 'description de l\'application mobile', 2, 4, '2017-10-03', 'Paris', '110 000', 'win', 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

DROP TABLE IF EXISTS `client`;
CREATE TABLE IF NOT EXISTS `client` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `urlLogo` varchar(150) DEFAULT NULL,
  `email` varchar(150) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `client`
--

INSERT INTO `client` (`id`, `name`, `urlLogo`, `email`) VALUES
(1, 'bnp paribas', 'jdiedi/djijdfjifdkkd/frdddsddss/fichier.png', 'bnpPariBas@bnp.com');

-- --------------------------------------------------------

--
-- Structure de la table `commercial`
--

DROP TABLE IF EXISTS `commercial`;
CREATE TABLE IF NOT EXISTS `commercial` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(150) DEFAULT NULL,
  `password` varchar(150) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `commercial`
--

INSERT INTO `commercial` (`id`, `login`, `password`) VALUES
(1, 'mickael.croquet', 'test'),
(2, 'dewaele.benoit', 'test');

-- --------------------------------------------------------

--
-- Structure de la table `consultant`
--

DROP TABLE IF EXISTS `consultant`;
CREATE TABLE IF NOT EXISTS `consultant` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  `id_besoin` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_consultant_id_besoin` (`id_besoin`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `consultant`
--

INSERT INTO `consultant` (`id`, `name`, `id_besoin`) VALUES
(1, 'geoffrey vanaerdewegh', 1),
(2, 'Alexis Samoy', 1);

-- --------------------------------------------------------

--
-- Structure de la table `file`
--

DROP TABLE IF EXISTS `file`;
CREATE TABLE IF NOT EXISTS `file` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(500) NOT NULL,
  `name` varchar(150) NOT NULL,
  `id_besoin` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_File_id_besoin` (`id_besoin`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `file`
--

INSERT INTO `file` (`id`, `url`, `name`, `id_besoin`) VALUES
(1, 'test/test/test/test.png', 'fichierTest.png', 1);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `besoin`
--
ALTER TABLE `besoin`
  ADD CONSTRAINT `FK_besoin_id_client` FOREIGN KEY (`id_client`) REFERENCES `client` (`id`),
  ADD CONSTRAINT `FK_besoin_id_commercial` FOREIGN KEY (`id_commercial`) REFERENCES `commercial` (`id`);

--
-- Contraintes pour la table `consultant`
--
ALTER TABLE `consultant`
  ADD CONSTRAINT `FK_consultant_id_besoin` FOREIGN KEY (`id_besoin`) REFERENCES `besoin` (`id`);

--
-- Contraintes pour la table `file`
--
ALTER TABLE `file`
  ADD CONSTRAINT `FK_File_id_besoin` FOREIGN KEY (`id_besoin`) REFERENCES `besoin` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
