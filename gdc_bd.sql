-- phpMyAdmin SQL Dump
-- version 2.11.5
-- http://www.phpmyadmin.net
--
-- Serveur: localhost
-- Généré le : Ven 20 Avril 2018 à 23:24
-- Version du serveur: 5.0.51
-- Version de PHP: 5.2.5

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

--
-- Base de données: `gdc_bd`
--
CREATE DATABASE `gdc_bd` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `gdc_bd`;

-- --------------------------------------------------------

--
-- Structure de la table `ac`
--

CREATE TABLE `ac` (
  `CODEAC` varchar(128) NOT NULL,
  `CODECIEE` varchar(128) NOT NULL,
  `NOMAC` varchar(128) NOT NULL,
  `DV` int(2) default NULL,
  PRIMARY KEY  (`CODEAC`),
  KEY `I_FK_AC_CIEE` (`CODECIEE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `ac`
--


-- --------------------------------------------------------

--
-- Structure de la table `activite`
--

CREATE TABLE `activite` (
  `CODEACTIVITE` varchar(128) NOT NULL,
  `NOMACTIVITE` varchar(128) NOT NULL,
  `DATE` date NOT NULL,
  PRIMARY KEY  (`CODEACTIVITE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `activite`
--


-- --------------------------------------------------------

--
-- Structure de la table `ciee`
--

CREATE TABLE `ciee` (
  `CODECIEE` varchar(128) NOT NULL,
  `CODESITE` varchar(128) NOT NULL,
  `NOMCIEE` varchar(128) NOT NULL,
  PRIMARY KEY  (`CODECIEE`),
  KEY `I_FK_CIEE_SITE` (`CODESITE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `ciee`
--


-- --------------------------------------------------------

--
-- Structure de la table `ece`
--

CREATE TABLE `ece` (
  `CODEE` varchar(128) NOT NULL,
  `CODECIEE` varchar(128) NOT NULL,
  `NOME` varchar(128) NOT NULL,
  `PRENOME` varchar(128) default NULL,
  `DATENAIS` date NOT NULL,
  `SEXEE` varchar(128) NOT NULL,
  `PROFESSIONE` varchar(128) NOT NULL,
  PRIMARY KEY  (`CODEE`),
  KEY `I_FK_ECE_CIEE` (`CODECIEE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `ece`
--


-- --------------------------------------------------------

--
-- Structure de la table `organiser`
--

CREATE TABLE `organiser` (
  `CODEAC` varchar(128) NOT NULL,
  `CODEACTIVITE` varchar(128) NOT NULL,
  `DATE` date NOT NULL,
  `HD` varchar(128) NOT NULL,
  `HF` varchar(128) NOT NULL,
  `NBREF` char(32) NOT NULL,
  `NBREG` char(32) NOT NULL,
  `THEME` varchar(128) NOT NULL,
  PRIMARY KEY  (`CODEAC`,`CODEACTIVITE`),
  KEY `I_FK_ORGANISER_AC` (`CODEAC`),
  KEY `I_FK_ORGANISER_ACTIVITE` (`CODEACTIVITE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `organiser`
--


-- --------------------------------------------------------

--
-- Structure de la table `pe`
--

CREATE TABLE `pe` (
  `CODEPE` varchar(128) NOT NULL,
  `CODEAC` varchar(128) NOT NULL,
  `NOMPE` varchar(128) NOT NULL,
  `PRENOMPE` varchar(128) default NULL,
  `DATENAIS` date NOT NULL,
  `SEXEPE` varchar(128) NOT NULL,
  `PROFESSIONPE` varchar(128) NOT NULL,
  PRIMARY KEY  (`CODEPE`),
  KEY `I_FK_PE_AC` (`CODEAC`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `pe`
--


-- --------------------------------------------------------

--
-- Structure de la table `site`
--

CREATE TABLE `site` (
  `CODESITE` varchar(128) NOT NULL,
  `NOMSITE` varchar(128) NOT NULL,
  PRIMARY KEY  (`CODESITE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `site`
--


-- --------------------------------------------------------

--
-- Structure de la table `spe`
--

CREATE TABLE `spe` (
  `CODESPE` varchar(128) NOT NULL,
  `CODECIEE` varchar(128) NOT NULL,
  `NOMSPE` varchar(128) NOT NULL,
  `PRENOMSPE` varchar(128) default NULL,
  `DATENAIS` date NOT NULL,
  `SEXESPE` varchar(128) NOT NULL,
  `PROFESSIONSPE` varchar(128) NOT NULL,
  PRIMARY KEY  (`CODESPE`),
  KEY `I_FK_SPE_CIEE` (`CODECIEE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `spe`
--


-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL auto_increment,
  `user_name` varchar(100) NOT NULL,
  `email` varchar(100) default NULL,
  `login` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `gender` varchar(10) default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Contenu de la table `users`
--

INSERT INTO `users` (`id`, `user_name`, `email`, `login`, `password`, `gender`) VALUES
(1, 'Default User', 'yodeco@yodeco.me', 'yodeco', '1f1a9f24897b33f6870a60d80ceb7f00', 'Other');

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `ac`
--
ALTER TABLE `ac`
  ADD CONSTRAINT `ac_ibfk_1` FOREIGN KEY (`CODECIEE`) REFERENCES `ciee` (`CODECIEE`);

--
-- Contraintes pour la table `ciee`
--
ALTER TABLE `ciee`
  ADD CONSTRAINT `ciee_ibfk_1` FOREIGN KEY (`CODESITE`) REFERENCES `site` (`CODESITE`);

--
-- Contraintes pour la table `ece`
--
ALTER TABLE `ece`
  ADD CONSTRAINT `ece_ibfk_1` FOREIGN KEY (`CODECIEE`) REFERENCES `ciee` (`CODECIEE`);

--
-- Contraintes pour la table `organiser`
--
ALTER TABLE `organiser`
  ADD CONSTRAINT `organiser_ibfk_1` FOREIGN KEY (`CODEAC`) REFERENCES `ac` (`CODEAC`),
  ADD CONSTRAINT `organiser_ibfk_2` FOREIGN KEY (`CODEACTIVITE`) REFERENCES `activite` (`CODEACTIVITE`);

--
-- Contraintes pour la table `pe`
--
ALTER TABLE `pe`
  ADD CONSTRAINT `pe_ibfk_1` FOREIGN KEY (`CODEAC`) REFERENCES `ac` (`CODEAC`);

--
-- Contraintes pour la table `spe`
--
ALTER TABLE `spe`
  ADD CONSTRAINT `spe_ibfk_1` FOREIGN KEY (`CODECIEE`) REFERENCES `ciee` (`CODECIEE`);
