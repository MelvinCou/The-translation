-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : dolibarr-mariadb:3306
-- Généré le : mar. 16 juil. 2024 à 14:12
-- Version du serveur : 10.8.8-MariaDB-1:10.8.8+maria~ubu2204
-- Version de PHP : 8.2.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `dolibarr`
--

-- --------------------------------------------------------

--
-- Structure de la table `llx_accounting_account`
--

CREATE TABLE `llx_accounting_account` (
  `rowid` bigint(20) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_pcg_version` varchar(32) NOT NULL,
  `pcg_type` varchar(20) NOT NULL,
  `account_number` varchar(32) NOT NULL,
  `account_parent` int(11) DEFAULT 0,
  `label` varchar(255) NOT NULL,
  `labelshort` varchar(255) DEFAULT NULL,
  `fk_accounting_category` int(11) DEFAULT 0,
  `fk_user_author` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1,
  `reconcilable` tinyint(4) NOT NULL DEFAULT 0,
  `import_key` varchar(14) DEFAULT NULL,
  `extraparams` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `llx_accounting_account`
--

INSERT INTO `llx_accounting_account` (`rowid`, `entity`, `datec`, `tms`, `fk_pcg_version`, `pcg_type`, `account_number`, `account_parent`, `label`, `labelshort`, `fk_accounting_category`, `fk_user_author`, `fk_user_modif`, `active`, `reconcilable`, `import_key`, `extraparams`) VALUES
(15000, 1, NULL, '2024-07-16 13:31:49', 'NSCF', 'CAPIT', '1', 0, 'Comptes de capitaux', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15001, 1, NULL, '2024-07-16 13:31:49', 'NSCF', 'CAPIT', '10', 17000, 'Capital, réserves et assimilés', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15002, 1, NULL, '2024-07-16 13:31:49', 'NSCF', 'CAPIT', '101', 15001, 'Capital émis', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15003, 1, NULL, '2024-07-16 13:31:49', 'NSCF', 'CAPIT', '1011', 15002, 'Capital souscrit, non appelé', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15004, 1, NULL, '2024-07-16 13:31:49', 'NSCF', 'CAPIT', '1012', 15002, 'Capital souscrit, appelé, non versé', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15005, 1, NULL, '2024-07-16 13:31:49', 'NSCF', 'CAPIT', '1013', 15002, 'Capital souscrit, appelé, versé', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15006, 1, NULL, '2024-07-16 13:31:49', 'NSCF', 'CAPIT', '10131', 15005, 'Capital non amorti', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15007, 1, NULL, '2024-07-16 13:31:49', 'NSCF', 'CAPIT', '10132', 15005, 'Capital amorti', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15008, 1, NULL, '2024-07-16 13:31:49', 'NSCF', 'CAPIT', '1018', 15002, 'Capital souscrit, soumis à des réglementations particulières', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15009, 1, NULL, '2024-07-16 13:31:49', 'NSCF', 'CAPIT', '103', 15001, 'Primes liées au capital social', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15010, 1, NULL, '2024-07-16 13:31:49', 'NSCF', 'CAPIT', '1031', 15009, 'Primes d\'émission', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15011, 1, NULL, '2024-07-16 13:31:49', 'NSCF', 'CAPIT', '1032', 15009, 'Primes de fusion', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15012, 1, NULL, '2024-07-16 13:31:49', 'NSCF', 'CAPIT', '1033', 15009, 'Primes d\'apport', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15013, 1, NULL, '2024-07-16 13:31:49', 'NSCF', 'CAPIT', '1034', 15009, 'Primes de conversion d\'obligations en actions', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15014, 1, NULL, '2024-07-16 13:31:49', 'NSCF', 'CAPIT', '104', 15001, 'Ecart d\'évaluation', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15015, 1, NULL, '2024-07-16 13:31:49', 'NSCF', 'CAPIT', '105', 15001, 'Ecart de réévaluation', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15016, 1, NULL, '2024-07-16 13:31:49', 'NSCF', 'CAPIT', '1050', 15015, 'Ecart de réévaluation : Immobilisations incorporelles', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15017, 1, NULL, '2024-07-16 13:31:49', 'NSCF', 'CAPIT', '10503', 15016, 'Ecart de réévaluation : Frais de recherche et de développement immobilisés', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15018, 1, NULL, '2024-07-16 13:31:49', 'NSCF', 'CAPIT', '10504', 15016, 'Ecart de réévaluation : Logiciels informatiques et assimilés', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15019, 1, NULL, '2024-07-16 13:31:49', 'NSCF', 'CAPIT', '10505', 15016, 'Ecart de réévaluation : Concessions et droits similaires, brevets, licences et marques', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15020, 1, NULL, '2024-07-16 13:31:49', 'NSCF', 'CAPIT', '10507', 15016, 'Ecarts de réévaluation : Fonds commercial – goodwill', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15021, 1, NULL, '2024-07-16 13:31:49', 'NSCF', 'CAPIT', '10508', 15016, 'Ecart de réévaluation : Immobilisations incorporelles', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15022, 1, NULL, '2024-07-16 13:31:49', 'NSCF', 'CAPIT', '1051', 15015, 'Ecart de réévaluation :Immobilisations corporelles', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15023, 1, NULL, '2024-07-16 13:31:49', 'NSCF', 'CAPIT', '10511', 15022, 'Ecart de réévaluation : Terrains', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15024, 1, NULL, '2024-07-16 13:31:49', 'NSCF', 'CAPIT', '10512', 15022, 'Ecart de réévaluation : Agencements et  aménagements de terrains', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15025, 1, NULL, '2024-07-16 13:31:49', 'NSCF', 'CAPIT', '10513', 15022, 'Ecart de réévaluation : Constructions', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15026, 1, NULL, '2024-07-16 13:31:49', 'NSCF', 'CAPIT', '10515', 15022, 'Ecarts de réévaluation : Installations techniques', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15027, 1, NULL, '2024-07-16 13:31:49', 'NSCF', 'CAPIT', '10518', 15022, 'Ecart de réévaluation : Autres Immobilisations corporelles', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15028, 1, NULL, '2024-07-16 13:31:49', 'NSCF', 'CAPIT', '1052', 15015, 'Ecart de réévaluation sur immobilisations financières', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15029, 1, NULL, '2024-07-16 13:31:49', 'NSCF', 'CAPIT', '10526', 15028, 'Ecart de réévaluation : Titres de filiale', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15030, 1, NULL, '2024-07-16 13:31:49', 'NSCF', 'CAPIT', '10527', 15028, 'Ecart de réévaluation : Autres immobilisations financières', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15031, 1, NULL, '2024-07-16 13:31:49', 'NSCF', 'CAPIT', '106', 15001, 'Réserves', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15032, 1, NULL, '2024-07-16 13:31:49', 'NSCF', 'CAPIT', '1061', 15031, 'Réserve légale', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15033, 1, NULL, '2024-07-16 13:31:49', 'NSCF', 'CAPIT', '1062', 15031, 'Réserve statutaire', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15034, 1, NULL, '2024-07-16 13:31:49', 'NSCF', 'CAPIT', '1063', 15031, 'Réserve ordinaire', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15035, 1, NULL, '2024-07-16 13:31:49', 'NSCF', 'CAPIT', '1064', 15031, 'Réserve réglementée', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15036, 1, NULL, '2024-07-16 13:31:49', 'NSCF', 'CAPIT', '10641', 15035, 'Réserve réglementée proprement dits', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15037, 1, NULL, '2024-07-16 13:31:49', 'NSCF', 'CAPIT', '10642', 15035, 'Plus-values nettes à long terme', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15038, 1, NULL, '2024-07-16 13:31:49', 'NSCF', 'CAPIT', '1068', 15031, 'Autres réserves', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15039, 1, NULL, '2024-07-16 13:31:49', 'NSCF', 'CAPIT', '107', 15001, 'Ecart d\'équivalence', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15040, 1, NULL, '2024-07-16 13:31:49', 'NSCF', 'CAPIT', '108', 15001, 'Compte de l\'exploitant', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15041, 1, NULL, '2024-07-16 13:31:49', 'NSCF', 'CAPIT', '109', 15001, 'Capital souscrit - non appelé (Solde débiteur à l\'actif du bilan)', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15042, 1, NULL, '2024-07-16 13:31:49', 'NSCF', 'CAPIT', '11', 17000, 'Report à nouveau (solde créditeur ou débiteur)', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15043, 1, NULL, '2024-07-16 13:31:49', 'NSCF', 'CAPIT', '110', 15042, 'Report à nouveau (solde créditeur)', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15044, 1, NULL, '2024-07-16 13:31:49', 'NSCF', 'CAPIT', '119', 15042, 'Report à nouveau (solde débiteur)', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15045, 1, NULL, '2024-07-16 13:31:49', 'NSCF', 'CAPIT', '12', 17000, 'Résultat de l\'exercice (bénéfice ou perte)', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15046, 1, NULL, '2024-07-16 13:31:49', 'NSCF', 'CAPIT', '120', 15045, 'Résultat de l\'exercice (bénéfice)', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15047, 1, NULL, '2024-07-16 13:31:49', 'NSCF', 'CAPIT', '129', 15045, 'Résultat de l\'exercice (perte)', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15048, 1, NULL, '2024-07-16 13:31:49', 'NSCF', 'CAPIT', '13', 17000, 'Produits et charges différés – hors cycle d\'exploitation', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15049, 1, NULL, '2024-07-16 13:31:49', 'NSCF', 'CAPIT', '131', 15048, 'Subventions d\'équipements', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15050, 1, NULL, '2024-07-16 13:31:49', 'NSCF', 'CAPIT', '1312', 15049, 'Subventions d\'équipements – Transfert gratuit d\'immobilisations', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15051, 1, NULL, '2024-07-16 13:31:50', 'NSCF', 'CAPIT', '1314', 15049, 'Subventions d\'équipements – Financement', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15052, 1, NULL, '2024-07-16 13:31:50', 'NSCF', 'CAPIT', '1319', 15049, 'Subventions d\'investissement inscrites au compte de résultat', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15053, 1, NULL, '2024-07-16 13:31:50', 'NSCF', 'CAPIT', '132', 15048, 'Autres subventions d\'investissements', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15054, 1, NULL, '2024-07-16 13:31:50', 'NSCF', 'CAPIT', '133', 15048, 'Impôts différés actif', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15055, 1, NULL, '2024-07-16 13:31:50', 'NSCF', 'CAPIT', '134', 15048, 'Impôts différés passif', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15056, 1, NULL, '2024-07-16 13:31:50', 'NSCF', 'CAPIT', '138', 15048, 'Autres produits et charges différés', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15057, 1, NULL, '2024-07-16 13:31:50', 'NSCF', 'CAPIT', '15', 17000, 'Provisions pour charges - passifs non courants', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15058, 1, NULL, '2024-07-16 13:31:50', 'NSCF', 'CAPIT', '153', 15057, 'Provisions pour pensions et obligations similaires', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15059, 1, NULL, '2024-07-16 13:31:50', 'NSCF', 'CAPIT', '155', 15057, 'Provisions pour impôts', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15060, 1, NULL, '2024-07-16 13:31:50', 'NSCF', 'CAPIT', '156', 15057, 'Provisions pour renouvellement des immobilisations en concession', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15061, 1, NULL, '2024-07-16 13:31:50', 'NSCF', 'CAPIT', '1560', 15060, 'Provisions pour renouvellement d\'immobilisation', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15062, 1, NULL, '2024-07-16 13:31:50', 'NSCF', 'CAPIT', '1562', 15060, 'Provisions pour renouvellement de gisements miniers', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15063, 1, NULL, '2024-07-16 13:31:50', 'NSCF', 'CAPIT', '158', 15057, 'Autres provisions pour charges – passifs non courants', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15064, 1, NULL, '2024-07-16 13:31:50', 'NSCF', 'CAPIT', '1581', 15063, 'Provisions réglementées relatives aux immobilisations', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15065, 1, NULL, '2024-07-16 13:31:50', 'NSCF', 'CAPIT', '1583', 15063, 'Provisions pour risques environnementaux', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15066, 1, NULL, '2024-07-16 13:31:50', 'NSCF', 'CAPIT', '16', 17000, 'Emprunts et dettes assimilées', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15067, 1, NULL, '2024-07-16 13:31:50', 'NSCF', 'CAPIT', '161', 15066, 'Titres participatifs', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15068, 1, NULL, '2024-07-16 13:31:50', 'NSCF', 'CAPIT', '162', 15066, 'Emprunts obligataires convertibles', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15069, 1, NULL, '2024-07-16 13:31:50', 'NSCF', 'CAPIT', '163', 15066, 'Autres emprunts obligataires', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15070, 1, NULL, '2024-07-16 13:31:50', 'NSCF', 'CAPIT', '164', 15066, 'Emprunts auprès des établissements de crédit', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15071, 1, NULL, '2024-07-16 13:31:50', 'NSCF', 'CAPIT', '165', 15066, 'Dépôts et cautionnements reçus', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15072, 1, NULL, '2024-07-16 13:31:50', 'NSCF', 'CAPIT', '1651', 15071, 'Dépôts reçus', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15073, 1, NULL, '2024-07-16 13:31:50', 'NSCF', 'CAPIT', '1655', 15071, 'Cautionnements reçus', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15074, 1, NULL, '2024-07-16 13:31:50', 'NSCF', 'CAPIT', '167', 15066, 'Dettes sur contrat de location - financement', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15075, 1, NULL, '2024-07-16 13:31:50', 'NSCF', 'CAPIT', '168', 15066, 'Autres emprunts et dettes assimilées', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15076, 1, NULL, '2024-07-16 13:31:50', 'NSCF', 'CAPIT', '1681', 15075, 'Autres emprunts', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15077, 1, NULL, '2024-07-16 13:31:50', 'NSCF', 'CAPIT', '1682', 15075, 'Emprunts auprès d\'organismes internationaux', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15078, 1, NULL, '2024-07-16 13:31:50', 'NSCF', 'CAPIT', '1688', 15075, 'Intérêts courus sur emprunts et dettes assimilés', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15079, 1, NULL, '2024-07-16 13:31:50', 'NSCF', 'CAPIT', '169', 15066, 'Primes de remboursement des obligations', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15080, 1, NULL, '2024-07-16 13:31:50', 'NSCF', 'CAPIT', '17', 17000, 'Dettes rattachées à des participations', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15081, 1, NULL, '2024-07-16 13:31:50', 'NSCF', 'CAPIT', '171', 15080, 'Dettes rattachées à des participations groupe', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15082, 1, NULL, '2024-07-16 13:31:50', 'NSCF', 'CAPIT', '172', 15080, 'Dettes rattachées à des participations hors groupe', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15083, 1, NULL, '2024-07-16 13:31:50', 'NSCF', 'CAPIT', '173', 15080, 'Dettes rattachées à des sociétés en participation', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15084, 1, NULL, '2024-07-16 13:31:50', 'NSCF', 'CAPIT', '1731', 15083, 'Principal', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15085, 1, NULL, '2024-07-16 13:31:50', 'NSCF', 'CAPIT', '1738', 15083, 'Intérêts courus', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15086, 1, NULL, '2024-07-16 13:31:50', 'NSCF', 'CAPIT', '178', 15080, 'Autres dettes rattachées à des participations', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15087, 1, NULL, '2024-07-16 13:31:50', 'NSCF', 'CAPIT', '18', 17000, 'Comptes de liaison des établissements et sociétés en participation', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15088, 1, NULL, '2024-07-16 13:31:50', 'NSCF', 'CAPIT', '187', 15087, 'Biens et prestations de services échangés entre établissements (produits)', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15089, 1, NULL, '2024-07-16 13:31:50', 'NSCF', 'CAPIT', '188', 15087, 'Comptes de liaison entre sociétés en participation', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15090, 1, NULL, '2024-07-16 13:31:50', 'NSCF', 'IMMO', '2', 0, 'COMPTES D\'IMMOBILISATIONS', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15091, 1, NULL, '2024-07-16 13:31:50', 'NSCF', 'IMMO', '20', 15090, 'Immobilisations incorporelles', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15092, 1, NULL, '2024-07-16 13:31:50', 'NSCF', 'IMMO', '203', 15091, 'Frais de développement immobilisables', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15093, 1, NULL, '2024-07-16 13:31:50', 'NSCF', 'IMMO', '204', 15091, 'Logiciels informatiques et assimilés', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15094, 1, NULL, '2024-07-16 13:31:50', 'NSCF', 'IMMO', '205', 15091, 'Concessions et droits similaires, brevets, licences, marques', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15095, 1, NULL, '2024-07-16 13:31:50', 'NSCF', 'IMMO', '2051', 15094, 'Logiciels', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15096, 1, NULL, '2024-07-16 13:31:50', 'NSCF', 'IMMO', '2052', 15094, 'Brevets', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15097, 1, NULL, '2024-07-16 13:31:50', 'NSCF', 'IMMO', '2053', 15094, 'Marques', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15098, 1, NULL, '2024-07-16 13:31:50', 'NSCF', 'IMMO', '2056', 15094, 'Licence', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15099, 1, NULL, '2024-07-16 13:31:50', 'NSCF', 'IMMO', '2058', 15094, 'Concession - autres droits similaires', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15100, 1, NULL, '2024-07-16 13:31:50', 'NSCF', 'IMMO', '207', 15091, 'Ecart d\'acquisition - goodwill', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15101, 1, NULL, '2024-07-16 13:31:50', 'NSCF', 'IMMO', '208', 15091, 'Autres immobilisations incorporelles', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15102, 1, NULL, '2024-07-16 13:31:50', 'NSCF', 'IMMO', '21', 15090, 'Immobilisations corporelles', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15103, 1, NULL, '2024-07-16 13:31:50', 'NSCF', 'IMMO', '211', 15102, 'Terrains', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15104, 1, NULL, '2024-07-16 13:31:50', 'NSCF', 'IMMO', '2110', 15103, 'Terrains de construction et chantiers', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15105, 1, NULL, '2024-07-16 13:31:50', 'NSCF', 'IMMO', '2111', 15103, 'Terrains nus', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15106, 1, NULL, '2024-07-16 13:31:50', 'NSCF', 'IMMO', '2112', 15103, 'Terrains aménagés', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15107, 1, NULL, '2024-07-16 13:31:50', 'NSCF', 'IMMO', '2114', 15103, 'Terrains bâtis', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15108, 1, NULL, '2024-07-16 13:31:50', 'NSCF', 'IMMO', '2115', 15103, 'Carrières et gisements', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15109, 1, NULL, '2024-07-16 13:31:50', 'NSCF', 'IMMO', '2118', 15103, 'Autres terrains', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15110, 1, NULL, '2024-07-16 13:31:50', 'NSCF', 'IMMO', '212', 15102, 'Agencements et aménagements de terrains (même ventilation que celle du compte 211)', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15111, 1, NULL, '2024-07-16 13:31:50', 'NSCF', 'IMMO', '213', 15102, 'Constructions', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15112, 1, NULL, '2024-07-16 13:31:50', 'NSCF', 'IMMO', '2131', 15111, 'Bâtiments', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15113, 1, NULL, '2024-07-16 13:31:50', 'NSCF', 'IMMO', '21311', 15112, 'Bâtiments industriels', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15114, 1, NULL, '2024-07-16 13:31:50', 'NSCF', 'IMMO', '21312', 15112, 'Bâtiments administratifs et commerciaux', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15115, 1, NULL, '2024-07-16 13:31:50', 'NSCF', 'IMMO', '21318', 15112, 'Autres ensembles immobiliers', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15116, 1, NULL, '2024-07-16 13:31:50', 'NSCF', 'IMMO', '213181', 15115, 'Affectés aux opérations professionnelles', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15117, 1, NULL, '2024-07-16 13:31:50', 'NSCF', 'IMMO', '213188', 15115, 'Affectés aux opérations non professionnelles', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15118, 1, NULL, '2024-07-16 13:31:50', 'NSCF', 'IMMO', '2135', 15111, 'Installations générales - agencements - aménagements des constructions', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15119, 1, NULL, '2024-07-16 13:31:50', 'NSCF', 'IMMO', '21351', 15118, 'Installation d\'eau', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15120, 1, NULL, '2024-07-16 13:31:50', 'NSCF', 'IMMO', '21352', 15118, 'Installation d\'électricité', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15121, 1, NULL, '2024-07-16 13:31:50', 'NSCF', 'IMMO', '21353', 15118, 'Installation de gaz', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15122, 1, NULL, '2024-07-16 13:31:50', 'NSCF', 'IMMO', '21354', 15118, 'Installation de vapeur', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15123, 1, NULL, '2024-07-16 13:31:50', 'NSCF', 'IMMO', '21355', 15118, 'Installation de protection et de sécurité', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15124, 1, NULL, '2024-07-16 13:31:50', 'NSCF', 'IMMO', '21356', 15118, 'Installation de télécommunication', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15125, 1, NULL, '2024-07-16 13:31:50', 'NSCF', 'IMMO', '21357', 15118, 'Installation d\'aération, chauffage et climatisation', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15126, 1, NULL, '2024-07-16 13:31:50', 'NSCF', 'IMMO', '21358', 15118, 'Autres agencements et installations', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15127, 1, NULL, '2024-07-16 13:31:50', 'NSCF', 'IMMO', '2138', 15111, 'Ouvrages d\'infrastructures', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15128, 1, NULL, '2024-07-16 13:31:50', 'NSCF', 'IMMO', '21381', 15127, 'Voies de terre', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15129, 1, NULL, '2024-07-16 13:31:50', 'NSCF', 'IMMO', '21382', 15127, 'Voies de fer', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15130, 1, NULL, '2024-07-16 13:31:50', 'NSCF', 'IMMO', '21383', 15127, 'Voies d\'eau', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15131, 1, NULL, '2024-07-16 13:31:50', 'NSCF', 'IMMO', '21384', 15127, 'Barrages - puits d\'eau', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15132, 1, NULL, '2024-07-16 13:31:50', 'NSCF', 'IMMO', '21385', 15127, 'Pistes d\'aérodromes', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15133, 1, NULL, '2024-07-16 13:31:50', 'NSCF', 'IMMO', '215', 15102, 'Installations techniques, matériel et outillage industriels', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15134, 1, NULL, '2024-07-16 13:31:50', 'NSCF', 'IMMO', '2151', 15133, 'Installations complexes spécialisées', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15135, 1, NULL, '2024-07-16 13:31:50', 'NSCF', 'IMMO', '2153', 15133, 'Installations à caractère spécifique', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15136, 1, NULL, '2024-07-16 13:31:50', 'NSCF', 'IMMO', '2154', 15133, 'Matériel industriel', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15137, 1, NULL, '2024-07-16 13:31:50', 'NSCF', 'IMMO', '2155', 15133, 'Outillage industriel', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15138, 1, NULL, '2024-07-16 13:31:50', 'NSCF', 'IMMO', '2157', 15133, 'Agencements et aménagements des matériels et outillage industriels', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15139, 1, NULL, '2024-07-16 13:31:50', 'NSCF', 'IMMO', '218', 15102, 'Autres immobilisations corporelles', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15140, 1, NULL, '2024-07-16 13:31:50', 'NSCF', 'IMMO', '2181', 15139, 'Installations générales, agencements, aménagements divers', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15141, 1, NULL, '2024-07-16 13:31:50', 'NSCF', 'IMMO', '2182', 15139, 'Matériel de transport', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15142, 1, NULL, '2024-07-16 13:31:50', 'NSCF', 'IMMO', '2183', 15139, 'Matériel de bureau et matériel informatique', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15143, 1, NULL, '2024-07-16 13:31:50', 'NSCF', 'IMMO', '2184', 15139, 'Mobilier', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15144, 1, NULL, '2024-07-16 13:31:50', 'NSCF', 'IMMO', '2185', 15139, 'Cheptel', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15145, 1, NULL, '2024-07-16 13:31:50', 'NSCF', 'IMMO', '2186', 15139, 'Emballages récupérables', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15146, 1, NULL, '2024-07-16 13:31:50', 'NSCF', 'IMMO', '22', 15090, 'Immobilisations mises en concession', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15147, 1, NULL, '2024-07-16 13:31:50', 'NSCF', 'IMMO', '221', 15146, 'Terrains en concession', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15148, 1, NULL, '2024-07-16 13:31:50', 'NSCF', 'IMMO', '222', 15146, 'Agencements et aménagements de terrains en concession', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15149, 1, NULL, '2024-07-16 13:31:50', 'NSCF', 'IMMO', '223', 15146, 'Constructions en concession', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15150, 1, NULL, '2024-07-16 13:31:50', 'NSCF', 'IMMO', '225', 15146, 'Installations techniques en concession', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15151, 1, NULL, '2024-07-16 13:31:50', 'NSCF', 'IMMO', '228', 15146, 'Autres immobilisations corporelles en concession', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15152, 1, NULL, '2024-07-16 13:31:50', 'NSCF', 'IMMO', '229', 15146, 'Droits du concédant', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15153, 1, NULL, '2024-07-16 13:31:50', 'NSCF', 'IMMO', '23', 15090, 'Immobilisations en cours', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15154, 1, NULL, '2024-07-16 13:31:50', 'NSCF', 'IMMO', '232', 15153, 'Immobilisations corporelles en cours', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15155, 1, NULL, '2024-07-16 13:31:50', 'NSCF', 'IMMO', '2322', 15154, 'Agencements et aménagements de Terrains en cours', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15156, 1, NULL, '2024-07-16 13:31:50', 'NSCF', 'IMMO', '2323', 15154, 'Constructions en cours', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15157, 1, NULL, '2024-07-16 13:31:50', 'NSCF', 'IMMO', '2325', 15154, 'Installations techniques, matériel et outillage industriels en cours', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15158, 1, NULL, '2024-07-16 13:31:50', 'NSCF', 'IMMO', '2328', 15154, 'Autres immobilisations corporelles en cours', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15159, 1, NULL, '2024-07-16 13:31:50', 'NSCF', 'IMMO', '237', 15153, 'Immobilisations incorporelles en cours', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15160, 1, NULL, '2024-07-16 13:31:50', 'NSCF', 'IMMO', '238', 15153, 'Avances et acomptes versés sur commandes d\'immobilisations', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15161, 1, NULL, '2024-07-16 13:31:50', 'NSCF', 'IMMO', '2382', 15160, 'Avances et acomptes versés sur commandes d\'immobilisations corporelles', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15162, 1, NULL, '2024-07-16 13:31:50', 'NSCF', 'IMMO', '2387', 15160, 'Avances et acomptes versés sur commandes d\'immobilisations incorporelles', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15163, 1, NULL, '2024-07-16 13:31:50', 'NSCF', 'IMMO', '26', 15090, 'Participations et créances rattachées à des participations (entreprises associées)', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15164, 1, NULL, '2024-07-16 13:31:50', 'NSCF', 'IMMO', '261', 15163, 'Titres de filiales', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15165, 1, NULL, '2024-07-16 13:31:50', 'NSCF', 'IMMO', '2611', 15164, 'Actions', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15166, 1, NULL, '2024-07-16 13:31:50', 'NSCF', 'IMMO', '2618', 15164, 'Autres titres', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15167, 1, NULL, '2024-07-16 13:31:50', 'NSCF', 'IMMO', '262', 15163, 'Autres titres de participation', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15168, 1, NULL, '2024-07-16 13:31:50', 'NSCF', 'IMMO', '265', 15163, 'Titres de participation évalués par équivalence', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15169, 1, NULL, '2024-07-16 13:31:50', 'NSCF', 'IMMO', '266', 15163, 'Créances rattachées à des participations groupe', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15170, 1, NULL, '2024-07-16 13:31:50', 'NSCF', 'IMMO', '2661', 15169, 'Créances liées à des participations groupe', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15171, 1, NULL, '2024-07-16 13:31:50', 'NSCF', 'IMMO', '2665', 15169, 'Versements représentatifs d\'apports non capitalisés (appel de fonds)', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15172, 1, NULL, '2024-07-16 13:31:50', 'NSCF', 'IMMO', '2666', 15169, 'Avances consolidables', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15173, 1, NULL, '2024-07-16 13:31:50', 'NSCF', 'IMMO', '2668', 15169, 'Dividendes à percevoir', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15174, 1, NULL, '2024-07-16 13:31:50', 'NSCF', 'IMMO', '267', 15163, 'Créances rattachées à des participations hors groupe', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15175, 1, NULL, '2024-07-16 13:31:50', 'NSCF', 'IMMO', '2671', 15174, 'Créances liées à des participations hors groupe', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15176, 1, NULL, '2024-07-16 13:31:50', 'NSCF', 'IMMO', '2675', 15174, 'Versements représentatifs d\'apports non capitalisés (appel de fonds)', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15177, 1, NULL, '2024-07-16 13:31:50', 'NSCF', 'IMMO', '2676', 15174, 'Avances consolidables', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15178, 1, NULL, '2024-07-16 13:31:50', 'NSCF', 'IMMO', '2677', 15174, 'Autres créances rattachées à des participations hors groupe', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15179, 1, NULL, '2024-07-16 13:31:50', 'NSCF', 'IMMO', '2678', 15174, 'Dividendes et intérêts à percevoir', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15180, 1, NULL, '2024-07-16 13:31:50', 'NSCF', 'IMMO', '268', 15163, 'Créances rattachées à des sociétés en participation', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15181, 1, NULL, '2024-07-16 13:31:50', 'NSCF', 'IMMO', '2681', 15180, 'Principal', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15182, 1, NULL, '2024-07-16 13:31:50', 'NSCF', 'IMMO', '2688', 15180, 'Intérêts courus', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15183, 1, NULL, '2024-07-16 13:31:50', 'NSCF', 'IMMO', '269', 15163, 'Versements restant à effectuer sur titres de participation non libérés', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15184, 1, NULL, '2024-07-16 13:31:50', 'NSCF', 'IMMO', '27', 15090, 'Autres immobilisations financières', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15185, 1, NULL, '2024-07-16 13:31:50', 'NSCF', 'IMMO', '271', 15184, 'Titres immobilisés autres que les titres immobilisés de l\'activité de portefeuille', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15186, 1, NULL, '2024-07-16 13:31:50', 'NSCF', 'IMMO', '2711', 15185, 'Actions', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15187, 1, NULL, '2024-07-16 13:31:50', 'NSCF', 'IMMO', '2718', 15185, 'Autres titres', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15188, 1, NULL, '2024-07-16 13:31:50', 'NSCF', 'IMMO', '272', 15184, 'Titres représentatifs de droit de créance', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15189, 1, NULL, '2024-07-16 13:31:50', 'NSCF', 'IMMO', '2721', 15188, 'Obligations', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15190, 1, NULL, '2024-07-16 13:31:50', 'NSCF', 'IMMO', '2722', 15188, 'Bons', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15191, 1, NULL, '2024-07-16 13:31:50', 'NSCF', 'IMMO', '273', 15184, 'Titres immobilisés de l\'activité de portefeuille', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15192, 1, NULL, '2024-07-16 13:31:50', 'NSCF', 'IMMO', '2731', 15191, 'Actions immobilisées de l\'activité de portefeuille', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15193, 1, NULL, '2024-07-16 13:31:50', 'NSCF', 'IMMO', '2732', 15191, 'Obligations remboursables en actions', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15194, 1, NULL, '2024-07-16 13:31:50', 'NSCF', 'IMMO', '2733', 15191, 'Obligations convertibles en actions', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15195, 1, NULL, '2024-07-16 13:31:50', 'NSCF', 'IMMO', '274', 15184, 'Prêts et créances sur contrat de location – financement', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15196, 1, NULL, '2024-07-16 13:31:50', 'NSCF', 'IMMO', '2741', 15195, 'Prêts participatifs', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15197, 1, NULL, '2024-07-16 13:31:50', 'NSCF', 'IMMO', '2742', 15195, 'Prêts aux associés', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15198, 1, NULL, '2024-07-16 13:31:50', 'NSCF', 'IMMO', '2743', 15195, 'Prêts au personnel', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15199, 1, NULL, '2024-07-16 13:31:50', 'NSCF', 'IMMO', '2745', 15195, 'Créances sur contrat de location - financement', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15200, 1, NULL, '2024-07-16 13:31:50', 'NSCF', 'IMMO', '2748', 15195, 'Autres prêts', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15201, 1, NULL, '2024-07-16 13:31:50', 'NSCF', 'IMMO', '275', 15184, 'Dépôts et cautionnements versés', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15202, 1, NULL, '2024-07-16 13:31:50', 'NSCF', 'IMMO', '2751', 15201, 'Dépôts', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15203, 1, NULL, '2024-07-16 13:31:50', 'NSCF', 'IMMO', '2755', 15201, 'Cautionnements', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15204, 1, NULL, '2024-07-16 13:31:50', 'NSCF', 'IMMO', '276', 15184, 'Autres créances immobilisées', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15205, 1, NULL, '2024-07-16 13:31:50', 'NSCF', 'IMMO', '2761', 15204, 'Créances diverses', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15206, 1, NULL, '2024-07-16 13:31:50', 'NSCF', 'IMMO', '2768', 15204, 'Intérêts courus', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15207, 1, NULL, '2024-07-16 13:31:50', 'NSCF', 'IMMO', '27682', 15206, 'Autres créances sur titres immobilisés (droit de créance)', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15208, 1, NULL, '2024-07-16 13:31:50', 'NSCF', 'IMMO', '27684', 15206, 'Autres créances sur prêts', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15209, 1, NULL, '2024-07-16 13:31:50', 'NSCF', 'IMMO', '27685', 15206, 'Autres créances sur dépôts et cautionnements', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15210, 1, NULL, '2024-07-16 13:31:50', 'NSCF', 'IMMO', '27688', 15206, 'Autres créances sur créances diverses', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15211, 1, NULL, '2024-07-16 13:31:50', 'NSCF', 'IMMO', '279', 15184, 'Versements restant à effectuer sur titres immobilisés non libérés', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15212, 1, NULL, '2024-07-16 13:31:50', 'NSCF', 'IMMO', '28', 15090, 'Amortissement des immobilisations', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15213, 1, NULL, '2024-07-16 13:31:50', 'NSCF', 'IMMO', '280', 15212, 'Amortissement des immobilisations incorporelles', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15214, 1, NULL, '2024-07-16 13:31:50', 'NSCF', 'IMMO', '2803', 15213, 'Amortissement des frais de recherche et de développement immobilisables', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15215, 1, NULL, '2024-07-16 13:31:50', 'NSCF', 'IMMO', '2804', 15213, 'Amortissement. des logiciels informatiques et assimilés', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15216, 1, NULL, '2024-07-16 13:31:50', 'NSCF', 'IMMO', '2805', 15213, 'Amortissement concessions et droits similaires, brevets, licences, marques.', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15217, 1, NULL, '2024-07-16 13:31:50', 'NSCF', 'IMMO', '2807', 15213, 'Amortissement écart d\'acquisition - Goodwill', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15218, 1, NULL, '2024-07-16 13:31:50', 'NSCF', 'IMMO', '2808', 15213, 'Amortissement autres immobilisations incorporelles', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15219, 1, NULL, '2024-07-16 13:31:50', 'NSCF', 'IMMO', '281', 15212, 'Amortissement des immobilisations corporelles', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15220, 1, NULL, '2024-07-16 13:31:50', 'NSCF', 'IMMO', '2812', 15219, 'Amortissement des agencements et aménagement de terrains', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15221, 1, NULL, '2024-07-16 13:31:50', 'NSCF', 'IMMO', '2813', 15219, 'Amortissement des constructions', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15222, 1, NULL, '2024-07-16 13:31:50', 'NSCF', 'IMMO', '2815', 15219, 'Amortissement des installations techniques', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15223, 1, NULL, '2024-07-16 13:31:50', 'NSCF', 'IMMO', '2818', 15219, 'Amortissement des autres immobilisations corporelles', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15224, 1, NULL, '2024-07-16 13:31:50', 'NSCF', 'IMMO', '282', 15212, 'Amortissement des immobilisations mises en concession', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15225, 1, NULL, '2024-07-16 13:31:50', 'NSCF', 'IMMO', '29', 15090, 'Pertes de valeur sur immobilisations', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15226, 1, NULL, '2024-07-16 13:31:50', 'NSCF', 'IMMO', '290', 15225, 'Pertes de valeur sur immobilisations incorporelles', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15227, 1, NULL, '2024-07-16 13:31:50', 'NSCF', 'IMMO', '2903', 15226, 'Pertes de valeurs sur frais de recherche et de développement immobilisables', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15228, 1, NULL, '2024-07-16 13:31:50', 'NSCF', 'IMMO', '2904', 15226, 'Pertes de valeur sur logiciels informatiques et assimilés', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15229, 1, NULL, '2024-07-16 13:31:50', 'NSCF', 'IMMO', '2905', 15226, 'Pertes de valeur sur concessions et droits similaires, brevets, licences, marques.', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15230, 1, NULL, '2024-07-16 13:31:50', 'NSCF', 'IMMO', '2907', 15226, 'Pertes de valeur sur écart d\'acquisition – Goodwill', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15231, 1, NULL, '2024-07-16 13:31:50', 'NSCF', 'IMMO', '2908', 15226, 'Pertes de valeur sur autres immobilisations incorporelles', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15232, 1, NULL, '2024-07-16 13:31:50', 'NSCF', 'IMMO', '291', 15225, 'Pertes de valeurs sur immobilisations corporelles', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15233, 1, NULL, '2024-07-16 13:31:50', 'NSCF', 'IMMO', '2912', 15232, 'Pertes de valeur sur agencements et aménagements de terrains', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15234, 1, NULL, '2024-07-16 13:31:50', 'NSCF', 'IMMO', '2913', 15232, 'Pertes de valeur sur constructions', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15235, 1, NULL, '2024-07-16 13:31:50', 'NSCF', 'IMMO', '2915', 15232, 'Pertes de valeur sur installations techniques', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15236, 1, NULL, '2024-07-16 13:31:50', 'NSCF', 'IMMO', '2918', 15232, 'Pertes de valeur sur autres immobilisations corporelles', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15237, 1, NULL, '2024-07-16 13:31:50', 'NSCF', 'IMMO', '292', 15225, 'Pertes de valeur sur immobilisations mises en concession', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15238, 1, NULL, '2024-07-16 13:31:50', 'NSCF', 'IMMO', '293', 15225, 'Pertes de valeur sur immobilisations en cours', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15239, 1, NULL, '2024-07-16 13:31:50', 'NSCF', 'IMMO', '2931', 15238, 'Pertes de valeur sur immobilisations corporelles en cours', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15240, 1, NULL, '2024-07-16 13:31:50', 'NSCF', 'IMMO', '2932', 15238, 'Pertes de valeur sur immobilisations incorporelles en cours', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15241, 1, NULL, '2024-07-16 13:31:50', 'NSCF', 'IMMO', '296', 15225, 'Pertes de valeur sur participations et créances rattachées', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15242, 1, NULL, '2024-07-16 13:31:50', 'NSCF', 'IMMO', '2961', 15241, 'Pertes de valeur sur titres de filiales', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15243, 1, NULL, '2024-07-16 13:31:50', 'NSCF', 'IMMO', '2962', 15241, 'Pertes de valeur sur autres formes de participations', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15244, 1, NULL, '2024-07-16 13:31:50', 'NSCF', 'IMMO', '2965', 15241, 'Pertes de valeur sur titres de participations évalués par équivalence', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15245, 1, NULL, '2024-07-16 13:31:50', 'NSCF', 'IMMO', '2966', 15241, 'Pertes de valeur sur créances rattachées à des participations groupe', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15246, 1, NULL, '2024-07-16 13:31:50', 'NSCF', 'IMMO', '2967', 15241, 'Pertes de valeur sur créances rattachées à des participations hors groupe', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15247, 1, NULL, '2024-07-16 13:31:50', 'NSCF', 'IMMO', '2968', 15241, 'Pertes de valeur sur créances rattachées à des sociétés en participations', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15248, 1, NULL, '2024-07-16 13:31:50', 'NSCF', 'IMMO', '297', 15225, 'Pertes de valeur sur autres titres immobilisés', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15249, 1, NULL, '2024-07-16 13:31:50', 'NSCF', 'IMMO', '2971', 15248, 'Pertes de valeur sur titres immobilisés autres que les titres immobilisés autres que TIAP (droits de propriété)', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15250, 1, NULL, '2024-07-16 13:31:50', 'NSCF', 'IMMO', '2972', 15248, 'Pertes de valeur sur titres représentatifs de droit de créance', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15251, 1, NULL, '2024-07-16 13:31:50', 'NSCF', 'IMMO', '2973', 15248, 'Pertes de valeur sur titres immobilisés de l\'activité de portefeuille', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15252, 1, NULL, '2024-07-16 13:31:50', 'NSCF', 'IMMO', '2974', 15248, 'Pertes de valeur sur contrat de location – financement', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15253, 1, NULL, '2024-07-16 13:31:50', 'NSCF', 'IMMO', '2975', 15248, 'Pertes de valeur sur dépôts et cautionnements versés', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15254, 1, NULL, '2024-07-16 13:31:50', 'NSCF', 'IMMO', '2976', 15248, 'Pertes de valeur sur autres créances immobilisées', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15255, 1, NULL, '2024-07-16 13:31:50', 'NSCF', 'IMMO', '298', 15225, 'Pertes de valeur sur autres instruments financiers', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15256, 1, NULL, '2024-07-16 13:31:50', 'NSCF', 'STOCK', '3', 0, 'COMPTES DE STOCKS ET ENCOURS', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15257, 1, NULL, '2024-07-16 13:31:50', 'NSCF', 'STOCK', '30', 15256, 'Stocks de marchandises', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15258, 1, NULL, '2024-07-16 13:31:51', 'NSCF', 'STOCK', '31', 15256, 'Matières premières et fournitures', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15259, 1, NULL, '2024-07-16 13:31:51', 'NSCF', 'STOCK', '311', 15258, 'Matières (ou groupe) A', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15260, 1, NULL, '2024-07-16 13:31:51', 'NSCF', 'STOCK', '312', 15258, 'Matières (ou groupe) B', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15261, 1, NULL, '2024-07-16 13:31:51', 'NSCF', 'STOCK', '313', 15258, 'Matières ...', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15262, 1, NULL, '2024-07-16 13:31:51', 'NSCF', 'STOCK', '32', 15256, 'Autres approvisionnements', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15263, 1, NULL, '2024-07-16 13:31:51', 'NSCF', 'STOCK', '321', 15262, 'Matières consommables', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15264, 1, NULL, '2024-07-16 13:31:51', 'NSCF', 'STOCK', '322', 15262, 'Fournitures consommables', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15265, 1, NULL, '2024-07-16 13:31:51', 'NSCF', 'STOCK', '326', 15262, 'Emballages', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15266, 1, NULL, '2024-07-16 13:31:51', 'NSCF', 'STOCK', '3261', 15265, 'Emballages perdus', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15267, 1, NULL, '2024-07-16 13:31:51', 'NSCF', 'STOCK', '3265', 15265, 'Emballages récupérables non identifiables', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15268, 1, NULL, '2024-07-16 13:31:51', 'NSCF', 'STOCK', '3267', 15265, 'Emballages à usage mixte', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15269, 1, NULL, '2024-07-16 13:31:51', 'NSCF', 'STOCK', '33', 15256, 'En-cours de production de biens', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15270, 1, NULL, '2024-07-16 13:31:51', 'NSCF', 'STOCK', '331', 15269, 'Produits en cours', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15271, 1, NULL, '2024-07-16 13:31:51', 'NSCF', 'STOCK', '335', 15269, 'Travaux en cours', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15272, 1, NULL, '2024-07-16 13:31:51', 'NSCF', 'STOCK', '34', 15256, 'En-cours de production de services', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15273, 1, NULL, '2024-07-16 13:31:51', 'NSCF', 'STOCK', '341', 15272, 'Etudes en cours', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15274, 1, NULL, '2024-07-16 13:31:51', 'NSCF', 'STOCK', '345', 15272, 'Prestations de services en cours', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15275, 1, NULL, '2024-07-16 13:31:51', 'NSCF', 'STOCK', '35', 15256, 'Stocks de produits', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15276, 1, NULL, '2024-07-16 13:31:51', 'NSCF', 'STOCK', '351', 15275, 'Produits intermédiaires', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15277, 1, NULL, '2024-07-16 13:31:51', 'NSCF', 'STOCK', '355', 15275, 'Produits finis', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15278, 1, NULL, '2024-07-16 13:31:51', 'NSCF', 'STOCK', '358', 15275, 'Produits résiduels ou matières de récupération', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15279, 1, NULL, '2024-07-16 13:31:51', 'NSCF', 'STOCK', '3581', 15278, 'Déchets', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15280, 1, NULL, '2024-07-16 13:31:51', 'NSCF', 'STOCK', '3585', 15278, 'Rebuts', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15281, 1, NULL, '2024-07-16 13:31:51', 'NSCF', 'STOCK', '3586', 15278, 'Matières de récupération', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15282, 1, NULL, '2024-07-16 13:31:51', 'NSCF', 'STOCK', '36', 15256, 'Stocks provenant d\'immobilisations', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15283, 1, NULL, '2024-07-16 13:31:51', 'NSCF', 'STOCK', '37', 15256, 'Stocks à l\'extérieur', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15284, 1, NULL, '2024-07-16 13:31:51', 'NSCF', 'STOCK', '370', 15283, 'Stocks de marchandises l\'extérieur', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15285, 1, NULL, '2024-07-16 13:31:51', 'NSCF', 'STOCK', '3700', 15284, 'Stocks en cours de route', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15286, 1, NULL, '2024-07-16 13:31:51', 'NSCF', 'STOCK', '3701', 15284, 'Stocks de marchandises en dépôt à l\'extérieur', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15287, 1, NULL, '2024-07-16 13:31:51', 'NSCF', 'STOCK', '3702', 15284, 'Stocks de marchandises en consignation à l\'extérieur', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15288, 1, NULL, '2024-07-16 13:31:51', 'NSCF', 'STOCK', '371', 15283, 'Stocks de matières premières et fournitures à l\'extérieur', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15289, 1, NULL, '2024-07-16 13:31:51', 'NSCF', 'STOCK', '375', 15283, 'Stocks de produits à l\'extérieur', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15290, 1, NULL, '2024-07-16 13:31:51', 'NSCF', 'STOCK', '38', 15256, 'Achats stockés', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15291, 1, NULL, '2024-07-16 13:31:51', 'NSCF', 'STOCK', '380', 15290, 'Marchandises stockées', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15292, 1, NULL, '2024-07-16 13:31:51', 'NSCF', 'STOCK', '381', 15290, 'Matières premières et fournitures stockées', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15293, 1, NULL, '2024-07-16 13:31:51', 'NSCF', 'STOCK', '382', 15290, 'Autres approvisionnements stockés', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15294, 1, NULL, '2024-07-16 13:31:51', 'NSCF', 'STOCK', '39', 15256, 'Pertes de valeur sur stocks et en cours', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15295, 1, NULL, '2024-07-16 13:31:51', 'NSCF', 'STOCK', '390', 15294, 'Pertes de valeur sur stocks de marchandises', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15296, 1, NULL, '2024-07-16 13:31:51', 'NSCF', 'STOCK', '391', 15294, 'Pertes de valeur sur matières premières et fournitures de biens', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15297, 1, NULL, '2024-07-16 13:31:51', 'NSCF', 'STOCK', '392', 15294, 'Pertes de valeur sur autres approvisionnements', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15298, 1, NULL, '2024-07-16 13:31:51', 'NSCF', 'STOCK', '393', 15294, 'Pertes de valeur sur en-cours de production de de biens', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15299, 1, NULL, '2024-07-16 13:31:51', 'NSCF', 'STOCK', '394', 15294, 'Pertes de valeur sur en-cours de production de de services', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15300, 1, NULL, '2024-07-16 13:31:51', 'NSCF', 'STOCK', '395', 15294, 'Pertes de valeur sur stocks de produits', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15301, 1, NULL, '2024-07-16 13:31:51', 'NSCF', 'STOCK', '397', 15294, 'Pertes de valeur sur stocks à l\'extérieur', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15302, 1, NULL, '2024-07-16 13:31:51', 'NSCF', 'THIRDPARTY', '4', 0, 'COMPTES DE TIERS', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15303, 1, NULL, '2024-07-16 13:31:51', 'NSCF', 'THIRDPARTY', '40', 15302, 'Fournisseurs et comptes rattachés', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15304, 1, NULL, '2024-07-16 13:31:51', 'NSCF', 'THIRDPARTY', '401', 15303, 'Fournisseurs de stocks et services', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15305, 1, NULL, '2024-07-16 13:31:51', 'NSCF', 'THIRDPARTY', '4011', 15304, 'Fournisseurs - Achats de biens et prestations de services', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15306, 1, NULL, '2024-07-16 13:31:51', 'NSCF', 'THIRDPARTY', '4017', 15304, 'Fournisseurs - Retenues de garantie', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15307, 1, NULL, '2024-07-16 13:31:51', 'NSCF', 'THIRDPARTY', '403', 15303, 'Fournisseurs - Effets à payer', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15308, 1, NULL, '2024-07-16 13:31:51', 'NSCF', 'THIRDPARTY', '404', 15303, 'Fournisseurs d\'immobilisations', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15309, 1, NULL, '2024-07-16 13:31:51', 'NSCF', 'THIRDPARTY', '4041', 15308, 'Fournisseurs - Achats d\'immobilisations', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15310, 1, NULL, '2024-07-16 13:31:51', 'NSCF', 'THIRDPARTY', '4047', 15308, 'Fournisseurs d\'immobilisations – Retenues de garantie', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15311, 1, NULL, '2024-07-16 13:31:51', 'NSCF', 'THIRDPARTY', '405', 15303, 'Fournisseurs d\'immobilisations - Effets à payer', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15312, 1, NULL, '2024-07-16 13:31:51', 'NSCF', 'THIRDPARTY', '408', 15303, 'Fournisseurs - factures non parvenues', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15313, 1, NULL, '2024-07-16 13:31:51', 'NSCF', 'THIRDPARTY', '4081', 15312, 'Fournisseurs de stocks - Factures non parvenues', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15314, 1, NULL, '2024-07-16 13:31:51', 'NSCF', 'THIRDPARTY', '4084', 15312, 'Fournisseurs d\'immobilisations – Factures non parvenues', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15315, 1, NULL, '2024-07-16 13:31:51', 'NSCF', 'THIRDPARTY', '4088', 15312, 'Fournisseurs - Intérêts courus', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15316, 1, NULL, '2024-07-16 13:31:51', 'NSCF', 'THIRDPARTY', '409', 15303, 'Fournisseurs débiteurs', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15317, 1, NULL, '2024-07-16 13:31:51', 'NSCF', 'THIRDPARTY', '4091', 15316, 'Fournisseurs - Avances et acomptes versés sur commandes', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15318, 1, NULL, '2024-07-16 13:31:51', 'NSCF', 'THIRDPARTY', '4096', 15316, 'Fournisseurs - Créances pour emballages et matériel à rendre ', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15319, 1, NULL, '2024-07-16 13:31:51', 'NSCF', 'THIRDPARTY', '4097', 15316, 'Fournisseurs - Autres avoirs', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15320, 1, NULL, '2024-07-16 13:31:51', 'NSCF', 'THIRDPARTY', '4098', 15316, 'Rabais, remises, ristournes à obtenir et autres avoirs non encore reçus', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15321, 1, NULL, '2024-07-16 13:31:51', 'NSCF', 'THIRDPARTY', '41', 15302, 'Clients et comptes rattachés', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15322, 1, NULL, '2024-07-16 13:31:51', 'NSCF', 'THIRDPARTY', '411', 15321, 'Clients', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15323, 1, NULL, '2024-07-16 13:31:51', 'NSCF', 'THIRDPARTY', '4111', 15322, 'Clients - Ventes de biens ou de prestations de services', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15324, 1, NULL, '2024-07-16 13:31:51', 'NSCF', 'THIRDPARTY', '4117', 15322, 'Clients - Retenues de garantie', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15325, 1, NULL, '2024-07-16 13:31:51', 'NSCF', 'THIRDPARTY', '413', 15321, 'Clients - Effets à recevoir', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15326, 1, NULL, '2024-07-16 13:31:51', 'NSCF', 'THIRDPARTY', '416', 15321, 'Clients douteux (litigieux)', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15327, 1, NULL, '2024-07-16 13:31:51', 'NSCF', 'THIRDPARTY', '417', 15321, 'Créances sur travaux ou prestations en cours', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15328, 1, NULL, '2024-07-16 13:31:51', 'NSCF', 'THIRDPARTY', '418', 15321, 'Clients - Produits non encore facturés', NULL, 0, NULL, NULL, 1, 0, NULL, NULL);
INSERT INTO `llx_accounting_account` (`rowid`, `entity`, `datec`, `tms`, `fk_pcg_version`, `pcg_type`, `account_number`, `account_parent`, `label`, `labelshort`, `fk_accounting_category`, `fk_user_author`, `fk_user_modif`, `active`, `reconcilable`, `import_key`, `extraparams`) VALUES
(15329, 1, NULL, '2024-07-16 13:31:51', 'NSCF', 'THIRDPARTY', '4181', 15328, 'Clients - Factures à établir', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15330, 1, NULL, '2024-07-16 13:31:51', 'NSCF', 'THIRDPARTY', '4188', 15328, 'Clients - Intérêts courus', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15331, 1, NULL, '2024-07-16 13:31:51', 'NSCF', 'THIRDPARTY', '419', 15321, 'Clients créditeurs', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15332, 1, NULL, '2024-07-16 13:31:51', 'NSCF', 'THIRDPARTY', '4191', 15331, 'Clients - Avances et acomptes reçus sur commandes', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15333, 1, NULL, '2024-07-16 13:31:51', 'NSCF', 'THIRDPARTY', '4196', 15331, 'Clients - Dettes sur emballages et matériels consignés autres avoirs à établir', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15334, 1, NULL, '2024-07-16 13:31:51', 'NSCF', 'THIRDPARTY', '4197', 15331, 'Clients - Autres avoirs', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15335, 1, NULL, '2024-07-16 13:31:51', 'NSCF', 'THIRDPARTY', '4198', 15331, 'Rabais, remises, ristournes à accorder et', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15336, 1, NULL, '2024-07-16 13:31:51', 'NSCF', 'THIRDPARTY', '42', 15302, 'Personnel et comptes rattachés', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15337, 1, NULL, '2024-07-16 13:31:51', 'NSCF', 'THIRDPARTY', '421', 15336, 'Personnel - Rémunérations dues', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15338, 1, NULL, '2024-07-16 13:31:51', 'NSCF', 'THIRDPARTY', '422', 15336, 'Fonds des œuvres sociales', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15339, 1, NULL, '2024-07-16 13:31:51', 'NSCF', 'THIRDPARTY', '423', 15336, 'Participation des salariés aux résultats', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15340, 1, NULL, '2024-07-16 13:31:51', 'NSCF', 'THIRDPARTY', '425', 15336, 'Personnel - Avances et acomptes accordés', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15341, 1, NULL, '2024-07-16 13:31:51', 'NSCF', 'THIRDPARTY', '426', 15336, 'Personnel - Dépôts reçus', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15342, 1, NULL, '2024-07-16 13:31:51', 'NSCF', 'THIRDPARTY', '427', 15336, 'Personnel - Oppositions sur salaires', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15343, 1, NULL, '2024-07-16 13:31:51', 'NSCF', 'THIRDPARTY', '428', 15336, 'Personnel - Charges à payer et produits à recevoir', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15344, 1, NULL, '2024-07-16 13:31:51', 'NSCF', 'THIRDPARTY', '4286', 15343, 'Personnel, charges à payer', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15345, 1, NULL, '2024-07-16 13:31:51', 'NSCF', 'THIRDPARTY', '4287', 15343, 'Personnel, produits à recevoir', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15346, 1, NULL, '2024-07-16 13:31:51', 'NSCF', 'THIRDPARTY', '43', 15302, 'Organismes sociaux et comptes rattachés', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15347, 1, NULL, '2024-07-16 13:31:51', 'NSCF', 'THIRDPARTY', '431', 15346, 'Sécurité sociale', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15348, 1, NULL, '2024-07-16 13:31:51', 'NSCF', 'THIRDPARTY', '432', 15346, 'Autres organismes sociaux', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15349, 1, NULL, '2024-07-16 13:31:51', 'NSCF', 'THIRDPARTY', '438', 15346, 'Organismes sociaux - Charges à payer et produits à recevoir', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15350, 1, NULL, '2024-07-16 13:31:51', 'NSCF', 'THIRDPARTY', '4386', 15349, 'Organismes sociaux, charges à payer', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15351, 1, NULL, '2024-07-16 13:31:51', 'NSCF', 'THIRDPARTY', '4387', 15349, 'Organismes sociaux, produits à recevoir', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15352, 1, NULL, '2024-07-16 13:31:51', 'NSCF', 'THIRDPARTY', '44', 15302, 'État, collectivités publiques, organismes internationaux et comptes rattachés', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15353, 1, NULL, '2024-07-16 13:31:51', 'NSCF', 'THIRDPARTY', '441', 15352, 'État et collectivités publiques, subventions à recevoir', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15354, 1, NULL, '2024-07-16 13:31:51', 'NSCF', 'THIRDPARTY', '4411', 15353, 'Subventions d\'investissement à recevoir', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15355, 1, NULL, '2024-07-16 13:31:51', 'NSCF', 'THIRDPARTY', '4417', 15353, 'Subventions d\'exploitation à recevoir', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15356, 1, NULL, '2024-07-16 13:31:51', 'NSCF', 'THIRDPARTY', '4418', 15353, 'Subventions d\'équilibre à recevoir', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15357, 1, NULL, '2024-07-16 13:31:51', 'NSCF', 'THIRDPARTY', '4419', 15353, 'Avances sur subventions à recevoir', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15358, 1, NULL, '2024-07-16 13:31:51', 'NSCF', 'THIRDPARTY', '442', 15352, 'Impôts et taxes recouvrables sur des tiers', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15359, 1, NULL, '2024-07-16 13:31:51', 'NSCF', 'THIRDPARTY', '443', 15352, 'Opérations particulières avec l\'Etat et les collectivités publiques', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15360, 1, NULL, '2024-07-16 13:31:51', 'NSCF', 'THIRDPARTY', '444', 15352, 'Etat - Impôts sur les résultats', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15361, 1, NULL, '2024-07-16 13:31:51', 'NSCF', 'THIRDPARTY', '445', 15352, 'Etat - Taxes sur le chiffre d\'affaires', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15362, 1, NULL, '2024-07-16 13:31:51', 'NSCF', 'THIRDPARTY', '4451', 15361, 'Taxes sur le chiffre d\'affaires à décaisser', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15363, 1, NULL, '2024-07-16 13:31:51', 'NSCF', 'THIRDPARTY', '44511', 15362, 'T.V.A. à décaisser', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15364, 1, NULL, '2024-07-16 13:31:51', 'NSCF', 'THIRDPARTY', '44518', 15362, 'Autres taxes assimilées à décaisser', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15365, 1, NULL, '2024-07-16 13:31:51', 'NSCF', 'THIRDPARTY', '4456', 15361, 'Taxes sur le chiffre d\'affaires déductibles', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15366, 1, NULL, '2024-07-16 13:31:51', 'NSCF', 'THIRDPARTY', '44562', 15365, 'T.V.A. sur immobilisations', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15367, 1, NULL, '2024-07-16 13:31:51', 'NSCF', 'THIRDPARTY', '44566', 15365, 'T.V.A. sur autres biens et services', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15368, 1, NULL, '2024-07-16 13:31:51', 'NSCF', 'THIRDPARTY', '44567', 15365, 'Crédit de T.V.A. à reporter', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15369, 1, NULL, '2024-07-16 13:31:51', 'NSCF', 'THIRDPARTY', '4457', 15361, 'Taxes sur le chiffre d\'affaires collectées par l\'entreprise', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15370, 1, NULL, '2024-07-16 13:31:51', 'NSCF', 'THIRDPARTY', '44571', 15369, 'T.V.A. collectée', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15371, 1, NULL, '2024-07-16 13:31:51', 'NSCF', 'THIRDPARTY', '44578', 15369, 'Autres taxes collectée assimilées à la T.V.A.', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15372, 1, NULL, '2024-07-16 13:31:51', 'NSCF', 'THIRDPARTY', '4458', 15361, 'Taxes sur le chiffre d\'affaires à régulariser ou en attente', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15373, 1, NULL, '2024-07-16 13:31:51', 'NSCF', 'THIRDPARTY', '44586', 15372, 'Taxes sur le chiffre d\'affaires sur factures non parvenues', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15374, 1, NULL, '2024-07-16 13:31:51', 'NSCF', 'THIRDPARTY', '44587', 15372, 'Taxes sur le chiffre d\'affaires sur factures à établir', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15375, 1, NULL, '2024-07-16 13:31:51', 'NSCF', 'THIRDPARTY', '446', 15352, 'Organismes internationaux', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15376, 1, NULL, '2024-07-16 13:31:51', 'NSCF', 'THIRDPARTY', '447', 15352, 'Autres impôts, taxes et versements assimilés', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15377, 1, NULL, '2024-07-16 13:31:51', 'NSCF', 'THIRDPARTY', '448', 15352, 'Etat - Charges à payer et produits à recevoir (hors impôts)', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15378, 1, NULL, '2024-07-16 13:31:51', 'NSCF', 'THIRDPARTY', '4486', 15377, 'Etat, charges à payer', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15379, 1, NULL, '2024-07-16 13:31:51', 'NSCF', 'THIRDPARTY', '4487', 15377, 'Etat, produits à recevoir', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15380, 1, NULL, '2024-07-16 13:31:51', 'NSCF', 'THIRDPARTY', '4488', 15377, 'Obligations cautionnées', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15381, 1, NULL, '2024-07-16 13:31:51', 'NSCF', 'THIRDPARTY', '45', 15302, 'Groupe et associés', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15382, 1, NULL, '2024-07-16 13:31:51', 'NSCF', 'THIRDPARTY', '451', 15381, 'Opérations groupe', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15383, 1, NULL, '2024-07-16 13:31:51', 'NSCF', 'THIRDPARTY', '4510', 15382, 'Groupe, avances accordées', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15384, 1, NULL, '2024-07-16 13:31:51', 'NSCF', 'THIRDPARTY', '4511', 15382, 'Groupe, avances reçues', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15385, 1, NULL, '2024-07-16 13:31:51', 'NSCF', 'THIRDPARTY', '455', 15381, 'Associés - Comptes courants', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15386, 1, NULL, '2024-07-16 13:31:51', 'NSCF', 'THIRDPARTY', '4551', 15385, 'Principal', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15387, 1, NULL, '2024-07-16 13:31:51', 'NSCF', 'THIRDPARTY', '4558', 15385, 'Intérêts courus', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15388, 1, NULL, '2024-07-16 13:31:51', 'NSCF', 'THIRDPARTY', '456', 15381, 'Associés - Opérations sur le capital', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15389, 1, NULL, '2024-07-16 13:31:51', 'NSCF', 'THIRDPARTY', '4561', 15388, 'Associés - Comptes d\'apport en société', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15390, 1, NULL, '2024-07-16 13:31:51', 'NSCF', 'THIRDPARTY', '45611', 15389, 'Apports en nature', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15391, 1, NULL, '2024-07-16 13:31:51', 'NSCF', 'THIRDPARTY', '45615', 15389, 'Apports en numéraire', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15392, 1, NULL, '2024-07-16 13:31:51', 'NSCF', 'THIRDPARTY', '4562', 15388, 'Apporteurs - Capital appelé, non versé', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15393, 1, NULL, '2024-07-16 13:31:51', 'NSCF', 'THIRDPARTY', '45621', 15392, 'Actionnaires - Capital souscrit et appelé, non versé', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15394, 1, NULL, '2024-07-16 13:31:51', 'NSCF', 'THIRDPARTY', '45625', 15392, 'Associés - Capital appelé, non versé', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15395, 1, NULL, '2024-07-16 13:31:51', 'NSCF', 'THIRDPARTY', '4563', 15388, 'Associés - versements reçus sur augmentation de capital', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15396, 1, NULL, '2024-07-16 13:31:51', 'NSCF', 'THIRDPARTY', '4564', 15388, 'Associés - Versements anticipés', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15397, 1, NULL, '2024-07-16 13:31:51', 'NSCF', 'THIRDPARTY', '4566', 15388, 'Actionnaires défaillants', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15398, 1, NULL, '2024-07-16 13:31:51', 'NSCF', 'THIRDPARTY', '4567', 15388, 'Associés - Capital à rembourser', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15399, 1, NULL, '2024-07-16 13:31:51', 'NSCF', 'THIRDPARTY', '457', 15381, 'Associés - Dividendes à payer', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15400, 1, NULL, '2024-07-16 13:31:51', 'NSCF', 'THIRDPARTY', '458', 15381, 'Associés - Opérations faites en commun ou en groupement', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15401, 1, NULL, '2024-07-16 13:31:51', 'NSCF', 'THIRDPARTY', '4581', 15400, 'Opérations courantes', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15402, 1, NULL, '2024-07-16 13:31:51', 'NSCF', 'THIRDPARTY', '4588', 15400, 'Intérêts courus', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15403, 1, NULL, '2024-07-16 13:31:51', 'NSCF', 'THIRDPARTY', '46', 15302, 'Débiteurs divers et créditeurs divers', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15404, 1, NULL, '2024-07-16 13:31:51', 'NSCF', 'THIRDPARTY', '462', 15403, 'Créances sur cessions d\'immobilisations', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15405, 1, NULL, '2024-07-16 13:31:51', 'NSCF', 'THIRDPARTY', '464', 15403, 'Dettes sur acquisitions valeurs mobilières de placement et instruments financiers dérivés', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15406, 1, NULL, '2024-07-16 13:31:51', 'NSCF', 'THIRDPARTY', '465', 15403, 'Créances sur cessions valeurs mobilières de placement et instruments financiers dérivés', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15407, 1, NULL, '2024-07-16 13:31:51', 'NSCF', 'THIRDPARTY', '467', 15403, 'Autres comptes débiteurs ou créditeurs', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15408, 1, NULL, '2024-07-16 13:31:51', 'NSCF', 'THIRDPARTY', '468', 15403, 'Diverses charges à payer et produits à recevoir', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15409, 1, NULL, '2024-07-16 13:31:51', 'NSCF', 'THIRDPARTY', '4686', 15408, 'Diverses charges à payer', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15410, 1, NULL, '2024-07-16 13:31:51', 'NSCF', 'THIRDPARTY', '4687', 15408, 'Divers produits à recevoir', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15411, 1, NULL, '2024-07-16 13:31:51', 'NSCF', 'THIRDPARTY', '47', 15302, 'Comptes transitoires ou d\'attente', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15412, 1, NULL, '2024-07-16 13:31:51', 'NSCF', 'THIRDPARTY', '471', 15411, 'Compte d\'attente 1', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15413, 1, NULL, '2024-07-16 13:31:51', 'NSCF', 'THIRDPARTY', '472', 15411, 'Compte d\'attente 2', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15414, 1, NULL, '2024-07-16 13:31:51', 'NSCF', 'THIRDPARTY', '473', 15411, 'Compte d\'attente 3', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15415, 1, NULL, '2024-07-16 13:31:51', 'NSCF', 'THIRDPARTY', '474', 15411, 'Compte d\'attente 4', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15416, 1, NULL, '2024-07-16 13:31:51', 'NSCF', 'THIRDPARTY', '475', 15411, 'Compte d\'attente 5', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15417, 1, NULL, '2024-07-16 13:31:51', 'NSCF', 'THIRDPARTY', '476', 15411, 'Différence de conversion - Actif', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15418, 1, NULL, '2024-07-16 13:31:51', 'NSCF', 'THIRDPARTY', '4761', 15417, 'Diminution des créances', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15419, 1, NULL, '2024-07-16 13:31:51', 'NSCF', 'THIRDPARTY', '4762', 15417, 'Augmentation des dettes', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15420, 1, NULL, '2024-07-16 13:31:51', 'NSCF', 'THIRDPARTY', '4768', 15417, 'Différences compensées par couverture de change', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15421, 1, NULL, '2024-07-16 13:31:51', 'NSCF', 'THIRDPARTY', '477', 15411, 'Différences de conversion - Passif', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15422, 1, NULL, '2024-07-16 13:31:51', 'NSCF', 'THIRDPARTY', '4771', 15421, 'Augmentation des créances', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15423, 1, NULL, '2024-07-16 13:31:51', 'NSCF', 'THIRDPARTY', '4772', 15421, 'Diminution des dettes', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15424, 1, NULL, '2024-07-16 13:31:51', 'NSCF', 'THIRDPARTY', '4778', 15421, 'Différences compensées par couverture de change', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15425, 1, NULL, '2024-07-16 13:31:51', 'NSCF', 'THIRDPARTY', '478', 15411, 'Autres comptes transitoires', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15426, 1, NULL, '2024-07-16 13:31:51', 'NSCF', 'THIRDPARTY', '48', 15302, 'Charges ou produits constatés d\'avance et provisions', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15427, 1, NULL, '2024-07-16 13:31:51', 'NSCF', 'THIRDPARTY', '481', 15426, 'Provisions, passifs courants', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15428, 1, NULL, '2024-07-16 13:31:51', 'NSCF', 'THIRDPARTY', '486', 15426, 'Charges constatées d\'avance', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15429, 1, NULL, '2024-07-16 13:31:51', 'NSCF', 'THIRDPARTY', '487', 15426, 'Produits constatés d\'avance', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15430, 1, NULL, '2024-07-16 13:31:51', 'NSCF', 'THIRDPARTY', '49', 15302, 'Pertes de valeur sur comptes de tiers', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15431, 1, NULL, '2024-07-16 13:31:51', 'NSCF', 'THIRDPARTY', '491', 15430, 'Pertes de valeur sur comptes de clients', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15432, 1, NULL, '2024-07-16 13:31:51', 'NSCF', 'THIRDPARTY', '495', 15430, 'Pertes de valeur sur comptes du groupe et sur associés', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15433, 1, NULL, '2024-07-16 13:31:51', 'NSCF', 'THIRDPARTY', '4951', 15432, 'Pertes de valeur sur comptes du groupe', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15434, 1, NULL, '2024-07-16 13:31:51', 'NSCF', 'THIRDPARTY', '4955', 15432, 'Pertes de valeur sur comptes courants des associés', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15435, 1, NULL, '2024-07-16 13:31:51', 'NSCF', 'THIRDPARTY', '496', 15430, 'Pertes de valeur sur comptes de débiteurs divers', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15436, 1, NULL, '2024-07-16 13:31:51', 'NSCF', 'THIRDPARTY', '4962', 15435, 'Créances sur cessions d\'immobilisations', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15437, 1, NULL, '2024-07-16 13:31:51', 'NSCF', 'THIRDPARTY', '4965', 15435, 'Créances sur cessions de valeurs mobilières de placement', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15438, 1, NULL, '2024-07-16 13:31:51', 'NSCF', 'THIRDPARTY', '4967', 15435, 'Autres comptes débiteurs', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15439, 1, NULL, '2024-07-16 13:31:51', 'NSCF', 'THIRDPARTY', '498', 15430, 'Pertes de valeur sur comptes de débiteurs divers', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15440, 1, NULL, '2024-07-16 13:31:51', 'NSCF', 'FINAN', '5', 0, 'COMPTES FINANCIERS', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15441, 1, NULL, '2024-07-16 13:31:51', 'NSCF', 'FINAN', '50', 15440, 'Valeurs mobilières de placement', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15442, 1, NULL, '2024-07-16 13:31:51', 'NSCF', 'FINAN', '501', 15441, 'Parts dans des entreprises liées', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15443, 1, NULL, '2024-07-16 13:31:51', 'NSCF', 'FINAN', '502', 15441, 'Actions propres', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15444, 1, NULL, '2024-07-16 13:31:51', 'NSCF', 'FINAN', '503', 15441, 'Autres actions ou titres conférant un droit de propriété', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15445, 1, NULL, '2024-07-16 13:31:51', 'NSCF', 'FINAN', '5031', 15444, 'Titres cotés', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15446, 1, NULL, '2024-07-16 13:31:51', 'NSCF', 'FINAN', '5032', 15444, 'Titres non cotés', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15447, 1, NULL, '2024-07-16 13:31:51', 'NSCF', 'FINAN', '506', 15441, 'Obligations, bons du Trésor et bons de caisse à court terme', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15448, 1, NULL, '2024-07-16 13:31:51', 'NSCF', 'FINAN', '5061', 15447, 'Obligations à court termes', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15449, 1, NULL, '2024-07-16 13:31:51', 'NSCF', 'FINAN', '5062', 15447, 'Bons du trésor à court terme', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15450, 1, NULL, '2024-07-16 13:31:51', 'NSCF', 'FINAN', '5063', 15447, 'Bons de caisse à court terme', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15451, 1, NULL, '2024-07-16 13:31:51', 'NSCF', 'FINAN', '508', 15441, 'Autres valeurs mobilières de placement et créances assimilées', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15452, 1, NULL, '2024-07-16 13:31:51', 'NSCF', 'FINAN', '5088', 15451, 'Autres valeurs mobilières', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15453, 1, NULL, '2024-07-16 13:31:51', 'NSCF', 'FINAN', '5082', 15451, 'Bons de souscription', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15454, 1, NULL, '2024-07-16 13:31:51', 'NSCF', 'FINAN', '5083', 15451, 'Intérêts courus sur obligations, bons et valeurs assimilés', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15455, 1, NULL, '2024-07-16 13:31:51', 'NSCF', 'FINAN', '509', 15441, 'Versements restant à effectuer sur valeurs mobilières de placement non libérées', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15456, 1, NULL, '2024-07-16 13:31:51', 'NSCF', 'FINAN', '51', 15440, 'Banques, établissements financiers et assimilés', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15457, 1, NULL, '2024-07-16 13:31:51', 'NSCF', 'FINAN', '511', 15456, 'Valeurs à l\'encaissement', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15458, 1, NULL, '2024-07-16 13:31:51', 'NSCF', 'FINAN', '5111', 15457, 'Coupons échus à l\'encaissement', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15459, 1, NULL, '2024-07-16 13:31:52', 'NSCF', 'FINAN', '5112', 15457, 'Chèques à encaisser', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15460, 1, NULL, '2024-07-16 13:31:52', 'NSCF', 'FINAN', '5113', 15457, 'Effets à l\'encaissement', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15461, 1, NULL, '2024-07-16 13:31:52', 'NSCF', 'FINAN', '5114', 15457, 'Effets à l\'escompte', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15462, 1, NULL, '2024-07-16 13:31:52', 'NSCF', 'FINAN', '5115', 15457, 'Cartes bancaires à l\'encaissement', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15463, 1, NULL, '2024-07-16 13:31:52', 'NSCF', 'FINAN', '512', 15456, 'Banques comptes courants', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15464, 1, NULL, '2024-07-16 13:31:52', 'NSCF', 'FINAN', '514', 15456, 'Chèques postaux', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15465, 1, NULL, '2024-07-16 13:31:52', 'NSCF', 'FINAN', '515', 15456, 'Caisses du Trésor et des établissements publics', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15466, 1, NULL, '2024-07-16 13:31:52', 'NSCF', 'FINAN', '516', 15456, 'Sociétés de bourse', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15467, 1, NULL, '2024-07-16 13:31:52', 'NSCF', 'FINAN', '517', 15456, 'Autres organismes financiers', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15468, 1, NULL, '2024-07-16 13:31:52', 'NSCF', 'FINAN', '518', 15456, 'Intérêts courus', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15469, 1, NULL, '2024-07-16 13:31:52', 'NSCF', 'FINAN', '5181', 15468, 'Intérêts courus à payer', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15470, 1, NULL, '2024-07-16 13:31:52', 'NSCF', 'FINAN', '5188', 15468, 'Intérêts courus à recevoir', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15471, 1, NULL, '2024-07-16 13:31:52', 'NSCF', 'FINAN', '519', 15456, 'Concours bancaires courants', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15472, 1, NULL, '2024-07-16 13:31:52', 'NSCF', 'FINAN', '5191', 15471, 'Crédit de mobilisation de créances commerciales (CMCC)', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15473, 1, NULL, '2024-07-16 13:31:52', 'NSCF', 'FINAN', '5192', 15471, 'Crédit documentaire', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15474, 1, NULL, '2024-07-16 13:31:52', 'NSCF', 'FINAN', '5193', 15471, 'Mobilisation de créances nées à l\'étranger', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15475, 1, NULL, '2024-07-16 13:31:52', 'NSCF', 'FINAN', '5198', 15471, 'Intérêts courus sur concours bancaires courants', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15476, 1, NULL, '2024-07-16 13:31:52', 'NSCF', 'FINAN', '52', 15440, 'Instruments de trésorerie', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15477, 1, NULL, '2024-07-16 13:31:52', 'NSCF', 'FINAN', '53', 15440, 'Caisse', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15478, 1, NULL, '2024-07-16 13:31:52', 'NSCF', 'FINAN', '54', 15440, 'Régies d\'avance et accréditifs', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15479, 1, NULL, '2024-07-16 13:31:52', 'NSCF', 'FINAN', '541', 15478, 'Régie d\'avance', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15480, 1, NULL, '2024-07-16 13:31:52', 'NSCF', 'FINAN', '542', 15478, 'Accréditifs', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15481, 1, NULL, '2024-07-16 13:31:52', 'NSCF', 'FINAN', '58', 15440, 'Virements internes', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15482, 1, NULL, '2024-07-16 13:31:52', 'NSCF', 'FINAN', '581', 15481, 'Virements de fonds', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15483, 1, NULL, '2024-07-16 13:31:52', 'NSCF', 'FINAN', '588', 15481, 'Autres virements internes', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15484, 1, NULL, '2024-07-16 13:31:52', 'NSCF', 'FINAN', '59', 15440, 'Pertes de valeur des actifs financiers courants', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15485, 1, NULL, '2024-07-16 13:31:52', 'NSCF', 'FINAN', '591', 15484, 'Pertes de valeur des dépôts en banque et autres établissements financiers', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15486, 1, NULL, '2024-07-16 13:31:52', 'NSCF', 'FINAN', '594', 15484, 'Pertes de valeur sur des régies d\'avance et accréditifs', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15487, 1, NULL, '2024-07-16 13:31:52', 'NSCF', 'EXPENSE', '6', 0, 'COMPTES DE CHARGES', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15488, 1, NULL, '2024-07-16 13:31:52', 'NSCF', 'EXPENSE', '60', 15487, 'Achats consommées', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15489, 1, NULL, '2024-07-16 13:31:52', 'NSCF', 'EXPENSE', '600', 15488, 'Achats de marchandises vendues', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15490, 1, NULL, '2024-07-16 13:31:52', 'NSCF', 'EXPENSE', '601', 15488, 'Matières premières', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15491, 1, NULL, '2024-07-16 13:31:52', 'NSCF', 'EXPENSE', '602', 15488, 'Autres approvisionnements', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15492, 1, NULL, '2024-07-16 13:31:52', 'NSCF', 'EXPENSE', '603', 15488, 'Variations des stocks ', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15493, 1, NULL, '2024-07-16 13:31:52', 'NSCF', 'EXPENSE', '6030', 15492, 'Variations des stocks de marchandises', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15494, 1, NULL, '2024-07-16 13:31:52', 'NSCF', 'EXPENSE', '6031', 15492, 'Variations des stocks de matières premières et fournitures', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15495, 1, NULL, '2024-07-16 13:31:52', 'NSCF', 'EXPENSE', '6032', 15492, 'Variations des stocks d\'autres approvisionnements', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15496, 1, NULL, '2024-07-16 13:31:52', 'NSCF', 'EXPENSE', '604', 15488, 'Achats d\'études  et prestations de services', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15497, 1, NULL, '2024-07-16 13:31:52', 'NSCF', 'EXPENSE', '605', 15488, 'Achats de matériel, équipements et travaux', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15498, 1, NULL, '2024-07-16 13:31:52', 'NSCF', 'EXPENSE', '607', 15488, 'Achats non stockés de matière et fournitures', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15499, 1, NULL, '2024-07-16 13:31:52', 'NSCF', 'EXPENSE', '6071', 15498, 'Fournitures non stockables (eau, énergie)', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15500, 1, NULL, '2024-07-16 13:31:52', 'NSCF', 'EXPENSE', '6073', 15498, 'Fournitures d\'entretien et de petit équipement', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15501, 1, NULL, '2024-07-16 13:31:52', 'NSCF', 'EXPENSE', '6074', 15498, 'Fournitures administratives', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15502, 1, NULL, '2024-07-16 13:31:52', 'NSCF', 'EXPENSE', '6078', 15498, 'Autres matières et fournitures', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15503, 1, NULL, '2024-07-16 13:31:52', 'NSCF', 'EXPENSE', '608', 15488, 'Frais accessoires sur achats (FAA)', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15504, 1, NULL, '2024-07-16 13:31:52', 'NSCF', 'EXPENSE', '609', 15488, 'Rabais, remises et ristournes obtenus sur achats', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15505, 1, NULL, '2024-07-16 13:31:52', 'NSCF', 'EXPENSE', '61', 15487, 'Services extérieurs', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15506, 1, NULL, '2024-07-16 13:31:52', 'NSCF', 'EXPENSE', '611', 15505, 'Sous-traitance générale', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15507, 1, NULL, '2024-07-16 13:31:52', 'NSCF', 'EXPENSE', '613', 15505, 'Locations', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15508, 1, NULL, '2024-07-16 13:31:52', 'NSCF', 'EXPENSE', '6132', 15507, 'Locations immobilières', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15509, 1, NULL, '2024-07-16 13:31:52', 'NSCF', 'EXPENSE', '6135', 15507, 'Locations mobilières', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15510, 1, NULL, '2024-07-16 13:31:52', 'NSCF', 'EXPENSE', '6136', 15507, 'Malis sur emballages', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15511, 1, NULL, '2024-07-16 13:31:52', 'NSCF', 'EXPENSE', '614', 15505, 'Charges locatives et charges de copropriété', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15512, 1, NULL, '2024-07-16 13:31:52', 'NSCF', 'EXPENSE', '615', 15505, 'Entretien, réparations et maintenance', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15513, 1, NULL, '2024-07-16 13:31:52', 'NSCF', 'EXPENSE', '6152', 15512, 'Sur biens immobiliers', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15514, 1, NULL, '2024-07-16 13:31:52', 'NSCF', 'EXPENSE', '6155', 15512, 'Sur biens mobiliers', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15515, 1, NULL, '2024-07-16 13:31:52', 'NSCF', 'EXPENSE', '6156', 15512, 'Maintenance', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15516, 1, NULL, '2024-07-16 13:31:52', 'NSCF', 'EXPENSE', '616', 15505, 'Primes d\'assurances', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15517, 1, NULL, '2024-07-16 13:31:52', 'NSCF', 'EXPENSE', '6161', 15516, 'Multirisques', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15518, 1, NULL, '2024-07-16 13:31:52', 'NSCF', 'EXPENSE', '6162', 15516, 'Assurance obligatoire dommage construction', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15519, 1, NULL, '2024-07-16 13:31:52', 'NSCF', 'EXPENSE', '6163', 15516, 'Assurance-transport', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15520, 1, NULL, '2024-07-16 13:31:52', 'NSCF', 'EXPENSE', '61636', 15519, 'sur achats', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15521, 1, NULL, '2024-07-16 13:31:52', 'NSCF', 'EXPENSE', '61637', 15519, 'sur ventes', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15522, 1, NULL, '2024-07-16 13:31:52', 'NSCF', 'EXPENSE', '61638', 15519, 'sur autres biens', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15523, 1, NULL, '2024-07-16 13:31:52', 'NSCF', 'EXPENSE', '6166', 15516, 'Assurances véhicules', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15524, 1, NULL, '2024-07-16 13:31:52', 'NSCF', 'EXPENSE', '6168', 15516, 'Autres assurances', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15525, 1, NULL, '2024-07-16 13:31:52', 'NSCF', 'EXPENSE', '617', 15505, 'Etudes et recherches', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15526, 1, NULL, '2024-07-16 13:31:52', 'NSCF', 'EXPENSE', '618', 15505, 'Documentation et divers', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15527, 1, NULL, '2024-07-16 13:31:52', 'NSCF', 'EXPENSE', '6181', 15526, 'Documentation générale', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15528, 1, NULL, '2024-07-16 13:31:52', 'NSCF', 'EXPENSE', '6183', 15526, 'Documentation technique', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15529, 1, NULL, '2024-07-16 13:31:52', 'NSCF', 'EXPENSE', '6185', 15526, 'Frais de colloques, séminaires, conférences', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15530, 1, NULL, '2024-07-16 13:31:52', 'NSCF', 'EXPENSE', '619', 15505, 'Rabais, remises et ristournes obtenus sur services extérieurs', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15531, 1, NULL, '2024-07-16 13:31:52', 'NSCF', 'EXPENSE', '62', 15487, 'Autres services extérieurs', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15532, 1, NULL, '2024-07-16 13:31:52', 'NSCF', 'EXPENSE', '621', 15531, 'Personnel extérieur à l\'entreprise', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15533, 1, NULL, '2024-07-16 13:31:52', 'NSCF', 'EXPENSE', '6211', 15532, 'Personnel intérimaire', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15534, 1, NULL, '2024-07-16 13:31:52', 'NSCF', 'EXPENSE', '6214', 15532, 'Personnel détaché ou prêté à l\'entreprise', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15535, 1, NULL, '2024-07-16 13:31:52', 'NSCF', 'EXPENSE', '622', 15531, 'Rémunérations d\'intermédiaires et honoraires', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15536, 1, NULL, '2024-07-16 13:31:52', 'NSCF', 'EXPENSE', '6221', 15535, 'Commissions et courtages sur achats', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15537, 1, NULL, '2024-07-16 13:31:52', 'NSCF', 'EXPENSE', '6222', 15535, 'Commissions et courtages sur ventes', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15538, 1, NULL, '2024-07-16 13:31:52', 'NSCF', 'EXPENSE', '6224', 15535, 'Rémunérations des transitaires', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15539, 1, NULL, '2024-07-16 13:31:52', 'NSCF', 'EXPENSE', '6225', 15535, 'Rémunérations d\'affacturage (mémoire)', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15540, 1, NULL, '2024-07-16 13:31:52', 'NSCF', 'EXPENSE', '6226', 15535, 'Honoraires', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15541, 1, NULL, '2024-07-16 13:31:52', 'NSCF', 'EXPENSE', '6227', 15535, 'Frais d\'actes et de contentieux', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15542, 1, NULL, '2024-07-16 13:31:52', 'NSCF', 'EXPENSE', '6228', 15535, 'Divers', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15543, 1, NULL, '2024-07-16 13:31:52', 'NSCF', 'EXPENSE', '624', 15531, 'Transports de biens et transports collectifs du personnel', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15544, 1, NULL, '2024-07-16 13:31:52', 'NSCF', 'EXPENSE', '6241', 15543, 'Transports sur achats', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15545, 1, NULL, '2024-07-16 13:31:52', 'NSCF', 'EXPENSE', '6242', 15543, 'Transports sur ventes', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15546, 1, NULL, '2024-07-16 13:31:52', 'NSCF', 'EXPENSE', '6243', 15543, 'Transports entre établissements ou chantiers', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15547, 1, NULL, '2024-07-16 13:31:52', 'NSCF', 'EXPENSE', '6244', 15543, 'Transports administratifs', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15548, 1, NULL, '2024-07-16 13:31:52', 'NSCF', 'EXPENSE', '6247', 15543, 'Transports collectifs du personnel', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15549, 1, NULL, '2024-07-16 13:31:52', 'NSCF', 'EXPENSE', '6248', 15543, 'Divers', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15550, 1, NULL, '2024-07-16 13:31:52', 'NSCF', 'EXPENSE', '625', 15531, 'Déplacements, missions et réceptions', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15551, 1, NULL, '2024-07-16 13:31:52', 'NSCF', 'EXPENSE', '6251', 15550, 'Voyages et déplacements', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15552, 1, NULL, '2024-07-16 13:31:52', 'NSCF', 'EXPENSE', '6255', 15550, 'Frais de déménagement', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15553, 1, NULL, '2024-07-16 13:31:52', 'NSCF', 'EXPENSE', '6256', 15550, 'Missions', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15554, 1, NULL, '2024-07-16 13:31:52', 'NSCF', 'EXPENSE', '6257', 15550, 'Réceptions', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15555, 1, NULL, '2024-07-16 13:31:52', 'NSCF', 'EXPENSE', '626', 15531, 'Frais postaux et de télécommunications', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15556, 1, NULL, '2024-07-16 13:31:52', 'NSCF', 'EXPENSE', '627', 15531, 'Services bancaires et assimilés', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15557, 1, NULL, '2024-07-16 13:31:52', 'NSCF', 'EXPENSE', '6271', 15556, 'Frais sur titres (achat, vente, garde)', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15558, 1, NULL, '2024-07-16 13:31:52', 'NSCF', 'EXPENSE', '6272', 15556, 'Commissions et frais sur émission d\'emprunts', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15559, 1, NULL, '2024-07-16 13:31:52', 'NSCF', 'EXPENSE', '6275', 15556, 'Frais sur effets', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15560, 1, NULL, '2024-07-16 13:31:52', 'NSCF', 'EXPENSE', '6276', 15556, 'Location de coffres', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15561, 1, NULL, '2024-07-16 13:31:52', 'NSCF', 'EXPENSE', '6278', 15556, 'Autres frais et commissions sur prestations de services', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15562, 1, NULL, '2024-07-16 13:31:52', 'NSCF', 'EXPENSE', '628', 15531, 'Cotisations et divers', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15563, 1, NULL, '2024-07-16 13:31:52', 'NSCF', 'EXPENSE', '6281', 15562, 'Concours divers (cotisations)', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15564, 1, NULL, '2024-07-16 13:31:52', 'NSCF', 'EXPENSE', '6284', 15562, 'Frais de recrutement de personnel', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15565, 1, NULL, '2024-07-16 13:31:52', 'NSCF', 'EXPENSE', '629', 15531, 'Rabais, remises et ristournes obtenus sur autres services extérieurs', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15566, 1, NULL, '2024-07-16 13:31:52', 'NSCF', 'EXPENSE', '63', 15487, 'Charges de personnel', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15567, 1, NULL, '2024-07-16 13:31:52', 'NSCF', 'EXPENSE', '631', 15566, 'Rémunérations du personnel', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15568, 1, NULL, '2024-07-16 13:31:52', 'NSCF', 'EXPENSE', '6311', 15567, 'Salaires, appointements', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15569, 1, NULL, '2024-07-16 13:31:52', 'NSCF', 'EXPENSE', '6312', 15567, 'Congés payés', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15570, 1, NULL, '2024-07-16 13:31:52', 'NSCF', 'EXPENSE', '6313', 15567, 'Primes et gratifications', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15571, 1, NULL, '2024-07-16 13:31:52', 'NSCF', 'EXPENSE', '6314', 15567, 'Indemnités et avantages divers', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15572, 1, NULL, '2024-07-16 13:31:52', 'NSCF', 'EXPENSE', '6316', 15567, 'Contributions aux œuvres sociales', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15573, 1, NULL, '2024-07-16 13:31:52', 'NSCF', 'EXPENSE', '634', 15566, 'Rémunération de l\'exploitant individuel', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15574, 1, NULL, '2024-07-16 13:31:52', 'NSCF', 'EXPENSE', '635', 15566, 'Cotisations aux organismes sociaux', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15575, 1, NULL, '2024-07-16 13:31:52', 'NSCF', 'EXPENSE', '6351', 15574, 'Cotisations CNAS', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15576, 1, NULL, '2024-07-16 13:31:52', 'NSCF', 'EXPENSE', '6352', 15574, 'Cotisations aux mutuelles', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15577, 1, NULL, '2024-07-16 13:31:52', 'NSCF', 'EXPENSE', '6353', 15574, 'Cotisations aux caisses de retraites', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15578, 1, NULL, '2024-07-16 13:31:52', 'NSCF', 'EXPENSE', '6358', 15574, 'Cotisations aux autres organismes sociaux (CACOBATH)', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15579, 1, NULL, '2024-07-16 13:31:52', 'NSCF', 'EXPENSE', '636', 15566, 'Charges sociales de l\'exploitant individuel', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15580, 1, NULL, '2024-07-16 13:31:52', 'NSCF', 'EXPENSE', '637', 15566, 'Autres charges sociales', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15581, 1, NULL, '2024-07-16 13:31:52', 'NSCF', 'EXPENSE', '6371', 15580, 'Prestations directes', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15582, 1, NULL, '2024-07-16 13:31:52', 'NSCF', 'EXPENSE', '6372', 15580, 'Versements aux comités d\'entreprise et d\'établissement', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15583, 1, NULL, '2024-07-16 13:31:52', 'NSCF', 'EXPENSE', '6374', 15580, 'Versements aux autres œuvres sociales', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15584, 1, NULL, '2024-07-16 13:31:52', 'NSCF', 'EXPENSE', '6375', 15580, 'Médecine du travail, pharmacie', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15585, 1, NULL, '2024-07-16 13:31:52', 'NSCF', 'EXPENSE', '638', 15566, 'Autres charges de personnel', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15586, 1, NULL, '2024-07-16 13:31:52', 'NSCF', 'EXPENSE', '64', 15487, 'Impôts, taxes et versements assimilés', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15587, 1, NULL, '2024-07-16 13:31:52', 'NSCF', 'EXPENSE', '641', 15586, 'Impôts, taxes et versements assimilés sur rémunérations', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15588, 1, NULL, '2024-07-16 13:31:52', 'NSCF', 'EXPENSE', '6411', 15587, 'Taxe sur les salaires', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15589, 1, NULL, '2024-07-16 13:31:52', 'NSCF', 'EXPENSE', '6413', 15587, 'Participation des employeurs à la formation professionnelle', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15590, 1, NULL, '2024-07-16 13:31:52', 'NSCF', 'EXPENSE', '6418', 15587, 'Autres impôts, taxes et versements assimilés sur rémunérations', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15591, 1, NULL, '2024-07-16 13:31:52', 'NSCF', 'EXPENSE', '642', 15586, 'Impôts et taxes non récupérables sur le chiffre d\'affaire', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15592, 1, NULL, '2024-07-16 13:31:52', 'NSCF', 'EXPENSE', '6421', 15591, 'Taxe sur l\'activité professionnelle (TAP)', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15593, 1, NULL, '2024-07-16 13:31:52', 'NSCF', 'EXPENSE', '6422', 15591, 'TVA non récupérable', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15594, 1, NULL, '2024-07-16 13:31:52', 'NSCF', 'EXPENSE', '6423', 15591, 'Droits de timbre et d\'enregistrement', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15595, 1, NULL, '2024-07-16 13:31:52', 'NSCF', 'EXPENSE', '6428', 15591, 'Autres impôts et taxes non récupérables sur le chiffre d\'affaire', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15596, 1, NULL, '2024-07-16 13:31:52', 'NSCF', 'EXPENSE', '645', 15586, 'Autres impôts et taxes (hors impôts sur le résultat)', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15597, 1, NULL, '2024-07-16 13:31:52', 'NSCF', 'EXPENSE', '6451', 15596, 'Taxe foncière', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15598, 1, NULL, '2024-07-16 13:31:52', 'NSCF', 'EXPENSE', '6452', 15596, 'Taxe d\'assainissement', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15599, 1, NULL, '2024-07-16 13:31:52', 'NSCF', 'EXPENSE', '6453', 15596, 'Droits de douane', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15600, 1, NULL, '2024-07-16 13:31:52', 'NSCF', 'EXPENSE', '6454', 15596, 'Vignettes automobiles', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15601, 1, NULL, '2024-07-16 13:31:52', 'NSCF', 'EXPENSE', '6456', 15596, 'Taxe écologique', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15602, 1, NULL, '2024-07-16 13:31:52', 'NSCF', 'EXPENSE', '6458', 15596, 'Autres droits et taxes', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15603, 1, NULL, '2024-07-16 13:31:52', 'NSCF', 'EXPENSE', '65', 15487, 'Autres charges opérationnelles', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15604, 1, NULL, '2024-07-16 13:31:52', 'NSCF', 'EXPENSE', '651', 15603, 'Redevances pour concessions, brevets, licences, logiciels et accès similaires', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15605, 1, NULL, '2024-07-16 13:31:52', 'NSCF', 'EXPENSE', '6511', 15604, 'Redevances pour concessions, brevets, licences, marques, procédés, logiciels', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15606, 1, NULL, '2024-07-16 13:31:52', 'NSCF', 'EXPENSE', '6516', 15604, 'Droits d\'auteur et de reproduction', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15607, 1, NULL, '2024-07-16 13:31:52', 'NSCF', 'EXPENSE', '6518', 15604, 'Autres droits et valeurs similaires', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15608, 1, NULL, '2024-07-16 13:31:52', 'NSCF', 'EXPENSE', '652', 15603, 'Moins-values sur sorties d\'actifs immobilisés non financiers', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15609, 1, NULL, '2024-07-16 13:31:52', 'NSCF', 'EXPENSE', '653', 15603, 'Jetons de présence', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15610, 1, NULL, '2024-07-16 13:31:52', 'NSCF', 'EXPENSE', '654', 15603, 'Pertes sur créances irrécouvrables', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15611, 1, NULL, '2024-07-16 13:31:52', 'NSCF', 'EXPENSE', '6541', 15610, 'Pertes sur créances de l\'exercice', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15612, 1, NULL, '2024-07-16 13:31:52', 'NSCF', 'EXPENSE', '6544', 15610, 'Pertes sur créances des exercices antérieurs', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15613, 1, NULL, '2024-07-16 13:31:52', 'NSCF', 'EXPENSE', '655', 15603, 'Quote-part de résultat sur opérations faites en commun', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15614, 1, NULL, '2024-07-16 13:31:52', 'NSCF', 'EXPENSE', '6551', 15613, 'Quote-part de résultats de groupement', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15615, 1, NULL, '2024-07-16 13:31:52', 'NSCF', 'EXPENSE', '6558', 15613, 'Amortissements de caducité des immobilisations mises en concession', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15616, 1, NULL, '2024-07-16 13:31:52', 'NSCF', 'EXPENSE', '6559', 15613, 'Dotations aux provisions des immobilisations mises en concession', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15617, 1, NULL, '2024-07-16 13:31:52', 'NSCF', 'EXPENSE', '656', 15603, 'Amendes et pénalités, subventions accordées dons et libéralités', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15618, 1, NULL, '2024-07-16 13:31:52', 'NSCF', 'EXPENSE', '6561', 15617, 'Amendes et pénalité', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15619, 1, NULL, '2024-07-16 13:31:52', 'NSCF', 'EXPENSE', '6562', 15617, 'Subventions accordées', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15620, 1, NULL, '2024-07-16 13:31:52', 'NSCF', 'EXPENSE', '6563', 15617, 'Dons et libéralités', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15621, 1, NULL, '2024-07-16 13:31:52', 'NSCF', 'EXPENSE', '657', 15603, 'Charges exceptionnelles de gestion courante', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15622, 1, NULL, '2024-07-16 13:31:52', 'NSCF', 'EXPENSE', '658', 15603, 'Autres charges de gestion courante', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15623, 1, NULL, '2024-07-16 13:31:52', 'NSCF', 'EXPENSE', '66', 15487, 'Charges financières', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15624, 1, NULL, '2024-07-16 13:31:52', 'NSCF', 'EXPENSE', '661', 15623, 'Charges d\'intérêts', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15625, 1, NULL, '2024-07-16 13:31:52', 'NSCF', 'EXPENSE', '6611', 15624, 'Intérêts des emprunts et dettes', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15626, 1, NULL, '2024-07-16 13:31:52', 'NSCF', 'EXPENSE', '66116', 15625, 'Intérêts des emprunts et dettes assimilées', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15627, 1, NULL, '2024-07-16 13:31:52', 'NSCF', 'EXPENSE', '66117', 15625, 'Intérêts des emprunts et  dettes rattachées à des participations', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15628, 1, NULL, '2024-07-16 13:31:52', 'NSCF', 'EXPENSE', '6615', 15624, 'Intérêts des comptes courants et des dépôts créditeurs', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15629, 1, NULL, '2024-07-16 13:31:52', 'NSCF', 'EXPENSE', '6616', 15624, 'Intérêts bancaires et sur opérations de financement (escompte,…)', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15630, 1, NULL, '2024-07-16 13:31:52', 'NSCF', 'EXPENSE', '6617', 15624, 'Intérêts des obligations cautionnées', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15631, 1, NULL, '2024-07-16 13:31:52', 'NSCF', 'EXPENSE', '6618', 15624, 'Intérêts des autres dettes', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15632, 1, NULL, '2024-07-16 13:31:52', 'NSCF', 'EXPENSE', '66181', 15631, 'Intérêts des dettes commerciales', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15633, 1, NULL, '2024-07-16 13:31:52', 'NSCF', 'EXPENSE', '66188', 15631, 'Intérêts des dettes diverses', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15634, 1, NULL, '2024-07-16 13:31:52', 'NSCF', 'EXPENSE', '664', 15623, 'Pertes sur créances liées à des participations', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15635, 1, NULL, '2024-07-16 13:31:52', 'NSCF', 'EXPENSE', '665', 15623, 'Ecarts d\'évaluation sur actifs financiers – Moins-values', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15636, 1, NULL, '2024-07-16 13:31:52', 'NSCF', 'EXPENSE', '6651', 15635, 'Ecarts d\'évaluation - moins-values sur des parts dans les entreprises liées', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15637, 1, NULL, '2024-07-16 13:31:52', 'NSCF', 'EXPENSE', '6653', 15635, 'Ecarts d\'évaluation - moins-values sur autres titres conférant un droit de propriété', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15638, 1, NULL, '2024-07-16 13:31:52', 'NSCF', 'EXPENSE', '6656', 15635, 'Ecarts d\'évaluation - moins-values sur obligations, bons du trésor et bons de caisse à court terme', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15639, 1, NULL, '2024-07-16 13:31:52', 'NSCF', 'EXPENSE', '6658', 15635, 'Ecarts d\'évaluation - moins-values sur autres valeurs mobilières et autres créances assimilées', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15640, 1, NULL, '2024-07-16 13:31:52', 'NSCF', 'EXPENSE', '666', 15623, 'Pertes de change', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15641, 1, NULL, '2024-07-16 13:31:52', 'NSCF', 'EXPENSE', '667', 15623, 'Pertes nettes sur cessions d\'actifs financiers', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15642, 1, NULL, '2024-07-16 13:31:52', 'NSCF', 'EXPENSE', '6671', 15641, 'Pertes nettes sur cession des parts dans les entreprises liées', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15643, 1, NULL, '2024-07-16 13:31:52', 'NSCF', 'EXPENSE', '6672', 15641, 'Pertes nettes sur cession d\'actions propres', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15644, 1, NULL, '2024-07-16 13:31:52', 'NSCF', 'EXPENSE', '6673', 15641, 'Pertes nettes sur cession d\'autres titres conférant un droit de propriété', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15645, 1, NULL, '2024-07-16 13:31:52', 'NSCF', 'EXPENSE', '6676', 15641, 'Pertes nettes sur cession d\'obligations, bons du trésor et bons de caisse à court terme', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15646, 1, NULL, '2024-07-16 13:31:52', 'NSCF', 'EXPENSE', '6678', 15641, 'Pertes nettes sur cession des autres valeurs mobilières et autres créances assimilées', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15647, 1, NULL, '2024-07-16 13:31:52', 'NSCF', 'EXPENSE', '668', 15623, 'Autres charges financières', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15648, 1, NULL, '2024-07-16 13:31:52', 'NSCF', 'EXPENSE', '67', 15487, 'Eléments extraordinaires - charges', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15649, 1, NULL, '2024-07-16 13:31:52', 'NSCF', 'EXPENSE', '672', 15648, 'Valeur résiduelle des immobilisations cédées', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15650, 1, NULL, '2024-07-16 13:31:52', 'NSCF', 'EXPENSE', '676', 15648, 'Charges sur exercices antérieurs', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15651, 1, NULL, '2024-07-16 13:31:52', 'NSCF', 'EXPENSE', '6760', 15650, 'Consommations sur exercices antérieurs', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15652, 1, NULL, '2024-07-16 13:31:52', 'NSCF', 'EXPENSE', '6761', 15650, 'Services sur exercices antérieurs', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15653, 1, NULL, '2024-07-16 13:31:52', 'NSCF', 'EXPENSE', '6762', 15650, 'Autres services sur exercices antérieurs', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15654, 1, NULL, '2024-07-16 13:31:52', 'NSCF', 'EXPENSE', '6763', 15650, 'Charges de personnel sur exercices antérieurs', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15655, 1, NULL, '2024-07-16 13:31:52', 'NSCF', 'EXPENSE', '6764', 15650, 'Impôts et taxes sur exercices antérieurs', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15656, 1, NULL, '2024-07-16 13:31:52', 'NSCF', 'EXPENSE', '6765', 15650, 'Autres charges opérationnelles sur exercices antérieurs', NULL, 0, NULL, NULL, 1, 0, NULL, NULL);
INSERT INTO `llx_accounting_account` (`rowid`, `entity`, `datec`, `tms`, `fk_pcg_version`, `pcg_type`, `account_number`, `account_parent`, `label`, `labelshort`, `fk_accounting_category`, `fk_user_author`, `fk_user_modif`, `active`, `reconcilable`, `import_key`, `extraparams`) VALUES
(15657, 1, NULL, '2024-07-16 13:31:52', 'NSCF', 'EXPENSE', '6766', 15650, 'Charges financières sur exercices antérieurs', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15658, 1, NULL, '2024-07-16 13:31:52', 'NSCF', 'EXPENSE', '6768', 15650, 'Dotations aux amortissements, provisions et pertes de valeurs sur exercices antérieurs', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15659, 1, NULL, '2024-07-16 13:31:52', 'NSCF', 'EXPENSE', '6769', 15650, 'Impôts sur les bénéfices sur exercices antérieurs', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15660, 1, NULL, '2024-07-16 13:31:52', 'NSCF', 'EXPENSE', '678', 15648, 'Autres éléments extraordinaires - charges', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15661, 1, NULL, '2024-07-16 13:31:52', 'NSCF', 'EXPENSE', '6783', 15660, 'Malis provenant du rachat par l\'entreprise d\'actions et obligations émises par elle-même', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15662, 1, NULL, '2024-07-16 13:31:52', 'NSCF', 'EXPENSE', '6788', 15660, 'Autres charges extraordinaires diverses', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15663, 1, NULL, '2024-07-16 13:31:52', 'NSCF', 'EXPENSE', '68', 15487, 'Dotations aux amortissements, provisions et pertes de valeur', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15664, 1, NULL, '2024-07-16 13:31:52', 'NSCF', 'EXPENSE', '681', 15663, 'Dotations aux amortissements, provisions et pertes de valeur, actifs non courants', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15665, 1, NULL, '2024-07-16 13:31:53', 'NSCF', 'EXPENSE', '6811', 15664, 'Dotations aux amortissements, provisions et pertes de valeur sur immobilisations incorporelles', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15666, 1, NULL, '2024-07-16 13:31:53', 'NSCF', 'EXPENSE', '68111', 15665, 'Dotations aux amortissements et provisions et pertes de valeur sur immobilisations incorporelles', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15667, 1, NULL, '2024-07-16 13:31:53', 'NSCF', 'EXPENSE', '68112', 15665, 'Pertes de valeur sur immobilisations incorporelles', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15668, 1, NULL, '2024-07-16 13:31:53', 'NSCF', 'EXPENSE', '6812', 15664, 'Dotations aux amortissements, provisions et pertes de valeur sur immobilisations corporelles', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15669, 1, NULL, '2024-07-16 13:31:53', 'NSCF', 'EXPENSE', '68121', 15668, 'Dotations aux amortissements et provisions et immobilisations corporelles', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15670, 1, NULL, '2024-07-16 13:31:53', 'NSCF', 'EXPENSE', '68122', 15668, 'Pertes de valeur sur immobilisations corporelles', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15671, 1, NULL, '2024-07-16 13:31:53', 'NSCF', 'EXPENSE', '68123', 15668, 'Pertes de valeur sur les investissements en cours', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15672, 1, NULL, '2024-07-16 13:31:53', 'NSCF', 'EXPENSE', '68126', 15668, 'Pertes de valeur sur immobilisations financières', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15673, 1, NULL, '2024-07-16 13:31:53', 'NSCF', 'EXPENSE', '682', 15663, 'Dotations aux amortissements, provisions et pertes de valeur des biens mis en concession', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15674, 1, NULL, '2024-07-16 13:31:53', 'NSCF', 'EXPENSE', '6821', 15673, 'Dotations aux amortissements, des biens mis en concession', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15675, 1, NULL, '2024-07-16 13:31:53', 'NSCF', 'EXPENSE', '6822', 15673, 'Dotations aux provisions des biens mis-en concession', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15676, 1, NULL, '2024-07-16 13:31:53', 'NSCF', 'EXPENSE', '6828', 15673, 'Pertes de valeur des biens mis en concession', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15677, 1, NULL, '2024-07-16 13:31:53', 'NSCF', 'EXPENSE', '685', 15663, 'Dotations aux amortissements, provisions et pertes de valeur, actifs courants', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15678, 1, NULL, '2024-07-16 13:31:53', 'NSCF', 'EXPENSE', '6853', 15677, 'Dotations aux pertes de valeur sur stocks', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15679, 1, NULL, '2024-07-16 13:31:53', 'NSCF', 'EXPENSE', '6854', 15677, 'Dotations aux pertes de valeur sur créances', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15680, 1, NULL, '2024-07-16 13:31:53', 'NSCF', 'EXPENSE', '6855', 15677, 'Dotations aux provisions et pertes de valeur sur comptes financiers', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15681, 1, NULL, '2024-07-16 13:31:53', 'NSCF', 'EXPENSE', '686', 15663, 'Dotations aux amortissements, provisions et pertes de valeur, éléments financiers', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15682, 1, NULL, '2024-07-16 13:31:53', 'NSCF', 'EXPENSE', '6861', 15681, 'Dotations aux amortissements des primes de remboursement des obligations', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15683, 1, NULL, '2024-07-16 13:31:53', 'NSCF', 'EXPENSE', '6865', 15681, 'Dotations aux provisions pour risques et charges financières', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15684, 1, NULL, '2024-07-16 13:31:53', 'NSCF', 'EXPENSE', '6866', 15681, 'Dotations aux provisions pour dépréciations des éléments financiers', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15685, 1, NULL, '2024-07-16 13:31:53', 'NSCF', 'EXPENSE', '68662', 15684, 'Dotations aux provisions pour dépréciations des immobilisations financières', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15686, 1, NULL, '2024-07-16 13:31:53', 'NSCF', 'EXPENSE', '68665', 15684, 'Dotations aux provisions pour les valeurs mobilières de placement', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15687, 1, NULL, '2024-07-16 13:31:53', 'NSCF', 'EXPENSE', '6868', 15681, 'Autres dotations', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15688, 1, NULL, '2024-07-16 13:31:53', 'NSCF', 'EXPENSE', '69', 15487, 'Impôts sur les résultats et assimilés', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15689, 1, NULL, '2024-07-16 13:31:53', 'NSCF', 'EXPENSE', '692', 15688, 'Imposition différée actif', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15690, 1, NULL, '2024-07-16 13:31:53', 'NSCF', 'EXPENSE', '693', 15688, 'Imposition différée passif', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15691, 1, NULL, '2024-07-16 13:31:53', 'NSCF', 'EXPENSE', '695', 15688, 'Impôts sur les bénéfices basés sur les résultats des activités ordinaires', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15692, 1, NULL, '2024-07-16 13:31:53', 'NSCF', 'EXPENSE', '698', 15688, 'Autres impôts sur les résultats', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15693, 1, NULL, '2024-07-16 13:31:53', 'NSCF', 'INCOME', '7', 0, 'COMPTES DE PRODUITS', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15694, 1, NULL, '2024-07-16 13:31:53', 'NSCF', 'INCOME', '70', 15693, 'Ventes de marchandises et de produits fabriqués, ventes de prestations de services et produits annexes', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15695, 1, NULL, '2024-07-16 13:31:53', 'NSCF', 'INCOME', '700', 15694, 'Ventes de marchandises', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15696, 1, NULL, '2024-07-16 13:31:53', 'NSCF', 'INCOME', '701', 15694, 'Ventes de produits finis', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15697, 1, NULL, '2024-07-16 13:31:53', 'NSCF', 'INCOME', '702', 15694, 'Ventes de produits intermédiaires', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15698, 1, NULL, '2024-07-16 13:31:53', 'NSCF', 'INCOME', '703', 15694, 'Ventes de produits résiduels', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15699, 1, NULL, '2024-07-16 13:31:53', 'NSCF', 'INCOME', '704', 15694, 'Ventes de travaux', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15700, 1, NULL, '2024-07-16 13:31:53', 'NSCF', 'INCOME', '705', 15694, 'Ventes d\'études ', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15701, 1, NULL, '2024-07-16 13:31:53', 'NSCF', 'INCOME', '706', 15694, 'Autres prestations de services', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15702, 1, NULL, '2024-07-16 13:31:53', 'NSCF', 'INCOME', '708', 15694, 'Produits des activités annexes', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15703, 1, NULL, '2024-07-16 13:31:53', 'NSCF', 'INCOME', '7081', 15702, 'Produits des services exploités dans l\'intérêt du personnel', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15704, 1, NULL, '2024-07-16 13:31:53', 'NSCF', 'INCOME', '7082', 15702, 'Commissions et courtages', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15705, 1, NULL, '2024-07-16 13:31:53', 'NSCF', 'INCOME', '7083', 15702, 'Locations diverses', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15706, 1, NULL, '2024-07-16 13:31:53', 'NSCF', 'INCOME', '7084', 15702, 'Mise à disposition de personnel facturée', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15707, 1, NULL, '2024-07-16 13:31:53', 'NSCF', 'INCOME', '7085', 15702, 'Ports et frais accessoires facturés', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15708, 1, NULL, '2024-07-16 13:31:53', 'NSCF', 'INCOME', '7086', 15702, 'Bonis sur reprises d\'emballages consignés', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15709, 1, NULL, '2024-07-16 13:31:53', 'NSCF', 'INCOME', '7087', 15702, 'Bonifications obtenues des clients et primes sur ventes', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15710, 1, NULL, '2024-07-16 13:31:53', 'NSCF', 'INCOME', '7088', 15702, 'Autres produits d\'activités annexes (cessions d\'approvisionnements)', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15711, 1, NULL, '2024-07-16 13:31:53', 'NSCF', 'INCOME', '709', 15694, 'Rabais, remises et ristournes accordés', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15712, 1, NULL, '2024-07-16 13:31:53', 'NSCF', 'INCOME', '7090', 15711, 'R.RR, accordés sur ventes de marchandises', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15713, 1, NULL, '2024-07-16 13:31:53', 'NSCF', 'INCOME', '7091', 15711, 'R.RR, accordés sur ventes de produits finis', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15714, 1, NULL, '2024-07-16 13:31:53', 'NSCF', 'INCOME', '7092', 15711, 'R.RR, accordés sur ventes de produits intermédiaires', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15715, 1, NULL, '2024-07-16 13:31:53', 'NSCF', 'INCOME', '7094', 15711, 'R.RR, accordés sur ventes de travaux', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15716, 1, NULL, '2024-07-16 13:31:53', 'NSCF', 'INCOME', '7095', 15711, 'R.RR, accordés sur ventes d\'études ', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15717, 1, NULL, '2024-07-16 13:31:53', 'NSCF', 'INCOME', '7096', 15711, 'R.RR, accordés sur autres prestations de services', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15718, 1, NULL, '2024-07-16 13:31:53', 'NSCF', 'INCOME', '7098', 15711, 'R.RR, accordés sur produits des activités annexes', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15719, 1, NULL, '2024-07-16 13:31:53', 'NSCF', 'INCOME', '72', 15693, 'Production stockée ou déstockée', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15720, 1, NULL, '2024-07-16 13:31:53', 'NSCF', 'INCOME', '723', 15719, 'Variation de stocks d\'encours', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15721, 1, NULL, '2024-07-16 13:31:53', 'NSCF', 'INCOME', '7233', 15720, 'Variation des en-cours de production de biens', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15722, 1, NULL, '2024-07-16 13:31:53', 'NSCF', 'INCOME', '72331', 15721, 'Produits en cours', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15723, 1, NULL, '2024-07-16 13:31:53', 'NSCF', 'INCOME', '72335', 15721, 'Travaux en cours', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15724, 1, NULL, '2024-07-16 13:31:53', 'NSCF', 'INCOME', '7234', 15720, 'Variation des en-cours de production de services', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15725, 1, NULL, '2024-07-16 13:31:53', 'NSCF', 'INCOME', '72341', 15724, 'Etudes en cours', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15726, 1, NULL, '2024-07-16 13:31:53', 'NSCF', 'INCOME', '72345', 15724, 'Autres prestations de services en cours', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15727, 1, NULL, '2024-07-16 13:31:53', 'NSCF', 'INCOME', '724', 15719, 'Variation de stocks de produits', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15728, 1, NULL, '2024-07-16 13:31:53', 'NSCF', 'INCOME', '7241', 15727, 'Variation de stocks des produits intermédiaires', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15729, 1, NULL, '2024-07-16 13:31:53', 'NSCF', 'INCOME', '7245', 15727, 'Variation de stocks des produits finis', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15730, 1, NULL, '2024-07-16 13:31:53', 'NSCF', 'INCOME', '7248', 15727, 'Variation des stocks des produits résiduels', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15731, 1, NULL, '2024-07-16 13:31:53', 'NSCF', 'INCOME', '73', 15693, 'Production immobilisée', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15732, 1, NULL, '2024-07-16 13:31:53', 'NSCF', 'INCOME', '731', 15731, 'Production immobilisée d\'actifs incorporels', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15733, 1, NULL, '2024-07-16 13:31:53', 'NSCF', 'INCOME', '732', 15731, 'Production immobilisée d\'actifs corporels', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15734, 1, NULL, '2024-07-16 13:31:53', 'NSCF', 'INCOME', '74', 15693, 'Subventions d\'exploitation', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15735, 1, NULL, '2024-07-16 13:31:53', 'NSCF', 'INCOME', '741', 15734, 'Subventions d\'équilibre', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15736, 1, NULL, '2024-07-16 13:31:53', 'NSCF', 'INCOME', '748', 15734, 'Autres subventions d\'exploitation', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15737, 1, NULL, '2024-07-16 13:31:53', 'NSCF', 'INCOME', '75', 15693, 'Autres produits opérationnels', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15738, 1, NULL, '2024-07-16 13:31:53', 'NSCF', 'INCOME', '751', 15737, 'Redevances pour concessions, brevets, licences, logiciels et valeurs similaires', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15739, 1, NULL, '2024-07-16 13:31:53', 'NSCF', 'INCOME', '7511', 15738, 'Redevances pour concessions, brevets, licences, logiciels, marques, procédés', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15740, 1, NULL, '2024-07-16 13:31:53', 'NSCF', 'INCOME', '7516', 15738, 'Droits d\'auteur et de reproduction', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15741, 1, NULL, '2024-07-16 13:31:53', 'NSCF', 'INCOME', '7518', 15738, 'Autres droits et valeurs similaires', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15742, 1, NULL, '2024-07-16 13:31:53', 'NSCF', 'INCOME', '752', 15737, 'Plus-value sur sortie d\'actifs immobilisés non financiers', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15743, 1, NULL, '2024-07-16 13:31:53', 'NSCF', 'INCOME', '753', 15737, 'Jetons de présence et rémunérations d\'administrateurs ou de gérants', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15744, 1, NULL, '2024-07-16 13:31:53', 'NSCF', 'INCOME', '754', 15737, 'Quotes-parts de subventions d\'investissements virés au résultat de l\'exercice', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15745, 1, NULL, '2024-07-16 13:31:53', 'NSCF', 'INCOME', '755', 15737, 'Quotes-parts de résultat sur opérations faites en commun', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15746, 1, NULL, '2024-07-16 13:31:53', 'NSCF', 'INCOME', '7551', 15745, 'Quote-part de perte transférée (comptabilité du gérant)', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15747, 1, NULL, '2024-07-16 13:31:53', 'NSCF', 'INCOME', '7555', 15745, 'Quote-part de bénéfice attribuée (comptabilité des associés non-gérants)', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15748, 1, NULL, '2024-07-16 13:31:53', 'NSCF', 'INCOME', '756', 15737, 'Rentrées sur créances amorties', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15749, 1, NULL, '2024-07-16 13:31:53', 'NSCF', 'INCOME', '757', 15737, 'Produits exceptionnels sur opérations de gestion', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15750, 1, NULL, '2024-07-16 13:31:53', 'NSCF', 'INCOME', '758', 15737, 'Autres produits de gestion courante', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15751, 1, NULL, '2024-07-16 13:31:53', 'NSCF', 'INCOME', '76', 15693, 'Produits financiers', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15752, 1, NULL, '2024-07-16 13:31:53', 'NSCF', 'INCOME', '761', 15751, 'Produits des participations', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15753, 1, NULL, '2024-07-16 13:31:53', 'NSCF', 'INCOME', '7611', 15752, 'Revenus des titres de participation', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15754, 1, NULL, '2024-07-16 13:31:53', 'NSCF', 'INCOME', '7616', 15752, 'Revenus sur autres formes de participation', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15755, 1, NULL, '2024-07-16 13:31:53', 'NSCF', 'INCOME', '7617', 15752, 'Revenus des créances rattachées à des participations', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15756, 1, NULL, '2024-07-16 13:31:53', 'NSCF', 'INCOME', '762', 15751, 'Revenus des actifs financiers', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15757, 1, NULL, '2024-07-16 13:31:53', 'NSCF', 'INCOME', '7621', 15756, 'Revenus des titres immobilisés', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15758, 1, NULL, '2024-07-16 13:31:53', 'NSCF', 'INCOME', '7626', 15756, 'Revenus des prêts', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15759, 1, NULL, '2024-07-16 13:31:53', 'NSCF', 'INCOME', '7627', 15756, 'Revenus des créances immobilisées', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15760, 1, NULL, '2024-07-16 13:31:53', 'NSCF', 'INCOME', '763', 15751, 'Revenus de créances', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15761, 1, NULL, '2024-07-16 13:31:53', 'NSCF', 'INCOME', '7631', 15760, 'Revenus des créances commerciales', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15762, 1, NULL, '2024-07-16 13:31:53', 'NSCF', 'INCOME', '7638', 15760, 'Revenus des créances diverses', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15763, 1, NULL, '2024-07-16 13:31:53', 'NSCF', 'INCOME', '765', 15751, 'Ecart d\'évaluation sur actifs financiers - plus values', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15764, 1, NULL, '2024-07-16 13:31:53', 'NSCF', 'INCOME', '766', 15751, 'Gains de change', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15765, 1, NULL, '2024-07-16 13:31:53', 'NSCF', 'INCOME', '767', 15751, 'Produits nets sur cessions d\'actifs financiers', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15766, 1, NULL, '2024-07-16 13:31:53', 'NSCF', 'INCOME', '7671', 15765, 'Profits nets sur cession des part dans les entreprises liées', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15767, 1, NULL, '2024-07-16 13:31:53', 'NSCF', 'INCOME', '7672', 15765, 'Profits nets sur cession d\'actions propres', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15768, 1, NULL, '2024-07-16 13:31:53', 'NSCF', 'INCOME', '7673', 15765, 'Profits nets sur cession des autres titres conférant un droit de propriété', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15769, 1, NULL, '2024-07-16 13:31:53', 'NSCF', 'INCOME', '7676', 15765, 'Profits nets sur cession d\'obligations, bons du trésor et bons de caisse à court terme', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15770, 1, NULL, '2024-07-16 13:31:53', 'NSCF', 'INCOME', '7678', 15765, 'Profits nets sur cession des autres valeurs mobilières et créances assimilées', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15771, 1, NULL, '2024-07-16 13:31:53', 'NSCF', 'INCOME', '768', 15751, 'Autres produits financiers', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15772, 1, NULL, '2024-07-16 13:31:53', 'NSCF', 'INCOME', '77', 15693, 'Eléments extraordinaires - produits', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15773, 1, NULL, '2024-07-16 13:31:53', 'NSCF', 'INCOME', '770', 15772, 'Produits sur exercices antérieurs', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15774, 1, NULL, '2024-07-16 13:31:53', 'NSCF', 'INCOME', '7700', 15773, 'Produits sur exercices antérieurs – ventes de marchandises', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15775, 1, NULL, '2024-07-16 13:31:53', 'NSCF', 'INCOME', '7701', 15773, 'Produits sur exercices antérieurs – ventes de produits finis', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15776, 1, NULL, '2024-07-16 13:31:53', 'NSCF', 'INCOME', '7702', 15773, 'Produits sur exercices antérieurs – ventes de produits intermédiaires', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15777, 1, NULL, '2024-07-16 13:31:53', 'NSCF', 'INCOME', '7703', 15773, 'Produits sur exercices antérieurs – ventes de produits résiduels', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15778, 1, NULL, '2024-07-16 13:31:53', 'NSCF', 'INCOME', '7704', 15773, 'Produits sur exercices antérieurs – ventes de travaux', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15779, 1, NULL, '2024-07-16 13:31:53', 'NSCF', 'INCOME', '7705', 15773, 'Produits sur exercices antérieurs – ventes d\'études ', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15780, 1, NULL, '2024-07-16 13:31:53', 'NSCF', 'INCOME', '7706', 15773, 'Produits sur exercices antérieurs – autres prestations de services', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15781, 1, NULL, '2024-07-16 13:31:53', 'NSCF', 'INCOME', '7708', 15773, 'Produits sur exercices antérieur - ventes de produits des activités annexes', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15782, 1, NULL, '2024-07-16 13:31:53', 'NSCF', 'INCOME', '775', 15772, 'Produits sur exercices antérieurs - autres produits opérationnels', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15783, 1, NULL, '2024-07-16 13:31:53', 'NSCF', 'INCOME', '7751', 15782, 'Redevances pour concessions, brevets, licence ; logiciels et valeurs similaires', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15784, 1, NULL, '2024-07-16 13:31:53', 'NSCF', 'INCOME', '7752', 15782, 'Plus-values sur sorties d\'actifs immobilisés non financiers', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15785, 1, NULL, '2024-07-16 13:31:53', 'NSCF', 'INCOME', '7753', 15782, 'Jetons de présence et rémunérations d\'administrateurs ou de gérants', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15786, 1, NULL, '2024-07-16 13:31:53', 'NSCF', 'INCOME', '7754', 15782, 'Quotes-parts de subventions d\'investissements virées au résultat de l\'exercice', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15787, 1, NULL, '2024-07-16 13:31:53', 'NSCF', 'INCOME', '7755', 15782, 'Quotes-parts de résultat sur opérations faites en commun', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15788, 1, NULL, '2024-07-16 13:31:53', 'NSCF', 'INCOME', '7756', 15782, 'Rentrées sur créances amorties', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15789, 1, NULL, '2024-07-16 13:31:53', 'NSCF', 'INCOME', '7757', 15782, 'Produits exceptionnels sur opération de gestion', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15790, 1, NULL, '2024-07-16 13:31:53', 'NSCF', 'INCOME', '7759', 15782, 'Produits sur exercices antérieurs - remboursement des immobilisations expropriées détruites', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15791, 1, NULL, '2024-07-16 13:31:53', 'NSCF', 'INCOME', '778', 15772, 'Autres éléments extraordinaires - produits', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15792, 1, NULL, '2024-07-16 13:31:53', 'NSCF', 'INCOME', '7783', 15791, 'Bonis provenant du rachat par l\'entreprise d\'actions et d\'obligations émises par elle-même', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15793, 1, NULL, '2024-07-16 13:31:53', 'NSCF', 'INCOME', '7788', 15791, 'Autres Produits extraordinaires divers', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15794, 1, NULL, '2024-07-16 13:31:53', 'NSCF', 'INCOME', '78', 15693, 'Reprises sur pertes de valeur et provisions', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15795, 1, NULL, '2024-07-16 13:31:53', 'NSCF', 'INCOME', '781', 15794, 'Reprises d\'exploitation sur pertes de valeurs et provisions - actifs non courants', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15796, 1, NULL, '2024-07-16 13:31:53', 'NSCF', 'INCOME', '7810', 15795, 'Reprises sur provisions et pertes de valeur des immobilisations incorporelles', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15797, 1, NULL, '2024-07-16 13:31:53', 'NSCF', 'INCOME', '7811', 15795, 'Reprises sur provisions et pertes de valeur des immobilisations corporelles', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15798, 1, NULL, '2024-07-16 13:31:53', 'NSCF', 'INCOME', '7812', 15795, 'Reprises sur provisions des immobilisations en concession', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15799, 1, NULL, '2024-07-16 13:31:53', 'NSCF', 'INCOME', '7813', 15795, 'Reprises sur provisions d\'immobilisations en cours', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15800, 1, NULL, '2024-07-16 13:31:53', 'NSCF', 'INCOME', '7816', 15795, 'Reprise sur pertes de valeur des participations et créances rattachées', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15801, 1, NULL, '2024-07-16 13:31:53', 'NSCF', 'INCOME', '7817', 15795, 'Reprise sur perte de valeur des autres titres immobilisés', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15802, 1, NULL, '2024-07-16 13:31:53', 'NSCF', 'INCOME', '7818', 15795, 'Reprise sur pertes de valeur des autres instruments financiers', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15803, 1, NULL, '2024-07-16 13:31:53', 'NSCF', 'INCOME', '785', 15794, 'Reprises d\'exploitation sur pertes de valeur et provisions - actifs courants', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15804, 1, NULL, '2024-07-16 13:31:53', 'NSCF', 'INCOME', '7853', 15803, 'Reprises sur provisions et pertes de valeur sur les comptes de stocks', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15805, 1, NULL, '2024-07-16 13:31:53', 'NSCF', 'INCOME', '7854', 15803, 'Reprises sur provisions et pertes de valeur sur les comptes de créances', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15806, 1, NULL, '2024-07-16 13:31:53', 'NSCF', 'INCOME', '7855', 15803, 'Reprises sur provisions et pertes de valeur sur les comptes de trésorerie', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15807, 1, NULL, '2024-07-16 13:31:53', 'NSCF', 'INCOME', '786', 15794, 'Reprises financières sur pertes de valeurs et provisions', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15808, 1, NULL, '2024-07-16 13:31:53', 'NSCF', 'INCOME', '7860', 15807, 'Reprises provisions sur plus-values à réinvestir', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15809, 1, NULL, '2024-07-16 13:31:53', 'NSCF', 'INCOME', '7863', 15807, 'Reprises provisions sur pensions et obligations similaires', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15810, 1, NULL, '2024-07-16 13:31:53', 'NSCF', 'INCOME', '7865', 15807, 'Reprises provisions pour impôts', NULL, 0, NULL, NULL, 1, 0, NULL, NULL),
(15811, 1, NULL, '2024-07-16 13:31:53', 'NSCF', 'INCOME', '7868', 15807, 'Reprises autres provisions pour charges - passifs non courants', NULL, 0, NULL, NULL, 1, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `llx_accounting_bookkeeping`
--

CREATE TABLE `llx_accounting_bookkeeping` (
  `rowid` int(11) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `piece_num` int(11) NOT NULL,
  `doc_date` date NOT NULL,
  `doc_type` varchar(30) NOT NULL,
  `doc_ref` varchar(300) NOT NULL,
  `fk_doc` int(11) NOT NULL,
  `fk_docdet` int(11) NOT NULL,
  `thirdparty_code` varchar(32) DEFAULT NULL,
  `subledger_account` varchar(32) DEFAULT NULL,
  `subledger_label` varchar(255) DEFAULT NULL,
  `numero_compte` varchar(32) NOT NULL,
  `label_compte` varchar(255) NOT NULL,
  `label_operation` varchar(255) DEFAULT NULL,
  `debit` double(24,8) NOT NULL,
  `credit` double(24,8) NOT NULL,
  `montant` double(24,8) DEFAULT NULL,
  `sens` varchar(1) DEFAULT NULL,
  `multicurrency_amount` double(24,8) DEFAULT NULL,
  `multicurrency_code` varchar(255) DEFAULT NULL,
  `lettering_code` varchar(255) DEFAULT NULL,
  `date_lettering` datetime DEFAULT NULL,
  `date_lim_reglement` datetime DEFAULT NULL,
  `fk_user_author` int(11) NOT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_user` int(11) DEFAULT NULL,
  `code_journal` varchar(32) NOT NULL,
  `journal_label` varchar(255) DEFAULT NULL,
  `date_validated` datetime DEFAULT NULL,
  `date_export` datetime DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `extraparams` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_accounting_bookkeeping_tmp`
--

CREATE TABLE `llx_accounting_bookkeeping_tmp` (
  `rowid` int(11) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `doc_date` date NOT NULL,
  `doc_type` varchar(30) NOT NULL,
  `doc_ref` varchar(300) NOT NULL,
  `fk_doc` int(11) NOT NULL,
  `fk_docdet` int(11) NOT NULL,
  `thirdparty_code` varchar(32) DEFAULT NULL,
  `subledger_account` varchar(32) DEFAULT NULL,
  `subledger_label` varchar(255) DEFAULT NULL,
  `numero_compte` varchar(32) DEFAULT NULL,
  `label_compte` varchar(255) NOT NULL,
  `label_operation` varchar(255) DEFAULT NULL,
  `debit` double(24,8) NOT NULL,
  `credit` double(24,8) NOT NULL,
  `montant` double(24,8) NOT NULL,
  `sens` varchar(1) DEFAULT NULL,
  `multicurrency_amount` double(24,8) DEFAULT NULL,
  `multicurrency_code` varchar(255) DEFAULT NULL,
  `lettering_code` varchar(255) DEFAULT NULL,
  `date_lettering` datetime DEFAULT NULL,
  `date_lim_reglement` datetime DEFAULT NULL,
  `fk_user_author` int(11) NOT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_user` int(11) DEFAULT NULL,
  `code_journal` varchar(32) NOT NULL,
  `journal_label` varchar(255) DEFAULT NULL,
  `piece_num` int(11) NOT NULL,
  `date_validated` datetime DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `extraparams` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_accounting_fiscalyear`
--

CREATE TABLE `llx_accounting_fiscalyear` (
  `rowid` int(11) NOT NULL,
  `label` varchar(128) NOT NULL,
  `date_start` date DEFAULT NULL,
  `date_end` date DEFAULT NULL,
  `statut` tinyint(4) NOT NULL DEFAULT 0,
  `entity` int(11) NOT NULL DEFAULT 1,
  `datec` datetime NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_user_author` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_accounting_groups_account`
--

CREATE TABLE `llx_accounting_groups_account` (
  `rowid` int(11) NOT NULL,
  `fk_accounting_account` int(11) NOT NULL,
  `fk_c_accounting_category` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_accounting_journal`
--

CREATE TABLE `llx_accounting_journal` (
  `rowid` int(11) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `code` varchar(32) NOT NULL,
  `label` varchar(128) NOT NULL,
  `nature` smallint(6) NOT NULL DEFAULT 1,
  `active` smallint(6) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `llx_accounting_journal`
--

INSERT INTO `llx_accounting_journal` (`rowid`, `entity`, `code`, `label`, `nature`, `active`) VALUES
(1, 1, 'VT', 'ACCOUNTING_SELL_JOURNAL', 2, 1),
(2, 1, 'AC', 'ACCOUNTING_PURCHASE_JOURNAL', 3, 1),
(3, 1, 'BQ', 'FinanceJournal', 4, 1),
(4, 1, 'OD', 'ACCOUNTING_MISCELLANEOUS_JOURNAL', 1, 1),
(5, 1, 'AN', 'ACCOUNTING_HAS_NEW_JOURNAL', 9, 1),
(6, 1, 'ER', 'ExpenseReportsJournal', 5, 1),
(7, 1, 'INV', 'InventoryJournal', 8, 1);

-- --------------------------------------------------------

--
-- Structure de la table `llx_accounting_system`
--

CREATE TABLE `llx_accounting_system` (
  `rowid` int(11) NOT NULL,
  `fk_country` int(11) DEFAULT NULL,
  `pcg_version` varchar(32) NOT NULL,
  `label` varchar(128) NOT NULL,
  `active` smallint(6) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `llx_accounting_system`
--

INSERT INTO `llx_accounting_system` (`rowid`, `fk_country`, `pcg_version`, `label`, `active`) VALUES
(1, 1, 'PCG99-ABREGE', 'The simple accountancy french plan', 1),
(2, 1, 'PCG99-BASE', 'The base accountancy french plan', 1),
(3, 1, 'PCG14-DEV', 'The developed accountancy french plan 2014', 1),
(4, 1, 'PCG18-ASSOC', 'French foundation chart of accounts 2018', 1),
(5, 1, 'PCGAFR14-DEV', 'The developed farm accountancy french plan 2014', 1),
(6, 2, 'PCMN-BASE', 'The base accountancy belgium plan', 1),
(7, 4, 'PCG08-PYME', 'The PYME accountancy spanish plan', 1),
(8, 5, 'SKR03', 'Standardkontenrahmen SKR 03', 1),
(9, 5, 'SKR04', 'Standardkontenrahmen SKR 04', 1),
(10, 6, 'PCG_SUISSE', 'Switzerland plan', 1),
(11, 7, 'ENG-BASE', 'England plan', 1),
(12, 10, 'PCT', 'The Tunisia plan', 1),
(13, 12, 'PCG', 'The Moroccan chart of accounts', 1),
(14, 13, 'NSCF', 'Nouveau système comptable financier', 1),
(15, 17, 'NL-VERKORT', 'Verkort rekeningschema', 1),
(16, 20, 'BAS-K1-MINI', 'The Swedish mini chart of accounts', 1),
(17, 41, 'AT-BASE', 'Plan Austria', 1),
(18, 67, 'PC-MIPYME', 'The PYME accountancy Chile plan', 1),
(19, 80, 'DK-STD', 'Standardkontoplan fra SKAT', 1),
(20, 84, 'EC-SUPERCIAS', 'Plan de cuentas Ecuador', 1),
(21, 140, 'PCN-LUXEMBURG', 'Plan comptable normalisé Luxembourgeois', 1),
(22, 188, 'RO-BASE', 'Plan de conturi romanesc', 1),
(23, 49, 'SYSCOHADA-BJ', 'Plan comptable Ouest-Africain', 1),
(24, 60, 'SYSCOHADA-BF', 'Plan comptable Ouest-Africain', 1),
(25, 73, 'SYSCOHADA-CD', 'Plan comptable Ouest-Africain', 1),
(26, 65, 'SYSCOHADA-CF', 'Plan comptable Ouest-Africain', 1),
(27, 72, 'SYSCOHADA-CG', 'Plan comptable Ouest-Africain', 1),
(28, 21, 'SYSCOHADA-CI', 'Plan comptable Ouest-Africain', 1),
(29, 24, 'SYSCOHADA-CM', 'Plan comptable Ouest-Africain', 1),
(30, 16, 'SYSCOHADA-GA', 'Plan comptable Ouest-Africain', 1),
(31, 87, 'SYSCOHADA-GQ', 'Plan comptable Ouest-Africain', 1),
(32, 71, 'SYSCOHADA-KM', 'Plan comptable Ouest-Africain', 1),
(33, 147, 'SYSCOHADA-ML', 'Plan comptable Ouest-Africain', 1),
(34, 168, 'SYSCOHADA-NE', 'Plan comptable Ouest-Africain', 1),
(35, 22, 'SYSCOHADA-SN', 'Plan comptable Ouest-Africain', 1),
(36, 66, 'SYSCOHADA-TD', 'Plan comptable Ouest-Africain', 1),
(37, 15, 'SYSCOHADA-TG', 'Plan comptable Ouest-Africain', 1),
(38, 11, 'US-BASE', 'USA basic chart of accounts', 1),
(39, 14, 'CA-ENG-BASE', 'Canadian basic chart of accounts - English', 1),
(40, 154, 'SAT/24-2019', 'Catalogo y codigo agrupador fiscal del 2019', 1);

-- --------------------------------------------------------

--
-- Structure de la table `llx_actioncomm`
--

CREATE TABLE `llx_actioncomm` (
  `id` int(11) NOT NULL,
  `ref` varchar(30) NOT NULL,
  `ref_ext` varchar(255) DEFAULT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `datep` datetime DEFAULT NULL,
  `datep2` datetime DEFAULT NULL,
  `fk_action` int(11) DEFAULT NULL,
  `code` varchar(50) DEFAULT NULL,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_user_author` int(11) DEFAULT NULL,
  `fk_user_mod` int(11) DEFAULT NULL,
  `fk_project` int(11) DEFAULT NULL,
  `fk_soc` int(11) DEFAULT NULL,
  `fk_contact` int(11) DEFAULT NULL,
  `fk_parent` int(11) NOT NULL DEFAULT 0,
  `fk_user_action` int(11) DEFAULT NULL,
  `fk_user_done` int(11) DEFAULT NULL,
  `transparency` int(11) DEFAULT NULL,
  `priority` smallint(6) DEFAULT NULL,
  `visibility` varchar(12) DEFAULT 'default',
  `fulldayevent` smallint(6) NOT NULL DEFAULT 0,
  `percent` smallint(6) NOT NULL DEFAULT 0,
  `location` varchar(128) DEFAULT NULL,
  `durationp` double DEFAULT NULL,
  `label` varchar(255) NOT NULL,
  `note` text DEFAULT NULL,
  `calling_duration` int(11) DEFAULT NULL,
  `email_subject` varchar(255) DEFAULT NULL,
  `email_msgid` varchar(255) DEFAULT NULL,
  `email_from` varchar(255) DEFAULT NULL,
  `email_sender` varchar(255) DEFAULT NULL,
  `email_to` varchar(255) DEFAULT NULL,
  `email_tocc` varchar(255) DEFAULT NULL,
  `email_tobcc` varchar(255) DEFAULT NULL,
  `errors_to` varchar(255) DEFAULT NULL,
  `reply_to` varchar(255) DEFAULT NULL,
  `recurid` varchar(128) DEFAULT NULL,
  `recurrule` varchar(128) DEFAULT NULL,
  `recurdateend` datetime DEFAULT NULL,
  `num_vote` int(11) DEFAULT NULL,
  `event_paid` smallint(6) NOT NULL DEFAULT 0,
  `status` smallint(6) NOT NULL DEFAULT 0,
  `fk_element` int(11) DEFAULT NULL,
  `elementtype` varchar(255) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `extraparams` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_actioncomm_extrafields`
--

CREATE TABLE `llx_actioncomm_extrafields` (
  `rowid` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_actioncomm_reminder`
--

CREATE TABLE `llx_actioncomm_reminder` (
  `rowid` int(11) NOT NULL,
  `dateremind` datetime NOT NULL,
  `typeremind` varchar(32) NOT NULL,
  `fk_user` int(11) NOT NULL,
  `offsetvalue` int(11) NOT NULL,
  `offsetunit` varchar(1) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `lasterror` varchar(128) DEFAULT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `fk_actioncomm` int(11) NOT NULL,
  `fk_email_template` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_actioncomm_resources`
--

CREATE TABLE `llx_actioncomm_resources` (
  `rowid` int(11) NOT NULL,
  `fk_actioncomm` int(11) NOT NULL,
  `element_type` varchar(50) NOT NULL,
  `fk_element` int(11) NOT NULL,
  `answer_status` varchar(50) DEFAULT NULL,
  `mandatory` smallint(6) DEFAULT NULL,
  `transparency` smallint(6) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_adherent`
--

CREATE TABLE `llx_adherent` (
  `rowid` int(11) NOT NULL,
  `ref` varchar(30) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `ref_ext` varchar(128) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `civility` varchar(6) DEFAULT NULL,
  `lastname` varchar(50) DEFAULT NULL,
  `firstname` varchar(50) DEFAULT NULL,
  `login` varchar(50) DEFAULT NULL,
  `pass` varchar(50) DEFAULT NULL,
  `pass_crypted` varchar(128) DEFAULT NULL,
  `fk_adherent_type` int(11) NOT NULL,
  `morphy` varchar(3) NOT NULL,
  `societe` varchar(128) DEFAULT NULL,
  `fk_soc` int(11) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `zip` varchar(30) DEFAULT NULL,
  `town` varchar(50) DEFAULT NULL,
  `state_id` int(11) DEFAULT NULL,
  `country` int(11) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `socialnetworks` text DEFAULT NULL,
  `skype` varchar(255) DEFAULT NULL,
  `twitter` varchar(255) DEFAULT NULL,
  `facebook` varchar(255) DEFAULT NULL,
  `linkedin` varchar(255) DEFAULT NULL,
  `instagram` varchar(255) DEFAULT NULL,
  `snapchat` varchar(255) DEFAULT NULL,
  `googleplus` varchar(255) DEFAULT NULL,
  `youtube` varchar(255) DEFAULT NULL,
  `whatsapp` varchar(255) DEFAULT NULL,
  `phone` varchar(30) DEFAULT NULL,
  `phone_perso` varchar(30) DEFAULT NULL,
  `phone_mobile` varchar(30) DEFAULT NULL,
  `birth` date DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `statut` smallint(6) NOT NULL DEFAULT 0,
  `public` smallint(6) NOT NULL DEFAULT 0,
  `datefin` datetime DEFAULT NULL,
  `note_private` text DEFAULT NULL,
  `note_public` text DEFAULT NULL,
  `model_pdf` varchar(255) DEFAULT NULL,
  `datevalid` datetime DEFAULT NULL,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_user_author` int(11) DEFAULT NULL,
  `fk_user_mod` int(11) DEFAULT NULL,
  `fk_user_valid` int(11) DEFAULT NULL,
  `canvas` varchar(32) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_adherent_extrafields`
--

CREATE TABLE `llx_adherent_extrafields` (
  `rowid` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_adherent_type`
--

CREATE TABLE `llx_adherent_type` (
  `rowid` int(11) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `statut` smallint(6) NOT NULL DEFAULT 0,
  `libelle` varchar(50) NOT NULL,
  `morphy` varchar(3) NOT NULL,
  `duration` varchar(6) DEFAULT NULL,
  `subscription` varchar(3) NOT NULL DEFAULT '1',
  `amount` double(24,8) DEFAULT NULL,
  `vote` varchar(3) NOT NULL DEFAULT '1',
  `note` text DEFAULT NULL,
  `mail_valid` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_adherent_type_extrafields`
--

CREATE TABLE `llx_adherent_type_extrafields` (
  `rowid` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_adherent_type_lang`
--

CREATE TABLE `llx_adherent_type_lang` (
  `rowid` int(11) NOT NULL,
  `fk_type` int(11) NOT NULL DEFAULT 0,
  `lang` varchar(5) NOT NULL DEFAULT '0',
  `label` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `email` text DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_advtargetemailing`
--

CREATE TABLE `llx_advtargetemailing` (
  `rowid` int(11) NOT NULL,
  `name` varchar(180) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `fk_element` int(11) NOT NULL,
  `type_element` varchar(180) NOT NULL,
  `filtervalue` text DEFAULT NULL,
  `fk_user_author` int(11) NOT NULL,
  `datec` datetime NOT NULL,
  `fk_user_mod` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_asset`
--

CREATE TABLE `llx_asset` (
  `rowid` int(11) NOT NULL,
  `ref` varchar(128) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `label` varchar(255) DEFAULT NULL,
  `amount_ht` double(24,8) DEFAULT NULL,
  `amount_vat` double(24,8) DEFAULT NULL,
  `fk_asset_type` int(11) NOT NULL,
  `description` text DEFAULT NULL,
  `note_public` text DEFAULT NULL,
  `note_private` text DEFAULT NULL,
  `date_creation` datetime NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_user_creat` int(11) NOT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_asset_extrafields`
--

CREATE TABLE `llx_asset_extrafields` (
  `rowid` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_asset_type`
--

CREATE TABLE `llx_asset_type` (
  `rowid` int(11) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `label` varchar(50) NOT NULL,
  `accountancy_code_asset` varchar(32) DEFAULT NULL,
  `accountancy_code_depreciation_asset` varchar(32) DEFAULT NULL,
  `accountancy_code_depreciation_expense` varchar(32) DEFAULT NULL,
  `note` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_asset_type_extrafields`
--

CREATE TABLE `llx_asset_type_extrafields` (
  `rowid` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_bank`
--

CREATE TABLE `llx_bank` (
  `rowid` int(11) NOT NULL,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `datev` date DEFAULT NULL,
  `dateo` date DEFAULT NULL,
  `amount` double(24,8) NOT NULL DEFAULT 0.00000000,
  `label` varchar(255) DEFAULT NULL,
  `fk_account` int(11) DEFAULT NULL,
  `fk_user_author` int(11) DEFAULT NULL,
  `fk_user_rappro` int(11) DEFAULT NULL,
  `fk_type` varchar(6) DEFAULT NULL,
  `num_releve` varchar(50) DEFAULT NULL,
  `num_chq` varchar(50) DEFAULT NULL,
  `numero_compte` varchar(32) DEFAULT NULL,
  `rappro` tinyint(4) DEFAULT 0,
  `note` text DEFAULT NULL,
  `fk_bordereau` int(11) DEFAULT 0,
  `banque` varchar(255) DEFAULT NULL,
  `emetteur` varchar(255) DEFAULT NULL,
  `author` varchar(40) DEFAULT NULL,
  `origin_id` int(11) DEFAULT NULL,
  `origin_type` varchar(64) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_bank_account`
--

CREATE TABLE `llx_bank_account` (
  `rowid` int(11) NOT NULL,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `ref` varchar(12) NOT NULL,
  `label` varchar(30) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `fk_user_author` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `bank` varchar(60) DEFAULT NULL,
  `code_banque` varchar(128) DEFAULT NULL,
  `code_guichet` varchar(6) DEFAULT NULL,
  `number` varchar(255) DEFAULT NULL,
  `cle_rib` varchar(5) DEFAULT NULL,
  `bic` varchar(11) DEFAULT NULL,
  `iban_prefix` varchar(34) DEFAULT NULL,
  `country_iban` varchar(2) DEFAULT NULL,
  `cle_iban` varchar(2) DEFAULT NULL,
  `domiciliation` varchar(255) DEFAULT NULL,
  `state_id` int(11) DEFAULT NULL,
  `fk_pays` int(11) NOT NULL,
  `proprio` varchar(60) DEFAULT NULL,
  `owner_address` varchar(255) DEFAULT NULL,
  `courant` smallint(6) NOT NULL DEFAULT 0,
  `clos` smallint(6) NOT NULL DEFAULT 0,
  `rappro` smallint(6) DEFAULT 1,
  `url` varchar(128) DEFAULT NULL,
  `account_number` varchar(32) DEFAULT NULL,
  `fk_accountancy_journal` int(11) DEFAULT NULL,
  `currency_code` varchar(3) NOT NULL,
  `min_allowed` int(11) DEFAULT 0,
  `min_desired` int(11) DEFAULT 0,
  `comment` text DEFAULT NULL,
  `note_public` text DEFAULT NULL,
  `model_pdf` varchar(255) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `extraparams` varchar(255) DEFAULT NULL,
  `ics` varchar(32) DEFAULT NULL,
  `ics_transfer` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_bank_account_extrafields`
--

CREATE TABLE `llx_bank_account_extrafields` (
  `rowid` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_bank_categ`
--

CREATE TABLE `llx_bank_categ` (
  `rowid` int(11) NOT NULL,
  `label` varchar(255) DEFAULT NULL,
  `entity` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_bank_class`
--

CREATE TABLE `llx_bank_class` (
  `lineid` int(11) NOT NULL,
  `fk_categ` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_bank_url`
--

CREATE TABLE `llx_bank_url` (
  `rowid` int(11) NOT NULL,
  `fk_bank` int(11) DEFAULT NULL,
  `url_id` int(11) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `type` varchar(24) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_blockedlog`
--

CREATE TABLE `llx_blockedlog` (
  `rowid` int(11) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `date_creation` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `action` varchar(50) DEFAULT NULL,
  `amounts` double(24,8) NOT NULL,
  `element` varchar(50) DEFAULT NULL,
  `fk_user` int(11) DEFAULT NULL,
  `user_fullname` varchar(255) DEFAULT NULL,
  `fk_object` int(11) DEFAULT NULL,
  `ref_object` varchar(255) DEFAULT NULL,
  `date_object` datetime DEFAULT NULL,
  `signature` varchar(100) NOT NULL,
  `signature_line` varchar(100) NOT NULL,
  `object_data` mediumtext DEFAULT NULL,
  `object_version` varchar(32) DEFAULT '',
  `certified` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_blockedlog_authority`
--

CREATE TABLE `llx_blockedlog_authority` (
  `rowid` int(11) NOT NULL,
  `blockchain` longtext NOT NULL,
  `signature` varchar(100) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_bom_bom`
--

CREATE TABLE `llx_bom_bom` (
  `rowid` int(11) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `ref` varchar(128) NOT NULL,
  `bomtype` int(11) DEFAULT 0,
  `label` varchar(255) DEFAULT NULL,
  `fk_product` int(11) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `note_public` text DEFAULT NULL,
  `note_private` text DEFAULT NULL,
  `fk_warehouse` int(11) DEFAULT NULL,
  `qty` double(24,8) DEFAULT NULL,
  `efficiency` double(24,8) DEFAULT 1.00000000,
  `duration` double(24,8) DEFAULT NULL,
  `date_creation` datetime NOT NULL,
  `date_valid` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_user_creat` int(11) NOT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `fk_user_valid` int(11) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `model_pdf` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_bom_bomline`
--

CREATE TABLE `llx_bom_bomline` (
  `rowid` int(11) NOT NULL,
  `fk_bom` int(11) NOT NULL,
  `fk_product` int(11) NOT NULL,
  `fk_bom_child` int(11) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `qty` double(24,8) NOT NULL,
  `qty_frozen` smallint(6) DEFAULT 0,
  `disable_stock_change` smallint(6) DEFAULT 0,
  `efficiency` double(24,8) NOT NULL DEFAULT 1.00000000,
  `position` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_bom_bomline_extrafields`
--

CREATE TABLE `llx_bom_bomline_extrafields` (
  `rowid` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_bom_bom_extrafields`
--

CREATE TABLE `llx_bom_bom_extrafields` (
  `rowid` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_bookmark`
--

CREATE TABLE `llx_bookmark` (
  `rowid` int(11) NOT NULL,
  `fk_user` int(11) NOT NULL,
  `dateb` datetime DEFAULT NULL,
  `url` text DEFAULT NULL,
  `target` varchar(16) DEFAULT NULL,
  `title` varchar(64) DEFAULT NULL,
  `favicon` varchar(24) DEFAULT NULL,
  `position` int(11) DEFAULT 0,
  `entity` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_bordereau_cheque`
--

CREATE TABLE `llx_bordereau_cheque` (
  `rowid` int(11) NOT NULL,
  `ref` varchar(30) NOT NULL,
  `ref_ext` varchar(255) DEFAULT NULL,
  `datec` datetime NOT NULL,
  `date_bordereau` date DEFAULT NULL,
  `amount` double(24,8) NOT NULL,
  `nbcheque` smallint(6) NOT NULL,
  `fk_bank_account` int(11) DEFAULT NULL,
  `fk_user_author` int(11) DEFAULT NULL,
  `statut` smallint(6) NOT NULL DEFAULT 0,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `note` text DEFAULT NULL,
  `entity` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_boxes`
--

CREATE TABLE `llx_boxes` (
  `rowid` int(11) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `box_id` int(11) NOT NULL,
  `position` smallint(6) NOT NULL,
  `box_order` varchar(3) NOT NULL,
  `fk_user` int(11) NOT NULL DEFAULT 0,
  `maxline` int(11) DEFAULT NULL,
  `params` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `llx_boxes`
--

INSERT INTO `llx_boxes` (`rowid`, `entity`, `box_id`, `position`, `box_order`, `fk_user`, `maxline`, `params`) VALUES
(1, 1, 1, 0, '0', 0, NULL, NULL),
(2, 1, 2, 0, '0', 0, NULL, NULL),
(3, 1, 2, 1, '0', 0, NULL, NULL),
(4, 1, 2, 2, '0', 0, NULL, NULL),
(5, 1, 2, 3, '0', 0, NULL, NULL),
(6, 1, 2, 11, '0', 0, NULL, NULL),
(7, 1, 2, 27, '0', 0, NULL, NULL),
(8, 1, 3, 0, '0', 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `llx_boxes_def`
--

CREATE TABLE `llx_boxes_def` (
  `rowid` int(11) NOT NULL,
  `file` varchar(200) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `note` varchar(130) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `llx_boxes_def`
--

INSERT INTO `llx_boxes_def` (`rowid`, `file`, `entity`, `tms`, `note`) VALUES
(1, 'box_produits.php', 1, '2024-07-16 13:36:03', NULL),
(2, 'box_produits_alerte_stock.php', 1, '2024-07-16 13:36:03', NULL),
(3, 'box_graph_product_distribution.php', 1, '2024-07-16 13:36:03', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `llx_budget`
--

CREATE TABLE `llx_budget` (
  `rowid` int(11) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `label` varchar(255) NOT NULL,
  `status` int(11) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `date_start` date DEFAULT NULL,
  `date_end` date DEFAULT NULL,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_user_creat` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `import_key` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_budget_lines`
--

CREATE TABLE `llx_budget_lines` (
  `rowid` int(11) NOT NULL,
  `fk_budget` int(11) NOT NULL,
  `fk_project_ids` varchar(180) NOT NULL,
  `amount` double(24,8) NOT NULL,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_user_creat` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `import_key` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_categorie`
--

CREATE TABLE `llx_categorie` (
  `rowid` int(11) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `fk_parent` int(11) NOT NULL DEFAULT 0,
  `label` varchar(180) NOT NULL,
  `ref_ext` varchar(255) DEFAULT NULL,
  `type` int(11) NOT NULL DEFAULT 1,
  `description` text DEFAULT NULL,
  `color` varchar(8) DEFAULT NULL,
  `fk_soc` int(11) DEFAULT NULL,
  `visible` tinyint(4) NOT NULL DEFAULT 1,
  `date_creation` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_user_creat` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_categories_extrafields`
--

CREATE TABLE `llx_categories_extrafields` (
  `rowid` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_categorie_account`
--

CREATE TABLE `llx_categorie_account` (
  `fk_categorie` int(11) NOT NULL,
  `fk_account` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_categorie_actioncomm`
--

CREATE TABLE `llx_categorie_actioncomm` (
  `fk_categorie` int(11) NOT NULL,
  `fk_actioncomm` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_categorie_contact`
--

CREATE TABLE `llx_categorie_contact` (
  `fk_categorie` int(11) NOT NULL,
  `fk_socpeople` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_categorie_fournisseur`
--

CREATE TABLE `llx_categorie_fournisseur` (
  `fk_categorie` int(11) NOT NULL,
  `fk_soc` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_categorie_lang`
--

CREATE TABLE `llx_categorie_lang` (
  `rowid` int(11) NOT NULL,
  `fk_category` int(11) NOT NULL DEFAULT 0,
  `lang` varchar(5) NOT NULL DEFAULT '0',
  `label` varchar(255) NOT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_categorie_member`
--

CREATE TABLE `llx_categorie_member` (
  `fk_categorie` int(11) NOT NULL,
  `fk_member` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_categorie_product`
--

CREATE TABLE `llx_categorie_product` (
  `fk_categorie` int(11) NOT NULL,
  `fk_product` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_categorie_project`
--

CREATE TABLE `llx_categorie_project` (
  `fk_categorie` int(11) NOT NULL,
  `fk_project` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_categorie_societe`
--

CREATE TABLE `llx_categorie_societe` (
  `fk_categorie` int(11) NOT NULL,
  `fk_soc` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_categorie_user`
--

CREATE TABLE `llx_categorie_user` (
  `fk_categorie` int(11) NOT NULL,
  `fk_user` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_categorie_warehouse`
--

CREATE TABLE `llx_categorie_warehouse` (
  `fk_categorie` int(11) NOT NULL,
  `fk_warehouse` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_categorie_website_page`
--

CREATE TABLE `llx_categorie_website_page` (
  `fk_categorie` int(11) NOT NULL,
  `fk_website_page` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_chargesociales`
--

CREATE TABLE `llx_chargesociales` (
  `rowid` int(11) NOT NULL,
  `ref` varchar(16) DEFAULT NULL,
  `date_ech` datetime NOT NULL,
  `libelle` varchar(80) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `date_creation` datetime DEFAULT NULL,
  `date_valid` datetime DEFAULT NULL,
  `fk_user` int(11) DEFAULT NULL,
  `fk_user_author` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `fk_user_valid` int(11) DEFAULT NULL,
  `fk_type` int(11) NOT NULL,
  `fk_account` int(11) DEFAULT NULL,
  `fk_mode_reglement` int(11) DEFAULT NULL,
  `amount` double(24,8) NOT NULL DEFAULT 0.00000000,
  `paye` smallint(6) NOT NULL DEFAULT 0,
  `periode` date DEFAULT NULL,
  `fk_projet` int(11) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_commande`
--

CREATE TABLE `llx_commande` (
  `rowid` int(11) NOT NULL,
  `ref` varchar(30) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `ref_ext` varchar(255) DEFAULT NULL,
  `ref_int` varchar(255) DEFAULT NULL,
  `ref_client` varchar(255) DEFAULT NULL,
  `fk_soc` int(11) NOT NULL,
  `fk_projet` int(11) DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `date_creation` datetime DEFAULT NULL,
  `date_valid` datetime DEFAULT NULL,
  `date_cloture` datetime DEFAULT NULL,
  `date_commande` date DEFAULT NULL,
  `fk_user_author` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `fk_user_valid` int(11) DEFAULT NULL,
  `fk_user_cloture` int(11) DEFAULT NULL,
  `source` smallint(6) DEFAULT NULL,
  `fk_statut` smallint(6) DEFAULT 0,
  `amount_ht` double(24,8) DEFAULT 0.00000000,
  `remise_percent` double DEFAULT 0,
  `remise_absolue` double DEFAULT 0,
  `remise` double DEFAULT 0,
  `total_tva` double(24,8) DEFAULT 0.00000000,
  `localtax1` double(24,8) DEFAULT 0.00000000,
  `localtax2` double(24,8) DEFAULT 0.00000000,
  `total_ht` double(24,8) DEFAULT 0.00000000,
  `total_ttc` double(24,8) DEFAULT 0.00000000,
  `note_private` text DEFAULT NULL,
  `note_public` text DEFAULT NULL,
  `model_pdf` varchar(255) DEFAULT NULL,
  `last_main_doc` varchar(255) DEFAULT NULL,
  `module_source` varchar(32) DEFAULT NULL,
  `pos_source` varchar(32) DEFAULT NULL,
  `facture` tinyint(4) DEFAULT 0,
  `fk_account` int(11) DEFAULT NULL,
  `fk_currency` varchar(3) DEFAULT NULL,
  `fk_cond_reglement` int(11) DEFAULT NULL,
  `fk_mode_reglement` int(11) DEFAULT NULL,
  `date_livraison` datetime DEFAULT NULL,
  `fk_shipping_method` int(11) DEFAULT NULL,
  `fk_warehouse` int(11) DEFAULT NULL,
  `fk_availability` int(11) DEFAULT NULL,
  `fk_input_reason` int(11) DEFAULT NULL,
  `fk_delivery_address` int(11) DEFAULT NULL,
  `fk_incoterms` int(11) DEFAULT NULL,
  `location_incoterms` varchar(255) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `extraparams` varchar(255) DEFAULT NULL,
  `fk_multicurrency` int(11) DEFAULT NULL,
  `multicurrency_code` varchar(255) DEFAULT NULL,
  `multicurrency_tx` double(24,8) DEFAULT 1.00000000,
  `multicurrency_total_ht` double(24,8) DEFAULT 0.00000000,
  `multicurrency_total_tva` double(24,8) DEFAULT 0.00000000,
  `multicurrency_total_ttc` double(24,8) DEFAULT 0.00000000
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_commandedet`
--

CREATE TABLE `llx_commandedet` (
  `rowid` int(11) NOT NULL,
  `fk_commande` int(11) NOT NULL,
  `fk_parent_line` int(11) DEFAULT NULL,
  `fk_product` int(11) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `vat_src_code` varchar(10) DEFAULT '',
  `tva_tx` double(6,3) DEFAULT NULL,
  `localtax1_tx` double(6,3) DEFAULT 0.000,
  `localtax1_type` varchar(10) DEFAULT NULL,
  `localtax2_tx` double(6,3) DEFAULT 0.000,
  `localtax2_type` varchar(10) DEFAULT NULL,
  `qty` double DEFAULT NULL,
  `remise_percent` double DEFAULT 0,
  `remise` double DEFAULT 0,
  `fk_remise_except` int(11) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `subprice` double(24,8) DEFAULT 0.00000000,
  `total_ht` double(24,8) DEFAULT 0.00000000,
  `total_tva` double(24,8) DEFAULT 0.00000000,
  `total_localtax1` double(24,8) DEFAULT 0.00000000,
  `total_localtax2` double(24,8) DEFAULT 0.00000000,
  `total_ttc` double(24,8) DEFAULT 0.00000000,
  `product_type` int(11) DEFAULT 0,
  `date_start` datetime DEFAULT NULL,
  `date_end` datetime DEFAULT NULL,
  `info_bits` int(11) DEFAULT 0,
  `buy_price_ht` double(24,8) DEFAULT 0.00000000,
  `fk_product_fournisseur_price` int(11) DEFAULT NULL,
  `special_code` int(11) DEFAULT 0,
  `rang` int(11) DEFAULT 0,
  `fk_unit` int(11) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `ref_ext` varchar(255) DEFAULT NULL,
  `fk_commandefourndet` int(11) DEFAULT NULL,
  `fk_multicurrency` int(11) DEFAULT NULL,
  `multicurrency_code` varchar(255) DEFAULT NULL,
  `multicurrency_subprice` double(24,8) DEFAULT 0.00000000,
  `multicurrency_total_ht` double(24,8) DEFAULT 0.00000000,
  `multicurrency_total_tva` double(24,8) DEFAULT 0.00000000,
  `multicurrency_total_ttc` double(24,8) DEFAULT 0.00000000
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_commandedet_extrafields`
--

CREATE TABLE `llx_commandedet_extrafields` (
  `rowid` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_commande_extrafields`
--

CREATE TABLE `llx_commande_extrafields` (
  `rowid` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_commande_fournisseur`
--

CREATE TABLE `llx_commande_fournisseur` (
  `rowid` int(11) NOT NULL,
  `ref` varchar(180) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `ref_ext` varchar(255) DEFAULT NULL,
  `ref_supplier` varchar(255) DEFAULT NULL,
  `fk_soc` int(11) NOT NULL,
  `fk_projet` int(11) DEFAULT 0,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `date_creation` datetime DEFAULT NULL,
  `date_valid` datetime DEFAULT NULL,
  `date_approve` datetime DEFAULT NULL,
  `date_approve2` datetime DEFAULT NULL,
  `date_commande` date DEFAULT NULL,
  `fk_user_author` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `fk_user_valid` int(11) DEFAULT NULL,
  `fk_user_approve` int(11) DEFAULT NULL,
  `fk_user_approve2` int(11) DEFAULT NULL,
  `source` smallint(6) NOT NULL,
  `fk_statut` smallint(6) DEFAULT 0,
  `billed` smallint(6) DEFAULT 0,
  `amount_ht` double(24,8) DEFAULT 0.00000000,
  `remise_percent` double DEFAULT 0,
  `remise` double DEFAULT 0,
  `total_tva` double(24,8) DEFAULT 0.00000000,
  `localtax1` double(24,8) DEFAULT 0.00000000,
  `localtax2` double(24,8) DEFAULT 0.00000000,
  `total_ht` double(24,8) DEFAULT 0.00000000,
  `total_ttc` double(24,8) DEFAULT 0.00000000,
  `note_private` text DEFAULT NULL,
  `note_public` text DEFAULT NULL,
  `model_pdf` varchar(255) DEFAULT NULL,
  `last_main_doc` varchar(255) DEFAULT NULL,
  `date_livraison` datetime DEFAULT NULL,
  `fk_account` int(11) DEFAULT NULL,
  `fk_cond_reglement` int(11) DEFAULT NULL,
  `fk_mode_reglement` int(11) DEFAULT NULL,
  `fk_input_method` int(11) DEFAULT 0,
  `fk_incoterms` int(11) DEFAULT NULL,
  `location_incoterms` varchar(255) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `extraparams` varchar(255) DEFAULT NULL,
  `fk_multicurrency` int(11) DEFAULT NULL,
  `multicurrency_code` varchar(255) DEFAULT NULL,
  `multicurrency_tx` double(24,8) DEFAULT 1.00000000,
  `multicurrency_total_ht` double(24,8) DEFAULT 0.00000000,
  `multicurrency_total_tva` double(24,8) DEFAULT 0.00000000,
  `multicurrency_total_ttc` double(24,8) DEFAULT 0.00000000
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_commande_fournisseurdet`
--

CREATE TABLE `llx_commande_fournisseurdet` (
  `rowid` int(11) NOT NULL,
  `fk_commande` int(11) NOT NULL,
  `fk_parent_line` int(11) DEFAULT NULL,
  `fk_product` int(11) DEFAULT NULL,
  `ref` varchar(50) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `vat_src_code` varchar(10) DEFAULT '',
  `tva_tx` double(6,3) DEFAULT 0.000,
  `localtax1_tx` double(6,3) DEFAULT 0.000,
  `localtax1_type` varchar(10) DEFAULT NULL,
  `localtax2_tx` double(6,3) DEFAULT 0.000,
  `localtax2_type` varchar(10) DEFAULT NULL,
  `qty` double DEFAULT NULL,
  `remise_percent` double DEFAULT 0,
  `remise` double DEFAULT 0,
  `subprice` double(24,8) DEFAULT 0.00000000,
  `total_ht` double(24,8) DEFAULT 0.00000000,
  `total_tva` double(24,8) DEFAULT 0.00000000,
  `total_localtax1` double(24,8) DEFAULT 0.00000000,
  `total_localtax2` double(24,8) DEFAULT 0.00000000,
  `total_ttc` double(24,8) DEFAULT 0.00000000,
  `product_type` int(11) DEFAULT 0,
  `date_start` datetime DEFAULT NULL,
  `date_end` datetime DEFAULT NULL,
  `info_bits` int(11) DEFAULT 0,
  `special_code` int(11) DEFAULT 0,
  `rang` int(11) DEFAULT 0,
  `import_key` varchar(14) DEFAULT NULL,
  `fk_unit` int(11) DEFAULT NULL,
  `fk_multicurrency` int(11) DEFAULT NULL,
  `multicurrency_code` varchar(255) DEFAULT NULL,
  `multicurrency_subprice` double(24,8) DEFAULT 0.00000000,
  `multicurrency_total_ht` double(24,8) DEFAULT 0.00000000,
  `multicurrency_total_tva` double(24,8) DEFAULT 0.00000000,
  `multicurrency_total_ttc` double(24,8) DEFAULT 0.00000000
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_commande_fournisseurdet_extrafields`
--

CREATE TABLE `llx_commande_fournisseurdet_extrafields` (
  `rowid` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_commande_fournisseur_dispatch`
--

CREATE TABLE `llx_commande_fournisseur_dispatch` (
  `rowid` int(11) NOT NULL,
  `fk_commande` int(11) DEFAULT NULL,
  `fk_product` int(11) DEFAULT NULL,
  `fk_commandefourndet` int(11) DEFAULT NULL,
  `fk_projet` int(11) DEFAULT NULL,
  `fk_reception` int(11) DEFAULT NULL,
  `qty` float DEFAULT NULL,
  `fk_entrepot` int(11) DEFAULT NULL,
  `fk_user` int(11) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `batch` varchar(128) DEFAULT NULL,
  `eatby` date DEFAULT NULL,
  `sellby` date DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_commande_fournisseur_dispatch_extrafields`
--

CREATE TABLE `llx_commande_fournisseur_dispatch_extrafields` (
  `rowid` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_commande_fournisseur_extrafields`
--

CREATE TABLE `llx_commande_fournisseur_extrafields` (
  `rowid` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_commande_fournisseur_log`
--

CREATE TABLE `llx_commande_fournisseur_log` (
  `rowid` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `datelog` datetime NOT NULL,
  `fk_commande` int(11) NOT NULL,
  `fk_statut` smallint(6) NOT NULL,
  `fk_user` int(11) NOT NULL,
  `comment` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_comment`
--

CREATE TABLE `llx_comment` (
  `rowid` int(11) NOT NULL,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `description` text NOT NULL,
  `fk_user_author` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `fk_element` int(11) DEFAULT NULL,
  `element_type` varchar(50) DEFAULT NULL,
  `entity` int(11) DEFAULT 1,
  `import_key` varchar(125) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_const`
--

CREATE TABLE `llx_const` (
  `rowid` int(11) NOT NULL,
  `name` varchar(180) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `value` text NOT NULL,
  `type` varchar(64) DEFAULT 'string',
  `visible` tinyint(4) NOT NULL DEFAULT 1,
  `note` text DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `llx_const`
--

INSERT INTO `llx_const` (`rowid`, `name`, `entity`, `value`, `type`, `visible`, `note`, `tms`) VALUES
(1, 'ACCOUNTING_MANAGE_ZERO', 0, '1', 'chaine', 1, 'Manage the  0 for the accountancy account', '2024-07-16 13:31:49'),
(3, 'MAIN_FEATURES_LEVEL', 0, '0', 'chaine', 1, 'Level of features to show: -1=stable+deprecated, 0=stable only (default), 1=stable+experimental, 2=stable+experimental+development', '2024-07-16 13:31:59'),
(4, 'MAILING_LIMIT_SENDBYWEB', 0, '25', 'chaine', 1, 'Number of targets to defined packet size when sending mass email', '2024-07-16 13:31:59'),
(5, 'MAIN_ENABLE_LOG_TO_HTML', 0, '0', 'chaine', 1, 'If this option is set to 1, it is possible to see log output at end of HTML sources by adding paramater logtohtml=1 on URL. Module log must also be enabled.', '2024-07-16 13:31:59'),
(6, 'MAIN_SECURITY_CSRF_WITH_TOKEN', 0, '0', 'chaine', 1, 'If this option is set to 1, a CSRF protection using an antiCSRF token is added.', '2024-07-16 13:31:59'),
(7, 'SYSLOG_HANDLERS', 0, '[\"mod_syslog_file\"]', 'chaine', 0, 'Which logger to use', '2024-07-16 13:31:59'),
(8, 'SYSLOG_FILE', 0, 'DOL_DATA_ROOT/dolibarr.log', 'chaine', 0, 'Directory where to write log file', '2024-07-16 13:31:59'),
(9, 'SYSLOG_LEVEL', 0, '7', 'chaine', 0, 'Level of debug info to show', '2024-07-16 13:31:59'),
(10, 'MAIN_UPLOAD_DOC', 0, '2048', 'chaine', 0, 'Max size for file upload (0 means no upload allowed)', '2024-07-16 13:31:59'),
(11, 'MAIN_ENABLE_OVERWRITE_TRANSLATION', 1, '1', 'chaine', 0, 'Enable translation overwrite', '2024-07-16 13:31:59'),
(12, 'MAIN_ENABLE_DEFAULT_VALUES', 1, '1', 'chaine', 0, 'Enable default value overwrite', '2024-07-16 13:31:59'),
(13, 'MAIN_MONNAIE', 1, 'EUR', 'chaine', 0, 'Currency', '2024-07-16 13:31:59'),
(14, 'MAIN_MAIL_SMTP_SERVER', 1, '', 'chaine', 0, 'Host or ip address for SMTP server', '2024-07-16 13:31:59'),
(15, 'MAIN_MAIL_SMTP_PORT', 1, '', 'chaine', 0, 'Port for SMTP server', '2024-07-16 13:31:59'),
(16, 'MAIN_MAIL_EMAIL_FROM', 1, 'robot@domain.com', 'chaine', 0, 'email emitter for Dolibarr automatic emails', '2024-07-16 13:31:59'),
(17, 'MAIN_SIZE_LISTE_LIMIT', 0, '20', 'chaine', 0, 'Maximum length of lists', '2024-07-16 13:31:59'),
(18, 'MAIN_SIZE_SHORTLIST_LIMIT', 0, '3', 'chaine', 0, 'Maximum length of short lists', '2024-07-16 13:31:59'),
(19, 'MAIN_MENU_STANDARD', 0, 'eldy_menu.php', 'chaine', 0, 'Menu manager for internal users', '2024-07-16 13:31:59'),
(20, 'MAIN_MENUFRONT_STANDARD', 0, 'eldy_menu.php', 'chaine', 0, 'Menu manager for external users', '2024-07-16 13:31:59'),
(21, 'MAIN_MENU_SMARTPHONE', 0, 'eldy_menu.php', 'chaine', 0, 'Menu manager for internal users using smartphones', '2024-07-16 13:31:59'),
(22, 'MAIN_MENUFRONT_SMARTPHONE', 0, 'eldy_menu.php', 'chaine', 0, 'Menu manager for external users using smartphones', '2024-07-16 13:31:59'),
(23, 'MAIN_DELAY_ACTIONS_TODO', 1, '7', 'chaine', 0, 'Tolérance de retard avant alerte (en jours) sur actions planifiées non réalisées', '2024-07-16 13:31:59'),
(24, 'MAIN_DELAY_ORDERS_TO_PROCESS', 1, '2', 'chaine', 0, 'Tolérance de retard avant alerte (en jours) sur commandes clients non traitées', '2024-07-16 13:31:59'),
(25, 'MAIN_DELAY_SUPPLIER_ORDERS_TO_PROCESS', 1, '7', 'chaine', 0, 'Tolérance de retard avant alerte (en jours) sur commandes fournisseurs non traitées', '2024-07-16 13:31:59'),
(26, 'MAIN_DELAY_PROPALS_TO_CLOSE', 1, '31', 'chaine', 0, 'Tolérance de retard avant alerte (en jours) sur propales à cloturer', '2024-07-16 13:32:00'),
(27, 'MAIN_DELAY_PROPALS_TO_BILL', 1, '7', 'chaine', 0, 'Tolérance de retard avant alerte (en jours) sur propales non facturées', '2024-07-16 13:32:00'),
(28, 'MAIN_DELAY_CUSTOMER_BILLS_UNPAYED', 1, '31', 'chaine', 0, 'Tolérance de retard avant alerte (en jours) sur factures client impayées', '2024-07-16 13:32:00'),
(29, 'MAIN_DELAY_SUPPLIER_BILLS_TO_PAY', 1, '2', 'chaine', 0, 'Tolérance de retard avant alerte (en jours) sur factures fournisseur impayées', '2024-07-16 13:32:00'),
(30, 'MAIN_DELAY_NOT_ACTIVATED_SERVICES', 1, '0', 'chaine', 0, 'Tolérance de retard avant alerte (en jours) sur services à activer', '2024-07-16 13:32:00'),
(31, 'MAIN_DELAY_RUNNING_SERVICES', 1, '0', 'chaine', 0, 'Tolérance de retard avant alerte (en jours) sur services expirés', '2024-07-16 13:32:00'),
(32, 'MAIN_DELAY_MEMBERS', 1, '31', 'chaine', 0, 'Tolérance de retard avant alerte (en jours) sur cotisations adhérent en retard', '2024-07-16 13:32:00'),
(33, 'MAIN_DELAY_TRANSACTIONS_TO_CONCILIATE', 1, '62', 'chaine', 0, 'Tolérance de retard avant alerte (en jours) sur rapprochements bancaires à faire', '2024-07-16 13:32:00'),
(34, 'MAIN_DELAY_EXPENSEREPORTS_TO_PAY', 1, '31', 'chaine', 0, 'Tolérance de retard avant alerte (en jours) sur les notes de frais impayées', '2024-07-16 13:32:00'),
(35, 'MAIN_FIX_FOR_BUGGED_MTA', 1, '1', 'chaine', 1, 'Set constant to fix email ending from PHP with some linux ike system', '2024-07-16 13:32:00'),
(36, 'MAILING_EMAIL_FROM', 1, 'no-reply@mydomain.com', 'chaine', 0, 'EMail emmetteur pour les envois d emailings', '2024-07-16 13:32:00'),
(37, 'PRODUCT_ADDON_PDF_ODT_PATH', 1, 'DOL_DATA_ROOT/doctemplates/products', 'chaine', 0, NULL, '2024-07-16 13:32:00'),
(38, 'CONTRACT_ADDON_PDF_ODT_PATH', 1, 'DOL_DATA_ROOT/doctemplates/contracts', 'chaine', 0, NULL, '2024-07-16 13:32:00'),
(39, 'USERGROUP_ADDON_PDF_ODT_PATH', 1, 'DOL_DATA_ROOT/doctemplates/usergroups', 'chaine', 0, NULL, '2024-07-16 13:32:00'),
(40, 'USER_ADDON_PDF_ODT_PATH', 1, 'DOL_DATA_ROOT/doctemplates/users', 'chaine', 0, NULL, '2024-07-16 13:32:00'),
(41, 'PRODUCT_PRICE_BASE_TYPE', 0, 'HT', 'string', 0, NULL, '2024-07-16 13:32:00'),
(42, 'ADHERENT_LOGIN_NOT_REQUIRED', 0, '1', 'string', 0, NULL, '2024-07-16 13:32:00'),
(43, 'MAIN_VERSION_LAST_INSTALL', 0, '14.0.2', 'chaine', 0, 'Dolibarr version when install', '2024-07-16 13:32:00'),
(44, 'MAIN_LANG_DEFAULT', 1, 'auto', 'chaine', 0, 'Default language', '2024-07-16 13:32:00'),
(45, 'MAIN_MODULE_PRODUCT', 1, '1', 'string', 0, '{\"authorid\":\"1\",\"ip\":\"172.18.0.1\"}', '2024-07-16 13:36:03'),
(46, 'PRODUCT_CODEPRODUCT_ADDON', 1, 'mod_codeproduct_leopard', 'chaine', 0, 'Module to control product codes', '2024-07-16 13:36:03'),
(47, 'PRODUCT_PRICE_UNIQ', 1, '1', 'chaine', 0, 'pricing rule by default', '2024-07-16 13:36:03'),
(51, 'MAIN_MODULE_STOCK', 1, '1', 'string', 0, '{\"authorid\":\"1\",\"ip\":\"172.18.0.1\"}', '2024-07-16 13:37:06'),
(52, 'STOCK_ALLOW_NEGATIVE_TRANSFER', 1, '1', 'chaine', 1, NULL, '2024-07-16 13:37:06'),
(53, 'STOCK_ADDON_PDF', 1, 'standard', 'chaine', 0, 'Name of PDF model of stock', '2024-07-16 13:37:06'),
(54, 'MOUVEMENT_ADDON_PDF', 1, 'stdmovement', 'chaine', 0, 'Name of PDF model of stock mouvement', '2024-07-16 13:37:06'),
(55, 'STOCK_ADDON_PDF_ODT_PATH', 1, 'DOL_DATA_ROOT/doctemplates/stocks', 'chaine', 0, NULL, '2024-07-16 13:37:06'),
(56, 'MOUVEMENT_ADDON_PDF_ODT_PATH', 1, 'DOL_DATA_ROOT/doctemplates/stocks/mouvements', 'chaine', 0, NULL, '2024-07-16 13:37:06'),
(59, 'MAIN_MODULE_API', 0, '1', 'string', 0, '{\"authorid\":\"1\",\"ip\":\"172.18.0.1\"}', '2024-07-16 13:51:59'),
(60, 'MAIN_IHM_PARAMS_REV', 1, '5', 'chaine', 0, '', '2024-07-16 13:51:59');

-- --------------------------------------------------------

--
-- Structure de la table `llx_contrat`
--

CREATE TABLE `llx_contrat` (
  `rowid` int(11) NOT NULL,
  `ref` varchar(255) DEFAULT NULL,
  `ref_customer` varchar(255) DEFAULT NULL,
  `ref_supplier` varchar(255) DEFAULT NULL,
  `ref_ext` varchar(255) DEFAULT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `datec` datetime DEFAULT NULL,
  `date_contrat` datetime DEFAULT NULL,
  `statut` smallint(6) DEFAULT 0,
  `fin_validite` datetime DEFAULT NULL,
  `date_cloture` datetime DEFAULT NULL,
  `fk_soc` int(11) NOT NULL,
  `fk_projet` int(11) DEFAULT NULL,
  `fk_commercial_signature` int(11) DEFAULT NULL,
  `fk_commercial_suivi` int(11) DEFAULT NULL,
  `fk_user_author` int(11) NOT NULL DEFAULT 0,
  `fk_user_modif` int(11) DEFAULT NULL,
  `fk_user_cloture` int(11) DEFAULT NULL,
  `note_private` text DEFAULT NULL,
  `note_public` text DEFAULT NULL,
  `model_pdf` varchar(255) DEFAULT NULL,
  `last_main_doc` varchar(255) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `extraparams` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_contratdet`
--

CREATE TABLE `llx_contratdet` (
  `rowid` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_contrat` int(11) NOT NULL,
  `fk_product` int(11) DEFAULT NULL,
  `statut` smallint(6) DEFAULT 0,
  `label` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `fk_remise_except` int(11) DEFAULT NULL,
  `date_commande` datetime DEFAULT NULL,
  `date_ouverture_prevue` datetime DEFAULT NULL,
  `date_ouverture` datetime DEFAULT NULL,
  `date_fin_validite` datetime DEFAULT NULL,
  `date_cloture` datetime DEFAULT NULL,
  `vat_src_code` varchar(10) DEFAULT '',
  `tva_tx` double(6,3) DEFAULT 0.000,
  `localtax1_tx` double(6,3) DEFAULT 0.000,
  `localtax1_type` varchar(10) DEFAULT NULL,
  `localtax2_tx` double(6,3) DEFAULT 0.000,
  `localtax2_type` varchar(10) DEFAULT NULL,
  `qty` double NOT NULL,
  `remise_percent` double DEFAULT 0,
  `subprice` double(24,8) DEFAULT 0.00000000,
  `price_ht` double DEFAULT NULL,
  `remise` double DEFAULT 0,
  `total_ht` double(24,8) DEFAULT 0.00000000,
  `total_tva` double(24,8) DEFAULT 0.00000000,
  `total_localtax1` double(24,8) DEFAULT 0.00000000,
  `total_localtax2` double(24,8) DEFAULT 0.00000000,
  `total_ttc` double(24,8) DEFAULT 0.00000000,
  `product_type` int(11) DEFAULT 1,
  `info_bits` int(11) DEFAULT 0,
  `buy_price_ht` double(24,8) DEFAULT NULL,
  `fk_product_fournisseur_price` int(11) DEFAULT NULL,
  `fk_user_author` int(11) NOT NULL DEFAULT 0,
  `fk_user_ouverture` int(11) DEFAULT NULL,
  `fk_user_cloture` int(11) DEFAULT NULL,
  `commentaire` text DEFAULT NULL,
  `fk_unit` int(11) DEFAULT NULL,
  `fk_multicurrency` int(11) DEFAULT NULL,
  `multicurrency_code` varchar(255) DEFAULT NULL,
  `multicurrency_subprice` double(24,8) DEFAULT 0.00000000,
  `multicurrency_total_ht` double(24,8) DEFAULT 0.00000000,
  `multicurrency_total_tva` double(24,8) DEFAULT 0.00000000,
  `multicurrency_total_ttc` double(24,8) DEFAULT 0.00000000
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_contratdet_extrafields`
--

CREATE TABLE `llx_contratdet_extrafields` (
  `rowid` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_contratdet_log`
--

CREATE TABLE `llx_contratdet_log` (
  `rowid` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_contratdet` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `statut` smallint(6) NOT NULL,
  `fk_user_author` int(11) NOT NULL,
  `commentaire` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_contrat_extrafields`
--

CREATE TABLE `llx_contrat_extrafields` (
  `rowid` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_cronjob`
--

CREATE TABLE `llx_cronjob` (
  `rowid` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `datec` datetime DEFAULT NULL,
  `jobtype` varchar(10) NOT NULL,
  `label` text NOT NULL,
  `command` varchar(255) DEFAULT NULL,
  `classesname` varchar(255) DEFAULT NULL,
  `objectname` varchar(255) DEFAULT NULL,
  `methodename` varchar(255) DEFAULT NULL,
  `params` text DEFAULT NULL,
  `md5params` varchar(32) DEFAULT NULL,
  `module_name` varchar(255) DEFAULT NULL,
  `priority` int(11) DEFAULT 0,
  `datelastrun` datetime DEFAULT NULL,
  `datenextrun` datetime DEFAULT NULL,
  `datestart` datetime DEFAULT NULL,
  `dateend` datetime DEFAULT NULL,
  `datelastresult` datetime DEFAULT NULL,
  `lastresult` text DEFAULT NULL,
  `lastoutput` text DEFAULT NULL,
  `unitfrequency` varchar(255) NOT NULL DEFAULT '3600',
  `frequency` int(11) NOT NULL DEFAULT 0,
  `maxrun` int(11) NOT NULL DEFAULT 0,
  `nbrun` int(11) DEFAULT NULL,
  `autodelete` int(11) DEFAULT 0,
  `status` int(11) NOT NULL DEFAULT 1,
  `processing` int(11) NOT NULL DEFAULT 0,
  `test` varchar(255) DEFAULT '1',
  `fk_user_author` int(11) DEFAULT NULL,
  `fk_user_mod` int(11) DEFAULT NULL,
  `fk_mailing` int(11) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `libname` varchar(255) DEFAULT NULL,
  `entity` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_c_accounting_category`
--

CREATE TABLE `llx_c_accounting_category` (
  `rowid` int(11) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `code` varchar(16) NOT NULL,
  `label` varchar(255) NOT NULL,
  `range_account` varchar(255) NOT NULL,
  `sens` tinyint(4) NOT NULL DEFAULT 0,
  `category_type` tinyint(4) NOT NULL DEFAULT 0,
  `formula` varchar(255) NOT NULL,
  `position` int(11) DEFAULT 0,
  `fk_country` int(11) DEFAULT NULL,
  `active` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `llx_c_accounting_category`
--

INSERT INTO `llx_c_accounting_category` (`rowid`, `entity`, `code`, `label`, `range_account`, `sens`, `category_type`, `formula`, `position`, `fk_country`, `active`) VALUES
(1, 1, 'INCOMES', 'Income of products/services', 'Example: 7xxxxx', 0, 0, '', 10, 0, 1),
(2, 1, 'EXPENSES', 'Expenses of products/services', 'Example: 6xxxxx', 0, 0, '', 20, 0, 1),
(3, 1, 'PROFIT', 'Balance', '', 0, 1, 'INCOMES+EXPENSES', 30, 0, 1);

-- --------------------------------------------------------

--
-- Structure de la table `llx_c_actioncomm`
--

CREATE TABLE `llx_c_actioncomm` (
  `id` int(11) NOT NULL,
  `code` varchar(50) NOT NULL,
  `type` varchar(50) NOT NULL DEFAULT 'system',
  `libelle` varchar(48) NOT NULL,
  `module` varchar(50) DEFAULT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1,
  `todo` tinyint(4) DEFAULT NULL,
  `color` varchar(9) DEFAULT NULL,
  `picto` varchar(48) DEFAULT NULL,
  `position` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `llx_c_actioncomm`
--

INSERT INTO `llx_c_actioncomm` (`id`, `code`, `type`, `libelle`, `module`, `active`, `todo`, `color`, `picto`, `position`) VALUES
(1, 'AC_TEL', 'system', 'Phone call', NULL, 1, NULL, NULL, NULL, 2),
(2, 'AC_FAX', 'system', 'Send Fax', NULL, 1, NULL, NULL, NULL, 3),
(4, 'AC_EMAIL', 'system', 'Send Email', NULL, 1, NULL, NULL, NULL, 4),
(5, 'AC_RDV', 'system', 'Rendez-vous', NULL, 1, NULL, NULL, NULL, 1),
(6, 'AC_EMAIL_IN', 'system', 'reception Email', NULL, 1, NULL, NULL, NULL, 4),
(11, 'AC_INT', 'system', 'Intervention on site', NULL, 1, NULL, NULL, NULL, 4),
(40, 'AC_OTH_AUTO', 'systemauto', 'Other (automatically inserted events)', NULL, 1, NULL, NULL, NULL, 20),
(50, 'AC_OTH', 'system', 'Other (manually inserted events)', NULL, 1, NULL, NULL, NULL, 5),
(60, 'AC_EO_ONLINECONF', 'module', 'Online/Virtual conference', 'conference@eventorganization', 1, NULL, NULL, NULL, 60),
(61, 'AC_EO_INDOORCONF', 'module', 'Indoor conference', 'conference@eventorganization', 1, NULL, NULL, NULL, 61),
(62, 'AC_EO_ONLINEBOOTH', 'module', 'Online/Virtual booth', 'booth@eventorganization', 1, NULL, NULL, NULL, 62),
(63, 'AC_EO_INDOORBOOTH', 'module', 'Indoor booth', 'booth@eventorganization', 1, NULL, NULL, NULL, 63);

-- --------------------------------------------------------

--
-- Structure de la table `llx_c_action_trigger`
--

CREATE TABLE `llx_c_action_trigger` (
  `rowid` int(11) NOT NULL,
  `elementtype` varchar(64) NOT NULL,
  `code` varchar(64) NOT NULL,
  `label` varchar(128) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `rang` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `llx_c_action_trigger`
--

INSERT INTO `llx_c_action_trigger` (`rowid`, `elementtype`, `code`, `label`, `description`, `rang`) VALUES
(1, 'societe', 'COMPANY_CREATE', 'Third party created', 'Executed when a third party is created', 1),
(2, 'societe', 'COMPANY_MODIFY', 'Third party update', 'Executed when you update third party', 1),
(3, 'societe', 'COMPANY_SENTBYMAIL', 'Mails sent from third party card', 'Executed when you send email from third party card', 1),
(4, 'societe', 'COMPANY_DELETE', 'Third party deleted', 'Executed when you delete third party', 1),
(5, 'propal', 'PROPAL_VALIDATE', 'Customer proposal validated', 'Executed when a commercial proposal is validated', 2),
(6, 'propal', 'PROPAL_SENTBYMAIL', 'Commercial proposal sent by mail', 'Executed when a commercial proposal is sent by mail', 3),
(7, 'propal', 'PROPAL_CLOSE_SIGNED', 'Customer proposal closed signed', 'Executed when a customer proposal is closed signed', 2),
(8, 'propal', 'PROPAL_CLOSE_REFUSED', 'Customer proposal closed refused', 'Executed when a customer proposal is closed refused', 2),
(9, 'propal', 'PROPAL_CLASSIFY_BILLED', 'Customer proposal set billed', 'Executed when a customer proposal is set to billed', 2),
(10, 'propal', 'PROPAL_DELETE', 'Customer proposal deleted', 'Executed when a customer proposal is deleted', 2),
(11, 'commande', 'ORDER_VALIDATE', 'Customer order validate', 'Executed when a customer order is validated', 4),
(12, 'commande', 'ORDER_CLOSE', 'Customer order classify delivered', 'Executed when a customer order is set delivered', 5),
(13, 'commande', 'ORDER_CLASSIFY_BILLED', 'Customer order classify billed', 'Executed when a customer order is set to billed', 5),
(14, 'commande', 'ORDER_CANCEL', 'Customer order canceled', 'Executed when a customer order is canceled', 5),
(15, 'commande', 'ORDER_SENTBYMAIL', 'Customer order sent by mail', 'Executed when a customer order is sent by mail ', 5),
(16, 'commande', 'ORDER_DELETE', 'Customer order deleted', 'Executed when a customer order is deleted', 5),
(17, 'facture', 'BILL_VALIDATE', 'Customer invoice validated', 'Executed when a customer invoice is approved', 6),
(18, 'facture', 'BILL_PAYED', 'Customer invoice payed', 'Executed when a customer invoice is payed', 7),
(19, 'facture', 'BILL_CANCEL', 'Customer invoice canceled', 'Executed when a customer invoice is conceled', 8),
(20, 'facture', 'BILL_SENTBYMAIL', 'Customer invoice sent by mail', 'Executed when a customer invoice is sent by mail', 9),
(21, 'facture', 'BILL_UNVALIDATE', 'Customer invoice unvalidated', 'Executed when a customer invoice status set back to draft', 9),
(22, 'facture', 'BILL_DELETE', 'Customer invoice deleted', 'Executed when a customer invoice is deleted', 9),
(23, 'proposal_supplier', 'PROPOSAL_SUPPLIER_VALIDATE', 'Price request validated', 'Executed when a commercial proposal is validated', 10),
(24, 'proposal_supplier', 'PROPOSAL_SUPPLIER_SENTBYMAIL', 'Price request sent by mail', 'Executed when a commercial proposal is sent by mail', 10),
(25, 'proposal_supplier', 'PROPOSAL_SUPPLIER_CLOSE_SIGNED', 'Price request closed signed', 'Executed when a customer proposal is closed signed', 10),
(26, 'proposal_supplier', 'PROPOSAL_SUPPLIER_CLOSE_REFUSED', 'Price request closed refused', 'Executed when a customer proposal is closed refused', 10),
(27, 'proposal_supplier', 'PROPOSAL_SUPPLIER_DELETE', 'Price request deleted', 'Executed when a customer proposal delete', 10),
(28, 'order_supplier', 'ORDER_SUPPLIER_VALIDATE', 'Supplier order validated', 'Executed when a supplier order is validated', 12),
(29, 'order_supplier', 'ORDER_SUPPLIER_APPROVE', 'Supplier order request approved', 'Executed when a supplier order is approved', 13),
(30, 'order_supplier', 'ORDER_SUPPLIER_SUBMIT', 'Supplier order request submited', 'Executed when a supplier order is approved', 13),
(31, 'order_supplier', 'ORDER_SUPPLIER_RECEIVE', 'Supplier order request received', 'Executed when a supplier order is received', 13),
(32, 'order_supplier', 'ORDER_SUPPLIER_REFUSE', 'Supplier order request refused', 'Executed when a supplier order is refused', 13),
(33, 'order_supplier', 'ORDER_SUPPLIER_SENTBYMAIL', 'Supplier order sent by mail', 'Executed when a supplier order is sent by mail', 14),
(34, 'order_supplier', 'ORDER_SUPPLIER_CLASSIFY_BILLED', 'Supplier order set billed', 'Executed when a supplier order is set as billed', 14),
(35, 'order_supplier', 'ORDER_SUPPLIER_DELETE', 'Supplier order deleted', 'Executed when a supplier order is deleted', 14),
(36, 'invoice_supplier', 'BILL_SUPPLIER_VALIDATE', 'Supplier invoice validated', 'Executed when a supplier invoice is validated', 15),
(37, 'invoice_supplier', 'BILL_SUPPLIER_UNVALIDATE', 'Supplier invoice unvalidated', 'Executed when a supplier invoice status is set back to draft', 15),
(38, 'invoice_supplier', 'BILL_SUPPLIER_PAYED', 'Supplier invoice payed', 'Executed when a supplier invoice is payed', 16),
(39, 'invoice_supplier', 'BILL_SUPPLIER_SENTBYMAIL', 'Supplier invoice sent by mail', 'Executed when a supplier invoice is sent by mail', 17),
(40, 'invoice_supplier', 'BILL_SUPPLIER_CANCELED', 'Supplier invoice cancelled', 'Executed when a supplier invoice is cancelled', 17),
(41, 'invoice_supplier', 'BILL_SUPPLIER_DELETE', 'Supplier invoice deleted', 'Executed when a supplier invoice is deleted', 17),
(42, 'contrat', 'CONTRACT_VALIDATE', 'Contract validated', 'Executed when a contract is validated', 18),
(43, 'contrat', 'CONTRACT_SENTBYMAIL', 'Contract sent by mail', 'Executed when a contract is sent by mail', 18),
(44, 'contrat', 'CONTRACT_DELETE', 'Contract deleted', 'Executed when a contract is deleted', 18),
(45, 'shipping', 'SHIPPING_VALIDATE', 'Shipping validated', 'Executed when a shipping is validated', 20),
(46, 'shipping', 'SHIPPING_SENTBYMAIL', 'Shipping sent by mail', 'Executed when a shipping is sent by mail', 21),
(47, 'shipping', 'SHIPPING_DELETE', 'Shipping sent is deleted', 'Executed when a shipping is deleted', 21),
(48, 'reception', 'RECEPTION_VALIDATE', 'Reception validated', 'Executed when a reception is validated', 22),
(49, 'reception', 'RECEPTION_SENTBYMAIL', 'Reception sent by mail', 'Executed when a reception is sent by mail', 22),
(50, 'member', 'MEMBER_VALIDATE', 'Member validated', 'Executed when a member is validated', 22),
(51, 'member', 'MEMBER_SENTBYMAIL', 'Mails sent from member card', 'Executed when you send email from member card', 23),
(52, 'member', 'MEMBER_SUBSCRIPTION_CREATE', 'Member subscribtion recorded', 'Executed when a member subscribtion is deleted', 24),
(53, 'member', 'MEMBER_SUBSCRIPTION_MODIFY', 'Member subscribtion modified', 'Executed when a member subscribtion is modified', 24),
(54, 'member', 'MEMBER_SUBSCRIPTION_DELETE', 'Member subscribtion deleted', 'Executed when a member subscribtion is deleted', 24),
(55, 'member', 'MEMBER_RESILIATE', 'Member resiliated', 'Executed when a member is resiliated', 25),
(56, 'member', 'MEMBER_DELETE', 'Member deleted', 'Executed when a member is deleted', 26),
(57, 'ficheinter', 'FICHINTER_VALIDATE', 'Intervention validated', 'Executed when a intervention is validated', 30),
(58, 'ficheinter', 'FICHINTER_CLASSIFY_BILLED', 'Intervention set billed', 'Executed when a intervention is set to billed (when option FICHINTER_CLASSIFY_BILLED is set)', 32),
(59, 'ficheinter', 'FICHINTER_CLASSIFY_UNBILLED', 'Intervention set unbilled', 'Executed when a intervention is set to unbilled (when option FICHINTER_CLASSIFY_BILLED is set)', 33),
(60, 'ficheinter', 'FICHINTER_REOPEN', 'Intervention opened', 'Executed when a intervention is re-opened', 34),
(61, 'ficheinter', 'FICHINTER_SENTBYMAIL', 'Intervention sent by mail', 'Executed when a intervention is sent by mail', 35),
(62, 'ficheinter', 'FICHINTER_DELETE', 'Intervention is deleted', 'Executed when a intervention is deleted', 35),
(63, 'product', 'PRODUCT_CREATE', 'Product or service created', 'Executed when a product or sevice is created', 40),
(64, 'product', 'PRODUCT_DELETE', 'Product or service deleted', 'Executed when a product or sevice is deleted', 42),
(65, 'expensereport', 'EXPENSE_REPORT_CREATE', 'Expense report created', 'Executed when an expense report is created', 201),
(66, 'expensereport', 'EXPENSE_REPORT_VALIDATE', 'Expense report validated', 'Executed when an expense report is validated', 202),
(67, 'expensereport', 'EXPENSE_REPORT_APPROVE', 'Expense report approved', 'Executed when an expense report is approved', 203),
(68, 'expensereport', 'EXPENSE_REPORT_PAID', 'Expense report billed', 'Executed when an expense report is set as billed', 204),
(69, 'expensereport', 'EXPENSE_REPORT_DELETE', 'Expense report deleted', 'Executed when an expense report is deleted', 205),
(70, 'expensereport', 'HOLIDAY_VALIDATE', 'Expense report validated', 'Executed when an expense report is validated', 211),
(71, 'expensereport', 'HOLIDAY_APPROVE', 'Expense report approved', 'Executed when an expense report is approved', 212),
(72, 'project', 'PROJECT_VALIDATE', 'Project validation', 'Executed when a project is validated', 141),
(73, 'project', 'PROJECT_DELETE', 'Project deleted', 'Executed when a project is deleted', 143),
(74, 'ticket', 'TICKET_CREATE', 'Ticket created', 'Executed when a ticket is created', 161),
(75, 'ticket', 'TICKET_MODIFY', 'Ticket modified', 'Executed when a ticket is modified', 163),
(76, 'ticket', 'TICKET_ASSIGNED', 'Ticket assigned', 'Executed when a ticket is modified', 164),
(77, 'ticket', 'TICKET_CLOSE', 'Ticket closed', 'Executed when a ticket is closed', 165),
(78, 'ticket', 'TICKET_SENTBYMAIL', 'Ticket message sent by email', 'Executed when a message is sent from the ticket record', 166),
(79, 'ticket', 'TICKET_DELETE', 'Ticket deleted', 'Executed when a ticket is deleted', 167),
(80, 'user', 'USER_SENTBYMAIL', 'Email sent', 'Executed when an email is sent from user card', 300),
(81, 'product', 'PRODUCT_MODIFY', 'Product or service modified', 'Executed when a product or sevice is modified', 41),
(82, 'member', 'MEMBER_MODIFY', 'Member modified', 'Executed when a member is modified', 23),
(83, 'ficheinter', 'FICHINTER_MODIFY', 'Intervention modified', 'Executed when a intervention is modified', 19),
(84, 'project', 'PROJECT_CREATE', 'Project creation', 'Executed when a project is created', 140),
(85, 'project', 'PROJECT_MODIFY', 'Project modified', 'Executed when a project is modified', 142),
(86, 'bom', 'BOM_VALIDATE', 'BOM validated', 'Executed when a BOM is validated', 650),
(87, 'bom', 'BOM_UNVALIDATE', 'BOM unvalidated', 'Executed when a BOM is unvalidated', 651),
(88, 'bom', 'BOM_CLOSE', 'BOM disabled', 'Executed when a BOM is disabled', 652),
(89, 'bom', 'BOM_REOPEN', 'BOM reopen', 'Executed when a BOM is re-open', 653),
(90, 'bom', 'BOM_DELETE', 'BOM deleted', 'Executed when a BOM deleted', 654),
(91, 'mrp', 'MRP_MO_VALIDATE', 'MO validated', 'Executed when a MO is validated', 660),
(92, 'mrp', 'MRP_MO_PRODUCED', 'MO produced', 'Executed when a MO is produced', 661),
(93, 'mrp', 'MRP_MO_DELETE', 'MO deleted', 'Executed when a MO is deleted', 662),
(94, 'mrp', 'MRP_MO_CANCEL', 'MO canceled', 'Executed when a MO is canceled', 663),
(95, 'contact', 'CONTACT_CREATE', 'Contact address created', 'Executed when a contact is created', 50),
(96, 'contact', 'CONTACT_MODIFY', 'Contact address update', 'Executed when a contact is updated', 51),
(97, 'contact', 'CONTACT_SENTBYMAIL', 'Mails sent from third party card', 'Executed when you send email from contact address record', 52),
(98, 'contact', 'CONTACT_DELETE', 'Contact address deleted', 'Executed when a contact is deleted', 53),
(99, 'recruitment', 'RECRUITMENTJOBPOSITION_CREATE', 'Job created', 'Executed when a job is created', 7500),
(100, 'recruitment', 'RECRUITMENTJOBPOSITION_MODIFY', 'Job modified', 'Executed when a job is modified', 7502),
(101, 'recruitment', 'RECRUITMENTJOBPOSITION_SENTBYMAIL', 'Mails sent from job record', 'Executed when you send email from job record', 7504),
(102, 'recruitment', 'RECRUITMENTJOBPOSITION_DELETE', 'Job deleted', 'Executed when a job is deleted', 7506),
(103, 'recruitment', 'RECRUITMENTCANDIDATURE_CREATE', 'Candidature created', 'Executed when a candidature is created', 7510),
(104, 'recruitment', 'RECRUITMENTCANDIDATURE_MODIFY', 'Candidature modified', 'Executed when a candidature is modified', 7512),
(105, 'recruitment', 'RECRUITMENTCANDIDATURE_SENTBYMAIL', 'Mails sent from candidature record', 'Executed when you send email from candidature record', 7514),
(106, 'recruitment', 'RECRUITMENTCANDIDATURE_DELETE', 'Candidature deleted', 'Executed when a candidature is deleted', 7516),
(107, 'project', 'TASK_CREATE', 'Task created', 'Executed when a project task is created', 150),
(108, 'project', 'TASK_MODIFY', 'Task modified', 'Executed when a project task is modified', 151),
(109, 'project', 'TASK_DELETE', 'Task deleted', 'Executed when a project task is deleted', 152),
(110, 'agenda', 'ACTION_CREATE', 'Action added', 'Executed when an action is added to the agenda', 700);

-- --------------------------------------------------------

--
-- Structure de la table `llx_c_availability`
--

CREATE TABLE `llx_c_availability` (
  `rowid` int(11) NOT NULL,
  `code` varchar(30) NOT NULL,
  `label` varchar(60) NOT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1,
  `position` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `llx_c_availability`
--

INSERT INTO `llx_c_availability` (`rowid`, `code`, `label`, `active`, `position`) VALUES
(1, 'AV_NOW', 'Immediate', 1, 10),
(2, 'AV_1W', '1 week', 1, 20),
(3, 'AV_2W', '2 weeks', 1, 30),
(4, 'AV_3W', '3 weeks', 1, 40);

-- --------------------------------------------------------

--
-- Structure de la table `llx_c_barcode_type`
--

CREATE TABLE `llx_c_barcode_type` (
  `rowid` int(11) NOT NULL,
  `code` varchar(16) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `libelle` varchar(50) NOT NULL,
  `coder` varchar(16) NOT NULL,
  `example` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_c_chargesociales`
--

CREATE TABLE `llx_c_chargesociales` (
  `id` int(11) NOT NULL,
  `libelle` varchar(80) DEFAULT NULL,
  `deductible` smallint(6) NOT NULL DEFAULT 0,
  `active` tinyint(4) NOT NULL DEFAULT 1,
  `code` varchar(12) NOT NULL,
  `accountancy_code` varchar(32) DEFAULT NULL,
  `fk_pays` int(11) NOT NULL DEFAULT 1,
  `module` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `llx_c_chargesociales`
--

INSERT INTO `llx_c_chargesociales` (`id`, `libelle`, `deductible`, `active`, `code`, `accountancy_code`, `fk_pays`, `module`) VALUES
(1, 'Securite sociale (URSSAF / MSA)', 1, 1, 'TAXSECU', NULL, 1, NULL),
(2, 'Securite sociale des indépendants (URSSAF)', 1, 1, 'TAXSSI', NULL, 1, NULL),
(10, 'Taxe apprentissage', 1, 1, 'TAXAPP', NULL, 1, NULL),
(11, 'Formation professionnelle continue', 1, 1, 'TAXFPC', NULL, 1, NULL),
(12, 'Cotisation fonciere des entreprises (CFE)', 1, 1, 'TAXCFE', NULL, 1, NULL),
(13, 'Cotisation sur la valeur ajoutee des entreprises (CVAE)', 1, 1, 'TAXCVAE', NULL, 1, NULL),
(20, 'Taxe fonciere', 1, 1, 'TAXFON', NULL, 1, NULL),
(25, 'Prelevement à la source (PAS)', 0, 1, 'TAXPAS', NULL, 1, NULL),
(30, 'Prevoyance', 1, 1, 'TAXPREV', NULL, 1, NULL),
(40, 'Mutuelle', 1, 1, 'TAXMUT', NULL, 1, NULL),
(50, 'Retraite', 1, 1, 'TAXRET', NULL, 1, NULL),
(60, 'Taxe sur vehicule societe (TVS)', 0, 1, 'TAXTVS', NULL, 1, NULL),
(70, 'impôts sur les sociétés (IS)', 0, 1, 'TAXIS', NULL, 1, NULL),
(201, 'ONSS', 1, 1, 'TAXBEONSS', NULL, 2, NULL),
(210, 'Precompte professionnel', 1, 1, 'TAXBEPREPRO', NULL, 2, NULL),
(220, 'Prime existence', 1, 1, 'TAXBEPRIEXI', NULL, 2, NULL),
(230, 'Precompte immobilier', 1, 1, 'TAXBEPREIMMO', NULL, 2, NULL),
(4101, 'Krankenversicherung', 1, 1, 'TAXATKV', NULL, 41, NULL),
(4102, 'Unfallversicherung', 1, 1, 'TAXATUV', NULL, 41, NULL),
(4103, 'Pensionsversicherung', 1, 1, 'TAXATPV', NULL, 41, NULL),
(4104, 'Arbeitslosenversicherung', 1, 1, 'TAXATAV', NULL, 41, NULL),
(4105, 'Insolvenzentgeltsicherungsfond', 1, 1, 'TAXATIESG', NULL, 41, NULL),
(4106, 'Wohnbauförderung', 1, 1, 'TAXATWF', NULL, 41, NULL),
(4107, 'Arbeiterkammerumlage', 1, 1, 'TAXATAK', NULL, 41, NULL),
(4108, 'Mitarbeitervorsorgekasse', 1, 1, 'TAXATMVK', NULL, 41, NULL),
(4109, 'Familienlastenausgleichsfond', 1, 1, 'TAXATFLAF', NULL, 41, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `llx_c_civility`
--

CREATE TABLE `llx_c_civility` (
  `rowid` int(11) NOT NULL,
  `code` varchar(6) NOT NULL,
  `label` varchar(50) DEFAULT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1,
  `module` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `llx_c_civility`
--

INSERT INTO `llx_c_civility` (`rowid`, `code`, `label`, `active`, `module`) VALUES
(1, 'MME', 'Madame', 1, NULL),
(3, 'MR', 'Monsieur', 1, NULL),
(5, 'MLE', 'Mademoiselle', 1, NULL),
(7, 'MTRE', 'Maître', 1, NULL),
(8, 'DR', 'Docteur', 1, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `llx_c_country`
--

CREATE TABLE `llx_c_country` (
  `rowid` int(11) NOT NULL,
  `code` varchar(2) NOT NULL,
  `code_iso` varchar(3) DEFAULT NULL,
  `label` varchar(50) NOT NULL,
  `eec` int(11) DEFAULT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1,
  `favorite` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `llx_c_country`
--

INSERT INTO `llx_c_country` (`rowid`, `code`, `code_iso`, `label`, `eec`, `active`, `favorite`) VALUES
(0, '', NULL, '-', NULL, 1, 1),
(1, 'FR', 'FRA', 'France', 1, 1, 0),
(2, 'BE', 'BEL', 'Belgium', 1, 1, 0),
(3, 'IT', 'ITA', 'Italy', 1, 1, 0),
(4, 'ES', 'ESP', 'Spain', 1, 1, 0),
(5, 'DE', 'DEU', 'Germany', 1, 1, 0),
(6, 'CH', 'CHE', 'Switzerland', NULL, 1, 0),
(7, 'GB', 'GBR', 'United Kingdom', NULL, 1, 0),
(8, 'IE', 'IRL', 'Ireland', 1, 1, 0),
(9, 'CN', 'CHN', 'China', NULL, 1, 0),
(10, 'TN', 'TUN', 'Tunisia', NULL, 1, 0),
(11, 'US', 'USA', 'United States', NULL, 1, 0),
(12, 'MA', 'MAR', 'Morocco', NULL, 1, 0),
(13, 'DZ', 'DZA', 'Algeria', NULL, 1, 0),
(14, 'CA', 'CAN', 'Canada', NULL, 1, 0),
(15, 'TG', 'TGO', 'Togo', NULL, 1, 0),
(16, 'GA', 'GAB', 'Gabon', NULL, 1, 0),
(17, 'NL', 'NLD', 'Netherlands', 1, 1, 0),
(18, 'HU', 'HUN', 'Hungary', 1, 1, 0),
(19, 'RU', 'RUS', 'Russia', NULL, 1, 0),
(20, 'SE', 'SWE', 'Sweden', 1, 1, 0),
(21, 'CI', 'CIV', 'Côte d\'Ivoire', NULL, 1, 0),
(22, 'SN', 'SEN', 'Senegal', NULL, 1, 0),
(23, 'AR', 'ARG', 'Argentina', NULL, 1, 0),
(24, 'CM', 'CMR', 'Cameroun', NULL, 1, 0),
(25, 'PT', 'PRT', 'Portugal', 1, 1, 0),
(26, 'SA', 'SAU', 'Saudi Arabia', NULL, 1, 0),
(27, 'MC', 'MCO', 'Monaco', 1, 1, 0),
(28, 'AU', 'AUS', 'Australia', NULL, 1, 0),
(29, 'SG', 'SGP', 'Singapour', NULL, 1, 0),
(30, 'AF', 'AFG', 'Afghanistan', NULL, 1, 0),
(31, 'AX', 'ALA', 'Iles Aland', NULL, 1, 0),
(32, 'AL', 'ALB', 'Albania', NULL, 1, 0),
(33, 'AS', 'ASM', 'Samoa américaines', NULL, 1, 0),
(34, 'AD', 'AND', 'Andorra', NULL, 1, 0),
(35, 'AO', 'AGO', 'Angola', NULL, 1, 0),
(36, 'AI', 'AIA', 'Anguilla', NULL, 1, 0),
(37, 'AQ', 'ATA', 'Antarctique', NULL, 1, 0),
(38, 'AG', 'ATG', 'Antigua-et-Barbuda', NULL, 1, 0),
(39, 'AM', 'ARM', 'Armenia', NULL, 1, 0),
(40, 'AW', 'ABW', 'Aruba', NULL, 1, 0),
(41, 'AT', 'AUT', 'Austria', 1, 1, 0),
(42, 'AZ', 'AZE', 'Azerbaïdjan', NULL, 1, 0),
(43, 'BS', 'BHS', 'Bahamas', NULL, 1, 0),
(44, 'BH', 'BHR', 'Bahreïn', NULL, 1, 0),
(45, 'BD', 'BGD', 'Bangladesh', NULL, 1, 0),
(46, 'BB', 'BRB', 'Barbade', NULL, 1, 0),
(47, 'BY', 'BLR', 'Belarus', NULL, 1, 0),
(48, 'BZ', 'BLZ', 'Belize', NULL, 1, 0),
(49, 'BJ', 'BEN', 'Bénin', NULL, 1, 0),
(50, 'BM', 'BMU', 'Bermudes', NULL, 1, 0),
(51, 'BT', 'BTN', 'Bhoutan', NULL, 1, 0),
(52, 'BO', 'BOL', 'Bolivie', NULL, 1, 0),
(53, 'BA', 'BIH', 'Bosnie-Herzégovine', NULL, 1, 0),
(54, 'BW', 'BWA', 'Botswana', NULL, 1, 0),
(55, 'BV', 'BVT', 'Ile Bouvet', NULL, 1, 0),
(56, 'BR', 'BRA', 'Brazil', NULL, 1, 0),
(57, 'IO', 'IOT', 'Territoire britannique de l\'Océan Indien', NULL, 1, 0),
(58, 'BN', 'BRN', 'Brunei', NULL, 1, 0),
(59, 'BG', 'BGR', 'Bulgarie', 1, 1, 0),
(60, 'BF', 'BFA', 'Burkina Faso', NULL, 1, 0),
(61, 'BI', 'BDI', 'Burundi', NULL, 1, 0),
(62, 'KH', 'KHM', 'Cambodge', NULL, 1, 0),
(63, 'CV', 'CPV', 'Cap-Vert', NULL, 1, 0),
(64, 'KY', 'CYM', 'Iles Cayman', NULL, 1, 0),
(65, 'CF', 'CAF', 'République centrafricaine', NULL, 1, 0),
(66, 'TD', 'TCD', 'Tchad', NULL, 1, 0),
(67, 'CL', 'CHL', 'Chili', NULL, 1, 0),
(68, 'CX', 'CXR', 'Ile Christmas', NULL, 1, 0),
(69, 'CC', 'CCK', 'Iles des Cocos (Keeling)', NULL, 1, 0),
(70, 'CO', 'COL', 'Colombie', NULL, 1, 0),
(71, 'KM', 'COM', 'Comores', NULL, 1, 0),
(72, 'CG', 'COG', 'Congo', NULL, 1, 0),
(73, 'CD', 'COD', 'République démocratique du Congo', NULL, 1, 0),
(74, 'CK', 'COK', 'Iles Cook', NULL, 1, 0),
(75, 'CR', 'CRI', 'Costa Rica', NULL, 1, 0),
(76, 'HR', 'HRV', 'Croatie', 1, 1, 0),
(77, 'CU', 'CUB', 'Cuba', NULL, 1, 0),
(78, 'CY', 'CYP', 'Cyprus', 1, 1, 0),
(79, 'CZ', 'CZE', 'Czech Republic', 1, 1, 0),
(80, 'DK', 'DNK', 'Denmark', 1, 1, 0),
(81, 'DJ', 'DJI', 'Djibouti', NULL, 1, 0),
(82, 'DM', 'DMA', 'Dominica', NULL, 1, 0),
(83, 'DO', 'DOM', 'Dominican Republic', NULL, 1, 0),
(84, 'EC', 'ECU', 'Republic of Ecuador', NULL, 1, 0),
(85, 'EG', 'EGY', 'Egypt', NULL, 1, 0),
(86, 'SV', 'SLV', 'El Salvador', NULL, 1, 0),
(87, 'GQ', 'GNQ', 'Equatorial Guinea', NULL, 1, 0),
(88, 'ER', 'ERI', 'Eritrea', NULL, 1, 0),
(89, 'EE', 'EST', 'Estonia', 1, 1, 0),
(90, 'ET', 'ETH', 'Ethiopia', NULL, 1, 0),
(91, 'FK', 'FLK', 'Falkland Islands', NULL, 1, 0),
(92, 'FO', 'FRO', 'Faroe Islands', NULL, 1, 0),
(93, 'FJ', 'FJI', 'Fidji Islands', NULL, 1, 0),
(94, 'FI', 'FIN', 'Finland', 1, 1, 0),
(95, 'GF', 'GUF', 'French Guiana', NULL, 1, 0),
(96, 'PF', 'PYF', 'French Polynesia', NULL, 1, 0),
(97, 'TF', 'ATF', 'Terres australes françaises', NULL, 1, 0),
(98, 'GM', 'GMB', 'Gambie', NULL, 1, 0),
(99, 'GE', 'GEO', 'Georgia', NULL, 1, 0),
(100, 'GH', 'GHA', 'Ghana', NULL, 1, 0),
(101, 'GI', 'GIB', 'Gibraltar', NULL, 1, 0),
(102, 'GR', 'GRC', 'Greece', 1, 1, 0),
(103, 'GL', 'GRL', 'Groenland', NULL, 1, 0),
(104, 'GD', 'GRD', 'Grenade', NULL, 1, 0),
(106, 'GU', 'GUM', 'Guam', NULL, 1, 0),
(107, 'GT', 'GTM', 'Guatemala', NULL, 1, 0),
(108, 'GN', 'GIN', 'Guinea', NULL, 1, 0),
(109, 'GW', 'GNB', 'Guinea-Bissao', NULL, 1, 0),
(111, 'HT', 'HTI', 'Haiti', NULL, 1, 0),
(112, 'HM', 'HMD', 'Iles Heard et McDonald', NULL, 1, 0),
(113, 'VA', 'VAT', 'Saint-Siège (Vatican)', NULL, 1, 0),
(114, 'HN', 'HND', 'Honduras', NULL, 1, 0),
(115, 'HK', 'HKG', 'Hong Kong', NULL, 1, 0),
(116, 'IS', 'ISL', 'Islande', NULL, 1, 0),
(117, 'IN', 'IND', 'India', NULL, 1, 0),
(118, 'ID', 'IDN', 'Indonésie', NULL, 1, 0),
(119, 'IR', 'IRN', 'Iran', NULL, 1, 0),
(120, 'IQ', 'IRQ', 'Iraq', NULL, 1, 0),
(121, 'IL', 'ISR', 'Israel', NULL, 1, 0),
(122, 'JM', 'JAM', 'Jamaïque', NULL, 1, 0),
(123, 'JP', 'JPN', 'Japon', NULL, 1, 0),
(124, 'JO', 'JOR', 'Jordanie', NULL, 1, 0),
(125, 'KZ', 'KAZ', 'Kazakhstan', NULL, 1, 0),
(126, 'KE', 'KEN', 'Kenya', NULL, 1, 0),
(127, 'KI', 'KIR', 'Kiribati', NULL, 1, 0),
(128, 'KP', 'PRK', 'North Corea', NULL, 1, 0),
(129, 'KR', 'KOR', 'South Corea', NULL, 1, 0),
(130, 'KW', 'KWT', 'Koweït', NULL, 1, 0),
(131, 'KG', 'KGZ', 'Kirghizistan', NULL, 1, 0),
(132, 'LA', 'LAO', 'Laos', NULL, 1, 0),
(133, 'LV', 'LVA', 'Lettonie', 1, 1, 0),
(134, 'LB', 'LBN', 'Liban', NULL, 1, 0),
(135, 'LS', 'LSO', 'Lesotho', NULL, 1, 0),
(136, 'LR', 'LBR', 'Liberia', NULL, 1, 0),
(137, 'LY', 'LBY', 'Libye', NULL, 1, 0),
(138, 'LI', 'LIE', 'Liechtenstein', NULL, 1, 0),
(139, 'LT', 'LTU', 'Lituanie', 1, 1, 0),
(140, 'LU', 'LUX', 'Luxembourg', 1, 1, 0),
(141, 'MO', 'MAC', 'Macao', NULL, 1, 0),
(142, 'MK', 'MKD', 'ex-République yougoslave de Macédoine', NULL, 1, 0),
(143, 'MG', 'MDG', 'Madagascar', NULL, 1, 0),
(144, 'MW', 'MWI', 'Malawi', NULL, 1, 0),
(145, 'MY', 'MYS', 'Malaisie', NULL, 1, 0),
(146, 'MV', 'MDV', 'Maldives', NULL, 1, 0),
(147, 'ML', 'MLI', 'Mali', NULL, 1, 0),
(148, 'MT', 'MLT', 'Malte', 1, 1, 0),
(149, 'MH', 'MHL', 'Iles Marshall', NULL, 1, 0),
(151, 'MR', 'MRT', 'Mauritanie', NULL, 1, 0),
(152, 'MU', 'MUS', 'Maurice', NULL, 1, 0),
(153, 'YT', 'MYT', 'Mayotte', NULL, 1, 0),
(154, 'MX', 'MEX', 'Mexique', NULL, 1, 0),
(155, 'FM', 'FSM', 'Micronésie', NULL, 1, 0),
(156, 'MD', 'MDA', 'Moldavie', NULL, 1, 0),
(157, 'MN', 'MNG', 'Mongolie', NULL, 1, 0),
(158, 'MS', 'MSR', 'Monserrat', NULL, 1, 0),
(159, 'MZ', 'MOZ', 'Mozambique', NULL, 1, 0),
(160, 'MM', 'MMR', 'Birmanie (Myanmar)', NULL, 1, 0),
(161, 'NA', 'NAM', 'Namibie', NULL, 1, 0),
(162, 'NR', 'NRU', 'Nauru', NULL, 1, 0),
(163, 'NP', 'NPL', 'Népal', NULL, 1, 0),
(165, 'NC', 'NCL', 'New Caledonia', NULL, 1, 0),
(166, 'NZ', 'NZL', 'New Zealand', NULL, 1, 0),
(167, 'NI', 'NIC', 'Nicaragua', NULL, 1, 0),
(168, 'NE', 'NER', 'Niger', NULL, 1, 0),
(169, 'NG', 'NGA', 'Nigeria', NULL, 1, 0),
(170, 'NU', 'NIU', 'Niue', NULL, 1, 0),
(171, 'NF', 'NFK', 'Norfolk Island', NULL, 1, 0),
(172, 'MP', 'MNP', 'Northern Mariana Islands', NULL, 1, 0),
(173, 'NO', 'NOR', 'Norway', NULL, 1, 0),
(174, 'OM', 'OMN', 'Oman', NULL, 1, 0),
(175, 'PK', 'PAK', 'Pakistan', NULL, 1, 0),
(176, 'PW', 'PLW', 'Palau', NULL, 1, 0),
(177, 'PS', 'PSE', 'Palestinian territories', NULL, 1, 0),
(178, 'PA', 'PAN', 'Panama', NULL, 1, 0),
(179, 'PG', 'PNG', 'Papua New Guinea', NULL, 1, 0),
(180, 'PY', 'PRY', 'Paraguay', NULL, 1, 0),
(181, 'PE', 'PER', 'Peru', NULL, 1, 0),
(182, 'PH', 'PHL', 'Philippines', NULL, 1, 0),
(183, 'PN', 'PCN', 'Pitcairn Islands', NULL, 1, 0),
(184, 'PL', 'POL', 'Pologne', 1, 1, 0),
(185, 'PR', 'PRI', 'Puerto Rico', NULL, 1, 0),
(186, 'QA', 'QAT', 'Qatar', NULL, 1, 0),
(188, 'RO', 'ROU', 'Romania', 1, 1, 0),
(189, 'RW', 'RWA', 'Rwanda', NULL, 1, 0),
(190, 'SH', 'SHN', 'Saint Helena', NULL, 1, 0),
(191, 'KN', 'KNA', 'Saint Kitts and Nevis', NULL, 1, 0),
(192, 'LC', 'LCA', 'Saint Lucia', NULL, 1, 0),
(193, 'PM', 'SPM', 'Saint Pierre and Miquelon', NULL, 1, 0),
(194, 'VC', 'VCT', 'Saint Vincent and the Grenadines', NULL, 1, 0),
(195, 'WS', 'WSM', 'Samoa', NULL, 1, 0),
(196, 'SM', 'SMR', 'San Marino ', NULL, 1, 0),
(197, 'ST', 'STP', 'Saint Thomas and Prince', NULL, 1, 0),
(198, 'RS', 'SRB', 'Serbia', NULL, 1, 0),
(199, 'SC', 'SYC', 'Seychelles', NULL, 1, 0),
(200, 'SL', 'SLE', 'Sierra Leone', NULL, 1, 0),
(201, 'SK', 'SVK', 'Slovakia', 1, 1, 0),
(202, 'SI', 'SVN', 'Slovenia', 1, 1, 0),
(203, 'SB', 'SLB', 'Solomon Islands', NULL, 1, 0),
(204, 'SO', 'SOM', 'Somalia', NULL, 1, 0),
(205, 'ZA', 'ZAF', 'South Africa', NULL, 1, 0),
(206, 'GS', 'SGS', 'South Georgia and the South Sandwich Islands ', NULL, 1, 0),
(207, 'LK', 'LKA', 'Sri Lanka', NULL, 1, 0),
(208, 'SD', 'SDN', 'Sudan', NULL, 1, 0),
(209, 'SR', 'SUR', 'Suriname', NULL, 1, 0),
(210, 'SJ', 'SJM', 'Svalbard and Jan Mayen', NULL, 1, 0),
(211, 'SZ', 'SWZ', 'Swaziland / Eswatini', NULL, 1, 0),
(212, 'SY', 'SYR', 'Syria', NULL, 1, 0),
(213, 'TW', 'TWN', 'Taiwan', NULL, 1, 0),
(214, 'TJ', 'TJK', 'Tajikistan', NULL, 1, 0),
(215, 'TZ', 'TZA', 'Tanzania', NULL, 1, 0),
(216, 'TH', 'THA', 'Thailand', NULL, 1, 0),
(217, 'TL', 'TLS', 'Timor-Leste', NULL, 1, 0),
(218, 'TK', 'TKL', 'Tokelau', NULL, 1, 0),
(219, 'TO', 'TON', 'Tonga', NULL, 1, 0),
(220, 'TT', 'TTO', 'Trinidad and Tobago', NULL, 1, 0),
(221, 'TR', 'TUR', 'Turkey', NULL, 1, 0),
(222, 'TM', 'TKM', 'Turkmenistan', NULL, 1, 0),
(223, 'TC', 'TCA', 'Turks and Caicos Islands', NULL, 1, 0),
(224, 'TV', 'TUV', 'Tuvalu', NULL, 1, 0),
(225, 'UG', 'UGA', 'Uganda', NULL, 1, 0),
(226, 'UA', 'UKR', 'Ukraine', NULL, 1, 0),
(227, 'AE', 'ARE', 'United Arab Emirates', NULL, 1, 0),
(228, 'UM', 'UMI', 'United States Minor Outlying Islands', NULL, 1, 0),
(229, 'UY', 'URY', 'Uruguay', NULL, 1, 0),
(230, 'UZ', 'UZB', 'Uzbekistan', NULL, 1, 0),
(231, 'VU', 'VUT', 'Vanuatu', NULL, 1, 0),
(232, 'VE', 'VEN', 'Venezuela', NULL, 1, 0),
(233, 'VN', 'VNM', 'Vietnam', NULL, 1, 0),
(234, 'VG', 'VGB', 'British Virgin Islands', NULL, 1, 0),
(235, 'VI', 'VIR', 'Virgin Islands of the United States', NULL, 1, 0),
(236, 'WF', 'WLF', 'Wallis and Futuna', NULL, 1, 0),
(237, 'EH', 'ESH', 'Western Sahara', NULL, 1, 0),
(238, 'YE', 'YEM', 'Yemen', NULL, 1, 0),
(239, 'ZM', 'ZMB', 'Zambia', NULL, 1, 0),
(240, 'ZW', 'ZWE', 'Zimbabwe', NULL, 1, 0),
(241, 'GG', 'GGY', 'Guernsey', NULL, 1, 0),
(242, 'IM', 'IMN', 'Isle of Man', 1, 1, 0),
(243, 'JE', 'JEY', 'Jersey', NULL, 1, 0),
(244, 'ME', 'MNE', 'Montenegro', NULL, 1, 0),
(245, 'BL', 'BLM', 'Saint-Barthélemy', NULL, 1, 0),
(246, 'MF', 'MAF', 'Saint-Martin', NULL, 1, 0),
(247, 'XK', 'XKX', 'Kosovo', NULL, 1, 0),
(300, 'CW', 'CUW', 'Curaçao', NULL, 1, 0),
(301, 'SX', 'SXM', 'Sint Maarten', NULL, 1, 0);

-- --------------------------------------------------------

--
-- Structure de la table `llx_c_currencies`
--

CREATE TABLE `llx_c_currencies` (
  `code_iso` varchar(3) NOT NULL,
  `label` varchar(64) NOT NULL,
  `unicode` varchar(32) DEFAULT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `llx_c_currencies`
--

INSERT INTO `llx_c_currencies` (`code_iso`, `label`, `unicode`, `active`) VALUES
('AED', 'United Arab Emirates Dirham', NULL, 1),
('AFN', 'Afghanistan Afghani', '[1547]', 1),
('ALL', 'Albania Lek', '[76,101,107]', 1),
('ANG', 'Netherlands Antilles Guilder', '[402]', 1),
('AOA', 'Angola Kwanza', NULL, 1),
('ARP', 'Pesos argentins', NULL, 0),
('ARS', 'Argentino Peso', '[36]', 1),
('ATS', 'Shiliing autrichiens', NULL, 0),
('AUD', 'Australia Dollar', '[36]', 1),
('AWG', 'Aruba Guilder', '[402]', 1),
('AZN', 'Azerbaijan New Manat', '[1084,1072,1085]', 1),
('BAM', 'Bosnia and Herzegovina Convertible Marka', '[75,77]', 1),
('BBD', 'Barbados Dollar', '[36]', 1),
('BDT', 'Bangladeshi Taka', '[2547]', 1),
('BEF', 'Francs belges', NULL, 0),
('BGN', 'Bulgaria Lev', '[1083,1074]', 1),
('BHD', 'Bahrain', NULL, 1),
('BMD', 'Bermuda Dollar', '[36]', 1),
('BND', 'Brunei Darussalam Dollar', '[36]', 1),
('BOB', 'Bolivia Boliviano', '[66,115]', 1),
('BRL', 'Brazil Real', '[82,36]', 1),
('BSD', 'Bahamas Dollar', '[36]', 1),
('BWP', 'Botswana Pula', '[80]', 1),
('BYR', 'Belarus Ruble', '[112,46]', 1),
('BZD', 'Belize Dollar', '[66,90,36]', 1),
('CAD', 'Canada Dollar', '[36]', 1),
('CHF', 'Switzerland Franc', '[67,72,70]', 1),
('CLP', 'Chile Peso', '[36]', 1),
('CNY', 'China Yuan Renminbi', '[165]', 1),
('COP', 'Colombia Peso', '[36]', 1),
('CRC', 'Costa Rica Colon', '[8353]', 1),
('CUP', 'Cuba Peso', '[8369]', 1),
('CVE', 'Cap Verde Escudo', '[4217]', 1),
('CZK', 'Czech Republic Koruna', '[75,269]', 1),
('DEM', 'Deutsche Mark', NULL, 0),
('DKK', 'Denmark Krone', '[107,114]', 1),
('DOP', 'Dominican Republic Peso', '[82,68,36]', 1),
('DZD', 'Algeria Dinar', NULL, 1),
('ECS', 'Ecuador Sucre', '[83,47,46]', 1),
('EEK', 'Estonia Kroon', '[107,114]', 1),
('EGP', 'Egypt Pound', '[163]', 1),
('ESP', 'Pesete', NULL, 0),
('ETB', 'Ethiopian Birr', NULL, 1),
('EUR', 'Euro Member Countries', '[8364]', 1),
('FIM', 'Mark finlandais', NULL, 0),
('FJD', 'Fiji Dollar', '[36]', 1),
('FKP', 'Falkland Islands (Malvinas) Pound', '[163]', 1),
('FRF', 'Francs francais', NULL, 0),
('GBP', 'United Kingdom Pound', '[163]', 1),
('GGP', 'Guernsey Pound', '[163]', 1),
('GHC', 'Ghana Cedis', '[162]', 1),
('GIP', 'Gibraltar Pound', '[163]', 1),
('GNF', 'Guinea Franc', '[70,71]', 1),
('GRD', 'Drachme (grece)', NULL, 0),
('GTQ', 'Guatemala Quetzal', '[81]', 1),
('GYD', 'Guyana Dollar', '[36]', 1),
('HKD', 'Hong Kong Dollar', '[36]', 1),
('HNL', 'Honduras Lempira', '[76]', 1),
('HRK', 'Croatia Kuna', '[107,110]', 1),
('HUF', 'Hungary Forint', '[70,116]', 1),
('IDR', 'Indonesia Rupiah', '[82,112]', 1),
('IEP', 'Livres irlandaises', NULL, 0),
('ILS', 'Israel Shekel', '[8362]', 1),
('IMP', 'Isle of Man Pound', '[163]', 1),
('INR', 'India Rupee', '[8377]', 1),
('IRR', 'Iran Rial', '[65020]', 1),
('ISK', 'Iceland Krona', '[107,114]', 1),
('ITL', 'Lires', NULL, 0),
('JEP', 'Jersey Pound', '[163]', 1),
('JMD', 'Jamaica Dollar', '[74,36]', 1),
('JPY', 'Japan Yen', '[165]', 1),
('KES', 'Kenya Shilling', NULL, 1),
('KGS', 'Kyrgyzstan Som', '[1083,1074]', 1),
('KHR', 'Cambodia Riel', '[6107]', 1),
('KPW', 'Korea (North) Won', '[8361]', 1),
('KRW', 'Korea (South) Won', '[8361]', 1),
('KYD', 'Cayman Islands Dollar', '[36]', 1),
('KZT', 'Kazakhstan Tenge', '[1083,1074]', 1),
('LAK', 'Laos Kip', '[8365]', 1),
('LBP', 'Lebanon Pound', '[163]', 1),
('LKR', 'Sri Lanka Rupee', '[8360]', 1),
('LRD', 'Liberia Dollar', '[36]', 1),
('LTL', 'Lithuania Litas', '[76,116]', 1),
('LUF', 'Francs luxembourgeois', NULL, 0),
('LVL', 'Latvia Lat', '[76,115]', 1),
('MAD', 'Morocco Dirham', NULL, 1),
('MDL', 'Moldova Leu', NULL, 1),
('MGA', 'Ariary', NULL, 1),
('MKD', 'Macedonia Denar', '[1076,1077,1085]', 1),
('MNT', 'Mongolia Tughrik', '[8366]', 1),
('MRO', 'Mauritania Ouguiya', NULL, 1),
('MUR', 'Mauritius Rupee', '[8360]', 1),
('MXN', 'Mexico Peso', '[36]', 1),
('MXP', 'Pesos Mexicans', NULL, 0),
('MYR', 'Malaysia Ringgit', '[82,77]', 1),
('MZN', 'Mozambique Metical', '[77,84]', 1),
('NAD', 'Namibia Dollar', '[36]', 1),
('NGN', 'Nigeria Naira', '[8358]', 1),
('NIO', 'Nicaragua Cordoba', '[67,36]', 1),
('NLG', 'Florins', NULL, 0),
('NOK', 'Norway Krone', '[107,114]', 1),
('NPR', 'Nepal Rupee', '[8360]', 1),
('NZD', 'New Zealand Dollar', '[36]', 1),
('OMR', 'Oman Rial', '[65020]', 1),
('PAB', 'Panama Balboa', '[66,47,46]', 1),
('PEN', 'Perú Sol', '[83,47]', 1),
('PHP', 'Philippines Peso', '[8369]', 1),
('PKR', 'Pakistan Rupee', '[8360]', 1),
('PLN', 'Poland Zloty', '[122,322]', 1),
('PTE', 'Escudos', NULL, 0),
('PYG', 'Paraguay Guarani', '[71,115]', 1),
('QAR', 'Qatar Riyal', '[65020]', 1),
('RON', 'Romania New Leu', '[108,101,105]', 1),
('RSD', 'Serbia Dinar', '[1044,1080,1085,46]', 1),
('RUB', 'Russia Ruble', '[1088,1091,1073]', 1),
('SAR', 'Saudi Arabia Riyal', '[65020]', 1),
('SBD', 'Solomon Islands Dollar', '[36]', 1),
('SCR', 'Seychelles Rupee', '[8360]', 1),
('SEK', 'Sweden Krona', '[107,114]', 1),
('SGD', 'Singapore Dollar', '[36]', 1),
('SHP', 'Saint Helena Pound', '[163]', 1),
('SKK', 'Couronnes slovaques', NULL, 0),
('SOS', 'Somalia Shilling', '[83]', 1),
('SRD', 'Suriname Dollar', '[36]', 1),
('SUR', 'Rouble', NULL, 0),
('SVC', 'El Salvador Colon', '[36]', 1),
('SYP', 'Syria Pound', '[163]', 1),
('THB', 'Thailand Baht', '[3647]', 1),
('TND', 'Tunisia Dinar', NULL, 1),
('TRL', 'Turkey Lira', '[84,76]', 0),
('TRY', 'Turkey Lira', '[8356]', 1),
('TTD', 'Trinidad and Tobago Dollar', '[84,84,36]', 1),
('TVD', 'Tuvalu Dollar', '[36]', 1),
('TWD', 'Taiwan New Dollar', '[78,84,36]', 1),
('UAH', 'Ukraine Hryvna', '[8372]', 1),
('USD', 'United States Dollar', '[36]', 1),
('UYU', 'Uruguay Peso', '[36,85]', 1),
('UZS', 'Uzbekistan Som', '[1083,1074]', 1),
('VEF', 'Venezuela Bolivar Fuerte', '[66,115]', 1),
('VND', 'Viet Nam Dong', '[8363]', 1),
('XAF', 'Communaute Financiere Africaine (BEAC) CFA Franc', NULL, 1),
('XCD', 'East Caribbean Dollar', '[36]', 1),
('XEU', 'Ecus', NULL, 0),
('XOF', 'Communaute Financiere Africaine (BCEAO) Franc', NULL, 1),
('XPF', 'Franc CFP', '[70]', 1),
('YER', 'Yemen Rial', '[65020]', 1),
('ZAR', 'South Africa Rand', '[82]', 1),
('ZWD', 'Zimbabwe Dollar', '[90,36]', 1);

-- --------------------------------------------------------

--
-- Structure de la table `llx_c_departements`
--

CREATE TABLE `llx_c_departements` (
  `rowid` int(11) NOT NULL,
  `code_departement` varchar(6) NOT NULL,
  `fk_region` int(11) DEFAULT NULL,
  `cheflieu` varchar(50) DEFAULT NULL,
  `tncc` int(11) DEFAULT NULL,
  `ncc` varchar(50) DEFAULT NULL,
  `nom` varchar(50) DEFAULT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `llx_c_departements`
--

INSERT INTO `llx_c_departements` (`rowid`, `code_departement`, `fk_region`, `cheflieu`, `tncc`, `ncc`, `nom`, `active`) VALUES
(1, '0', 0, '0', 0, '-', '-', 1),
(2, 'AL01', 1301, '', 0, '', 'Wilaya d\'Adrar', 1),
(3, 'AL02', 1301, '', 0, '', 'Wilaya de Chlef', 1),
(4, 'AL03', 1301, '', 0, '', 'Wilaya de Laghouat', 1),
(5, 'AL04', 1301, '', 0, '', 'Wilaya d\'Oum El Bouaghi', 1),
(6, 'AL05', 1301, '', 0, '', 'Wilaya de Batna', 1),
(7, 'AL06', 1301, '', 0, '', 'Wilaya de Béjaïa', 1),
(8, 'AL07', 1301, '', 0, '', 'Wilaya de Biskra', 1),
(9, 'AL08', 1301, '', 0, '', 'Wilaya de Béchar', 1),
(10, 'AL09', 1301, '', 0, '', 'Wilaya de Blida', 1),
(11, 'AL10', 1301, '', 0, '', 'Wilaya de Bouira', 1),
(12, 'AL11', 1301, '', 0, '', 'Wilaya de Tamanrasset', 1),
(13, 'AL12', 1301, '', 0, '', 'Wilaya de Tébessa', 1),
(14, 'AL13', 1301, '', 0, '', 'Wilaya de Tlemcen', 1),
(15, 'AL14', 1301, '', 0, '', 'Wilaya de Tiaret', 1),
(16, 'AL15', 1301, '', 0, '', 'Wilaya de Tizi Ouzou', 1),
(17, 'AL16', 1301, '', 0, '', 'Wilaya d\'Alger', 1),
(18, 'AL17', 1301, '', 0, '', 'Wilaya de Djelfa', 1),
(19, 'AL18', 1301, '', 0, '', 'Wilaya de Jijel', 1),
(20, 'AL19', 1301, '', 0, '', 'Wilaya de Sétif', 1),
(21, 'AL20', 1301, '', 0, '', 'Wilaya de Saïda', 1),
(22, 'AL21', 1301, '', 0, '', 'Wilaya de Skikda', 1),
(23, 'AL22', 1301, '', 0, '', 'Wilaya de Sidi Bel Abbès', 1),
(24, 'AL23', 1301, '', 0, '', 'Wilaya d\'Annaba', 1),
(25, 'AL24', 1301, '', 0, '', 'Wilaya de Guelma', 1),
(26, 'AL25', 1301, '', 0, '', 'Wilaya de Constantine', 1),
(27, 'AL26', 1301, '', 0, '', 'Wilaya de Médéa', 1),
(28, 'AL27', 1301, '', 0, '', 'Wilaya de Mostaganem', 1),
(29, 'AL28', 1301, '', 0, '', 'Wilaya de M\'Sila', 1),
(30, 'AL29', 1301, '', 0, '', 'Wilaya de Mascara', 1),
(31, 'AL30', 1301, '', 0, '', 'Wilaya d\'Ouargla', 1),
(32, 'AL31', 1301, '', 0, '', 'Wilaya d\'Oran', 1),
(33, 'AL32', 1301, '', 0, '', 'Wilaya d\'El Bayadh', 1),
(34, 'AL33', 1301, '', 0, '', 'Wilaya d\'Illizi', 1),
(35, 'AL34', 1301, '', 0, '', 'Wilaya de Bordj Bou Arreridj', 1),
(36, 'AL35', 1301, '', 0, '', 'Wilaya de Boumerdès', 1),
(37, 'AL36', 1301, '', 0, '', 'Wilaya d\'El Tarf', 1),
(38, 'AL37', 1301, '', 0, '', 'Wilaya de Tindouf', 1),
(39, 'AL38', 1301, '', 0, '', 'Wilaya de Tissemsilt', 1),
(40, 'AL39', 1301, '', 0, '', 'Wilaya d\'El Oued', 1),
(41, 'AL40', 1301, '', 0, '', 'Wilaya de Khenchela', 1),
(42, 'AL41', 1301, '', 0, '', 'Wilaya de Souk Ahras', 1),
(43, 'AL42', 1301, '', 0, '', 'Wilaya de Tipaza', 1),
(44, 'AL43', 1301, '', 0, '', 'Wilaya de Mila', 1),
(45, 'AL44', 1301, '', 0, '', 'Wilaya d\'Aïn Defla', 1),
(46, 'AL45', 1301, '', 0, '', 'Wilaya de Naâma', 1),
(47, 'AL46', 1301, '', 0, '', 'Wilaya d\'Aïn Témouchent', 1),
(48, 'AL47', 1301, '', 0, '', 'Wilaya de Ghardaia', 1),
(49, 'AL48', 1301, '', 0, '', 'Wilaya de Relizane', 1),
(50, 'AD-002', 34000, 'AD100', NULL, NULL, 'Canillo', 1),
(51, 'AD-003', 34000, 'AD200', NULL, NULL, 'Encamp', 1),
(52, 'AD-004', 34000, 'AD400', NULL, NULL, 'La Massana', 1),
(53, 'AD-005', 34000, 'AD300', NULL, NULL, 'Ordino', 1),
(54, 'AD-006', 34000, 'AD600', NULL, NULL, 'Sant Julià de Lòria', 1),
(55, 'AD-007', 34000, 'AD500', NULL, NULL, 'Andorra la Vella', 1),
(56, 'AD-008', 34000, 'AD700', NULL, NULL, 'Escaldes-Engordany', 1),
(57, 'AO-ABO', 35001, NULL, NULL, 'BENGO', 'Bengo', 1),
(58, 'AO-BGU', 35001, NULL, NULL, 'BENGUELA', 'Benguela', 1),
(59, 'AO-BIE', 35001, NULL, NULL, 'BIÉ', 'Bié', 1),
(60, 'AO-CAB', 35001, NULL, NULL, 'CABINDA', 'Cabinda', 1),
(61, 'AO-CCU', 35001, NULL, NULL, 'KUANDO KUBANGO', 'Kuando Kubango', 1),
(62, 'AO-CNO', 35001, NULL, NULL, 'KWANZA NORTE', 'Kwanza Norte', 1),
(63, 'AO-CUS', 35001, NULL, NULL, 'KWANZA SUL', 'Kwanza Sul', 1),
(64, 'AO-CNN', 35001, NULL, NULL, 'CUNENE', 'Cunene', 1),
(65, 'AO-HUA', 35001, NULL, NULL, 'HUAMBO', 'Huambo', 1),
(66, 'AO-HUI', 35001, NULL, NULL, 'HUÍLA', 'Huila', 1),
(67, 'AO-LUA', 35001, NULL, NULL, 'LUANDA', 'Luanda', 1),
(68, 'AO-LNO', 35001, NULL, NULL, 'LUNDA-NORTE', 'Lunda-Norte', 1),
(69, 'AO-LSU', 35001, NULL, NULL, 'LUNDA-SUL', 'Lunda-Sul', 1),
(70, 'AO-MAL', 35001, NULL, NULL, 'MALANGE', 'Malange', 1),
(71, 'AO-MOX', 35001, NULL, NULL, 'MOXICO', 'Moxico', 1),
(72, 'AO-NAM', 35001, NULL, NULL, 'NAMÍBE', 'Namíbe', 1),
(73, 'AO-UIG', 35001, NULL, NULL, 'UÍGE', 'Uíge', 1),
(74, 'AO-ZAI', 35001, NULL, NULL, 'ZAÍRE', 'Zaíre', 1),
(75, '2301', 2301, '', 0, 'CATAMARCA', 'Catamarca', 1),
(76, '2302', 2301, '', 0, 'JUJUY', 'Jujuy', 1),
(77, '2303', 2301, '', 0, 'TUCAMAN', 'Tucamán', 1),
(78, '2304', 2301, '', 0, 'SANTIAGO DEL ESTERO', 'Santiago del Estero', 1),
(79, '2305', 2301, '', 0, 'SALTA', 'Salta', 1),
(80, '2306', 2302, '', 0, 'CHACO', 'Chaco', 1),
(81, '2307', 2302, '', 0, 'CORRIENTES', 'Corrientes', 1),
(82, '2308', 2302, '', 0, 'ENTRE RIOS', 'Entre Ríos', 1),
(83, '2309', 2302, '', 0, 'FORMOSA', 'Formosa', 1),
(84, '2310', 2302, '', 0, 'SANTA FE', 'Santa Fe', 1),
(85, '2311', 2303, '', 0, 'LA RIOJA', 'La Rioja', 1),
(86, '2312', 2303, '', 0, 'MENDOZA', 'Mendoza', 1),
(87, '2313', 2303, '', 0, 'SAN JUAN', 'San Juan', 1),
(88, '2314', 2303, '', 0, 'SAN LUIS', 'San Luis', 1),
(89, '2315', 2304, '', 0, 'CORDOBA', 'Córdoba', 1),
(90, '2316', 2304, '', 0, 'BUENOS AIRES', 'Buenos Aires', 1),
(91, '2317', 2304, '', 0, 'CABA', 'Caba', 1),
(92, '2318', 2305, '', 0, 'LA PAMPA', 'La Pampa', 1),
(93, '2319', 2305, '', 0, 'NEUQUEN', 'Neuquén', 1),
(94, '2320', 2305, '', 0, 'RIO NEGRO', 'Río Negro', 1),
(95, '2321', 2305, '', 0, 'CHUBUT', 'Chubut', 1),
(96, '2322', 2305, '', 0, 'SANTA CRUZ', 'Santa Cruz', 1),
(97, '2323', 2305, '', 0, 'TIERRA DEL FUEGO', 'Tierra del Fuego', 1),
(98, '2324', 2305, '', 0, 'ISLAS MALVINAS', 'Islas Malvinas', 1),
(99, '2325', 2305, '', 0, 'ANTARTIDA', 'Antártida', 1),
(100, '2326', 2305, '', 0, 'MISIONES', 'Misiones', 1),
(101, 'NSW', 2801, '', 1, '', 'New South Wales', 1),
(102, 'VIC', 2801, '', 1, '', 'Victoria', 1),
(103, 'QLD', 2801, '', 1, '', 'Queensland', 1),
(104, 'SA', 2801, '', 1, '', 'South Australia', 1),
(105, 'ACT', 2801, '', 1, '', 'Australia Capital Territory', 1),
(106, 'TAS', 2801, '', 1, '', 'Tasmania', 1),
(107, 'WA', 2801, '', 1, '', 'Western Australia', 1),
(108, 'NT', 2801, '', 1, '', 'Northern Territory', 1),
(109, 'B', 4101, NULL, NULL, 'BURGENLAND', 'Burgenland', 1),
(110, 'K', 4101, NULL, NULL, 'KAERNTEN', 'Kärnten', 1),
(111, 'N', 4101, NULL, NULL, 'NIEDEROESTERREICH', 'Niederösterreich', 1),
(112, 'O', 4101, NULL, NULL, 'OBEROESTERREICH', 'Oberösterreich', 1),
(113, 'S', 4101, NULL, NULL, 'SALZBURG', 'Salzburg', 1),
(114, 'ST', 4101, NULL, NULL, 'STEIERMARK', 'Steiermark', 1),
(115, 'T', 4101, NULL, NULL, 'TIROL', 'Tirol', 1),
(116, 'V', 4101, NULL, NULL, 'VORARLBERG', 'Vorarlberg', 1),
(117, 'W', 4101, NULL, NULL, 'WIEN', 'Wien', 1),
(118, 'CC', 4601, 'Oistins', 0, 'CC', 'Christ Church', 1),
(119, 'SA', 4601, 'Greenland', 0, 'SA', 'Saint Andrew', 1),
(120, 'SG', 4601, 'Bulkeley', 0, 'SG', 'Saint George', 1),
(121, 'JA', 4601, 'Holetown', 0, 'JA', 'Saint James', 1),
(122, 'SJ', 4601, 'Four Roads', 0, 'SJ', 'Saint John', 1),
(123, 'SB', 4601, 'Bathsheba', 0, 'SB', 'Saint Joseph', 1),
(124, 'SL', 4601, 'Crab Hill', 0, 'SL', 'Saint Lucy', 1),
(125, 'SM', 4601, 'Bridgetown', 0, 'SM', 'Saint Michael', 1),
(126, 'SP', 4601, 'Speightstown', 0, 'SP', 'Saint Peter', 1),
(127, 'SC', 4601, 'Crane', 0, 'SC', 'Saint Philip', 1),
(128, 'ST', 4601, 'Hillaby', 0, 'ST', 'Saint Thomas', 1),
(129, '01', 201, '', 1, 'ANVERS', 'Anvers', 1),
(130, '02', 203, '', 3, 'BRUXELLES-CAPITALE', 'Bruxelles-Capitale', 1),
(131, '03', 202, '', 2, 'BRABANT-WALLON', 'Brabant-Wallon', 1),
(132, '04', 201, '', 1, 'BRABANT-FLAMAND', 'Brabant-Flamand', 1),
(133, '05', 201, '', 1, 'FLANDRE-OCCIDENTALE', 'Flandre-Occidentale', 1),
(134, '06', 201, '', 1, 'FLANDRE-ORIENTALE', 'Flandre-Orientale', 1),
(135, '07', 202, '', 2, 'HAINAUT', 'Hainaut', 1),
(136, '08', 201, '', 2, 'LIEGE', 'Liège', 1),
(137, '09', 202, '', 1, 'LIMBOURG', 'Limbourg', 1),
(138, '10', 202, '', 2, 'LUXEMBOURG', 'Luxembourg', 1),
(139, '11', 201, '', 2, 'NAMUR', 'Namur', 1),
(140, 'AC', 5601, 'ACRE', 0, 'AC', 'Acre', 1),
(141, 'AL', 5601, 'ALAGOAS', 0, 'AL', 'Alagoas', 1),
(142, 'AP', 5601, 'AMAPA', 0, 'AP', 'Amapá', 1),
(143, 'AM', 5601, 'AMAZONAS', 0, 'AM', 'Amazonas', 1),
(144, 'BA', 5601, 'BAHIA', 0, 'BA', 'Bahia', 1),
(145, 'CE', 5601, 'CEARA', 0, 'CE', 'Ceará', 1),
(146, 'ES', 5601, 'ESPIRITO SANTO', 0, 'ES', 'Espirito Santo', 1),
(147, 'GO', 5601, 'GOIAS', 0, 'GO', 'Goiás', 1),
(148, 'MA', 5601, 'MARANHAO', 0, 'MA', 'Maranhão', 1),
(149, 'MT', 5601, 'MATO GROSSO', 0, 'MT', 'Mato Grosso', 1),
(150, 'MS', 5601, 'MATO GROSSO DO SUL', 0, 'MS', 'Mato Grosso do Sul', 1),
(151, 'MG', 5601, 'MINAS GERAIS', 0, 'MG', 'Minas Gerais', 1),
(152, 'PA', 5601, 'PARA', 0, 'PA', 'Pará', 1),
(153, 'PB', 5601, 'PARAIBA', 0, 'PB', 'Paraiba', 1),
(154, 'PR', 5601, 'PARANA', 0, 'PR', 'Paraná', 1),
(155, 'PE', 5601, 'PERNAMBUCO', 0, 'PE', 'Pernambuco', 1),
(156, 'PI', 5601, 'PIAUI', 0, 'PI', 'Piauí', 1),
(157, 'RJ', 5601, 'RIO DE JANEIRO', 0, 'RJ', 'Rio de Janeiro', 1),
(158, 'RN', 5601, 'RIO GRANDE DO NORTE', 0, 'RN', 'Rio Grande do Norte', 1),
(159, 'RS', 5601, 'RIO GRANDE DO SUL', 0, 'RS', 'Rio Grande do Sul', 1),
(160, 'RO', 5601, 'RONDONIA', 0, 'RO', 'Rondônia', 1),
(161, 'RR', 5601, 'RORAIMA', 0, 'RR', 'Roraima', 1),
(162, 'SC', 5601, 'SANTA CATARINA', 0, 'SC', 'Santa Catarina', 1),
(163, 'SE', 5601, 'SERGIPE', 0, 'SE', 'Sergipe', 1),
(164, 'SP', 5601, 'SAO PAULO', 0, 'SP', 'Sao Paulo', 1),
(165, 'TO', 5601, 'TOCANTINS', 0, 'TO', 'Tocantins', 1),
(166, 'DF', 5601, 'DISTRITO FEDERAL', 0, 'DF', 'Distrito Federal', 1),
(167, 'ON', 1401, '', 1, '', 'Ontario', 1),
(168, 'QC', 1401, '', 1, '', 'Quebec', 1),
(169, 'NS', 1401, '', 1, '', 'Nova Scotia', 1),
(170, 'NB', 1401, '', 1, '', 'New Brunswick', 1),
(171, 'MB', 1401, '', 1, '', 'Manitoba', 1),
(172, 'BC', 1401, '', 1, '', 'British Columbia', 1),
(173, 'PE', 1401, '', 1, '', 'Prince Edward Island', 1),
(174, 'SK', 1401, '', 1, '', 'Saskatchewan', 1),
(175, 'AB', 1401, '', 1, '', 'Alberta', 1),
(176, 'NL', 1401, '', 1, '', 'Newfoundland and Labrador', 1),
(177, '011', 6701, '', 0, '011', 'Iquique', 1),
(178, '014', 6701, '', 0, '014', 'Tamarugal', 1),
(179, '021', 6702, '', 0, '021', 'Antofagasa', 1),
(180, '022', 6702, '', 0, '022', 'El Loa', 1),
(181, '023', 6702, '', 0, '023', 'Tocopilla', 1),
(182, '031', 6703, '', 0, '031', 'Copiapó', 1),
(183, '032', 6703, '', 0, '032', 'Chañaral', 1),
(184, '033', 6703, '', 0, '033', 'Huasco', 1),
(185, '041', 6704, '', 0, '041', 'Elqui', 1),
(186, '042', 6704, '', 0, '042', 'Choapa', 1),
(187, '043', 6704, '', 0, '043', 'Limarí', 1),
(188, '051', 6705, '', 0, '051', 'Valparaíso', 1),
(189, '052', 6705, '', 0, '052', 'Isla de Pascua', 1),
(190, '053', 6705, '', 0, '053', 'Los Andes', 1),
(191, '054', 6705, '', 0, '054', 'Petorca', 1),
(192, '055', 6705, '', 0, '055', 'Quillota', 1),
(193, '056', 6705, '', 0, '056', 'San Antonio', 1),
(194, '057', 6705, '', 0, '057', 'San Felipe de Aconcagua', 1),
(195, '058', 6705, '', 0, '058', 'Marga Marga', 1),
(196, '061', 6706, '', 0, '061', 'Cachapoal', 1),
(197, '062', 6706, '', 0, '062', 'Cardenal Caro', 1),
(198, '063', 6706, '', 0, '063', 'Colchagua', 1),
(199, '071', 6707, '', 0, '071', 'Talca', 1),
(200, '072', 6707, '', 0, '072', 'Cauquenes', 1),
(201, '073', 6707, '', 0, '073', 'Curicó', 1),
(202, '074', 6707, '', 0, '074', 'Linares', 1),
(203, '081', 6708, '', 0, '081', 'Concepción', 1),
(204, '082', 6708, '', 0, '082', 'Arauco', 1),
(205, '083', 6708, '', 0, '083', 'Biobío', 1),
(206, '084', 6708, '', 0, '084', 'Ñuble', 1),
(207, '091', 6709, '', 0, '091', 'Cautín', 1),
(208, '092', 6709, '', 0, '092', 'Malleco', 1),
(209, '101', 6710, '', 0, '101', 'Llanquihue', 1),
(210, '102', 6710, '', 0, '102', 'Chiloé', 1),
(211, '103', 6710, '', 0, '103', 'Osorno', 1),
(212, '104', 6710, '', 0, '104', 'Palena', 1),
(213, '111', 6711, '', 0, '111', 'Coihaique', 1),
(214, '112', 6711, '', 0, '112', 'Aisén', 1),
(215, '113', 6711, '', 0, '113', 'Capitán Prat', 1),
(216, '114', 6711, '', 0, '114', 'General Carrera', 1),
(217, '121', 6712, '', 0, '121', 'Magallanes', 1),
(218, '122', 6712, '', 0, '122', 'Antártica Chilena', 1),
(219, '123', 6712, '', 0, '123', 'Tierra del Fuego', 1),
(220, '124', 6712, '', 0, '124', 'Última Esperanza', 1),
(221, '131', 6713, '', 0, '131', 'Santiago', 1),
(222, '132', 6713, '', 0, '132', 'Cordillera', 1),
(223, '133', 6713, '', 0, '133', 'Chacabuco', 1),
(224, '134', 6713, '', 0, '134', 'Maipo', 1),
(225, '135', 6713, '', 0, '135', 'Melipilla', 1),
(226, '136', 6713, '', 0, '136', 'Talagante', 1),
(227, '141', 6714, '', 0, '141', 'Valdivia', 1),
(228, '142', 6714, '', 0, '142', 'Ranco', 1),
(229, '151', 6715, '', 0, '151', 'Arica', 1),
(230, '152', 6715, '', 0, '152', 'Parinacota', 1),
(231, 'ANT', 7001, '', 0, 'ANT', 'Antioquia', 1),
(232, 'BOL', 7001, '', 0, 'BOL', 'Bolívar', 1),
(233, 'BOY', 7001, '', 0, 'BOY', 'Boyacá', 1),
(234, 'CAL', 7001, '', 0, 'CAL', 'Caldas', 1),
(235, 'CAU', 7001, '', 0, 'CAU', 'Cauca', 1),
(236, 'CUN', 7001, '', 0, 'CUN', 'Cundinamarca', 1),
(237, 'HUI', 7001, '', 0, 'HUI', 'Huila', 1),
(238, 'LAG', 7001, '', 0, 'LAG', 'La Guajira', 1),
(239, 'MET', 7001, '', 0, 'MET', 'Meta', 1),
(240, 'NAR', 7001, '', 0, 'NAR', 'Nariño', 1),
(241, 'NDS', 7001, '', 0, 'NDS', 'Norte de Santander', 1),
(242, 'SAN', 7001, '', 0, 'SAN', 'Santander', 1),
(243, 'SUC', 7001, '', 0, 'SUC', 'Sucre', 1),
(244, 'TOL', 7001, '', 0, 'TOL', 'Tolima', 1),
(245, 'VAC', 7001, '', 0, 'VAC', 'Valle del Cauca', 1),
(246, 'RIS', 7001, '', 0, 'RIS', 'Risalda', 1),
(247, 'ATL', 7001, '', 0, 'ATL', 'Atlántico', 1),
(248, 'COR', 7001, '', 0, 'COR', 'Córdoba', 1),
(249, 'SAP', 7001, '', 0, 'SAP', 'San Andrés, Providencia y Santa Catalina', 1),
(250, 'ARA', 7001, '', 0, 'ARA', 'Arauca', 1),
(251, 'CAS', 7001, '', 0, 'CAS', 'Casanare', 1),
(252, 'AMA', 7001, '', 0, 'AMA', 'Amazonas', 1),
(253, 'CAQ', 7001, '', 0, 'CAQ', 'Caquetá', 1),
(254, 'CHO', 7001, '', 0, 'CHO', 'Chocó', 1),
(255, 'GUA', 7001, '', 0, 'GUA', 'Guainía', 1),
(256, 'GUV', 7001, '', 0, 'GUV', 'Guaviare', 1),
(257, 'PUT', 7001, '', 0, 'PUT', 'Putumayo', 1),
(258, 'QUI', 7001, '', 0, 'QUI', 'Quindío', 1),
(259, 'VAU', 7001, '', 0, 'VAU', 'Vaupés', 1),
(260, 'BOG', 7001, '', 0, 'BOG', 'Bogotá', 1),
(261, 'VID', 7001, '', 0, 'VID', 'Vichada', 1),
(262, 'CES', 7001, '', 0, 'CES', 'Cesar', 1),
(263, 'MAG', 7001, '', 0, 'MAG', 'Magdalena', 1),
(264, '971', 1, '97105', 3, 'GUADELOUPE', 'Guadeloupe', 1),
(265, '972', 2, '97209', 3, 'MARTINIQUE', 'Martinique', 1),
(266, '973', 3, '97302', 3, 'GUYANE', 'Guyane', 1),
(267, '974', 4, '97411', 3, 'REUNION', 'Réunion', 1),
(268, '976', 6, '97601', 3, 'MAYOTTE', 'Mayotte', 1),
(269, '01', 84, '01053', 5, 'AIN', 'Ain', 1),
(270, '02', 32, '02408', 5, 'AISNE', 'Aisne', 1),
(271, '03', 84, '03190', 5, 'ALLIER', 'Allier', 1),
(272, '04', 93, '04070', 4, 'ALPES-DE-HAUTE-PROVENCE', 'Alpes-de-Haute-Provence', 1),
(273, '05', 93, '05061', 4, 'HAUTES-ALPES', 'Hautes-Alpes', 1),
(274, '06', 93, '06088', 4, 'ALPES-MARITIMES', 'Alpes-Maritimes', 1),
(275, '07', 84, '07186', 5, 'ARDECHE', 'Ardèche', 1),
(276, '08', 44, '08105', 4, 'ARDENNES', 'Ardennes', 1),
(277, '09', 76, '09122', 5, 'ARIEGE', 'Ariège', 1),
(278, '10', 44, '10387', 5, 'AUBE', 'Aube', 1),
(279, '11', 76, '11069', 5, 'AUDE', 'Aude', 1),
(280, '12', 76, '12202', 5, 'AVEYRON', 'Aveyron', 1),
(281, '13', 93, '13055', 4, 'BOUCHES-DU-RHONE', 'Bouches-du-Rhône', 1),
(282, '14', 28, '14118', 2, 'CALVADOS', 'Calvados', 1),
(283, '15', 84, '15014', 2, 'CANTAL', 'Cantal', 1),
(284, '16', 75, '16015', 3, 'CHARENTE', 'Charente', 1),
(285, '17', 75, '17300', 3, 'CHARENTE-MARITIME', 'Charente-Maritime', 1),
(286, '18', 24, '18033', 2, 'CHER', 'Cher', 1),
(287, '19', 75, '19272', 3, 'CORREZE', 'Corrèze', 1),
(288, '2A', 94, '2A004', 3, 'CORSE-DU-SUD', 'Corse-du-Sud', 1),
(289, '2B', 94, '2B033', 3, 'HAUTE-CORSE', 'Haute-Corse', 1),
(290, '21', 27, '21231', 3, 'COTE-D OR', 'Côte-d Or', 1),
(291, '22', 53, '22278', 4, 'COTES-D ARMOR', 'Côtes-d Armor', 1),
(292, '23', 75, '23096', 3, 'CREUSE', 'Creuse', 1),
(293, '24', 75, '24322', 3, 'DORDOGNE', 'Dordogne', 1),
(294, '25', 27, '25056', 2, 'DOUBS', 'Doubs', 1),
(295, '26', 84, '26362', 3, 'DROME', 'Drôme', 1),
(296, '27', 28, '27229', 5, 'EURE', 'Eure', 1),
(297, '28', 24, '28085', 1, 'EURE-ET-LOIR', 'Eure-et-Loir', 1),
(298, '29', 53, '29232', 2, 'FINISTERE', 'Finistère', 1),
(299, '30', 76, '30189', 2, 'GARD', 'Gard', 1),
(300, '31', 76, '31555', 3, 'HAUTE-GARONNE', 'Haute-Garonne', 1),
(301, '32', 76, '32013', 2, 'GERS', 'Gers', 1),
(302, '33', 75, '33063', 3, 'GIRONDE', 'Gironde', 1),
(303, '34', 76, '34172', 5, 'HERAULT', 'Hérault', 1),
(304, '35', 53, '35238', 1, 'ILLE-ET-VILAINE', 'Ille-et-Vilaine', 1),
(305, '36', 24, '36044', 5, 'INDRE', 'Indre', 1),
(306, '37', 24, '37261', 1, 'INDRE-ET-LOIRE', 'Indre-et-Loire', 1),
(307, '38', 84, '38185', 5, 'ISERE', 'Isère', 1),
(308, '39', 27, '39300', 2, 'JURA', 'Jura', 1),
(309, '40', 75, '40192', 4, 'LANDES', 'Landes', 1),
(310, '41', 24, '41018', 0, 'LOIR-ET-CHER', 'Loir-et-Cher', 1),
(311, '42', 84, '42218', 3, 'LOIRE', 'Loire', 1),
(312, '43', 84, '43157', 3, 'HAUTE-LOIRE', 'Haute-Loire', 1),
(313, '44', 52, '44109', 3, 'LOIRE-ATLANTIQUE', 'Loire-Atlantique', 1),
(314, '45', 24, '45234', 2, 'LOIRET', 'Loiret', 1),
(315, '46', 76, '46042', 2, 'LOT', 'Lot', 1),
(316, '47', 75, '47001', 0, 'LOT-ET-GARONNE', 'Lot-et-Garonne', 1),
(317, '48', 76, '48095', 3, 'LOZERE', 'Lozère', 1),
(318, '49', 52, '49007', 0, 'MAINE-ET-LOIRE', 'Maine-et-Loire', 1),
(319, '50', 28, '50502', 3, 'MANCHE', 'Manche', 1),
(320, '51', 44, '51108', 3, 'MARNE', 'Marne', 1),
(321, '52', 44, '52121', 3, 'HAUTE-MARNE', 'Haute-Marne', 1),
(322, '53', 52, '53130', 3, 'MAYENNE', 'Mayenne', 1),
(323, '54', 44, '54395', 0, 'MEURTHE-ET-MOSELLE', 'Meurthe-et-Moselle', 1),
(324, '55', 44, '55029', 3, 'MEUSE', 'Meuse', 1),
(325, '56', 53, '56260', 2, 'MORBIHAN', 'Morbihan', 1),
(326, '57', 44, '57463', 3, 'MOSELLE', 'Moselle', 1),
(327, '58', 27, '58194', 3, 'NIEVRE', 'Nièvre', 1),
(328, '59', 32, '59350', 2, 'NORD', 'Nord', 1),
(329, '60', 32, '60057', 5, 'OISE', 'Oise', 1),
(330, '61', 28, '61001', 5, 'ORNE', 'Orne', 1),
(331, '62', 32, '62041', 2, 'PAS-DE-CALAIS', 'Pas-de-Calais', 1),
(332, '63', 84, '63113', 2, 'PUY-DE-DOME', 'Puy-de-Dôme', 1),
(333, '64', 75, '64445', 4, 'PYRENEES-ATLANTIQUES', 'Pyrénées-Atlantiques', 1),
(334, '65', 76, '65440', 4, 'HAUTES-PYRENEES', 'Hautes-Pyrénées', 1),
(335, '66', 76, '66136', 4, 'PYRENEES-ORIENTALES', 'Pyrénées-Orientales', 1),
(336, '67', 44, '67482', 2, 'BAS-RHIN', 'Bas-Rhin', 1),
(337, '68', 44, '68066', 2, 'HAUT-RHIN', 'Haut-Rhin', 1),
(338, '69', 84, '69123', 2, 'RHONE', 'Rhône', 1),
(339, '70', 27, '70550', 3, 'HAUTE-SAONE', 'Haute-Saône', 1),
(340, '71', 27, '71270', 0, 'SAONE-ET-LOIRE', 'Saône-et-Loire', 1),
(341, '72', 52, '72181', 3, 'SARTHE', 'Sarthe', 1),
(342, '73', 84, '73065', 3, 'SAVOIE', 'Savoie', 1),
(343, '74', 84, '74010', 3, 'HAUTE-SAVOIE', 'Haute-Savoie', 1),
(344, '75', 11, '75056', 0, 'PARIS', 'Paris', 1),
(345, '76', 28, '76540', 3, 'SEINE-MARITIME', 'Seine-Maritime', 1),
(346, '77', 11, '77288', 0, 'SEINE-ET-MARNE', 'Seine-et-Marne', 1),
(347, '78', 11, '78646', 4, 'YVELINES', 'Yvelines', 1),
(348, '79', 75, '79191', 4, 'DEUX-SEVRES', 'Deux-Sèvres', 1),
(349, '80', 32, '80021', 3, 'SOMME', 'Somme', 1),
(350, '81', 76, '81004', 2, 'TARN', 'Tarn', 1),
(351, '82', 76, '82121', 0, 'TARN-ET-GARONNE', 'Tarn-et-Garonne', 1),
(352, '83', 93, '83137', 2, 'VAR', 'Var', 1),
(353, '84', 93, '84007', 0, 'VAUCLUSE', 'Vaucluse', 1),
(354, '85', 52, '85191', 3, 'VENDEE', 'Vendée', 1),
(355, '86', 75, '86194', 3, 'VIENNE', 'Vienne', 1),
(356, '87', 75, '87085', 3, 'HAUTE-VIENNE', 'Haute-Vienne', 1),
(357, '88', 44, '88160', 4, 'VOSGES', 'Vosges', 1),
(358, '89', 27, '89024', 5, 'YONNE', 'Yonne', 1),
(359, '90', 27, '90010', 0, 'TERRITOIRE DE BELFORT', 'Territoire de Belfort', 1),
(360, '91', 11, '91228', 5, 'ESSONNE', 'Essonne', 1),
(361, '92', 11, '92050', 4, 'HAUTS-DE-SEINE', 'Hauts-de-Seine', 1),
(362, '93', 11, '93008', 3, 'SEINE-SAINT-DENIS', 'Seine-Saint-Denis', 1),
(363, '94', 11, '94028', 2, 'VAL-DE-MARNE', 'Val-de-Marne', 1),
(364, '95', 11, '95500', 2, 'VAL-D OISE', 'Val-d Oise', 1),
(365, 'BW', 501, NULL, NULL, 'BADEN-WÜRTTEMBERG', 'Baden-Württemberg', 1),
(366, 'BY', 501, NULL, NULL, 'BAYERN', 'Bayern', 1),
(367, 'BE', 501, NULL, NULL, 'BERLIN', 'Berlin', 1),
(368, 'BB', 501, NULL, NULL, 'BRANDENBURG', 'Brandenburg', 1),
(369, 'HB', 501, NULL, NULL, 'BREMEN', 'Bremen', 1),
(370, 'HH', 501, NULL, NULL, 'HAMBURG', 'Hamburg', 1),
(371, 'HE', 501, NULL, NULL, 'HESSEN', 'Hessen', 1),
(372, 'MV', 501, NULL, NULL, 'MECKLENBURG-VORPOMMERN', 'Mecklenburg-Vorpommern', 1),
(373, 'NI', 501, NULL, NULL, 'NIEDERSACHSEN', 'Niedersachsen', 1),
(374, 'NW', 501, NULL, NULL, 'NORDRHEIN-WESTFALEN', 'Nordrhein-Westfalen', 1),
(375, 'RP', 501, NULL, NULL, 'RHEINLAND-PFALZ', 'Rheinland-Pfalz', 1),
(376, 'SL', 501, NULL, NULL, 'SAARLAND', 'Saarland', 1),
(377, 'SN', 501, NULL, NULL, 'SACHSEN', 'Sachsen', 1),
(378, 'ST', 501, NULL, NULL, 'SACHSEN-ANHALT', 'Sachsen-Anhalt', 1),
(379, 'SH', 501, NULL, NULL, 'SCHLESWIG-HOLSTEIN', 'Schleswig-Holstein', 1),
(380, 'TH', 501, NULL, NULL, 'THÜRINGEN', 'Thüringen', 1),
(381, 'AT', 11401, '', 0, 'AT', 'Atlántida', 1),
(382, 'CH', 11401, '', 0, 'CH', 'Choluteca', 1),
(383, 'CL', 11401, '', 0, 'CL', 'Colón', 1),
(384, 'CM', 11401, '', 0, 'CM', 'Comayagua', 1),
(385, 'CO', 11401, '', 0, 'CO', 'Copán', 1),
(386, 'CR', 11401, '', 0, 'CR', 'Cortés', 1),
(387, 'EP', 11401, '', 0, 'EP', 'El Paraíso', 1),
(388, 'FM', 11401, '', 0, 'FM', 'Francisco Morazán', 1),
(389, 'GD', 11401, '', 0, 'GD', 'Gracias a Dios', 1),
(390, 'IN', 11401, '', 0, 'IN', 'Intibucá', 1),
(391, 'IB', 11401, '', 0, 'IB', 'Islas de la Bahía', 1),
(392, 'LP', 11401, '', 0, 'LP', 'La Paz', 1),
(393, 'LM', 11401, '', 0, 'LM', 'Lempira', 1),
(394, 'OC', 11401, '', 0, 'OC', 'Ocotepeque', 1),
(395, 'OL', 11401, '', 0, 'OL', 'Olancho', 1),
(396, 'SB', 11401, '', 0, 'SB', 'Santa Bárbara', 1),
(397, 'VL', 11401, '', 0, 'VL', 'Valle', 1),
(398, 'YO', 11401, '', 0, 'YO', 'Yoro', 1),
(399, 'DC', 11401, '', 0, 'DC', 'Distrito Central', 1),
(400, 'HU-BU', 180100, 'HU101', NULL, NULL, 'Budapest', 1),
(401, 'HU-PE', 180100, 'HU102', NULL, NULL, 'Pest', 1),
(402, 'HU-FE', 182100, 'HU211', NULL, NULL, 'Fejér', 1),
(403, 'HU-KE', 182100, 'HU212', NULL, NULL, 'Komárom-Esztergom', 1),
(404, 'HU-VE', 182100, 'HU213', NULL, NULL, 'Veszprém', 1),
(405, 'HU-GS', 182200, 'HU221', NULL, NULL, 'Győr-Moson-Sopron', 1),
(406, 'HU-VA', 182200, 'HU222', NULL, NULL, 'Vas', 1),
(407, 'HU-ZA', 182200, 'HU223', NULL, NULL, 'Zala', 1),
(408, 'HU-BA', 182300, 'HU231', NULL, NULL, 'Baranya', 1),
(409, 'HU-SO', 182300, 'HU232', NULL, NULL, 'Somogy', 1),
(410, 'HU-TO', 182300, 'HU233', NULL, NULL, 'Tolna', 1),
(411, 'HU-BZ', 183100, 'HU311', NULL, NULL, 'Borsod-Abaúj-Zemplén', 1),
(412, 'HU-HE', 183100, 'HU312', NULL, NULL, 'Heves', 1),
(413, 'HU-NO', 183100, 'HU313', NULL, NULL, 'Nógrád', 1),
(414, 'HU-HB', 183200, 'HU321', NULL, NULL, 'Hajdú-Bihar', 1),
(415, 'HU-JN', 183200, 'HU322', NULL, NULL, 'Jász-Nagykun-Szolnok', 1),
(416, 'HU-SZ', 183200, 'HU323', NULL, NULL, 'Szabolcs-Szatmár-Bereg', 1),
(417, 'HU-BK', 183300, 'HU331', NULL, NULL, 'Bács-Kiskun', 1),
(418, 'HU-BE', 183300, 'HU332', NULL, NULL, 'Békés', 1),
(419, 'HU-CS', 183300, 'HU333', NULL, NULL, 'Csongrád', 1),
(420, 'AG', 315, NULL, NULL, NULL, 'AGRIGENTO', 1),
(421, 'AL', 312, NULL, NULL, NULL, 'ALESSANDRIA', 1),
(422, 'AN', 310, NULL, NULL, NULL, 'ANCONA', 1),
(423, 'AO', 319, NULL, NULL, NULL, 'AOSTA', 1),
(424, 'AR', 316, NULL, NULL, NULL, 'AREZZO', 1),
(425, 'AP', 310, NULL, NULL, NULL, 'ASCOLI PICENO', 1),
(426, 'AT', 312, NULL, NULL, NULL, 'ASTI', 1),
(427, 'AV', 304, NULL, NULL, NULL, 'AVELLINO', 1),
(428, 'BA', 313, NULL, NULL, NULL, 'BARI', 1),
(429, 'BT', 313, NULL, NULL, NULL, 'BARLETTA-ANDRIA-TRANI', 1),
(430, 'BL', 320, NULL, NULL, NULL, 'BELLUNO', 1),
(431, 'BN', 304, NULL, NULL, NULL, 'BENEVENTO', 1),
(432, 'BG', 309, NULL, NULL, NULL, 'BERGAMO', 1),
(433, 'BI', 312, NULL, NULL, NULL, 'BIELLA', 1),
(434, 'BO', 305, NULL, NULL, NULL, 'BOLOGNA', 1),
(435, 'BZ', 317, NULL, NULL, NULL, 'BOLZANO', 1),
(436, 'BS', 309, NULL, NULL, NULL, 'BRESCIA', 1),
(437, 'BR', 313, NULL, NULL, NULL, 'BRINDISI', 1),
(438, 'CA', 314, NULL, NULL, NULL, 'CAGLIARI', 1),
(439, 'CL', 315, NULL, NULL, NULL, 'CALTANISSETTA', 1),
(440, 'CB', 311, NULL, NULL, NULL, 'CAMPOBASSO', 1),
(441, 'CI', 314, NULL, NULL, NULL, 'CARBONIA-IGLESIAS', 1),
(442, 'CE', 304, NULL, NULL, NULL, 'CASERTA', 1),
(443, 'CT', 315, NULL, NULL, NULL, 'CATANIA', 1),
(444, 'CZ', 303, NULL, NULL, NULL, 'CATANZARO', 1),
(445, 'CH', 301, NULL, NULL, NULL, 'CHIETI', 1),
(446, 'CO', 309, NULL, NULL, NULL, 'COMO', 1),
(447, 'CS', 303, NULL, NULL, NULL, 'COSENZA', 1),
(448, 'CR', 309, NULL, NULL, NULL, 'CREMONA', 1),
(449, 'KR', 303, NULL, NULL, NULL, 'CROTONE', 1),
(450, 'CN', 312, NULL, NULL, NULL, 'CUNEO', 1),
(451, 'EN', 315, NULL, NULL, NULL, 'ENNA', 1),
(452, 'FM', 310, NULL, NULL, NULL, 'FERMO', 1),
(453, 'FE', 305, NULL, NULL, NULL, 'FERRARA', 1),
(454, 'FI', 316, NULL, NULL, NULL, 'FIRENZE', 1),
(455, 'FG', 313, NULL, NULL, NULL, 'FOGGIA', 1),
(456, 'FC', 305, NULL, NULL, NULL, 'FORLI-CESENA', 1),
(457, 'FR', 307, NULL, NULL, NULL, 'FROSINONE', 1),
(458, 'GE', 308, NULL, NULL, NULL, 'GENOVA', 1),
(459, 'GO', 306, NULL, NULL, NULL, 'GORIZIA', 1),
(460, 'GR', 316, NULL, NULL, NULL, 'GROSSETO', 1),
(461, 'IM', 308, NULL, NULL, NULL, 'IMPERIA', 1),
(462, 'IS', 311, NULL, NULL, NULL, 'ISERNIA', 1),
(463, 'SP', 308, NULL, NULL, NULL, 'LA SPEZIA', 1),
(464, 'AQ', 301, NULL, NULL, NULL, 'L AQUILA', 1),
(465, 'LT', 307, NULL, NULL, NULL, 'LATINA', 1),
(466, 'LE', 313, NULL, NULL, NULL, 'LECCE', 1),
(467, 'LC', 309, NULL, NULL, NULL, 'LECCO', 1),
(468, 'LI', 314, NULL, NULL, NULL, 'LIVORNO', 1),
(469, 'LO', 309, NULL, NULL, NULL, 'LODI', 1),
(470, 'LU', 316, NULL, NULL, NULL, 'LUCCA', 1),
(471, 'MC', 310, NULL, NULL, NULL, 'MACERATA', 1),
(472, 'MN', 309, NULL, NULL, NULL, 'MANTOVA', 1),
(473, 'MS', 316, NULL, NULL, NULL, 'MASSA-CARRARA', 1),
(474, 'MT', 302, NULL, NULL, NULL, 'MATERA', 1),
(475, 'VS', 314, NULL, NULL, NULL, 'MEDIO CAMPIDANO', 1),
(476, 'ME', 315, NULL, NULL, NULL, 'MESSINA', 1),
(477, 'MI', 309, NULL, NULL, NULL, 'MILANO', 1),
(478, 'MB', 309, NULL, NULL, NULL, 'MONZA e BRIANZA', 1),
(479, 'MO', 305, NULL, NULL, NULL, 'MODENA', 1),
(480, 'NA', 304, NULL, NULL, NULL, 'NAPOLI', 1),
(481, 'NO', 312, NULL, NULL, NULL, 'NOVARA', 1),
(482, 'NU', 314, NULL, NULL, NULL, 'NUORO', 1),
(483, 'OG', 314, NULL, NULL, NULL, 'OGLIASTRA', 1),
(484, 'OT', 314, NULL, NULL, NULL, 'OLBIA-TEMPIO', 1),
(485, 'OR', 314, NULL, NULL, NULL, 'ORISTANO', 1),
(486, 'PD', 320, NULL, NULL, NULL, 'PADOVA', 1),
(487, 'PA', 315, NULL, NULL, NULL, 'PALERMO', 1),
(488, 'PR', 305, NULL, NULL, NULL, 'PARMA', 1),
(489, 'PV', 309, NULL, NULL, NULL, 'PAVIA', 1),
(490, 'PG', 318, NULL, NULL, NULL, 'PERUGIA', 1),
(491, 'PU', 310, NULL, NULL, NULL, 'PESARO e URBINO', 1),
(492, 'PE', 301, NULL, NULL, NULL, 'PESCARA', 1),
(493, 'PC', 305, NULL, NULL, NULL, 'PIACENZA', 1),
(494, 'PI', 316, NULL, NULL, NULL, 'PISA', 1),
(495, 'PT', 316, NULL, NULL, NULL, 'PISTOIA', 1),
(496, 'PN', 306, NULL, NULL, NULL, 'PORDENONE', 1),
(497, 'PZ', 302, NULL, NULL, NULL, 'POTENZA', 1),
(498, 'PO', 316, NULL, NULL, NULL, 'PRATO', 1),
(499, 'RG', 315, NULL, NULL, NULL, 'RAGUSA', 1),
(500, 'RA', 305, NULL, NULL, NULL, 'RAVENNA', 1),
(501, 'RC', 303, NULL, NULL, NULL, 'REGGIO CALABRIA', 1),
(502, 'RE', 305, NULL, NULL, NULL, 'REGGIO NELL EMILIA', 1),
(503, 'RI', 307, NULL, NULL, NULL, 'RIETI', 1),
(504, 'RN', 305, NULL, NULL, NULL, 'RIMINI', 1),
(505, 'RM', 307, NULL, NULL, NULL, 'ROMA', 1),
(506, 'RO', 320, NULL, NULL, NULL, 'ROVIGO', 1),
(507, 'SA', 304, NULL, NULL, NULL, 'SALERNO', 1),
(508, 'SS', 314, NULL, NULL, NULL, 'SASSARI', 1),
(509, 'SV', 308, NULL, NULL, NULL, 'SAVONA', 1),
(510, 'SI', 316, NULL, NULL, NULL, 'SIENA', 1),
(511, 'SR', 315, NULL, NULL, NULL, 'SIRACUSA', 1),
(512, 'SO', 309, NULL, NULL, NULL, 'SONDRIO', 1),
(513, 'TA', 313, NULL, NULL, NULL, 'TARANTO', 1),
(514, 'TE', 301, NULL, NULL, NULL, 'TERAMO', 1),
(515, 'TR', 318, NULL, NULL, NULL, 'TERNI', 1),
(516, 'TO', 312, NULL, NULL, NULL, 'TORINO', 1),
(517, 'TP', 315, NULL, NULL, NULL, 'TRAPANI', 1),
(518, 'TN', 317, NULL, NULL, NULL, 'TRENTO', 1),
(519, 'TV', 320, NULL, NULL, NULL, 'TREVISO', 1),
(520, 'TS', 306, NULL, NULL, NULL, 'TRIESTE', 1),
(521, 'UD', 306, NULL, NULL, NULL, 'UDINE', 1),
(522, 'VA', 309, NULL, NULL, NULL, 'VARESE', 1),
(523, 'VE', 320, NULL, NULL, NULL, 'VENEZIA', 1),
(524, 'VB', 312, NULL, NULL, NULL, 'VERBANO-CUSIO-OSSOLA', 1),
(525, 'VC', 312, NULL, NULL, NULL, 'VERCELLI', 1),
(526, 'VR', 320, NULL, NULL, NULL, 'VERONA', 1),
(527, 'VV', 303, NULL, NULL, NULL, 'VIBO VALENTIA', 1),
(528, 'VI', 320, NULL, NULL, NULL, 'VICENZA', 1),
(529, 'VT', 307, NULL, NULL, NULL, 'VITERBO', 1),
(530, 'LU0001', 14001, '', 0, '', 'Clervaux', 1),
(531, 'LU0002', 14001, '', 0, '', 'Diekirch', 1),
(532, 'LU0003', 14001, '', 0, '', 'Redange', 1),
(533, 'LU0004', 14001, '', 0, '', 'Vianden', 1),
(534, 'LU0005', 14001, '', 0, '', 'Wiltz', 1),
(535, 'LU0006', 14002, '', 0, '', 'Echternach', 1),
(536, 'LU0007', 14002, '', 0, '', 'Grevenmacher', 1),
(537, 'LU0008', 14002, '', 0, '', 'Remich', 1),
(538, 'LU0009', 14003, '', 0, '', 'Capellen', 1),
(539, 'LU0010', 14003, '', 0, '', 'Esch-sur-Alzette', 1),
(540, 'LU0011', 14003, '', 0, '', 'Luxembourg', 1),
(541, 'LU0012', 14003, '', 0, '', 'Mersch', 1),
(542, 'MA', 1209, '', 0, '', 'Province de Benslimane', 1),
(543, 'MA1', 1209, '', 0, '', 'Province de Berrechid', 1),
(544, 'MA2', 1209, '', 0, '', 'Province de Khouribga', 1),
(545, 'MA3', 1209, '', 0, '', 'Province de Settat', 1),
(546, 'MA4', 1210, '', 0, '', 'Province d\'El Jadida', 1),
(547, 'MA5', 1210, '', 0, '', 'Province de Safi', 1),
(548, 'MA6', 1210, '', 0, '', 'Province de Sidi Bennour', 1),
(549, 'MA7', 1210, '', 0, '', 'Province de Youssoufia', 1),
(550, 'MA6B', 1205, '', 0, '', 'Préfecture de Fès', 1),
(551, 'MA7B', 1205, '', 0, '', 'Province de Boulemane', 1),
(552, 'MA8', 1205, '', 0, '', 'Province de Moulay Yacoub', 1),
(553, 'MA9', 1205, '', 0, '', 'Province de Sefrou', 1),
(554, 'MA8A', 1202, '', 0, '', 'Province de Kénitra', 1),
(555, 'MA9A', 1202, '', 0, '', 'Province de Sidi Kacem', 1),
(556, 'MA10', 1202, '', 0, '', 'Province de Sidi Slimane', 1),
(557, 'MA11', 1208, '', 0, '', 'Préfecture de Casablanca', 1),
(558, 'MA12', 1208, '', 0, '', 'Préfecture de Mohammédia', 1),
(559, 'MA13', 1208, '', 0, '', 'Province de Médiouna', 1),
(560, 'MA14', 1208, '', 0, '', 'Province de Nouaceur', 1),
(561, 'MA15', 1214, '', 0, '', 'Province d\'Assa-Zag', 1),
(562, 'MA16', 1214, '', 0, '', 'Province d\'Es-Semara', 1),
(563, 'MA17A', 1214, '', 0, '', 'Province de Guelmim', 1),
(564, 'MA18', 1214, '', 0, '', 'Province de Tata', 1),
(565, 'MA19', 1214, '', 0, '', 'Province de Tan-Tan', 1),
(566, 'MA15', 1215, '', 0, '', 'Province de Boujdour', 1),
(567, 'MA16', 1215, '', 0, '', 'Province de Lâayoune', 1),
(568, 'MA17', 1215, '', 0, '', 'Province de Tarfaya', 1),
(569, 'MA18', 1211, '', 0, '', 'Préfecture de Marrakech', 1),
(570, 'MA19', 1211, '', 0, '', 'Province d\'Al Haouz', 1),
(571, 'MA20', 1211, '', 0, '', 'Province de Chichaoua', 1),
(572, 'MA21', 1211, '', 0, '', 'Province d\'El Kelâa des Sraghna', 1),
(573, 'MA22', 1211, '', 0, '', 'Province d\'Essaouira', 1),
(574, 'MA23', 1211, '', 0, '', 'Province de Rehamna', 1),
(575, 'MA24', 1206, '', 0, '', 'Préfecture de Meknès', 1),
(576, 'MA25', 1206, '', 0, '', 'Province d’El Hajeb', 1),
(577, 'MA26', 1206, '', 0, '', 'Province d\'Errachidia', 1),
(578, 'MA27', 1206, '', 0, '', 'Province d’Ifrane', 1),
(579, 'MA28', 1206, '', 0, '', 'Province de Khénifra', 1),
(580, 'MA29', 1206, '', 0, '', 'Province de Midelt', 1),
(581, 'MA30', 1204, '', 0, '', 'Préfecture d\'Oujda-Angad', 1),
(582, 'MA31', 1204, '', 0, '', 'Province de Berkane', 1),
(583, 'MA32', 1204, '', 0, '', 'Province de Driouch', 1),
(584, 'MA33', 1204, '', 0, '', 'Province de Figuig', 1),
(585, 'MA34', 1204, '', 0, '', 'Province de Jerada', 1),
(586, 'MA35', 1204, '', 0, '', 'Province de Nador', 1),
(587, 'MA36', 1204, '', 0, '', 'Province de Taourirt', 1),
(588, 'MA37', 1216, '', 0, '', 'Province d\'Aousserd', 1),
(589, 'MA38', 1216, '', 0, '', 'Province d\'Oued Ed-Dahab', 1),
(590, 'MA39', 1207, '', 0, '', 'Préfecture de Rabat', 1),
(591, 'MA40', 1207, '', 0, '', 'Préfecture de Skhirat-Témara', 1),
(592, 'MA41', 1207, '', 0, '', 'Préfecture de Salé', 1),
(593, 'MA42', 1207, '', 0, '', 'Province de Khémisset', 1),
(594, 'MA43', 1213, '', 0, '', 'Préfecture d\'Agadir Ida-Outanane', 1),
(595, 'MA44', 1213, '', 0, '', 'Préfecture d\'Inezgane-Aït Melloul', 1),
(596, 'MA45', 1213, '', 0, '', 'Province de Chtouka-Aït Baha', 1),
(597, 'MA46', 1213, '', 0, '', 'Province d\'Ouarzazate', 1),
(598, 'MA47', 1213, '', 0, '', 'Province de Sidi Ifni', 1),
(599, 'MA48', 1213, '', 0, '', 'Province de Taroudant', 1),
(600, 'MA49', 1213, '', 0, '', 'Province de Tinghir', 1),
(601, 'MA50', 1213, '', 0, '', 'Province de Tiznit', 1),
(602, 'MA51', 1213, '', 0, '', 'Province de Zagora', 1),
(603, 'MA52', 1212, '', 0, '', 'Province d\'Azilal', 1),
(604, 'MA53', 1212, '', 0, '', 'Province de Beni Mellal', 1),
(605, 'MA54', 1212, '', 0, '', 'Province de Fquih Ben Salah', 1),
(606, 'MA55', 1201, '', 0, '', 'Préfecture de M\'diq-Fnideq', 1),
(607, 'MA56', 1201, '', 0, '', 'Préfecture de Tanger-Asilah', 1),
(608, 'MA57', 1201, '', 0, '', 'Province de Chefchaouen', 1),
(609, 'MA58', 1201, '', 0, '', 'Province de Fahs-Anjra', 1),
(610, 'MA59', 1201, '', 0, '', 'Province de Larache', 1),
(611, 'MA60', 1201, '', 0, '', 'Province d\'Ouezzane', 1),
(612, 'MA61', 1201, '', 0, '', 'Province de Tétouan', 1),
(613, 'MA62', 1203, '', 0, '', 'Province de Guercif', 1),
(614, 'MA63', 1203, '', 0, '', 'Province d\'Al Hoceïma', 1),
(615, 'MA64', 1203, '', 0, '', 'Province de Taounate', 1),
(616, 'MA65', 1203, '', 0, '', 'Province de Taza', 1),
(617, 'MA6A', 1205, '', 0, '', 'Préfecture de Fès', 1),
(618, 'MA7A', 1205, '', 0, '', 'Province de Boulemane', 1),
(619, 'MA15A', 1214, '', 0, '', 'Province d\'Assa-Zag', 1),
(620, 'MA16A', 1214, '', 0, '', 'Province d\'Es-Semara', 1),
(621, 'MA18A', 1211, '', 0, '', 'Préfecture de Marrakech', 1),
(622, 'MA19A', 1214, '', 0, '', 'Province de Tan-Tan', 1),
(623, 'MA19B', 1214, '', 0, '', 'Province de Tan-Tan', 1),
(624, 'GR', 1701, NULL, NULL, NULL, 'Groningen', 1),
(625, 'FR', 1701, NULL, NULL, NULL, 'Friesland', 1),
(626, 'DR', 1701, NULL, NULL, NULL, 'Drenthe', 1),
(627, 'OV', 1701, NULL, NULL, NULL, 'Overijssel', 1),
(628, 'GD', 1701, NULL, NULL, NULL, 'Gelderland', 1),
(629, 'FL', 1701, NULL, NULL, NULL, 'Flevoland', 1),
(630, 'UT', 1701, NULL, NULL, NULL, 'Utrecht', 1),
(631, 'NH', 1701, NULL, NULL, NULL, 'Noord-Holland', 1),
(632, 'ZH', 1701, NULL, NULL, NULL, 'Zuid-Holland', 1),
(633, 'ZL', 1701, NULL, NULL, NULL, 'Zeeland', 1),
(634, 'NB', 1701, NULL, NULL, NULL, 'Noord-Brabant', 1),
(635, 'LB', 1701, NULL, NULL, NULL, 'Limburg', 1),
(636, 'PA-1', 17801, '', 0, '', 'Bocas del Toro', 1),
(637, 'PA-2', 17801, '', 0, '', 'Coclé', 1),
(638, 'PA-3', 17801, '', 0, '', 'Colón', 1),
(639, 'PA-4', 17801, '', 0, '', 'Chiriquí', 1),
(640, 'PA-5', 17801, '', 0, '', 'Darién', 1),
(641, 'PA-6', 17801, '', 0, '', 'Herrera', 1),
(642, 'PA-7', 17801, '', 0, '', 'Los Santos', 1),
(643, 'PA-8', 17801, '', 0, '', 'Panamá', 1),
(644, 'PA-9', 17801, '', 0, '', 'Veraguas', 1),
(645, 'PA-13', 17801, '', 0, '', 'Panamá Oeste', 1),
(646, '0101', 18101, '', 0, '', 'Chachapoyas', 1),
(647, '0102', 18101, '', 0, '', 'Bagua', 1),
(648, '0103', 18101, '', 0, '', 'Bongará', 1),
(649, '0104', 18101, '', 0, '', 'Condorcanqui', 1),
(650, '0105', 18101, '', 0, '', 'Luya', 1),
(651, '0106', 18101, '', 0, '', 'Rodríguez de Mendoza', 1),
(652, '0107', 18101, '', 0, '', 'Utcubamba', 1),
(653, '0201', 18102, '', 0, '', 'Huaraz', 1),
(654, '0202', 18102, '', 0, '', 'Aija', 1),
(655, '0203', 18102, '', 0, '', 'Antonio Raymondi', 1),
(656, '0204', 18102, '', 0, '', 'Asunción', 1),
(657, '0205', 18102, '', 0, '', 'Bolognesi', 1),
(658, '0206', 18102, '', 0, '', 'Carhuaz', 1),
(659, '0207', 18102, '', 0, '', 'Carlos Fermín Fitzcarrald', 1),
(660, '0208', 18102, '', 0, '', 'Casma', 1),
(661, '0209', 18102, '', 0, '', 'Corongo', 1),
(662, '0210', 18102, '', 0, '', 'Huari', 1),
(663, '0211', 18102, '', 0, '', 'Huarmey', 1),
(664, '0212', 18102, '', 0, '', 'Huaylas', 1),
(665, '0213', 18102, '', 0, '', 'Mariscal Luzuriaga', 1),
(666, '0214', 18102, '', 0, '', 'Ocros', 1),
(667, '0215', 18102, '', 0, '', 'Pallasca', 1),
(668, '0216', 18102, '', 0, '', 'Pomabamba', 1),
(669, '0217', 18102, '', 0, '', 'Recuay', 1),
(670, '0218', 18102, '', 0, '', 'Papá', 1),
(671, '0219', 18102, '', 0, '', 'Sihuas', 1),
(672, '0220', 18102, '', 0, '', 'Yungay', 1),
(673, '0301', 18103, '', 0, '', 'Abancay', 1),
(674, '0302', 18103, '', 0, '', 'Andahuaylas', 1),
(675, '0303', 18103, '', 0, '', 'Antabamba', 1),
(676, '0304', 18103, '', 0, '', 'Aymaraes', 1),
(677, '0305', 18103, '', 0, '', 'Cotabambas', 1),
(678, '0306', 18103, '', 0, '', 'Chincheros', 1),
(679, '0307', 18103, '', 0, '', 'Grau', 1),
(680, '0401', 18104, '', 0, '', 'Arequipa', 1),
(681, '0402', 18104, '', 0, '', 'Camaná', 1),
(682, '0403', 18104, '', 0, '', 'Caravelí', 1),
(683, '0404', 18104, '', 0, '', 'Castilla', 1),
(684, '0405', 18104, '', 0, '', 'Caylloma', 1),
(685, '0406', 18104, '', 0, '', 'Condesuyos', 1),
(686, '0407', 18104, '', 0, '', 'Islay', 1),
(687, '0408', 18104, '', 0, '', 'La Unión', 1),
(688, '0501', 18105, '', 0, '', 'Huamanga', 1),
(689, '0502', 18105, '', 0, '', 'Cangallo', 1),
(690, '0503', 18105, '', 0, '', 'Huanca Sancos', 1),
(691, '0504', 18105, '', 0, '', 'Huanta', 1),
(692, '0505', 18105, '', 0, '', 'La Mar', 1),
(693, '0506', 18105, '', 0, '', 'Lucanas', 1),
(694, '0507', 18105, '', 0, '', 'Parinacochas', 1),
(695, '0508', 18105, '', 0, '', 'Páucar del Sara Sara', 1),
(696, '0509', 18105, '', 0, '', 'Sucre', 1),
(697, '0510', 18105, '', 0, '', 'Víctor Fajardo', 1),
(698, '0511', 18105, '', 0, '', 'Vilcas Huamán', 1),
(699, '0601', 18106, '', 0, '', 'Cajamarca', 1),
(700, '0602', 18106, '', 0, '', 'Cajabamba', 1),
(701, '0603', 18106, '', 0, '', 'Celendín', 1),
(702, '0604', 18106, '', 0, '', 'Chota', 1),
(703, '0605', 18106, '', 0, '', 'Contumazá', 1),
(704, '0606', 18106, '', 0, '', 'Cutervo', 1),
(705, '0607', 18106, '', 0, '', 'Hualgayoc', 1),
(706, '0608', 18106, '', 0, '', 'Jaén', 1),
(707, '0609', 18106, '', 0, '', 'San Ignacio', 1),
(708, '0610', 18106, '', 0, '', 'San Marcos', 1),
(709, '0611', 18106, '', 0, '', 'San Miguel', 1),
(710, '0612', 18106, '', 0, '', 'San Pablo', 1),
(711, '0613', 18106, '', 0, '', 'Santa Cruz', 1),
(712, '0701', 18107, '', 0, '', 'Callao', 1),
(713, '0801', 18108, '', 0, '', 'Cusco', 1),
(714, '0802', 18108, '', 0, '', 'Acomayo', 1),
(715, '0803', 18108, '', 0, '', 'Anta', 1),
(716, '0804', 18108, '', 0, '', 'Calca', 1),
(717, '0805', 18108, '', 0, '', 'Canas', 1),
(718, '0806', 18108, '', 0, '', 'Canchis', 1),
(719, '0807', 18108, '', 0, '', 'Chumbivilcas', 1),
(720, '0808', 18108, '', 0, '', 'Espinar', 1),
(721, '0809', 18108, '', 0, '', 'La Convención', 1),
(722, '0810', 18108, '', 0, '', 'Paruro', 1),
(723, '0811', 18108, '', 0, '', 'Paucartambo', 1),
(724, '0812', 18108, '', 0, '', 'Quispicanchi', 1),
(725, '0813', 18108, '', 0, '', 'Urubamba', 1),
(726, '0901', 18109, '', 0, '', 'Huancavelica', 1),
(727, '0902', 18109, '', 0, '', 'Acobamba', 1),
(728, '0903', 18109, '', 0, '', 'Angaraes', 1),
(729, '0904', 18109, '', 0, '', 'Castrovirreyna', 1),
(730, '0905', 18109, '', 0, '', 'Churcampa', 1),
(731, '0906', 18109, '', 0, '', 'Huaytará', 1),
(732, '0907', 18109, '', 0, '', 'Tayacaja', 1),
(733, '1001', 18110, '', 0, '', 'Huánuco', 1),
(734, '1002', 18110, '', 0, '', 'Ambón', 1),
(735, '1003', 18110, '', 0, '', 'Dos de Mayo', 1),
(736, '1004', 18110, '', 0, '', 'Huacaybamba', 1),
(737, '1005', 18110, '', 0, '', 'Huamalíes', 1),
(738, '1006', 18110, '', 0, '', 'Leoncio Prado', 1),
(739, '1007', 18110, '', 0, '', 'Marañón', 1),
(740, '1008', 18110, '', 0, '', 'Pachitea', 1),
(741, '1009', 18110, '', 0, '', 'Puerto Inca', 1),
(742, '1010', 18110, '', 0, '', 'Lauricocha', 1),
(743, '1011', 18110, '', 0, '', 'Yarowilca', 1),
(744, '1101', 18111, '', 0, '', 'Ica', 1),
(745, '1102', 18111, '', 0, '', 'Chincha', 1),
(746, '1103', 18111, '', 0, '', 'Nazca', 1),
(747, '1104', 18111, '', 0, '', 'Palpa', 1),
(748, '1105', 18111, '', 0, '', 'Pisco', 1),
(749, '1201', 18112, '', 0, '', 'Huancayo', 1),
(750, '1202', 18112, '', 0, '', 'Concepción', 1),
(751, '1203', 18112, '', 0, '', 'Chanchamayo', 1),
(752, '1204', 18112, '', 0, '', 'Jauja', 1),
(753, '1205', 18112, '', 0, '', 'Junín', 1),
(754, '1206', 18112, '', 0, '', 'Satipo', 1),
(755, '1207', 18112, '', 0, '', 'Tarma', 1),
(756, '1208', 18112, '', 0, '', 'Yauli', 1),
(757, '1209', 18112, '', 0, '', 'Chupaca', 1),
(758, '1301', 18113, '', 0, '', 'Trujillo', 1),
(759, '1302', 18113, '', 0, '', 'Ascope', 1),
(760, '1303', 18113, '', 0, '', 'Bolívar', 1),
(761, '1304', 18113, '', 0, '', 'Chepén', 1),
(762, '1305', 18113, '', 0, '', 'Julcán', 1),
(763, '1306', 18113, '', 0, '', 'Otuzco', 1),
(764, '1307', 18113, '', 0, '', 'Pacasmayo', 1),
(765, '1308', 18113, '', 0, '', 'Pataz', 1),
(766, '1309', 18113, '', 0, '', 'Sánchez Carrión', 1),
(767, '1310', 18113, '', 0, '', 'Santiago de Chuco', 1),
(768, '1311', 18113, '', 0, '', 'Gran Chimú', 1),
(769, '1312', 18113, '', 0, '', 'Virú', 1),
(770, '1401', 18114, '', 0, '', 'Chiclayo', 1),
(771, '1402', 18114, '', 0, '', 'Ferreñafe', 1),
(772, '1403', 18114, '', 0, '', 'Lambayeque', 1),
(773, '1501', 18115, '', 0, '', 'Lima', 1),
(774, '1502', 18116, '', 0, '', 'Huaura', 1),
(775, '1503', 18116, '', 0, '', 'Barranca', 1),
(776, '1504', 18116, '', 0, '', 'Cajatambo', 1),
(777, '1505', 18116, '', 0, '', 'Canta', 1),
(778, '1506', 18116, '', 0, '', 'Cañete', 1),
(779, '1507', 18116, '', 0, '', 'Huaral', 1),
(780, '1508', 18116, '', 0, '', 'Huarochirí', 1),
(781, '1509', 18116, '', 0, '', 'Oyón', 1),
(782, '1510', 18116, '', 0, '', 'Yauyos', 1),
(783, '1601', 18117, '', 0, '', 'Maynas', 1),
(784, '1602', 18117, '', 0, '', 'Alto Amazonas', 1),
(785, '1603', 18117, '', 0, '', 'Loreto', 1),
(786, '1604', 18117, '', 0, '', 'Mariscal Ramón Castilla', 1),
(787, '1605', 18117, '', 0, '', 'Requena', 1),
(788, '1606', 18117, '', 0, '', 'Ucayali', 1),
(789, '1607', 18117, '', 0, '', 'Datem del Marañón', 1),
(790, '1701', 18118, '', 0, '', 'Tambopata', 1),
(791, '1702', 18118, '', 0, '', 'Manú', 1),
(792, '1703', 18118, '', 0, '', 'Tahuamanu', 1),
(793, '1801', 18119, '', 0, '', 'Mariscal Nieto', 1),
(794, '1802', 18119, '', 0, '', 'General Sánchez Cerro', 1),
(795, '1803', 18119, '', 0, '', 'Ilo', 1),
(796, '1901', 18120, '', 0, '', 'Pasco', 1),
(797, '1902', 18120, '', 0, '', 'Daniel Alcides Carrión', 1),
(798, '1903', 18120, '', 0, '', 'Oxapampa', 1),
(799, '2001', 18121, '', 0, '', 'Piura', 1),
(800, '2002', 18121, '', 0, '', 'Ayabaca', 1),
(801, '2003', 18121, '', 0, '', 'Huancabamba', 1),
(802, '2004', 18121, '', 0, '', 'Morropón', 1),
(803, '2005', 18121, '', 0, '', 'Paita', 1),
(804, '2006', 18121, '', 0, '', 'Sullana', 1),
(805, '2007', 18121, '', 0, '', 'Talara', 1),
(806, '2008', 18121, '', 0, '', 'Sechura', 1),
(807, '2101', 18122, '', 0, '', 'Puno', 1),
(808, '2102', 18122, '', 0, '', 'Azángaro', 1),
(809, '2103', 18122, '', 0, '', 'Carabaya', 1),
(810, '2104', 18122, '', 0, '', 'Chucuito', 1),
(811, '2105', 18122, '', 0, '', 'El Collao', 1),
(812, '2106', 18122, '', 0, '', 'Huancané', 1),
(813, '2107', 18122, '', 0, '', 'Lampa', 1),
(814, '2108', 18122, '', 0, '', 'Melgar', 1),
(815, '2109', 18122, '', 0, '', 'Moho', 1),
(816, '2110', 18122, '', 0, '', 'San Antonio de Putina', 1),
(817, '2111', 18122, '', 0, '', 'San Román', 1),
(818, '2112', 18122, '', 0, '', 'Sandia', 1),
(819, '2113', 18122, '', 0, '', 'Yunguyo', 1),
(820, '2201', 18123, '', 0, '', 'Moyobamba', 1),
(821, '2202', 18123, '', 0, '', 'Bellavista', 1),
(822, '2203', 18123, '', 0, '', 'El Dorado', 1),
(823, '2204', 18123, '', 0, '', 'Huallaga', 1),
(824, '2205', 18123, '', 0, '', 'Lamas', 1),
(825, '2206', 18123, '', 0, '', 'Mariscal Cáceres', 1),
(826, '2207', 18123, '', 0, '', 'Picota', 1),
(827, '2208', 18123, '', 0, '', 'La Rioja', 1),
(828, '2209', 18123, '', 0, '', 'San Martín', 1),
(829, '2210', 18123, '', 0, '', 'Tocache', 1),
(830, '2301', 18124, '', 0, '', 'Tacna', 1),
(831, '2302', 18124, '', 0, '', 'Candarave', 1),
(832, '2303', 18124, '', 0, '', 'Jorge Basadre', 1),
(833, '2304', 18124, '', 0, '', 'Tarata', 1),
(834, '2401', 18125, '', 0, '', 'Tumbes', 1),
(835, '2402', 18125, '', 0, '', 'Contralmirante Villar', 1),
(836, '2403', 18125, '', 0, '', 'Zarumilla', 1),
(837, '2501', 18126, '', 0, '', 'Coronel Portillo', 1),
(838, '2502', 18126, '', 0, '', 'Atalaya', 1),
(839, '2503', 18126, '', 0, '', 'Padre Abad', 1),
(840, '2504', 18126, '', 0, '', 'Purús', 1),
(841, 'PT-AV', 15001, NULL, NULL, 'AVEIRO', 'Aveiro', 1),
(842, 'PT-AC', 15002, NULL, NULL, 'AZORES', 'Azores', 1),
(843, 'PT-BE', 15001, NULL, NULL, 'BEJA', 'Beja', 1),
(844, 'PT-BR', 15001, NULL, NULL, 'BRAGA', 'Braga', 1),
(845, 'PT-BA', 15001, NULL, NULL, 'BRAGANCA', 'Bragança', 1),
(846, 'PT-CB', 15001, NULL, NULL, 'CASTELO BRANCO', 'Castelo Branco', 1),
(847, 'PT-CO', 15001, NULL, NULL, 'COIMBRA', 'Coimbra', 1),
(848, 'PT-EV', 15001, NULL, NULL, 'EVORA', 'Évora', 1),
(849, 'PT-FA', 15001, NULL, NULL, 'FARO', 'Faro', 1),
(850, 'PT-GU', 15001, NULL, NULL, 'GUARDA', 'Guarda', 1),
(851, 'PT-LE', 15001, NULL, NULL, 'LEIRIA', 'Leiria', 1),
(852, 'PT-LI', 15001, NULL, NULL, 'LISBON', 'Lisboa', 1),
(853, 'PT-AML', 15001, NULL, NULL, 'AREA METROPOLITANA LISBOA', 'Área Metropolitana de Lisboa', 1),
(854, 'PT-MA', 15002, NULL, NULL, 'MADEIRA', 'Madeira', 1),
(855, 'PT-PA', 15001, NULL, NULL, 'PORTALEGRE', 'Portalegre', 1),
(856, 'PT-PO', 15001, NULL, NULL, 'PORTO', 'Porto', 1),
(857, 'PT-SA', 15001, NULL, NULL, 'SANTAREM', 'Santarém', 1),
(858, 'PT-SE', 15001, NULL, NULL, 'SETUBAL', 'Setúbal', 1),
(859, 'PT-VC', 15001, NULL, NULL, 'VIANA DO CASTELO', 'Viana Do Castelo', 1),
(860, 'PT-VR', 15001, NULL, NULL, 'VILA REAL', 'Vila Real', 1),
(861, 'PT-VI', 15001, NULL, NULL, 'VISEU', 'Viseu', 1),
(862, 'AB', 18801, '', 0, '', 'Alba', 1),
(863, 'AR', 18801, '', 0, '', 'Arad', 1),
(864, 'AG', 18801, '', 0, '', 'Argeș', 1),
(865, 'BC', 18801, '', 0, '', 'Bacău', 1),
(866, 'BH', 18801, '', 0, '', 'Bihor', 1),
(867, 'BN', 18801, '', 0, '', 'Bistrița-Năsăud', 1),
(868, 'BT', 18801, '', 0, '', 'Botoșani', 1),
(869, 'BV', 18801, '', 0, '', 'Brașov', 1),
(870, 'BR', 18801, '', 0, '', 'Brăila', 1),
(871, 'BU', 18801, '', 0, '', 'Bucuresti', 1),
(872, 'BZ', 18801, '', 0, '', 'Buzău', 1),
(873, 'CL', 18801, '', 0, '', 'Călărași', 1),
(874, 'CS', 18801, '', 0, '', 'Caraș-Severin', 1),
(875, 'CJ', 18801, '', 0, '', 'Cluj', 1),
(876, 'CT', 18801, '', 0, '', 'Constanța', 1),
(877, 'CV', 18801, '', 0, '', 'Covasna', 1),
(878, 'DB', 18801, '', 0, '', 'Dâmbovița', 1),
(879, 'DJ', 18801, '', 0, '', 'Dolj', 1),
(880, 'GL', 18801, '', 0, '', 'Galați', 1),
(881, 'GR', 18801, '', 0, '', 'Giurgiu', 1),
(882, 'GJ', 18801, '', 0, '', 'Gorj', 1),
(883, 'HR', 18801, '', 0, '', 'Harghita', 1),
(884, 'HD', 18801, '', 0, '', 'Hunedoara', 1),
(885, 'IL', 18801, '', 0, '', 'Ialomița', 1),
(886, 'IS', 18801, '', 0, '', 'Iași', 1),
(887, 'IF', 18801, '', 0, '', 'Ilfov', 1),
(888, 'MM', 18801, '', 0, '', 'Maramureș', 1),
(889, 'MH', 18801, '', 0, '', 'Mehedinți', 1),
(890, 'MS', 18801, '', 0, '', 'Mureș', 1),
(891, 'NT', 18801, '', 0, '', 'Neamț', 1),
(892, 'OT', 18801, '', 0, '', 'Olt', 1),
(893, 'PH', 18801, '', 0, '', 'Prahova', 1),
(894, 'SM', 18801, '', 0, '', 'Satu Mare', 1),
(895, 'SJ', 18801, '', 0, '', 'Sălaj', 1),
(896, 'SB', 18801, '', 0, '', 'Sibiu', 1),
(897, 'SV', 18801, '', 0, '', 'Suceava', 1),
(898, 'TR', 18801, '', 0, '', 'Teleorman', 1),
(899, 'TM', 18801, '', 0, '', 'Timiș', 1),
(900, 'TL', 18801, '', 0, '', 'Tulcea', 1),
(901, 'VS', 18801, '', 0, '', 'Vaslui', 1),
(902, 'VL', 18801, '', 0, '', 'Vâlcea', 1),
(903, 'VN', 18801, '', 0, '', 'Vrancea', 1),
(904, 'SI031', 20203, NULL, NULL, 'MURA', 'Mura', 1),
(905, 'SI032', 20203, NULL, NULL, 'DRAVA', 'Drava', 1),
(906, 'SI033', 20203, NULL, NULL, 'CARINTHIA', 'Carinthia', 1),
(907, 'SI034', 20203, NULL, NULL, 'SAVINJA', 'Savinja', 1),
(908, 'SI035', 20203, NULL, NULL, 'CENTRAL SAVA', 'Central Sava', 1),
(909, 'SI036', 20203, NULL, NULL, 'LOWER SAVA', 'Lower Sava', 1),
(910, 'SI037', 20203, NULL, NULL, 'SOUTHEAST SLOVENIA', 'Southeast Slovenia', 1),
(911, 'SI038', 20203, NULL, NULL, 'LITTORAL–INNER CARNIOLA', 'Littoral–Inner Carniola', 1),
(912, 'SI041', 20204, NULL, NULL, 'CENTRAL SLOVENIA', 'Central Slovenia', 1),
(913, 'SI038', 20204, NULL, NULL, 'UPPER CARNIOLA', 'Upper Carniola', 1),
(914, 'SI043', 20204, NULL, NULL, 'GORIZIA', 'Gorizia', 1),
(915, 'SI044', 20204, NULL, NULL, 'COASTAL–KARST', 'Coastal–Karst', 1),
(916, 'TW-KLU', 21301, 'KLU', NULL, NULL, '基隆市', 1),
(917, 'TW-TPE', 21301, 'TPE', NULL, NULL, '臺北市', 1),
(918, 'TW-TPH', 21301, 'TPH', NULL, NULL, '新北市', 1),
(919, 'TW-TYC', 21301, 'TYC', NULL, NULL, '桃園市', 1),
(920, 'TW-HSH', 21301, 'HSH', NULL, NULL, '新竹縣', 1),
(921, 'TW-HSC', 21301, 'HSC', NULL, NULL, '新竹市', 1),
(922, 'TW-MAL', 21301, 'MAL', NULL, NULL, '苗栗縣', 1),
(923, 'TW-MAC', 21301, 'MAC', NULL, NULL, '苗栗市', 1),
(924, 'TW-TXG', 21301, 'TXG', NULL, NULL, '臺中市', 1),
(925, 'TW-CWH', 21301, 'CWH', NULL, NULL, '彰化縣', 1),
(926, 'TW-CWS', 21301, 'CWS', NULL, NULL, '彰化市', 1),
(927, 'TW-NTC', 21301, 'NTC', NULL, NULL, '南投市', 1),
(928, 'TW-NTO', 21301, 'NTO', NULL, NULL, '南投縣', 1),
(929, 'TW-YLH', 21301, 'YLH', NULL, NULL, '雲林縣', 1),
(930, 'TW-CHY', 21301, 'CHY', NULL, NULL, '嘉義縣', 1),
(931, 'TW-CYI', 21301, 'CYI', NULL, NULL, '嘉義市', 1),
(932, 'TW-TNN', 21301, 'TNN', NULL, NULL, '臺南市', 1),
(933, 'TW-KHH', 21301, 'KHH', NULL, NULL, '高雄市', 1),
(934, 'TW-IUH', 21301, 'IUH', NULL, NULL, '屏東縣', 1),
(935, 'TW-PTS', 21301, 'PTS', NULL, NULL, '屏東市', 1),
(936, 'TW-ILN', 21301, 'ILN', NULL, NULL, '宜蘭縣', 1),
(937, 'TW-ILC', 21301, 'ILC', NULL, NULL, '宜蘭市', 1),
(938, 'TW-HWA', 21301, 'HWA', NULL, NULL, '花蓮縣', 1),
(939, 'TW-HWC', 21301, 'HWC', NULL, NULL, '花蓮市', 1),
(940, 'TW-TTC', 21301, 'TTC', NULL, NULL, '臺東市', 1),
(941, 'TW-TTT', 21301, 'TTT', NULL, NULL, '臺東縣', 1),
(942, 'TW-PEH', 21301, 'PEH', NULL, NULL, '澎湖縣', 1),
(943, 'TW-GNI', 21301, 'GNI', NULL, NULL, '綠島', 1),
(944, 'TW-KYD', 21301, 'KYD', NULL, NULL, '蘭嶼', 1),
(945, 'TW-KMN', 21301, 'KMN', NULL, NULL, '金門縣', 1),
(946, 'TW-LNN', 21301, 'LNN', NULL, NULL, '連江縣', 1),
(947, 'TN01', 1001, '', 0, '', 'Ariana', 1),
(948, 'TN02', 1001, '', 0, '', 'Béja', 1),
(949, 'TN03', 1001, '', 0, '', 'Ben Arous', 1),
(950, 'TN04', 1001, '', 0, '', 'Bizerte', 1),
(951, 'TN05', 1001, '', 0, '', 'Gabès', 1),
(952, 'TN06', 1001, '', 0, '', 'Gafsa', 1),
(953, 'TN07', 1001, '', 0, '', 'Jendouba', 1),
(954, 'TN08', 1001, '', 0, '', 'Kairouan', 1),
(955, 'TN09', 1001, '', 0, '', 'Kasserine', 1),
(956, 'TN10', 1001, '', 0, '', 'Kébili', 1),
(957, 'TN11', 1001, '', 0, '', 'La Manouba', 1),
(958, 'TN12', 1001, '', 0, '', 'Le Kef', 1),
(959, 'TN13', 1001, '', 0, '', 'Mahdia', 1),
(960, 'TN14', 1001, '', 0, '', 'Médenine', 1),
(961, 'TN15', 1001, '', 0, '', 'Monastir', 1),
(962, 'TN16', 1001, '', 0, '', 'Nabeul', 1),
(963, 'TN17', 1001, '', 0, '', 'Sfax', 1),
(964, 'TN18', 1001, '', 0, '', 'Sidi Bouzid', 1),
(965, 'TN19', 1001, '', 0, '', 'Siliana', 1),
(966, 'TN20', 1001, '', 0, '', 'Sousse', 1),
(967, 'TN21', 1001, '', 0, '', 'Tataouine', 1),
(968, 'TN22', 1001, '', 0, '', 'Tozeur', 1),
(969, 'TN23', 1001, '', 0, '', 'Tunis', 1),
(970, 'TN24', 1001, '', 0, '', 'Zaghouan', 1);
INSERT INTO `llx_c_departements` (`rowid`, `code_departement`, `fk_region`, `cheflieu`, `tncc`, `ncc`, `nom`, `active`) VALUES
(971, 'AL', 1101, '', 0, 'ALABAMA', 'Alabama', 1),
(972, 'AK', 1101, '', 0, 'ALASKA', 'Alaska', 1),
(973, 'AZ', 1101, '', 0, 'ARIZONA', 'Arizona', 1),
(974, 'AR', 1101, '', 0, 'ARKANSAS', 'Arkansas', 1),
(975, 'CA', 1101, '', 0, 'CALIFORNIA', 'California', 1),
(976, 'CO', 1101, '', 0, 'COLORADO', 'Colorado', 1),
(977, 'CT', 1101, '', 0, 'CONNECTICUT', 'Connecticut', 1),
(978, 'DE', 1101, '', 0, 'DELAWARE', 'Delaware', 1),
(979, 'FL', 1101, '', 0, 'FLORIDA', 'Florida', 1),
(980, 'GA', 1101, '', 0, 'GEORGIA', 'Georgia', 1),
(981, 'HI', 1101, '', 0, 'HAWAII', 'Hawaii', 1),
(982, 'ID', 1101, '', 0, 'IDAHO', 'Idaho', 1),
(983, 'IL', 1101, '', 0, 'ILLINOIS', 'Illinois', 1),
(984, 'IN', 1101, '', 0, 'INDIANA', 'Indiana', 1),
(985, 'IA', 1101, '', 0, 'IOWA', 'Iowa', 1),
(986, 'KS', 1101, '', 0, 'KANSAS', 'Kansas', 1),
(987, 'KY', 1101, '', 0, 'KENTUCKY', 'Kentucky', 1),
(988, 'LA', 1101, '', 0, 'LOUISIANA', 'Louisiana', 1),
(989, 'ME', 1101, '', 0, 'MAINE', 'Maine', 1),
(990, 'MD', 1101, '', 0, 'MARYLAND', 'Maryland', 1),
(991, 'MA', 1101, '', 0, 'MASSACHUSSETTS', 'Massachusetts', 1),
(992, 'MI', 1101, '', 0, 'MICHIGAN', 'Michigan', 1),
(993, 'MN', 1101, '', 0, 'MINNESOTA', 'Minnesota', 1),
(994, 'MS', 1101, '', 0, 'MISSISSIPPI', 'Mississippi', 1),
(995, 'MO', 1101, '', 0, 'MISSOURI', 'Missouri', 1),
(996, 'MT', 1101, '', 0, 'MONTANA', 'Montana', 1),
(997, 'NE', 1101, '', 0, 'NEBRASKA', 'Nebraska', 1),
(998, 'NV', 1101, '', 0, 'NEVADA', 'Nevada', 1),
(999, 'NH', 1101, '', 0, 'NEW HAMPSHIRE', 'New Hampshire', 1),
(1000, 'NJ', 1101, '', 0, 'NEW JERSEY', 'New Jersey', 1),
(1001, 'NM', 1101, '', 0, 'NEW MEXICO', 'New Mexico', 1),
(1002, 'NY', 1101, '', 0, 'NEW YORK', 'New York', 1),
(1003, 'NC', 1101, '', 0, 'NORTH CAROLINA', 'North Carolina', 1),
(1004, 'ND', 1101, '', 0, 'NORTH DAKOTA', 'North Dakota', 1),
(1005, 'OH', 1101, '', 0, 'OHIO', 'Ohio', 1),
(1006, 'OK', 1101, '', 0, 'OKLAHOMA', 'Oklahoma', 1),
(1007, 'OR', 1101, '', 0, 'OREGON', 'Oregon', 1),
(1008, 'PA', 1101, '', 0, 'PENNSYLVANIA', 'Pennsylvania', 1),
(1009, 'RI', 1101, '', 0, 'RHODE ISLAND', 'Rhode Island', 1),
(1010, 'SC', 1101, '', 0, 'SOUTH CAROLINA', 'South Carolina', 1),
(1011, 'SD', 1101, '', 0, 'SOUTH DAKOTA', 'South Dakota', 1),
(1012, 'TN', 1101, '', 0, 'TENNESSEE', 'Tennessee', 1),
(1013, 'TX', 1101, '', 0, 'TEXAS', 'Texas', 1),
(1014, 'UT', 1101, '', 0, 'UTAH', 'Utah', 1),
(1015, 'VT', 1101, '', 0, 'VERMONT', 'Vermont', 1),
(1016, 'VA', 1101, '', 0, 'VIRGINIA', 'Virginia', 1),
(1017, 'WA', 1101, '', 0, 'WASHINGTON', 'Washington', 1),
(1018, 'WV', 1101, '', 0, 'WEST VIRGINIA', 'West Virginia', 1),
(1019, 'WI', 1101, '', 0, 'WISCONSIN', 'Wisconsin', 1),
(1020, 'WY', 1101, '', 0, 'WYOMING', 'Wyoming', 1),
(1021, '001', 5201, '', 0, '', 'Belisario Boeto', 1),
(1022, '002', 5201, '', 0, '', 'Hernando Siles', 1),
(1023, '003', 5201, '', 0, '', 'Jaime Zudáñez', 1),
(1024, '004', 5201, '', 0, '', 'Juana Azurduy de Padilla', 1),
(1025, '005', 5201, '', 0, '', 'Luis Calvo', 1),
(1026, '006', 5201, '', 0, '', 'Nor Cinti', 1),
(1027, '007', 5201, '', 0, '', 'Oropeza', 1),
(1028, '008', 5201, '', 0, '', 'Sud Cinti', 1),
(1029, '009', 5201, '', 0, '', 'Tomina', 1),
(1030, '010', 5201, '', 0, '', 'Yamparáez', 1),
(1031, '011', 5202, '', 0, '', 'Abel Iturralde', 1),
(1032, '012', 5202, '', 0, '', 'Aroma', 1),
(1033, '013', 5202, '', 0, '', 'Bautista Saavedra', 1),
(1034, '014', 5202, '', 0, '', 'Caranavi', 1),
(1035, '015', 5202, '', 0, '', 'Eliodoro Camacho', 1),
(1036, '016', 5202, '', 0, '', 'Franz Tamayo', 1),
(1037, '017', 5202, '', 0, '', 'Gualberto Villarroel', 1),
(1038, '018', 5202, '', 0, '', 'Ingaví', 1),
(1039, '019', 5202, '', 0, '', 'Inquisivi', 1),
(1040, '020', 5202, '', 0, '', 'José Ramón Loayza', 1),
(1041, '021', 5202, '', 0, '', 'Larecaja', 1),
(1042, '022', 5202, '', 0, '', 'Los Andes (Bolivia)', 1),
(1043, '023', 5202, '', 0, '', 'Manco Kapac', 1),
(1044, '024', 5202, '', 0, '', 'Muñecas', 1),
(1045, '025', 5202, '', 0, '', 'Nor Yungas', 1),
(1046, '026', 5202, '', 0, '', 'Omasuyos', 1),
(1047, '027', 5202, '', 0, '', 'Pacajes', 1),
(1048, '028', 5202, '', 0, '', 'Pedro Domingo Murillo', 1),
(1049, '029', 5202, '', 0, '', 'Sud Yungas', 1),
(1050, '030', 5202, '', 0, '', 'General José Manuel Pando', 1),
(1051, '031', 5203, '', 0, '', 'Arani', 1),
(1052, '032', 5203, '', 0, '', 'Arque', 1),
(1053, '033', 5203, '', 0, '', 'Ayopaya', 1),
(1054, '034', 5203, '', 0, '', 'Bolívar (Bolivia)', 1),
(1055, '035', 5203, '', 0, '', 'Campero', 1),
(1056, '036', 5203, '', 0, '', 'Capinota', 1),
(1057, '037', 5203, '', 0, '', 'Cercado (Cochabamba)', 1),
(1058, '038', 5203, '', 0, '', 'Esteban Arze', 1),
(1059, '039', 5203, '', 0, '', 'Germán Jordán', 1),
(1060, '040', 5203, '', 0, '', 'José Carrasco', 1),
(1061, '041', 5203, '', 0, '', 'Mizque', 1),
(1062, '042', 5203, '', 0, '', 'Punata', 1),
(1063, '043', 5203, '', 0, '', 'Quillacollo', 1),
(1064, '044', 5203, '', 0, '', 'Tapacarí', 1),
(1065, '045', 5203, '', 0, '', 'Tiraque', 1),
(1066, '046', 5203, '', 0, '', 'Chapare', 1),
(1067, '047', 5204, '', 0, '', 'Carangas', 1),
(1068, '048', 5204, '', 0, '', 'Cercado (Oruro)', 1),
(1069, '049', 5204, '', 0, '', 'Eduardo Avaroa', 1),
(1070, '050', 5204, '', 0, '', 'Ladislao Cabrera', 1),
(1071, '051', 5204, '', 0, '', 'Litoral de Atacama', 1),
(1072, '052', 5204, '', 0, '', 'Mejillones', 1),
(1073, '053', 5204, '', 0, '', 'Nor Carangas', 1),
(1074, '054', 5204, '', 0, '', 'Pantaleón Dalence', 1),
(1075, '055', 5204, '', 0, '', 'Poopó', 1),
(1076, '056', 5204, '', 0, '', 'Sabaya', 1),
(1077, '057', 5204, '', 0, '', 'Sajama', 1),
(1078, '058', 5204, '', 0, '', 'San Pedro de Totora', 1),
(1079, '059', 5204, '', 0, '', 'Saucarí', 1),
(1080, '060', 5204, '', 0, '', 'Sebastián Pagador', 1),
(1081, '061', 5204, '', 0, '', 'Sud Carangas', 1),
(1082, '062', 5204, '', 0, '', 'Tomás Barrón', 1),
(1083, '063', 5205, '', 0, '', 'Alonso de Ibáñez', 1),
(1084, '064', 5205, '', 0, '', 'Antonio Quijarro', 1),
(1085, '065', 5205, '', 0, '', 'Bernardino Bilbao', 1),
(1086, '066', 5205, '', 0, '', 'Charcas (Potosí)', 1),
(1087, '067', 5205, '', 0, '', 'Chayanta', 1),
(1088, '068', 5205, '', 0, '', 'Cornelio Saavedra', 1),
(1089, '069', 5205, '', 0, '', 'Daniel Campos', 1),
(1090, '070', 5205, '', 0, '', 'Enrique Baldivieso', 1),
(1091, '071', 5205, '', 0, '', 'José María Linares', 1),
(1092, '072', 5205, '', 0, '', 'Modesto Omiste', 1),
(1093, '073', 5205, '', 0, '', 'Nor Chichas', 1),
(1094, '074', 5205, '', 0, '', 'Nor Lípez', 1),
(1095, '075', 5205, '', 0, '', 'Rafael Bustillo', 1),
(1096, '076', 5205, '', 0, '', 'Sud Chichas', 1),
(1097, '077', 5205, '', 0, '', 'Sud Lípez', 1),
(1098, '078', 5205, '', 0, '', 'Tomás Frías', 1),
(1099, '079', 5206, '', 0, '', 'Aniceto Arce', 1),
(1100, '080', 5206, '', 0, '', 'Burdet O\'Connor', 1),
(1101, '081', 5206, '', 0, '', 'Cercado (Tarija)', 1),
(1102, '082', 5206, '', 0, '', 'Eustaquio Méndez', 1),
(1103, '083', 5206, '', 0, '', 'José María Avilés', 1),
(1104, '084', 5206, '', 0, '', 'Gran Chaco', 1),
(1105, '085', 5207, '', 0, '', 'Andrés Ibáñez', 1),
(1106, '086', 5207, '', 0, '', 'Caballero', 1),
(1107, '087', 5207, '', 0, '', 'Chiquitos', 1),
(1108, '088', 5207, '', 0, '', 'Cordillera (Bolivia)', 1),
(1109, '089', 5207, '', 0, '', 'Florida', 1),
(1110, '090', 5207, '', 0, '', 'Germán Busch', 1),
(1111, '091', 5207, '', 0, '', 'Guarayos', 1),
(1112, '092', 5207, '', 0, '', 'Ichilo', 1),
(1113, '093', 5207, '', 0, '', 'Obispo Santistevan', 1),
(1114, '094', 5207, '', 0, '', 'Sara', 1),
(1115, '095', 5207, '', 0, '', 'Vallegrande', 1),
(1116, '096', 5207, '', 0, '', 'Velasco', 1),
(1117, '097', 5207, '', 0, '', 'Warnes', 1),
(1118, '098', 5207, '', 0, '', 'Ángel Sandóval', 1),
(1119, '099', 5207, '', 0, '', 'Ñuflo de Chaves', 1),
(1120, '100', 5208, '', 0, '', 'Cercado (Beni)', 1),
(1121, '101', 5208, '', 0, '', 'Iténez', 1),
(1122, '102', 5208, '', 0, '', 'Mamoré', 1),
(1123, '103', 5208, '', 0, '', 'Marbán', 1),
(1124, '104', 5208, '', 0, '', 'Moxos', 1),
(1125, '105', 5208, '', 0, '', 'Vaca Díez', 1),
(1126, '106', 5208, '', 0, '', 'Yacuma', 1),
(1127, '107', 5208, '', 0, '', 'General José Ballivián Segurola', 1),
(1128, '108', 5209, '', 0, '', 'Abuná', 1),
(1129, '109', 5209, '', 0, '', 'Madre de Dios', 1),
(1130, '110', 5209, '', 0, '', 'Manuripi', 1),
(1131, '111', 5209, '', 0, '', 'Nicolás Suárez', 1),
(1132, '112', 5209, '', 0, '', 'General Federico Román', 1),
(1133, 'VI', 419, '01', 19, 'ALAVA', 'Álava', 1),
(1134, 'AB', 404, '02', 4, 'ALBACETE', 'Albacete', 1),
(1135, 'A', 411, '03', 11, 'ALICANTE', 'Alicante', 1),
(1136, 'AL', 401, '04', 1, 'ALMERIA', 'Almería', 1),
(1137, 'O', 418, '33', 18, 'ASTURIAS', 'Asturias', 1),
(1138, 'AV', 403, '05', 3, 'AVILA', 'Ávila', 1),
(1139, 'BA', 412, '06', 12, 'BADAJOZ', 'Badajoz', 1),
(1140, 'B', 406, '08', 6, 'BARCELONA', 'Barcelona', 1),
(1141, 'BU', 403, '09', 8, 'BURGOS', 'Burgos', 1),
(1142, 'CC', 412, '10', 12, 'CACERES', 'Cáceres', 1),
(1143, 'CA', 401, '11', 1, 'CADIZ', 'Cádiz', 1),
(1144, 'S', 410, '39', 10, 'CANTABRIA', 'Cantabria', 1),
(1145, 'CS', 411, '12', 11, 'CASTELLON', 'Castellón', 1),
(1146, 'CE', 407, '51', 7, 'CEUTA', 'Ceuta', 1),
(1147, 'CR', 404, '13', 4, 'CIUDAD REAL', 'Ciudad Real', 1),
(1148, 'CO', 401, '14', 1, 'CORDOBA', 'Córdoba', 1),
(1149, 'CU', 404, '16', 4, 'CUENCA', 'Cuenca', 1),
(1150, 'GI', 406, '17', 6, 'GERONA', 'Gerona', 1),
(1151, 'GR', 401, '18', 1, 'GRANADA', 'Granada', 1),
(1152, 'GU', 404, '19', 4, 'GUADALAJARA', 'Guadalajara', 1),
(1153, 'SS', 419, '20', 19, 'GUIPUZCOA', 'Guipúzcoa', 1),
(1154, 'H', 401, '21', 1, 'HUELVA', 'Huelva', 1),
(1155, 'HU', 402, '22', 2, 'HUESCA', 'Huesca', 1),
(1156, 'PM', 414, '07', 14, 'ISLAS BALEARES', 'Islas Baleares', 1),
(1157, 'J', 401, '23', 1, 'JAEN', 'Jaén', 1),
(1158, 'C', 413, '15', 13, 'LA CORUÑA', 'La Coruña', 1),
(1159, 'LO', 415, '26', 15, 'LA RIOJA', 'La Rioja', 1),
(1160, 'GC', 405, '35', 5, 'LAS PALMAS', 'Las Palmas', 1),
(1161, 'LE', 403, '24', 3, 'LEON', 'León', 1),
(1162, 'L', 406, '25', 6, 'LERIDA', 'Lérida', 1),
(1163, 'LU', 413, '27', 13, 'LUGO', 'Lugo', 1),
(1164, 'M', 416, '28', 16, 'MADRID', 'Madrid', 1),
(1165, 'MA', 401, '29', 1, 'MALAGA', 'Málaga', 1),
(1166, 'ML', 409, '52', 9, 'MELILLA', 'Melilla', 1),
(1167, 'MU', 417, '30', 17, 'MURCIA', 'Murcia', 1),
(1168, 'NA', 408, '31', 8, 'NAVARRA', 'Navarra', 1),
(1169, 'OR', 413, '32', 13, 'ORENSE', 'Orense', 1),
(1170, 'P', 403, '34', 3, 'PALENCIA', 'Palencia', 1),
(1171, 'PO', 413, '36', 13, 'PONTEVEDRA', 'Pontevedra', 1),
(1172, 'SA', 403, '37', 3, 'SALAMANCA', 'Salamanca', 1),
(1173, 'TF', 405, '38', 5, 'STA. CRUZ DE TENERIFE', 'Santa Cruz de Tenerife', 1),
(1174, 'SG', 403, '40', 3, 'SEGOVIA', 'Segovia', 1),
(1175, 'SE', 401, '41', 1, 'SEVILLA', 'Sevilla', 1),
(1176, 'SO', 403, '42', 3, 'SORIA', 'Soria', 1),
(1177, 'T', 406, '43', 6, 'TARRAGONA', 'Tarragona', 1),
(1178, 'TE', 402, '44', 2, 'TERUEL', 'Teruel', 1),
(1179, 'TO', 404, '45', 5, 'TOLEDO', 'Toledo', 1),
(1180, 'V', 411, '46', 11, 'VALENCIA', 'Valencia', 1),
(1181, 'VA', 403, '47', 3, 'VALLADOLID', 'Valladolid', 1),
(1182, 'BI', 419, '48', 19, 'VIZCAYA', 'Vizcaya', 1),
(1183, 'ZA', 403, '49', 3, 'ZAMORA', 'Zamora', 1),
(1184, 'Z', 402, '50', 1, 'ZARAGOZA', 'Zaragoza', 1),
(1185, '66', 10201, '', 0, '', 'Αθήνα', 1),
(1186, '67', 10205, '', 0, '', 'Δράμα', 1),
(1187, '01', 10205, '', 0, '', 'Έβρος', 1),
(1188, '02', 10205, '', 0, '', 'Θάσος', 1),
(1189, '03', 10205, '', 0, '', 'Καβάλα', 1),
(1190, '04', 10205, '', 0, '', 'Ξάνθη', 1),
(1191, '05', 10205, '', 0, '', 'Ροδόπη', 1),
(1192, '06', 10203, '', 0, '', 'Ημαθία', 1),
(1193, '07', 10203, '', 0, '', 'Θεσσαλονίκη', 1),
(1194, '08', 10203, '', 0, '', 'Κιλκίς', 1),
(1195, '09', 10203, '', 0, '', 'Πέλλα', 1),
(1196, '10', 10203, '', 0, '', 'Πιερία', 1),
(1197, '11', 10203, '', 0, '', 'Σέρρες', 1),
(1198, '12', 10203, '', 0, '', 'Χαλκιδική', 1),
(1199, '13', 10206, '', 0, '', 'Άρτα', 1),
(1200, '14', 10206, '', 0, '', 'Θεσπρωτία', 1),
(1201, '15', 10206, '', 0, '', 'Ιωάννινα', 1),
(1202, '16', 10206, '', 0, '', 'Πρέβεζα', 1),
(1203, '17', 10213, '', 0, '', 'Γρεβενά', 1),
(1204, '18', 10213, '', 0, '', 'Καστοριά', 1),
(1205, '19', 10213, '', 0, '', 'Κοζάνη', 1),
(1206, '20', 10213, '', 0, '', 'Φλώρινα', 1),
(1207, '21', 10212, '', 0, '', 'Καρδίτσα', 1),
(1208, '22', 10212, '', 0, '', 'Λάρισα', 1),
(1209, '23', 10212, '', 0, '', 'Μαγνησία', 1),
(1210, '24', 10212, '', 0, '', 'Τρίκαλα', 1),
(1211, '25', 10212, '', 0, '', 'Σποράδες', 1),
(1212, '26', 10212, '', 0, '', 'Βοιωτία', 1),
(1213, '27', 10202, '', 0, '', 'Εύβοια', 1),
(1214, '28', 10202, '', 0, '', 'Ευρυτανία', 1),
(1215, '29', 10202, '', 0, '', 'Φθιώτιδα', 1),
(1216, '30', 10202, '', 0, '', 'Φωκίδα', 1),
(1217, '31', 10209, '', 0, '', 'Αργολίδα', 1),
(1218, '32', 10209, '', 0, '', 'Αρκαδία', 1),
(1219, '33', 10209, '', 0, '', 'Κορινθία', 1),
(1220, '34', 10209, '', 0, '', 'Λακωνία', 1),
(1221, '35', 10209, '', 0, '', 'Μεσσηνία', 1),
(1222, '36', 10211, '', 0, '', 'Αιτωλοακαρνανία', 1),
(1223, '37', 10211, '', 0, '', 'Αχαΐα', 1),
(1224, '38', 10211, '', 0, '', 'Ηλεία', 1),
(1225, '39', 10207, '', 0, '', 'Ζάκυνθος', 1),
(1226, '40', 10207, '', 0, '', 'Κέρκυρα', 1),
(1227, '41', 10207, '', 0, '', 'Κεφαλληνία', 1),
(1228, '42', 10207, '', 0, '', 'Ιθάκη', 1),
(1229, '43', 10207, '', 0, '', 'Λευκάδα', 1),
(1230, '44', 10208, '', 0, '', 'Ικαρία', 1),
(1231, '45', 10208, '', 0, '', 'Λέσβος', 1),
(1232, '46', 10208, '', 0, '', 'Λήμνος', 1),
(1233, '47', 10208, '', 0, '', 'Σάμος', 1),
(1234, '48', 10208, '', 0, '', 'Χίος', 1),
(1235, '49', 10210, '', 0, '', 'Άνδρος', 1),
(1236, '50', 10210, '', 0, '', 'Θήρα', 1),
(1237, '51', 10210, '', 0, '', 'Κάλυμνος', 1),
(1238, '52', 10210, '', 0, '', 'Κάρπαθος', 1),
(1239, '53', 10210, '', 0, '', 'Κέα-Κύθνος', 1),
(1240, '54', 10210, '', 0, '', 'Κω', 1),
(1241, '55', 10210, '', 0, '', 'Μήλος', 1),
(1242, '56', 10210, '', 0, '', 'Μύκονος', 1),
(1243, '57', 10210, '', 0, '', 'Νάξος', 1),
(1244, '58', 10210, '', 0, '', 'Πάρος', 1),
(1245, '59', 10210, '', 0, '', 'Ρόδος', 1),
(1246, '60', 10210, '', 0, '', 'Σύρος', 1),
(1247, '61', 10210, '', 0, '', 'Τήνος', 1),
(1248, '62', 10204, '', 0, '', 'Ηράκλειο', 1),
(1249, '63', 10204, '', 0, '', 'Λασίθι', 1),
(1250, '64', 10204, '', 0, '', 'Ρέθυμνο', 1),
(1251, '65', 10204, '', 0, '', 'Χανιά', 1),
(1252, 'AG', 601, NULL, NULL, 'ARGOVIE', 'Argovie', 1),
(1253, 'AI', 601, NULL, NULL, 'APPENZELL RHODES INTERIEURES', 'Appenzell Rhodes intérieures', 1),
(1254, 'AR', 601, NULL, NULL, 'APPENZELL RHODES EXTERIEURES', 'Appenzell Rhodes extérieures', 1),
(1255, 'BE', 601, NULL, NULL, 'BERNE', 'Berne', 1),
(1256, 'BL', 601, NULL, NULL, 'BALE CAMPAGNE', 'Bâle Campagne', 1),
(1257, 'BS', 601, NULL, NULL, 'BALE VILLE', 'Bâle Ville', 1),
(1258, 'FR', 601, NULL, NULL, 'FRIBOURG', 'Fribourg', 1),
(1259, 'GE', 601, NULL, NULL, 'GENEVE', 'Genève', 1),
(1260, 'GL', 601, NULL, NULL, 'GLARIS', 'Glaris', 1),
(1261, 'GR', 601, NULL, NULL, 'GRISONS', 'Grisons', 1),
(1262, 'JU', 601, NULL, NULL, 'JURA', 'Jura', 1),
(1263, 'LU', 601, NULL, NULL, 'LUCERNE', 'Lucerne', 1),
(1264, 'NE', 601, NULL, NULL, 'NEUCHATEL', 'Neuchâtel', 1),
(1265, 'NW', 601, NULL, NULL, 'NIDWALD', 'Nidwald', 1),
(1266, 'OW', 601, NULL, NULL, 'OBWALD', 'Obwald', 1),
(1267, 'SG', 601, NULL, NULL, 'SAINT-GALL', 'Saint-Gall', 1),
(1268, 'SH', 601, NULL, NULL, 'SCHAFFHOUSE', 'Schaffhouse', 1),
(1269, 'SO', 601, NULL, NULL, 'SOLEURE', 'Soleure', 1),
(1270, 'SZ', 601, NULL, NULL, 'SCHWYZ', 'Schwyz', 1),
(1271, 'TG', 601, NULL, NULL, 'THURGOVIE', 'Thurgovie', 1),
(1272, 'TI', 601, NULL, NULL, 'TESSIN', 'Tessin', 1),
(1273, 'UR', 601, NULL, NULL, 'URI', 'Uri', 1),
(1274, 'VD', 601, NULL, NULL, 'VAUD', 'Vaud', 1),
(1275, 'VS', 601, NULL, NULL, 'VALAIS', 'Valais', 1),
(1276, 'ZG', 601, NULL, NULL, 'ZUG', 'Zug', 1),
(1277, 'ZH', 601, NULL, NULL, 'ZURICH', 'Zürich', 1),
(1278, '701', 701, NULL, 0, NULL, 'Bedfordshire', 1),
(1279, '702', 701, NULL, 0, NULL, 'Berkshire', 1),
(1280, '703', 701, NULL, 0, NULL, 'Bristol, City of', 1),
(1281, '704', 701, NULL, 0, NULL, 'Buckinghamshire', 1),
(1282, '705', 701, NULL, 0, NULL, 'Cambridgeshire', 1),
(1283, '706', 701, NULL, 0, NULL, 'Cheshire', 1),
(1284, '707', 701, NULL, 0, NULL, 'Cleveland', 1),
(1285, '708', 701, NULL, 0, NULL, 'Cornwall', 1),
(1286, '709', 701, NULL, 0, NULL, 'Cumberland', 1),
(1287, '710', 701, NULL, 0, NULL, 'Cumbria', 1),
(1288, '711', 701, NULL, 0, NULL, 'Derbyshire', 1),
(1289, '712', 701, NULL, 0, NULL, 'Devon', 1),
(1290, '713', 701, NULL, 0, NULL, 'Dorset', 1),
(1291, '714', 701, NULL, 0, NULL, 'Co. Durham', 1),
(1292, '715', 701, NULL, 0, NULL, 'East Riding of Yorkshire', 1),
(1293, '716', 701, NULL, 0, NULL, 'East Sussex', 1),
(1294, '717', 701, NULL, 0, NULL, 'Essex', 1),
(1295, '718', 701, NULL, 0, NULL, 'Gloucestershire', 1),
(1296, '719', 701, NULL, 0, NULL, 'Greater Manchester', 1),
(1297, '720', 701, NULL, 0, NULL, 'Hampshire', 1),
(1298, '721', 701, NULL, 0, NULL, 'Hertfordshire', 1),
(1299, '722', 701, NULL, 0, NULL, 'Hereford and Worcester', 1),
(1300, '723', 701, NULL, 0, NULL, 'Herefordshire', 1),
(1301, '724', 701, NULL, 0, NULL, 'Huntingdonshire', 1),
(1302, '725', 701, NULL, 0, NULL, 'Isle of Man', 1),
(1303, '726', 701, NULL, 0, NULL, 'Isle of Wight', 1),
(1304, '727', 701, NULL, 0, NULL, 'Jersey', 1),
(1305, '728', 701, NULL, 0, NULL, 'Kent', 1),
(1306, '729', 701, NULL, 0, NULL, 'Lancashire', 1),
(1307, '730', 701, NULL, 0, NULL, 'Leicestershire', 1),
(1308, '731', 701, NULL, 0, NULL, 'Lincolnshire', 1),
(1309, '732', 701, NULL, 0, NULL, 'London - City of London', 1),
(1310, '733', 701, NULL, 0, NULL, 'Merseyside', 1),
(1311, '734', 701, NULL, 0, NULL, 'Middlesex', 1),
(1312, '735', 701, NULL, 0, NULL, 'Norfolk', 1),
(1313, '736', 701, NULL, 0, NULL, 'North Yorkshire', 1),
(1314, '737', 701, NULL, 0, NULL, 'North Riding of Yorkshire', 1),
(1315, '738', 701, NULL, 0, NULL, 'Northamptonshire', 1),
(1316, '739', 701, NULL, 0, NULL, 'Northumberland', 1),
(1317, '740', 701, NULL, 0, NULL, 'Nottinghamshire', 1),
(1318, '741', 701, NULL, 0, NULL, 'Oxfordshire', 1),
(1319, '742', 701, NULL, 0, NULL, 'Rutland', 1),
(1320, '743', 701, NULL, 0, NULL, 'Shropshire', 1),
(1321, '744', 701, NULL, 0, NULL, 'Somerset', 1),
(1322, '745', 701, NULL, 0, NULL, 'Staffordshire', 1),
(1323, '746', 701, NULL, 0, NULL, 'Suffolk', 1),
(1324, '747', 701, NULL, 0, NULL, 'Surrey', 1),
(1325, '748', 701, NULL, 0, NULL, 'Sussex', 1),
(1326, '749', 701, NULL, 0, NULL, 'Tyne and Wear', 1),
(1327, '750', 701, NULL, 0, NULL, 'Warwickshire', 1),
(1328, '751', 701, NULL, 0, NULL, 'West Midlands', 1),
(1329, '752', 701, NULL, 0, NULL, 'West Sussex', 1),
(1330, '753', 701, NULL, 0, NULL, 'West Yorkshire', 1),
(1331, '754', 701, NULL, 0, NULL, 'West Riding of Yorkshire', 1),
(1332, '755', 701, NULL, 0, NULL, 'Wiltshire', 1),
(1333, '756', 701, NULL, 0, NULL, 'Worcestershire', 1),
(1334, '757', 701, NULL, 0, NULL, 'Yorkshire', 1),
(1335, '758', 702, NULL, 0, NULL, 'Anglesey', 1),
(1336, '759', 702, NULL, 0, NULL, 'Breconshire', 1),
(1337, '760', 702, NULL, 0, NULL, 'Caernarvonshire', 1),
(1338, '761', 702, NULL, 0, NULL, 'Cardiganshire', 1),
(1339, '762', 702, NULL, 0, NULL, 'Carmarthenshire', 1),
(1340, '763', 702, NULL, 0, NULL, 'Ceredigion', 1),
(1341, '764', 702, NULL, 0, NULL, 'Denbighshire', 1),
(1342, '765', 702, NULL, 0, NULL, 'Flintshire', 1),
(1343, '766', 702, NULL, 0, NULL, 'Glamorgan', 1),
(1344, '767', 702, NULL, 0, NULL, 'Gwent', 1),
(1345, '768', 702, NULL, 0, NULL, 'Gwynedd', 1),
(1346, '769', 702, NULL, 0, NULL, 'Merionethshire', 1),
(1347, '770', 702, NULL, 0, NULL, 'Monmouthshire', 1),
(1348, '771', 702, NULL, 0, NULL, 'Mid Glamorgan', 1),
(1349, '772', 702, NULL, 0, NULL, 'Montgomeryshire', 1),
(1350, '773', 702, NULL, 0, NULL, 'Pembrokeshire', 1),
(1351, '774', 702, NULL, 0, NULL, 'Powys', 1),
(1352, '775', 702, NULL, 0, NULL, 'Radnorshire', 1),
(1353, '776', 702, NULL, 0, NULL, 'South Glamorgan', 1),
(1354, '777', 703, NULL, 0, NULL, 'Aberdeen, City of', 1),
(1355, '778', 703, NULL, 0, NULL, 'Angus', 1),
(1356, '779', 703, NULL, 0, NULL, 'Argyll', 1),
(1357, '780', 703, NULL, 0, NULL, 'Ayrshire', 1),
(1358, '781', 703, NULL, 0, NULL, 'Banffshire', 1),
(1359, '782', 703, NULL, 0, NULL, 'Berwickshire', 1),
(1360, '783', 703, NULL, 0, NULL, 'Bute', 1),
(1361, '784', 703, NULL, 0, NULL, 'Caithness', 1),
(1362, '785', 703, NULL, 0, NULL, 'Clackmannanshire', 1),
(1363, '786', 703, NULL, 0, NULL, 'Dumfriesshire', 1),
(1364, '787', 703, NULL, 0, NULL, 'Dumbartonshire', 1),
(1365, '788', 703, NULL, 0, NULL, 'Dundee, City of', 1),
(1366, '789', 703, NULL, 0, NULL, 'East Lothian', 1),
(1367, '790', 703, NULL, 0, NULL, 'Fife', 1),
(1368, '791', 703, NULL, 0, NULL, 'Inverness', 1),
(1369, '792', 703, NULL, 0, NULL, 'Kincardineshire', 1),
(1370, '793', 703, NULL, 0, NULL, 'Kinross-shire', 1),
(1371, '794', 703, NULL, 0, NULL, 'Kirkcudbrightshire', 1),
(1372, '795', 703, NULL, 0, NULL, 'Lanarkshire', 1),
(1373, '796', 703, NULL, 0, NULL, 'Midlothian', 1),
(1374, '797', 703, NULL, 0, NULL, 'Morayshire', 1),
(1375, '798', 703, NULL, 0, NULL, 'Nairnshire', 1),
(1376, '799', 703, NULL, 0, NULL, 'Orkney', 1),
(1377, '800', 703, NULL, 0, NULL, 'Peebleshire', 1),
(1378, '801', 703, NULL, 0, NULL, 'Perthshire', 1),
(1379, '802', 703, NULL, 0, NULL, 'Renfrewshire', 1),
(1380, '803', 703, NULL, 0, NULL, 'Ross & Cromarty', 1),
(1381, '804', 703, NULL, 0, NULL, 'Roxburghshire', 1),
(1382, '805', 703, NULL, 0, NULL, 'Selkirkshire', 1),
(1383, '806', 703, NULL, 0, NULL, 'Shetland', 1),
(1384, '807', 703, NULL, 0, NULL, 'Stirlingshire', 1),
(1385, '808', 703, NULL, 0, NULL, 'Sutherland', 1),
(1386, '809', 703, NULL, 0, NULL, 'West Lothian', 1),
(1387, '810', 703, NULL, 0, NULL, 'Wigtownshire', 1),
(1388, '811', 704, NULL, 0, NULL, 'Antrim', 1),
(1389, '812', 704, NULL, 0, NULL, 'Armagh', 1),
(1390, '813', 704, NULL, 0, NULL, 'Co. Down', 1),
(1391, '814', 704, NULL, 0, NULL, 'Co. Fermanagh', 1),
(1392, '815', 704, NULL, 0, NULL, 'Co. Londonderry', 1),
(1393, 'SS', 8601, '', 0, '', 'San Salvador', 1),
(1394, 'SA', 8603, '', 0, '', 'Santa Ana', 1),
(1395, 'AH', 8603, '', 0, '', 'Ahuachapan', 1),
(1396, 'SO', 8603, '', 0, '', 'Sonsonate', 1),
(1397, 'US', 8602, '', 0, '', 'Usulutan', 1),
(1398, 'SM', 8602, '', 0, '', 'San Miguel', 1),
(1399, 'MO', 8602, '', 0, '', 'Morazan', 1),
(1400, 'LU', 8602, '', 0, '', 'La Union', 1),
(1401, 'LL', 8601, '', 0, '', 'La Libertad', 1),
(1402, 'CH', 8601, '', 0, '', 'Chalatenango', 1),
(1403, 'CA', 8601, '', 0, '', 'Cabañas', 1),
(1404, 'LP', 8601, '', 0, '', 'La Paz', 1),
(1405, 'SV', 8601, '', 0, '', 'San Vicente', 1),
(1406, 'CU', 8601, '', 0, '', 'Cuscatlan', 1),
(1407, 'AN', 11701, NULL, 0, 'AN', 'Andaman & Nicobar', 1),
(1408, 'AP', 11701, NULL, 0, 'AP', 'Andhra Pradesh', 1),
(1409, 'AR', 11701, NULL, 0, 'AR', 'Arunachal Pradesh', 1),
(1410, 'AS', 11701, NULL, 0, 'AS', 'Assam', 1),
(1411, 'BR', 11701, NULL, 0, 'BR', 'Bihar', 1),
(1412, 'CG', 11701, NULL, 0, 'CG', 'Chattisgarh', 1),
(1413, 'CH', 11701, NULL, 0, 'CH', 'Chandigarh', 1),
(1414, 'DD', 11701, NULL, 0, 'DD', 'Daman & Diu', 1),
(1415, 'DL', 11701, NULL, 0, 'DL', 'Delhi', 1),
(1416, 'DN', 11701, NULL, 0, 'DN', 'Dadra and Nagar Haveli', 1),
(1417, 'GA', 11701, NULL, 0, 'GA', 'Goa', 1),
(1418, 'GJ', 11701, NULL, 0, 'GJ', 'Gujarat', 1),
(1419, 'HP', 11701, NULL, 0, 'HP', 'Himachal Pradesh', 1),
(1420, 'HR', 11701, NULL, 0, 'HR', 'Haryana', 1),
(1421, 'JH', 11701, NULL, 0, 'JH', 'Jharkhand', 1),
(1422, 'JK', 11701, NULL, 0, 'JK', 'Jammu & Kashmir', 1),
(1423, 'KA', 11701, NULL, 0, 'KA', 'Karnataka', 1),
(1424, 'KL', 11701, NULL, 0, 'KL', 'Kerala', 1),
(1425, 'LD', 11701, NULL, 0, 'LD', 'Lakshadweep', 1),
(1426, 'MH', 11701, NULL, 0, 'MH', 'Maharashtra', 1),
(1427, 'ML', 11701, NULL, 0, 'ML', 'Meghalaya', 1),
(1428, 'MN', 11701, NULL, 0, 'MN', 'Manipur', 1),
(1429, 'MP', 11701, NULL, 0, 'MP', 'Madhya Pradesh', 1),
(1430, 'MZ', 11701, NULL, 0, 'MZ', 'Mizoram', 1),
(1431, 'NL', 11701, NULL, 0, 'NL', 'Nagaland', 1),
(1432, 'OR', 11701, NULL, 0, 'OR', 'Orissa', 1),
(1433, 'PB', 11701, NULL, 0, 'PB', 'Punjab', 1),
(1434, 'PY', 11701, NULL, 0, 'PY', 'Puducherry', 1),
(1435, 'RJ', 11701, NULL, 0, 'RJ', 'Rajasthan', 1),
(1436, 'SK', 11701, NULL, 0, 'SK', 'Sikkim', 1),
(1437, 'TE', 11701, NULL, 0, 'TE', 'Telangana', 1),
(1438, 'TN', 11701, NULL, 0, 'TN', 'Tamil Nadu', 1),
(1439, 'TR', 11701, NULL, 0, 'TR', 'Tripura', 1),
(1440, 'UL', 11701, NULL, 0, 'UL', 'Uttarakhand', 1),
(1441, 'UP', 11701, NULL, 0, 'UP', 'Uttar Pradesh', 1),
(1442, 'WB', 11701, NULL, 0, 'WB', 'West Bengal', 1),
(1443, 'BA', 11801, NULL, 0, 'BA', 'Bali', 1),
(1444, 'BB', 11801, NULL, 0, 'BB', 'Bangka Belitung', 1),
(1445, 'BT', 11801, NULL, 0, 'BT', 'Banten', 1),
(1446, 'BE', 11801, NULL, 0, 'BA', 'Bengkulu', 1),
(1447, 'YO', 11801, NULL, 0, 'YO', 'DI Yogyakarta', 1),
(1448, 'JK', 11801, NULL, 0, 'JK', 'DKI Jakarta', 1),
(1449, 'GO', 11801, NULL, 0, 'GO', 'Gorontalo', 1),
(1450, 'JA', 11801, NULL, 0, 'JA', 'Jambi', 1),
(1451, 'JB', 11801, NULL, 0, 'JB', 'Jawa Barat', 1),
(1452, 'JT', 11801, NULL, 0, 'JT', 'Jawa Tengah', 1),
(1453, 'JI', 11801, NULL, 0, 'JI', 'Jawa Timur', 1),
(1454, 'KB', 11801, NULL, 0, 'KB', 'Kalimantan Barat', 1),
(1455, 'KS', 11801, NULL, 0, 'KS', 'Kalimantan Selatan', 1),
(1456, 'KT', 11801, NULL, 0, 'KT', 'Kalimantan Tengah', 1),
(1457, 'KI', 11801, NULL, 0, 'KI', 'Kalimantan Timur', 1),
(1458, 'KU', 11801, NULL, 0, 'KU', 'Kalimantan Utara', 1),
(1459, 'KR', 11801, NULL, 0, 'KR', 'Kepulauan Riau', 1),
(1460, 'LA', 11801, NULL, 0, 'LA', 'Lampung', 1),
(1461, 'MA', 11801, NULL, 0, 'MA', 'Maluku', 1),
(1462, 'MU', 11801, NULL, 0, 'MU', 'Maluku Utara', 1),
(1463, 'AC', 11801, NULL, 0, 'AC', 'Nanggroe Aceh Darussalam', 1),
(1464, 'NB', 11801, NULL, 0, 'NB', 'Nusa Tenggara Barat', 1),
(1465, 'NT', 11801, NULL, 0, 'NT', 'Nusa Tenggara Timur', 1),
(1466, 'PA', 11801, NULL, 0, 'PA', 'Papua', 1),
(1467, 'PB', 11801, NULL, 0, 'PB', 'Papua Barat', 1),
(1468, 'RI', 11801, NULL, 0, 'RI', 'Riau', 1),
(1469, 'SR', 11801, NULL, 0, 'SR', 'Sulawesi Barat', 1),
(1470, 'SN', 11801, NULL, 0, 'SN', 'Sulawesi Selatan', 1),
(1471, 'ST', 11801, NULL, 0, 'ST', 'Sulawesi Tengah', 1),
(1472, 'SG', 11801, NULL, 0, 'SG', 'Sulawesi Tenggara', 1),
(1473, 'SA', 11801, NULL, 0, 'SA', 'Sulawesi Utara', 1),
(1474, 'SB', 11801, NULL, 0, 'SB', 'Sumatera Barat', 1),
(1475, 'SS', 11801, NULL, 0, 'SS', 'Sumatera Selatan', 1),
(1476, 'SU', 11801, NULL, 0, 'SU', 'Sumatera Utara	', 1),
(1477, 'CMX', 15401, '', 0, 'CMX', 'Ciudad de México', 1),
(1478, 'AGS', 15401, '', 0, 'AGS', 'Aguascalientes', 1),
(1479, 'BCN', 15401, '', 0, 'BCN', 'Baja California Norte', 1),
(1480, 'BCS', 15401, '', 0, 'BCS', 'Baja California Sur', 1),
(1481, 'CAM', 15401, '', 0, 'CAM', 'Campeche', 1),
(1482, 'CHP', 15401, '', 0, 'CHP', 'Chiapas', 1),
(1483, 'CHI', 15401, '', 0, 'CHI', 'Chihuahua', 1),
(1484, 'COA', 15401, '', 0, 'COA', 'Coahuila', 1),
(1485, 'COL', 15401, '', 0, 'COL', 'Colima', 1),
(1486, 'DUR', 15401, '', 0, 'DUR', 'Durango', 1),
(1487, 'GTO', 15401, '', 0, 'GTO', 'Guanajuato', 1),
(1488, 'GRO', 15401, '', 0, 'GRO', 'Guerrero', 1),
(1489, 'HGO', 15401, '', 0, 'HGO', 'Hidalgo', 1),
(1490, 'JAL', 15401, '', 0, 'JAL', 'Jalisco', 1),
(1491, 'MEX', 15401, '', 0, 'MEX', 'México', 1),
(1492, 'MIC', 15401, '', 0, 'MIC', 'Michoacán de Ocampo', 1),
(1493, 'MOR', 15401, '', 0, 'MOR', 'Morelos', 1),
(1494, 'NAY', 15401, '', 0, 'NAY', 'Nayarit', 1),
(1495, 'NLE', 15401, '', 0, 'NLE', 'Nuevo León', 1),
(1496, 'OAX', 15401, '', 0, 'OAX', 'Oaxaca', 1),
(1497, 'PUE', 15401, '', 0, 'PUE', 'Puebla', 1),
(1498, 'QRO', 15401, '', 0, 'QRO', 'Querétaro', 1),
(1499, 'ROO', 15401, '', 0, 'ROO', 'Quintana Roo', 1),
(1500, 'SLP', 15401, '', 0, 'SLP', 'San Luis Potosí', 1),
(1501, 'SIN', 15401, '', 0, 'SIN', 'Sinaloa', 1),
(1502, 'SON', 15401, '', 0, 'SON', 'Sonora', 1),
(1503, 'TAB', 15401, '', 0, 'TAB', 'Tabasco', 1),
(1504, 'TAM', 15401, '', 0, 'TAM', 'Tamaulipas', 1),
(1505, 'TLX', 15401, '', 0, 'TLX', 'Tlaxcala', 1),
(1506, 'VER', 15401, '', 0, 'VER', 'Veracruz', 1),
(1507, 'YUC', 15401, '', 0, 'YUC', 'Yucatán', 1),
(1508, 'ZAC', 15401, '', 0, 'ZAC', 'Zacatecas', 1),
(1509, 'VE-L', 23201, '', 0, 'VE-L', 'Mérida', 1),
(1510, 'VE-T', 23201, '', 0, 'VE-T', 'Trujillo', 1),
(1511, 'VE-E', 23201, '', 0, 'VE-E', 'Barinas', 1),
(1512, 'VE-M', 23202, '', 0, 'VE-M', 'Miranda', 1),
(1513, 'VE-W', 23202, '', 0, 'VE-W', 'Vargas', 1),
(1514, 'VE-A', 23202, '', 0, 'VE-A', 'Distrito Capital', 1),
(1515, 'VE-D', 23203, '', 0, 'VE-D', 'Aragua', 1),
(1516, 'VE-G', 23203, '', 0, 'VE-G', 'Carabobo', 1),
(1517, 'VE-I', 23204, '', 0, 'VE-I', 'Falcón', 1),
(1518, 'VE-K', 23204, '', 0, 'VE-K', 'Lara', 1),
(1519, 'VE-U', 23204, '', 0, 'VE-U', 'Yaracuy', 1),
(1520, 'VE-F', 23205, '', 0, 'VE-F', 'Bolívar', 1),
(1521, 'VE-X', 23205, '', 0, 'VE-X', 'Amazonas', 1),
(1522, 'VE-Y', 23205, '', 0, 'VE-Y', 'Delta Amacuro', 1),
(1523, 'VE-O', 23206, '', 0, 'VE-O', 'Nueva Esparta', 1),
(1524, 'VE-Z', 23206, '', 0, 'VE-Z', 'Dependencias Federales', 1),
(1525, 'VE-C', 23207, '', 0, 'VE-C', 'Apure', 1),
(1526, 'VE-J', 23207, '', 0, 'VE-J', 'Guárico', 1),
(1527, 'VE-H', 23207, '', 0, 'VE-H', 'Cojedes', 1),
(1528, 'VE-P', 23207, '', 0, 'VE-P', 'Portuguesa', 1),
(1529, 'VE-B', 23208, '', 0, 'VE-B', 'Anzoátegui', 1),
(1530, 'VE-N', 23208, '', 0, 'VE-N', 'Monagas', 1),
(1531, 'VE-R', 23208, '', 0, 'VE-R', 'Sucre', 1),
(1532, 'VE-V', 23209, '', 0, 'VE-V', 'Zulia', 1),
(1533, 'VE-S', 23209, '', 0, 'VE-S', 'Táchira', 1),
(1534, 'AE-1', 22701, '', 0, '', 'Abu Dhabi', 1),
(1535, 'AE-2', 22701, '', 0, '', 'Dubai', 1),
(1536, 'AE-3', 22701, '', 0, '', 'Ajman', 1),
(1537, 'AE-4', 22701, '', 0, '', 'Fujairah', 1),
(1538, 'AE-5', 22701, '', 0, '', 'Ras al-Khaimah', 1),
(1539, 'AE-6', 22701, '', 0, '', 'Sharjah', 1),
(1540, 'AE-7', 22701, '', 0, '', 'Umm al-Quwain', 1);

-- --------------------------------------------------------

--
-- Structure de la table `llx_c_ecotaxe`
--

CREATE TABLE `llx_c_ecotaxe` (
  `rowid` int(11) NOT NULL,
  `code` varchar(64) NOT NULL,
  `label` varchar(255) DEFAULT NULL,
  `price` double(24,8) DEFAULT NULL,
  `organization` varchar(255) DEFAULT NULL,
  `fk_pays` int(11) NOT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `llx_c_ecotaxe`
--

INSERT INTO `llx_c_ecotaxe` (`rowid`, `code`, `label`, `price`, `organization`, `fk_pays`, `active`) VALUES
(1, '25040', 'PETIT APPAREILS MENAGERS', 0.25000000, 'Eco-systèmes', 1, 1),
(2, '25050', 'TRES PETIT APPAREILS MENAGERS', 0.08000000, 'Eco-systèmes', 1, 1),
(3, '32070', 'ECRAN POIDS < 5 KG', 2.08000000, 'Eco-systèmes', 1, 1),
(4, '32080', 'ECRAN POIDS > 5 KG', 1.25000000, 'Eco-systèmes', 1, 1),
(5, '32051', 'ORDINATEUR PORTABLE', 0.42000000, 'Eco-systèmes', 1, 1),
(6, '32061', 'TABLETTE INFORMATIQUE', 0.84000000, 'Eco-systèmes', 1, 1),
(7, '36011', 'ORDINATEUR FIXE (UC)', 1.15000000, 'Eco-systèmes', 1, 1),
(8, '36021', 'IMPRIMANTES', 0.83000000, 'Eco-systèmes', 1, 1),
(9, '36030', 'IT (INFORMATIQUE ET TELECOMS)', 0.83000000, 'Eco-systèmes', 1, 1),
(10, '36040', 'PETIT IT (CLAVIERS / SOURIS)', 0.08000000, 'Eco-systèmes', 1, 1),
(11, '36050', 'TELEPHONIE MOBILE', 0.02000000, 'Eco-systèmes', 1, 1),
(12, '36060', 'CONNECTIQUE CABLES', 0.02000000, 'Eco-systèmes', 1, 1),
(13, '45010', 'GROS MATERIEL GRAND PUBLIC (TELEAGRANDISSEURS)', 1.67000000, 'Eco-systèmes', 1, 1),
(14, '45020', 'MOYEN MATERIEL GRAND PUBLIC (LOUPES ELECTRONIQUES)', 0.42000000, 'Eco-systèmes', 1, 1),
(15, '45030', 'PETIT MATERIEL GRAND PUBLIC (VIE QUOTIDIENNE)', 0.08000000, 'Eco-systèmes', 1, 1),
(16, '75030', 'JOUETS < 0,5 KG', 0.08000000, 'Eco-systèmes', 1, 1),
(17, '75040', 'JOUETS ENTRE 0,5 KG ET 10 KG', 0.17000000, 'Eco-systèmes', 1, 1),
(18, '74050', 'JOUETS > 10 KG', 1.67000000, 'Eco-systèmes', 1, 1),
(19, '85010', 'EQUIPEMENT MEDICAL < 0,5 KG', 0.08000000, 'Eco-systèmes', 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `llx_c_effectif`
--

CREATE TABLE `llx_c_effectif` (
  `id` int(11) NOT NULL,
  `code` varchar(12) NOT NULL,
  `libelle` varchar(30) DEFAULT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1,
  `module` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `llx_c_effectif`
--

INSERT INTO `llx_c_effectif` (`id`, `code`, `libelle`, `active`, `module`) VALUES
(0, 'EF0', '-', 1, NULL),
(1, 'EF1-5', '1 - 5', 1, NULL),
(2, 'EF6-10', '6 - 10', 1, NULL),
(3, 'EF11-50', '11 - 50', 1, NULL),
(4, 'EF51-100', '51 - 100', 1, NULL),
(5, 'EF100-500', '100 - 500', 1, NULL),
(6, 'EF500-', '> 500', 1, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `llx_c_email_senderprofile`
--

CREATE TABLE `llx_c_email_senderprofile` (
  `rowid` int(11) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `private` smallint(6) NOT NULL DEFAULT 0,
  `date_creation` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `label` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `signature` text DEFAULT NULL,
  `position` smallint(6) DEFAULT 0,
  `active` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_c_email_templates`
--

CREATE TABLE `llx_c_email_templates` (
  `rowid` int(11) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `module` varchar(32) DEFAULT NULL,
  `type_template` varchar(32) DEFAULT NULL,
  `lang` varchar(6) DEFAULT '',
  `private` smallint(6) NOT NULL DEFAULT 0,
  `fk_user` int(11) DEFAULT NULL,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `label` varchar(180) DEFAULT NULL,
  `position` smallint(6) DEFAULT NULL,
  `enabled` varchar(255) DEFAULT '1',
  `active` tinyint(4) NOT NULL DEFAULT 1,
  `topic` text DEFAULT NULL,
  `joinfiles` text DEFAULT NULL,
  `content` mediumtext DEFAULT NULL,
  `content_lines` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `llx_c_email_templates`
--

INSERT INTO `llx_c_email_templates` (`rowid`, `entity`, `module`, `type_template`, `lang`, `private`, `fk_user`, `datec`, `tms`, `label`, `position`, `enabled`, `active`, `topic`, `joinfiles`, `content`, `content_lines`) VALUES
(1, 0, 'banque', 'thirdparty', '', 0, NULL, NULL, '2024-07-16 13:31:55', '(YourSEPAMandate)', 1, '$conf->societe->enabled && $conf->banque->enabled && $conf->prelevement->enabled', 0, '__(YourSEPAMandate)__', '0', '__(Hello)__,<br><br>\n\n__(FindYourSEPAMandate)__ :<br>\n__MYCOMPANY_NAME__<br>\n__MYCOMPANY_FULLADDRESS__<br><br>\n__(Sincerely)__<br>\n__USER_SIGNATURE__', NULL),
(2, 0, 'adherent', 'member', '', 0, NULL, NULL, '2024-07-16 13:31:55', '(SendingEmailOnAutoSubscription)', 10, '$conf->adherent->enabled', 1, '[__[MAIN_INFO_SOCIETE_NOM]__] __(YourMembershipRequestWasReceived)__', '0', '__(Hello)__ __MEMBER_FULLNAME__,<br><br>\n\n__(ThisIsContentOfYourMembershipRequestWasReceived)__<br>\n<br>__ONLINE_PAYMENT_TEXT_AND_URL__<br>\n<br><br>\n__(Sincerely)__<br>__USER_SIGNATURE__', NULL),
(3, 0, 'adherent', 'member', '', 0, NULL, NULL, '2024-07-16 13:31:55', '(SendingEmailOnMemberValidation)', 20, '$conf->adherent->enabled', 1, '[__[MAIN_INFO_SOCIETE_NOM]__] __(YourMembershipWasValidated)__', '0', '__(Hello)__ __MEMBER_FULLNAME__,<br><br>\n\n__(ThisIsContentOfYourMembershipWasValidated)__<br>__(FirstName)__ : __MEMBER_FIRSTNAME__<br>__(LastName)__ : __MEMBER_LASTNAME__<br>__(ID)__ : __MEMBER_ID__<br>\n<br>__ONLINE_PAYMENT_TEXT_AND_URL__<br>\n<br><br>\n__(Sincerely)__<br>__USER_SIGNATURE__', NULL),
(4, 0, 'adherent', 'member', '', 0, NULL, NULL, '2024-07-16 13:31:55', '(SendingEmailOnNewSubscription)', 30, '$conf->adherent->enabled', 1, '[__[MAIN_INFO_SOCIETE_NOM]__] __(YourSubscriptionWasRecorded)__', '1', '__(Hello)__ __MEMBER_FULLNAME__,<br><br>\n\n__(ThisIsContentOfYourSubscriptionWasRecorded)__<br>\n\n<br><br>\n__(Sincerely)__<br>__USER_SIGNATURE__', NULL),
(5, 0, 'adherent', 'member', '', 0, NULL, NULL, '2024-07-16 13:31:55', '(SendingReminderForExpiredSubscription)', 40, '$conf->adherent->enabled', 1, '[__[MAIN_INFO_SOCIETE_NOM]__] __(SubscriptionReminderEmail)__', '0', '__(Hello)__ __MEMBER_FULLNAME__,<br><br>\n\n__(ThisIsContentOfSubscriptionReminderEmail)__<br>\n<br>__ONLINE_PAYMENT_TEXT_AND_URL__<br>\n<br><br>\n__(Sincerely)__<br>__USER_SIGNATURE__', NULL),
(6, 0, 'adherent', 'member', '', 0, NULL, NULL, '2024-07-16 13:31:55', '(SendingEmailOnCancelation)', 50, '$conf->adherent->enabled', 1, '[__[MAIN_INFO_SOCIETE_NOM]__] __(YourMembershipWasCanceled)__', '0', '__(Hello)__ __MEMBER_FULLNAME__,<br><br>\n\n__(YourMembershipWasCanceled)__<br>\n<br><br>\n__(Sincerely)__<br>__USER_SIGNATURE__', NULL),
(7, 0, 'adherent', 'member', '', 0, NULL, NULL, '2024-07-16 13:31:55', '(SendingAnEMailToMember)', 60, '$conf->adherent->enabled', 1, '[__[MAIN_INFO_SOCIETE_NOM]__] __(CardContent)__', '0', '__(Hello)__,<br><br>\n\n__(ThisIsContentOfYourCard)__<br>\n__(ID)__ : __ID__<br>\n__(Civiliyty)__ : __MEMBER_CIVILITY__<br>\n__(Firstname)__ : __MEMBER_FIRSTNAME__<br>\n__(Lastname)__ : __MEMBER_LASTNAME__<br>\n__(Fullname)__ : __MEMBER_FULLNAME__<br>\n__(Company)__ : __MEMBER_COMPANY__<br>\n__(Address)__ : __MEMBER_ADDRESS__<br>\n__(Zip)__ : __MEMBER_ZIP__<br>\n__(Town)__ : __MEMBER_TOWN__<br>\n__(Country)__ : __MEMBER_COUNTRY__<br>\n__(Email)__ : __MEMBER_EMAIL__<br>\n__(Birthday)__ : __MEMBER_BIRTH__<br>\n__(Photo)__ : __MEMBER_PHOTO__<br>\n__(Login)__ : __MEMBER_LOGIN__<br>\n__(Password)__ : __MEMBER_PASSWORD__<br>\n__(Phone)__ : __MEMBER_PHONE__<br>\n__(PhonePerso)__ : __MEMBER_PHONEPRO__<br>\n__(PhoneMobile)__ : __MEMBER_PHONEMOBILE__<br><br>\n__(Sincerely)__<br>__USER_SIGNATURE__', NULL),
(8, 0, 'recruitment', 'recruitmentcandidature_send', '', 0, NULL, NULL, '2024-07-16 13:31:55', '(AnswerCandidature)', 100, '$conf->recruitment->enabled', 1, '[__[MAIN_INFO_SOCIETE_NOM]__] __(YourCandidature)__', '0', '__(Hello)__ __CANDIDATE_FULLNAME__,<br><br>\n\n__(YourCandidatureAnswerMessage)__<br>__ONLINE_INTERVIEW_SCHEDULER_TEXT_AND_URL__\n<br><br>\n__(Sincerely)__<br>__USER_SIGNATURE__', NULL),
(9, 0, '', 'conferenceorbooth', '', 0, NULL, NULL, '2024-07-16 13:31:55', '(EventOrganizationEmailAskConf)', 10, '1', 1, '[__[MAIN_INFO_SOCIETE_NOM]__] __(EventOrganizationEmailAskConf)__', NULL, '__(Hello)__ __THIRDPARTY_NAME__,<br /><br />__(ThisIsContentOfYourOrganizationEventConfRequestWasReceived)__<br /><br />__ONLINE_PAYMENT_TEXT_AND_URL__<br /><br /><br />__(Sincerely)__<br />__USER_SIGNATURE__', NULL),
(10, 0, '', 'conferenceorbooth', '', 0, NULL, NULL, '2024-07-16 13:31:55', '(EventOrganizationEmailAskBooth)', 20, '1', 1, '[__[MAIN_INFO_SOCIETE_NOM]__] __(EventOrganizationEmailAskBooth)__', NULL, '__(Hello)__ __THIRDPARTY_NAME__,<br /><br />__(ThisIsContentOfYourOrganizationEventBoothRequestWasReceived)__<br /><br />__ONLINE_PAYMENT_TEXT_AND_URL__<br /><br /><br />__(Sincerely)__<br />__USER_SIGNATURE__', NULL),
(11, 0, '', 'conferenceorbooth', '', 0, NULL, NULL, '2024-07-16 13:31:55', '(EventOrganizationEmailSubsBooth)', 30, '1', 1, '[__[MAIN_INFO_SOCIETE_NOM]__] __(EventOrganizationEmailSubsBooth)__', NULL, '__(Hello)__ __THIRDPARTY_NAME__,<br /><br />__(ThisIsContentOfYourOrganizationEventBoothSubscriptionWasReceived)__<br /><br />__ONLINE_PAYMENT_TEXT_AND_URL__<br /><br /><br />__(Sincerely)__<br />__USER_SIGNATURE__', NULL),
(12, 0, '', 'conferenceorbooth', '', 0, NULL, NULL, '2024-07-16 13:31:55', '(EventOrganizationEmailSubsEvent)', 40, '1', 1, '[__[MAIN_INFO_SOCIETE_NOM]__] __(EventOrganizationEmailSubsEvent)__', NULL, '__(Hello)__ __THIRDPARTY_NAME__,<br /><br />__(ThisIsContentOfYourOrganizationEventEventSubscriptionWasReceived)__<br /><br />__(Sincerely)__<br /><br />__MYCOMPANY_NAME__<br />__USER_SIGNATURE__', NULL),
(13, 0, '', 'conferenceorbooth', '', 0, NULL, NULL, '2024-07-16 13:31:55', '(EventOrganizationMassEmailAttendees)', 50, '1', 1, '[__[MAIN_INFO_SOCIETE_NOM]__] __(EventOrganizationMassEmailAttendees)__', NULL, '__(Hello)__ __THIRDPARTY_NAME__,<br /><br />__(ThisIsContentOfYourOrganizationEventBulkMailToAttendees)__<br /><br />__(Sincerely)__<br />__USER_SIGNATURE__', NULL),
(14, 0, '', 'conferenceorbooth', '', 0, NULL, NULL, '2024-07-16 13:31:55', '(EventOrganizationMassEmailSpeakers)', 60, '1', 1, '[__[MAIN_INFO_SOCIETE_NOM]__] __(EventOrganizationMassEmailSpeakers)__', NULL, '__(Hello)__ __THIRDPARTY_NAME__,<br /><br />__(ThisIsContentOfYourOrganizationEventBulkMailToSpeakers)__<br /><br />__(Sincerely)__<br />__USER_SIGNATURE__', NULL),
(15, 0, 'partnership', 'partnership_send', '', 0, NULL, NULL, '2024-07-16 13:31:55', '(SendingEmailOnPartnershipWillSoonBeCanceled)', 100, '1', 1, '[__[MAIN_INFO_SOCIETE_NOM]__] - __(YourPartnershipWillSoonBeCanceledTopic)__', '0', '<body>\n <p>__(Hello)__,<br><br>\n__(YourPartnershipWillSoonBeCanceledContent)__</p>\n<br />\n\n<br />\n\n            __(Sincerely)__ <br />\n            __[MAIN_INFO_SOCIETE_NOM]__ <br />\n </body>\n', NULL),
(16, 0, 'partnership', 'partnership_send', '', 0, NULL, NULL, '2024-07-16 13:31:55', '(SendingEmailOnPartnershipCanceled)', 100, '1', 1, '[__[MAIN_INFO_SOCIETE_NOM]__] - __(YourPartnershipCanceledTopic)__', '0', '<body>\n <p>__(Hello)__,<br><br>\n__(YourPartnershipCanceledContent)__</p>\n<br />\n\n<br />\n\n            __(Sincerely)__ <br />\n            __[MAIN_INFO_SOCIETE_NOM]__ <br />\n </body>\n', NULL),
(17, 0, 'partnership', 'partnership_send', '', 0, NULL, NULL, '2024-07-16 13:31:55', '(SendingEmailOnPartnershipRefused)', 100, '1', 1, '[__[MAIN_INFO_SOCIETE_NOM]__] - __(YourPartnershipRefusedTopic)__', '0', '<body>\n <p>__(Hello)__,<br><br>\n__(YourPartnershipRefusedContent)__</p>\n<br />\n\n<br />\n\n            __(Sincerely)__ <br />\n            __[MAIN_INFO_SOCIETE_NOM]__ <br />\n </body>\n', NULL),
(18, 0, 'partnership', 'partnership_send', '', 0, NULL, NULL, '2024-07-16 13:31:55', '(SendingEmailOnPartnershipAccepted)', 100, '1', 1, '[__[MAIN_INFO_SOCIETE_NOM]__] - __(YourPartnershipAcceptedTopic)__', '0', '<body>\n <p>__(Hello)__,<br><br>\n__(YourPartnershipAcceptedContent)__</p>\n<br />\n\n<br />\n\n            __(Sincerely)__ <br />\n            __[MAIN_INFO_SOCIETE_NOM]__ <br />\n </body>\n', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `llx_c_exp_tax_cat`
--

CREATE TABLE `llx_c_exp_tax_cat` (
  `rowid` int(11) NOT NULL,
  `label` varchar(48) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `active` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `llx_c_exp_tax_cat`
--

INSERT INTO `llx_c_exp_tax_cat` (`rowid`, `label`, `entity`, `active`) VALUES
(1, 'ExpAutoCat', 1, 0),
(2, 'ExpCycloCat', 1, 0),
(3, 'ExpMotoCat', 1, 0),
(4, 'ExpAuto3CV', 1, 1),
(5, 'ExpAuto4CV', 1, 1),
(6, 'ExpAuto5CV', 1, 1),
(7, 'ExpAuto6CV', 1, 1),
(8, 'ExpAuto7CV', 1, 1),
(9, 'ExpAuto8CV', 1, 1),
(10, 'ExpAuto9CV', 1, 0),
(11, 'ExpAuto10CV', 1, 0),
(12, 'ExpAuto11CV', 1, 0),
(13, 'ExpAuto12CV', 1, 0),
(14, 'ExpAuto3PCV', 1, 0),
(15, 'ExpAuto4PCV', 1, 0),
(16, 'ExpAuto5PCV', 1, 0),
(17, 'ExpAuto6PCV', 1, 0),
(18, 'ExpAuto7PCV', 1, 0),
(19, 'ExpAuto8PCV', 1, 0),
(20, 'ExpAuto9PCV', 1, 0),
(21, 'ExpAuto10PCV', 1, 0),
(22, 'ExpAuto11PCV', 1, 0),
(23, 'ExpAuto12PCV', 1, 0),
(24, 'ExpAuto13PCV', 1, 0),
(25, 'ExpCyclo', 1, 0),
(26, 'ExpMoto12CV', 1, 0),
(27, 'ExpMoto345CV', 1, 0),
(28, 'ExpMoto5PCV', 1, 0);

-- --------------------------------------------------------

--
-- Structure de la table `llx_c_exp_tax_range`
--

CREATE TABLE `llx_c_exp_tax_range` (
  `rowid` int(11) NOT NULL,
  `fk_c_exp_tax_cat` int(11) NOT NULL DEFAULT 1,
  `range_ik` double NOT NULL DEFAULT 0,
  `entity` int(11) NOT NULL DEFAULT 1,
  `active` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `llx_c_exp_tax_range`
--

INSERT INTO `llx_c_exp_tax_range` (`rowid`, `fk_c_exp_tax_cat`, `range_ik`, `entity`, `active`) VALUES
(1, 4, 0, 1, 1),
(2, 4, 5000, 1, 1),
(3, 4, 20000, 1, 1),
(4, 5, 0, 1, 1),
(5, 5, 5000, 1, 1),
(6, 5, 20000, 1, 1),
(7, 6, 0, 1, 1),
(8, 6, 5000, 1, 1),
(9, 6, 20000, 1, 1),
(10, 7, 0, 1, 1),
(11, 7, 5000, 1, 1),
(12, 7, 20000, 1, 1),
(13, 8, 0, 1, 1),
(14, 8, 5000, 1, 1),
(15, 8, 20000, 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `llx_c_field_list`
--

CREATE TABLE `llx_c_field_list` (
  `rowid` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `element` varchar(64) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `name` varchar(32) NOT NULL,
  `alias` varchar(32) NOT NULL,
  `title` varchar(32) NOT NULL,
  `align` varchar(6) DEFAULT 'left',
  `sort` tinyint(4) NOT NULL DEFAULT 1,
  `search` tinyint(4) NOT NULL DEFAULT 0,
  `visible` tinyint(4) NOT NULL DEFAULT 1,
  `enabled` varchar(255) DEFAULT '1',
  `rang` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_c_format_cards`
--

CREATE TABLE `llx_c_format_cards` (
  `rowid` int(11) NOT NULL,
  `code` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `paper_size` varchar(20) NOT NULL,
  `orientation` varchar(1) NOT NULL,
  `metric` varchar(5) NOT NULL,
  `leftmargin` double(24,8) NOT NULL,
  `topmargin` double(24,8) NOT NULL,
  `nx` int(11) NOT NULL,
  `ny` int(11) NOT NULL,
  `spacex` double(24,8) NOT NULL,
  `spacey` double(24,8) NOT NULL,
  `width` double(24,8) NOT NULL,
  `height` double(24,8) NOT NULL,
  `font_size` int(11) NOT NULL,
  `custom_x` double(24,8) NOT NULL,
  `custom_y` double(24,8) NOT NULL,
  `active` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `llx_c_format_cards`
--

INSERT INTO `llx_c_format_cards` (`rowid`, `code`, `name`, `paper_size`, `orientation`, `metric`, `leftmargin`, `topmargin`, `nx`, `ny`, `spacex`, `spacey`, `width`, `height`, `font_size`, `custom_x`, `custom_y`, `active`) VALUES
(1, '5160', 'Avery-5160, WL-875WX', 'letter', 'P', 'mm', 5.58165000, 12.70000000, 3, 10, 3.55600000, 0.00000000, 65.87490000, 25.40000000, 7, 0.00000000, 0.00000000, 1),
(2, '5161', 'Avery-5161, WL-75WX', 'letter', 'P', 'mm', 4.44500000, 12.70000000, 2, 10, 3.96800000, 0.00000000, 101.60000000, 25.40000000, 7, 0.00000000, 0.00000000, 1),
(3, '5162', 'Avery-5162, WL-100WX', 'letter', 'P', 'mm', 3.87350000, 22.35200000, 2, 7, 4.95400000, 0.00000000, 101.60000000, 33.78100000, 8, 0.00000000, 0.00000000, 1),
(4, '5163', 'Avery-5163, WL-125WX', 'letter', 'P', 'mm', 4.57200000, 12.70000000, 2, 5, 3.55600000, 0.00000000, 101.60000000, 50.80000000, 10, 0.00000000, 0.00000000, 1),
(5, '5164', 'Avery-5164 (inch)', 'letter', 'P', 'in', 0.14800000, 0.50000000, 2, 3, 0.20310000, 0.00000000, 4.00000000, 3.33000000, 12, 0.00000000, 0.00000000, 0),
(6, '8600', 'Avery-8600', 'letter', 'P', 'mm', 7.10000000, 19.00000000, 3, 10, 9.50000000, 3.10000000, 66.60000000, 25.40000000, 7, 0.00000000, 0.00000000, 1),
(7, '99012', 'DYMO 99012 89*36mm', 'custom', 'L', 'mm', 1.00000000, 1.00000000, 1, 1, 0.00000000, 0.00000000, 36.00000000, 89.00000000, 10, 36.00000000, 89.00000000, 1),
(8, '99014', 'DYMO 99014 101*54mm', 'custom', 'L', 'mm', 1.00000000, 1.00000000, 1, 1, 0.00000000, 0.00000000, 54.00000000, 101.00000000, 10, 54.00000000, 101.00000000, 1),
(9, 'AVERYC32010', 'Avery-C32010', 'A4', 'P', 'mm', 15.00000000, 13.00000000, 2, 5, 10.00000000, 0.00000000, 85.00000000, 54.00000000, 10, 0.00000000, 0.00000000, 1),
(10, 'CARD', 'Dolibarr Business cards', 'A4', 'P', 'mm', 15.00000000, 15.00000000, 2, 5, 0.00000000, 0.00000000, 85.00000000, 54.00000000, 10, 0.00000000, 0.00000000, 1),
(11, 'L7163', 'Avery-L7163', 'A4', 'P', 'mm', 5.00000000, 15.00000000, 2, 7, 2.50000000, 0.00000000, 99.10000000, 38.10000000, 8, 0.00000000, 0.00000000, 1);

-- --------------------------------------------------------

--
-- Structure de la table `llx_c_forme_juridique`
--

CREATE TABLE `llx_c_forme_juridique` (
  `rowid` int(11) NOT NULL,
  `code` int(11) NOT NULL,
  `fk_pays` int(11) NOT NULL,
  `libelle` varchar(255) DEFAULT NULL,
  `isvatexempted` tinyint(4) NOT NULL DEFAULT 0,
  `active` tinyint(4) NOT NULL DEFAULT 1,
  `module` varchar(32) DEFAULT NULL,
  `position` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `llx_c_forme_juridique`
--

INSERT INTO `llx_c_forme_juridique` (`rowid`, `code`, `fk_pays`, `libelle`, `isvatexempted`, `active`, `module`, `position`) VALUES
(1, 0, 0, '-', 0, 1, NULL, 0),
(2, 2301, 23, 'Monotributista', 0, 1, NULL, 0),
(3, 2302, 23, 'Sociedad Civil', 0, 1, NULL, 0),
(4, 2303, 23, 'Sociedades Comerciales', 0, 1, NULL, 0),
(5, 2304, 23, 'Sociedades de Hecho', 0, 1, NULL, 0),
(6, 2305, 23, 'Sociedades Irregulares', 0, 1, NULL, 0),
(7, 2306, 23, 'Sociedad Colectiva', 0, 1, NULL, 0),
(8, 2307, 23, 'Sociedad en Comandita Simple', 0, 1, NULL, 0),
(9, 2308, 23, 'Sociedad de Capital e Industria', 0, 1, NULL, 0),
(10, 2309, 23, 'Sociedad Accidental o en participación', 0, 1, NULL, 0),
(11, 2310, 23, 'Sociedad de Responsabilidad Limitada', 0, 1, NULL, 0),
(12, 2311, 23, 'Sociedad Anónima', 0, 1, NULL, 0),
(13, 2312, 23, 'Sociedad Anónima con Participación Estatal Mayoritaria', 0, 1, NULL, 0),
(14, 2313, 23, 'Sociedad en Comandita por Acciones (arts. 315 a 324, LSC)', 0, 1, NULL, 0),
(15, 4100, 41, 'GmbH - Gesellschaft mit beschränkter Haftung', 0, 1, NULL, 0),
(16, 4101, 41, 'GesmbH - Gesellschaft mit beschränkter Haftung', 0, 1, NULL, 0),
(17, 4102, 41, 'AG - Aktiengesellschaft', 0, 1, NULL, 0),
(18, 4103, 41, 'EWIV - Europäische wirtschaftliche Interessenvereinigung', 0, 1, NULL, 0),
(19, 4104, 41, 'KEG - Kommanditerwerbsgesellschaft', 0, 1, NULL, 0),
(20, 4105, 41, 'OEG - Offene Erwerbsgesellschaft', 0, 1, NULL, 0),
(21, 4106, 41, 'OHG - Offene Handelsgesellschaft', 0, 1, NULL, 0),
(22, 4107, 41, 'AG & Co KG - Kommanditgesellschaft', 0, 1, NULL, 0),
(23, 4108, 41, 'GmbH & Co KG - Kommanditgesellschaft', 0, 1, NULL, 0),
(24, 4109, 41, 'KG - Kommanditgesellschaft', 0, 1, NULL, 0),
(25, 4110, 41, 'OG - Offene Gesellschaft', 0, 1, NULL, 0),
(26, 4111, 41, 'GbR - Gesellschaft nach bürgerlichem Recht', 0, 1, NULL, 0),
(27, 4112, 41, 'GesbR - Gesellschaft nach bürgerlichem Recht', 0, 1, NULL, 0),
(28, 4113, 41, 'GesnbR - Gesellschaft nach bürgerlichem Recht', 0, 1, NULL, 0),
(29, 4114, 41, 'e.U. - eingetragener Einzelunternehmer', 0, 1, NULL, 0),
(30, 200, 2, 'Indépendant', 0, 1, NULL, 0),
(31, 201, 2, 'SRL - Société à responsabilité limitée', 0, 1, NULL, 0),
(32, 202, 2, 'SA   - Société Anonyme', 0, 1, NULL, 0),
(33, 203, 2, 'SCRL - Société coopérative à responsabilité limitée', 0, 1, NULL, 0),
(34, 204, 2, 'ASBL - Association sans but Lucratif', 0, 1, NULL, 0),
(35, 205, 2, 'SCRI - Société coopérative à responsabilité illimitée', 0, 1, NULL, 0),
(36, 206, 2, 'SCS  - Société en commandite simple', 0, 1, NULL, 0),
(37, 207, 2, 'SCA  - Société en commandite par action', 0, 1, NULL, 0),
(38, 208, 2, 'SNC  - Société en nom collectif', 0, 1, NULL, 0),
(39, 209, 2, 'GIE  - Groupement d intérêt économique', 0, 1, NULL, 0),
(40, 210, 2, 'GEIE - Groupement européen d intérêt économique', 0, 1, NULL, 0),
(41, 220, 2, 'Eenmanszaak', 0, 1, NULL, 0),
(42, 221, 2, 'BVBA - Besloten vennootschap met beperkte aansprakelijkheid', 0, 1, NULL, 0),
(43, 222, 2, 'NV   - Naamloze Vennootschap', 0, 1, NULL, 0),
(44, 223, 2, 'CVBA - Coöperatieve vennootschap met beperkte aansprakelijkheid', 0, 1, NULL, 0),
(45, 224, 2, 'VZW  - Vereniging zonder winstoogmerk', 0, 1, NULL, 0),
(46, 225, 2, 'CVOA - Coöperatieve vennootschap met onbeperkte aansprakelijkheid ', 0, 1, NULL, 0),
(47, 226, 2, 'GCV  - Gewone commanditaire vennootschap', 0, 1, NULL, 0),
(48, 227, 2, 'Comm.VA - Commanditaire vennootschap op aandelen', 0, 1, NULL, 0),
(49, 228, 2, 'VOF  - Vennootschap onder firma', 0, 1, NULL, 0),
(50, 229, 2, 'VS0  - Vennootschap met sociaal oogmerk', 0, 1, NULL, 0),
(51, 11, 1, 'Artisan Commerçant (EI)', 0, 1, NULL, 0),
(52, 12, 1, 'Commerçant (EI)', 0, 1, NULL, 0),
(53, 13, 1, 'Artisan (EI)', 0, 1, NULL, 0),
(54, 14, 1, 'Officier public ou ministériel', 0, 1, NULL, 0),
(55, 15, 1, 'Profession libérale (EI)', 0, 1, NULL, 0),
(56, 16, 1, 'Exploitant agricole', 0, 1, NULL, 0),
(57, 17, 1, 'Agent commercial', 0, 1, NULL, 0),
(58, 18, 1, 'Associé Gérant de société', 0, 1, NULL, 0),
(59, 19, 1, 'Personne physique', 0, 1, NULL, 0),
(60, 21, 1, 'Indivision', 0, 1, NULL, 0),
(61, 22, 1, 'Société créée de fait', 0, 1, NULL, 0),
(62, 23, 1, 'Société en participation', 0, 1, NULL, 0),
(63, 24, 1, 'Société coopérative d\'interet collectif (SCIC)', 0, 1, NULL, 0),
(64, 25, 1, 'Société coopérative de production à responsabilité limitée (SCOP)', 0, 1, NULL, 0),
(65, 27, 1, 'Paroisse hors zone concordataire', 0, 1, NULL, 0),
(66, 29, 1, 'Groupement de droit privé non doté de la personnalité morale', 0, 1, NULL, 0),
(67, 31, 1, 'Personne morale de droit étranger, immatriculée au RCS', 0, 1, NULL, 0),
(68, 32, 1, 'Personne morale de droit étranger, non immatriculée au RCS', 0, 1, NULL, 0),
(69, 35, 1, 'Régime auto-entrepreneur', 0, 1, NULL, 0),
(70, 41, 1, 'Etablissement public ou régie à caractère industriel ou commercial', 0, 1, NULL, 0),
(71, 51, 1, 'Société coopérative commerciale particulière', 0, 1, NULL, 0),
(72, 52, 1, 'Société en nom collectif', 0, 1, NULL, 0),
(73, 53, 1, 'Société en commandite', 0, 1, NULL, 0),
(74, 54, 1, 'Société à responsabilité limitée (SARL)', 0, 1, NULL, 0),
(75, 55, 1, 'Société anonyme à conseil d administration', 0, 1, NULL, 0),
(76, 56, 1, 'Société anonyme à directoire', 0, 1, NULL, 0),
(77, 57, 1, 'Société par actions simplifiée (SAS)', 0, 1, NULL, 0),
(78, 58, 1, 'Entreprise Unipersonnelle à Responsabilité Limitée (EURL)', 0, 1, NULL, 0),
(79, 59, 1, 'Société par actions simplifiée unipersonnelle (SASU)', 0, 1, NULL, 0),
(80, 60, 1, 'Entreprise Individuelle à Responsabilité Limitée (EIRL)', 0, 1, NULL, 0),
(81, 61, 1, 'Caisse d\'épargne et de prévoyance', 0, 1, NULL, 0),
(82, 62, 1, 'Groupement d\'intérêt économique (GIE)', 0, 1, NULL, 0),
(83, 63, 1, 'Société coopérative agricole', 0, 1, NULL, 0),
(84, 64, 1, 'Société non commerciale d assurances', 0, 1, NULL, 0),
(85, 65, 1, 'Société civile', 0, 1, NULL, 0),
(86, 69, 1, 'Personnes de droit privé inscrites au RCS', 0, 1, NULL, 0),
(87, 71, 1, 'Administration de l état', 0, 1, NULL, 0),
(88, 72, 1, 'Collectivité territoriale', 0, 1, NULL, 0),
(89, 73, 1, 'Etablissement public administratif', 0, 1, NULL, 0),
(90, 74, 1, 'Personne morale de droit public administratif', 0, 1, NULL, 0),
(91, 81, 1, 'Organisme gérant régime de protection social à adhésion obligatoire', 0, 1, NULL, 0),
(92, 82, 1, 'Organisme mutualiste', 0, 1, NULL, 0),
(93, 83, 1, 'Comité d entreprise', 0, 1, NULL, 0),
(94, 84, 1, 'Organisme professionnel', 0, 1, NULL, 0),
(95, 85, 1, 'Organisme de retraite à adhésion non obligatoire', 0, 1, NULL, 0),
(96, 91, 1, 'Syndicat de propriétaires', 0, 1, NULL, 0),
(97, 92, 1, 'Association loi 1901 ou assimilé', 0, 1, NULL, 0),
(98, 93, 1, 'Fondation', 0, 1, NULL, 0),
(99, 99, 1, 'Personne morale de droit privé', 0, 1, NULL, 0),
(100, 500, 5, 'GmbH - Gesellschaft mit beschränkter Haftung', 0, 1, NULL, 0),
(101, 501, 5, 'AG - Aktiengesellschaft ', 0, 1, NULL, 0),
(102, 502, 5, 'GmbH&Co. KG - Gesellschaft mit beschränkter Haftung & Compagnie Kommanditgesellschaft', 0, 1, NULL, 0),
(103, 503, 5, 'Gewerbe - Personengesellschaft', 0, 1, NULL, 0),
(104, 504, 5, 'UG - Unternehmergesellschaft -haftungsbeschränkt-', 0, 1, NULL, 0),
(105, 505, 5, 'GbR - Gesellschaft des bürgerlichen Rechts', 0, 1, NULL, 0),
(106, 506, 5, 'KG - Kommanditgesellschaft', 0, 1, NULL, 0),
(107, 507, 5, 'Ltd. - Limited Company', 0, 1, NULL, 0),
(108, 508, 5, 'OHG - Offene Handelsgesellschaft', 0, 1, NULL, 0),
(109, 509, 5, 'eG - eingetragene Genossenschaft', 0, 1, NULL, 0),
(110, 8001, 80, 'Aktieselvskab A/S', 0, 1, NULL, 0),
(111, 8002, 80, 'Anparts Selvskab ApS', 0, 1, NULL, 0),
(112, 8003, 80, 'Personlig ejet selvskab', 0, 1, NULL, 0),
(113, 8004, 80, 'Iværksætterselvskab IVS', 0, 1, NULL, 0),
(114, 8005, 80, 'Interessentskab I/S', 0, 1, NULL, 0),
(115, 8006, 80, 'Holdingselskab', 0, 1, NULL, 0),
(116, 8007, 80, 'Selskab Med Begrænset Hæftelse SMBA', 0, 1, NULL, 0),
(117, 8008, 80, 'Kommanditselskab K/S', 0, 1, NULL, 0),
(118, 8009, 80, 'SPE-selskab', 0, 1, NULL, 0),
(119, 10201, 102, 'Ατομική επιχείρηση', 0, 1, NULL, 0),
(120, 10202, 102, 'Εταιρική  επιχείρηση', 0, 1, NULL, 0),
(121, 10203, 102, 'Ομόρρυθμη Εταιρεία Ο.Ε', 0, 1, NULL, 0),
(122, 10204, 102, 'Ετερόρρυθμη Εταιρεία Ε.Ε', 0, 1, NULL, 0),
(123, 10205, 102, 'Εταιρεία Περιορισμένης Ευθύνης Ε.Π.Ε', 0, 1, NULL, 0),
(124, 10206, 102, 'Ανώνυμη Εταιρεία Α.Ε', 0, 1, NULL, 0),
(125, 10207, 102, 'Ανώνυμη ναυτιλιακή εταιρεία Α.Ν.Ε', 0, 1, NULL, 0),
(126, 10208, 102, 'Συνεταιρισμός', 0, 1, NULL, 0),
(127, 10209, 102, 'Συμπλοιοκτησία', 0, 1, NULL, 0),
(128, 301, 3, 'Società semplice', 0, 1, NULL, 0),
(129, 302, 3, 'Società in nome collettivo s.n.c.', 0, 1, NULL, 0),
(130, 303, 3, 'Società in accomandita semplice s.a.s.', 0, 1, NULL, 0),
(131, 304, 3, 'Società per azioni s.p.a.', 0, 1, NULL, 0),
(132, 305, 3, 'Società a responsabilità limitata s.r.l.', 0, 1, NULL, 0),
(133, 306, 3, 'Società in accomandita per azioni s.a.p.a.', 0, 1, NULL, 0),
(134, 307, 3, 'Società cooperativa a r.l.', 0, 1, NULL, 0),
(135, 308, 3, 'Società consortile', 0, 1, NULL, 0),
(136, 309, 3, 'Società europea', 0, 1, NULL, 0),
(137, 310, 3, 'Società cooperativa europea', 0, 1, NULL, 0),
(138, 311, 3, 'Società unipersonale', 0, 1, NULL, 0),
(139, 312, 3, 'Società di professionisti', 0, 1, NULL, 0),
(140, 313, 3, 'Società di fatto', 0, 1, NULL, 0),
(141, 315, 3, 'Società apparente', 0, 1, NULL, 0),
(142, 316, 3, 'Impresa individuale ', 0, 1, NULL, 0),
(143, 317, 3, 'Impresa coniugale', 0, 1, NULL, 0),
(144, 318, 3, 'Impresa familiare', 0, 1, NULL, 0),
(145, 319, 3, 'Consorzio cooperativo', 0, 1, NULL, 0),
(146, 320, 3, 'Società cooperativa sociale', 0, 1, NULL, 0),
(147, 321, 3, 'Società cooperativa di consumo', 0, 1, NULL, 0),
(148, 322, 3, 'Società cooperativa agricola', 0, 1, NULL, 0),
(149, 323, 3, 'A.T.I. Associazione temporanea di imprese', 0, 1, NULL, 0),
(150, 324, 3, 'R.T.I. Raggruppamento temporaneo di imprese', 0, 1, NULL, 0),
(151, 325, 3, 'Studio associato', 0, 1, NULL, 0),
(152, 600, 6, 'Raison Individuelle', 0, 1, NULL, 0),
(153, 601, 6, 'Société Simple', 0, 1, NULL, 0),
(154, 602, 6, 'Société en nom collectif', 0, 1, NULL, 0),
(155, 603, 6, 'Société en commandite', 0, 1, NULL, 0),
(156, 604, 6, 'Société anonyme (SA)', 0, 1, NULL, 0),
(157, 605, 6, 'Société en commandite par actions', 0, 1, NULL, 0),
(158, 606, 6, 'Société à responsabilité limitée (SARL)', 0, 1, NULL, 0),
(159, 607, 6, 'Société coopérative', 0, 1, NULL, 0),
(160, 608, 6, 'Association', 0, 1, NULL, 0),
(161, 609, 6, 'Fondation', 0, 1, NULL, 0),
(162, 700, 7, 'Sole Trader', 0, 1, NULL, 0),
(163, 701, 7, 'Partnership', 0, 1, NULL, 0),
(164, 702, 7, 'Private Limited Company by shares (LTD)', 0, 1, NULL, 0),
(165, 703, 7, 'Public Limited Company', 0, 1, NULL, 0),
(166, 704, 7, 'Workers Cooperative', 0, 1, NULL, 0),
(167, 705, 7, 'Limited Liability Partnership', 0, 1, NULL, 0),
(168, 706, 7, 'Franchise', 0, 1, NULL, 0),
(169, 1000, 10, 'Société à responsabilité limitée (SARL)', 0, 1, NULL, 0),
(170, 1001, 10, 'Société en Nom Collectif (SNC)', 0, 1, NULL, 0),
(171, 1002, 10, 'Société en Commandite Simple (SCS)', 0, 1, NULL, 0),
(172, 1003, 10, 'société en participation', 0, 1, NULL, 0),
(173, 1004, 10, 'Société Anonyme (SA)', 0, 1, NULL, 0),
(174, 1005, 10, 'Société Unipersonnelle à Responsabilité Limitée (SUARL)', 0, 1, NULL, 0),
(175, 1006, 10, 'Groupement d\'intérêt économique (GEI)', 0, 1, NULL, 0),
(176, 1007, 10, 'Groupe de sociétés', 0, 1, NULL, 0),
(177, 1701, 17, 'Eenmanszaak', 0, 1, NULL, 0),
(178, 1702, 17, 'Maatschap', 0, 1, NULL, 0),
(179, 1703, 17, 'Vennootschap onder firma', 0, 1, NULL, 0),
(180, 1704, 17, 'Commanditaire vennootschap', 0, 1, NULL, 0),
(181, 1705, 17, 'Besloten vennootschap (BV)', 0, 1, NULL, 0),
(182, 1706, 17, 'Naamloze Vennootschap (NV)', 0, 1, NULL, 0),
(183, 1707, 17, 'Vereniging', 0, 1, NULL, 0),
(184, 1708, 17, 'Stichting', 0, 1, NULL, 0),
(185, 1709, 17, 'Coöperatie met beperkte aansprakelijkheid (BA)', 0, 1, NULL, 0),
(186, 1710, 17, 'Coöperatie met uitgesloten aansprakelijkheid (UA)', 0, 1, NULL, 0),
(187, 1711, 17, 'Coöperatie met wettelijke aansprakelijkheid (WA)', 0, 1, NULL, 0),
(188, 1712, 17, 'Onderlinge waarborgmaatschappij', 0, 1, NULL, 0),
(189, 401, 4, 'Empresario Individual', 0, 1, NULL, 0),
(190, 402, 4, 'Comunidad de Bienes', 0, 1, NULL, 0),
(191, 403, 4, 'Sociedad Civil', 0, 1, NULL, 0),
(192, 404, 4, 'Sociedad Colectiva', 0, 1, NULL, 0),
(193, 405, 4, 'Sociedad Limitada', 0, 1, NULL, 0),
(194, 406, 4, 'Sociedad Anónima', 0, 1, NULL, 0),
(195, 407, 4, 'Sociedad Comanditaria por Acciones', 0, 1, NULL, 0),
(196, 408, 4, 'Sociedad Comanditaria Simple', 0, 1, NULL, 0),
(197, 409, 4, 'Sociedad Laboral', 0, 1, NULL, 0),
(198, 410, 4, 'Sociedad Cooperativa', 0, 1, NULL, 0),
(199, 411, 4, 'Sociedad de Garantía Recíproca', 0, 1, NULL, 0),
(200, 412, 4, 'Entidad de Capital-Riesgo', 0, 1, NULL, 0),
(201, 413, 4, 'Agrupación de Interés Económico', 0, 1, NULL, 0),
(202, 414, 4, 'Sociedad de Inversión Mobiliaria', 0, 1, NULL, 0),
(203, 415, 4, 'Agrupación sin Ánimo de Lucro', 0, 1, NULL, 0),
(204, 15201, 152, 'Mauritius Private Company Limited By Shares', 0, 1, NULL, 0),
(205, 15202, 152, 'Mauritius Company Limited By Guarantee', 0, 1, NULL, 0),
(206, 15203, 152, 'Mauritius Public Company Limited By Shares', 0, 1, NULL, 0),
(207, 15204, 152, 'Mauritius Foreign Company', 0, 1, NULL, 0),
(208, 15205, 152, 'Mauritius GBC1 (Offshore Company)', 0, 1, NULL, 0),
(209, 15206, 152, 'Mauritius GBC2 (International Company)', 0, 1, NULL, 0),
(210, 15207, 152, 'Mauritius General Partnership', 0, 1, NULL, 0),
(211, 15208, 152, 'Mauritius Limited Partnership', 0, 1, NULL, 0),
(212, 15209, 152, 'Mauritius Sole Proprietorship', 0, 1, NULL, 0),
(213, 15210, 152, 'Mauritius Trusts', 0, 1, NULL, 0),
(214, 15401, 154, 'Sociedad en nombre colectivo', 0, 1, NULL, 0),
(215, 15402, 154, 'Sociedad en comandita simple', 0, 1, NULL, 0),
(216, 15403, 154, 'Sociedad de responsabilidad limitada', 0, 1, NULL, 0),
(217, 15404, 154, 'Sociedad anónima', 0, 1, NULL, 0),
(218, 15405, 154, 'Sociedad en comandita por acciones', 0, 1, NULL, 0),
(219, 15406, 154, 'Sociedad cooperativa', 0, 1, NULL, 0),
(220, 14001, 140, 'Entreprise individuelle', 0, 1, NULL, 0),
(221, 14002, 140, 'Société en nom collectif (SENC)', 0, 1, NULL, 0),
(222, 14003, 140, 'Société en commandite simple (SECS)', 0, 1, NULL, 0),
(223, 14004, 140, 'Société en commandite par actions (SECA)', 0, 1, NULL, 0),
(224, 14005, 140, 'Société à responsabilité limitée (SARL)', 0, 1, NULL, 0),
(225, 14006, 140, 'Société anonyme (SA)', 0, 1, NULL, 0),
(226, 14007, 140, 'Société coopérative (SC)', 0, 1, NULL, 0),
(227, 14008, 140, 'Société européenne (SE)', 0, 1, NULL, 0),
(228, 18801, 188, 'AFJ - Alte forme juridice', 0, 1, NULL, 0),
(229, 18802, 188, 'ASF - Asociatie familialã', 0, 1, NULL, 0),
(230, 18803, 188, 'CON - Concesiune', 0, 1, NULL, 0),
(231, 18804, 188, 'CRL - Soc civilã profesionala cu pers. juridica si rãspundere limitata (SPRL)', 0, 1, NULL, 0),
(232, 18805, 188, 'INC - Închiriere', 0, 1, NULL, 0),
(233, 18806, 188, 'LOC - Locaţie de gestiune', 0, 1, NULL, 0),
(234, 18807, 188, 'OC1 - Organizaţie cooperatistã meşteşugãreascã', 0, 1, NULL, 0),
(235, 18808, 188, 'OC2 - Organizaţie cooperatistã de consum', 0, 1, NULL, 0),
(236, 18809, 188, 'OC3 - Organizaţie cooperatistã de credit', 0, 1, NULL, 0),
(237, 18810, 188, 'PFA - Persoanã fizicã independentã', 0, 1, NULL, 0),
(238, 18811, 188, 'RA - Regie autonomã', 0, 1, NULL, 0),
(239, 18812, 188, 'SA - Societate comercialã pe acţiuni', 0, 1, NULL, 0),
(240, 18813, 188, 'SCS - Societate comercialã în comanditã simplã', 0, 1, NULL, 0),
(241, 18814, 188, 'SNC - Societate comercialã în nume colectiv', 0, 1, NULL, 0),
(242, 18815, 188, 'SPI - Societate profesionala practicieni in insolventa (SPPI)', 0, 1, NULL, 0),
(243, 18816, 188, 'SRL - Societate comercialã cu rãspundere limitatã', 0, 1, NULL, 0),
(244, 18817, 188, 'URL - Intreprindere profesionala unipersonala cu rãspundere limitata (IPURL)', 0, 1, NULL, 0),
(245, 17801, 178, 'Empresa individual', 0, 1, NULL, 0),
(246, 17802, 178, 'Asociación General', 0, 1, NULL, 0),
(247, 17803, 178, 'Sociedad de Responsabilidad Limitada', 0, 1, NULL, 0),
(248, 17804, 178, 'Sociedad Civil', 0, 1, NULL, 0),
(249, 17805, 178, 'Sociedad Anónima', 0, 1, NULL, 0),
(250, 1300, 13, 'Personne physique', 0, 1, NULL, 0),
(251, 1301, 13, 'Société à responsabilité limitée (SARL)', 0, 1, NULL, 0),
(252, 1302, 13, 'Entreprise unipersonnelle à responsabilité limitée (EURL)', 0, 1, NULL, 0),
(253, 1303, 13, 'Société en Nom Collectif (SNC)', 0, 1, NULL, 0),
(254, 1304, 13, 'société par actions (SPA)', 0, 1, NULL, 0),
(255, 1305, 13, 'Société en Commandite Simple (SCS)', 0, 1, NULL, 0),
(256, 1306, 13, 'Société en commandite par actions (SCA)', 0, 1, NULL, 0),
(257, 1307, 13, 'Société en participation', 0, 1, NULL, 0),
(258, 1308, 13, 'Groupe de sociétés', 0, 1, NULL, 0);

-- --------------------------------------------------------

--
-- Structure de la table `llx_c_holiday_types`
--

CREATE TABLE `llx_c_holiday_types` (
  `rowid` int(11) NOT NULL,
  `code` varchar(16) NOT NULL,
  `label` varchar(255) NOT NULL,
  `affect` int(11) NOT NULL,
  `delay` int(11) NOT NULL,
  `newByMonth` double(8,5) NOT NULL DEFAULT 0.00000,
  `fk_country` int(11) DEFAULT NULL,
  `active` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `llx_c_holiday_types`
--

INSERT INTO `llx_c_holiday_types` (`rowid`, `code`, `label`, `affect`, `delay`, `newByMonth`, `fk_country`, `active`) VALUES
(1, 'LEAVE_SICK', 'Sick leave', 0, 0, 0.00000, NULL, 1),
(2, 'LEAVE_OTHER', 'Other leave', 0, 0, 0.00000, NULL, 1),
(3, 'LEAVE_PAID', 'Paid vacation', 1, 7, 0.00000, NULL, 0),
(4, 'LEAVE_RTT_FR', 'RTT', 1, 7, 0.83000, 1, 1),
(5, 'LEAVE_PAID_FR', 'Paid vacation', 1, 30, 2.08334, 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `llx_c_hrm_department`
--

CREATE TABLE `llx_c_hrm_department` (
  `rowid` int(11) NOT NULL,
  `pos` tinyint(4) NOT NULL DEFAULT 0,
  `code` varchar(16) NOT NULL,
  `label` varchar(50) DEFAULT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `llx_c_hrm_department`
--

INSERT INTO `llx_c_hrm_department` (`rowid`, `pos`, `code`, `label`, `active`) VALUES
(1, 5, 'MANAGEMENT', 'Management', 1),
(3, 15, 'TRAINING', 'Training', 1),
(4, 20, 'IT', 'Inform. Technology (IT)', 0),
(5, 25, 'MARKETING', 'Marketing', 0),
(6, 30, 'SALES', 'Sales', 1),
(7, 35, 'LEGAL', 'Legal', 0),
(8, 40, 'FINANCIAL', 'Financial accounting', 1),
(9, 45, 'HUMANRES', 'Human resources', 1),
(10, 50, 'PURCHASING', 'Purchasing', 1),
(12, 60, 'CUSTOMSERV', 'Customer service', 0),
(14, 70, 'LOGISTIC', 'Logistics', 1),
(15, 75, 'CONSTRUCT', 'Engineering/design', 0),
(16, 80, 'PRODUCTION', 'Production', 1),
(17, 85, 'QUALITY', 'Quality assurance', 0);

-- --------------------------------------------------------

--
-- Structure de la table `llx_c_hrm_function`
--

CREATE TABLE `llx_c_hrm_function` (
  `rowid` int(11) NOT NULL,
  `pos` tinyint(4) NOT NULL DEFAULT 0,
  `code` varchar(16) NOT NULL,
  `label` varchar(50) DEFAULT NULL,
  `c_level` tinyint(4) NOT NULL DEFAULT 0,
  `active` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `llx_c_hrm_function`
--

INSERT INTO `llx_c_hrm_function` (`rowid`, `pos`, `code`, `label`, `c_level`, `active`) VALUES
(1, 5, 'EXECBOARD', 'Executive board', 0, 1),
(2, 10, 'MANAGDIR', 'Managing director', 1, 1),
(3, 15, 'ACCOUNTMANAG', 'Account manager', 0, 1),
(4, 20, 'ENGAGDIR', 'Engagement director', 1, 1),
(5, 25, 'DIRECTOR', 'Director', 1, 1),
(6, 30, 'PROJMANAG', 'Project manager', 0, 1),
(7, 35, 'DEPHEAD', 'Department head', 0, 1),
(8, 40, 'SECRETAR', 'Secretary', 0, 1),
(9, 45, 'EMPLOYEE', 'Department employee', 0, 1);

-- --------------------------------------------------------

--
-- Structure de la table `llx_c_hrm_public_holiday`
--

CREATE TABLE `llx_c_hrm_public_holiday` (
  `id` int(11) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 0,
  `fk_country` int(11) DEFAULT NULL,
  `code` varchar(62) DEFAULT NULL,
  `dayrule` varchar(64) DEFAULT '',
  `day` int(11) DEFAULT NULL,
  `month` int(11) DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  `active` int(11) DEFAULT 1,
  `import_key` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `llx_c_hrm_public_holiday`
--

INSERT INTO `llx_c_hrm_public_holiday` (`id`, `entity`, `fk_country`, `code`, `dayrule`, `day`, `month`, `year`, `active`, `import_key`) VALUES
(1, 0, 0, 'NEWYEARDAY1', '', 1, 1, 0, 1, NULL),
(2, 0, 0, 'LABORDAY1', '', 1, 5, 0, 1, NULL),
(3, 0, 0, 'ASSOMPTIONDAY1', '', 15, 8, 0, 1, NULL),
(4, 0, 0, 'CHRISTMASDAY1', '', 25, 12, 0, 1, NULL),
(5, 0, 1, 'FR-VICTORYDAY', '', 8, 5, 0, 1, NULL),
(6, 0, 1, 'FR-NATIONALDAY', '', 14, 7, 0, 1, NULL),
(7, 0, 1, 'FR-ASSOMPTION', '', 15, 8, 0, 1, NULL),
(8, 0, 1, 'FR-TOUSSAINT', '', 1, 11, 0, 1, NULL),
(9, 0, 1, 'FR-ARMISTICE', '', 11, 11, 0, 1, NULL),
(10, 0, 1, 'FR-EASTER', 'eastermonday', 0, 0, 0, 1, NULL),
(11, 0, 1, 'FR-ASCENSION', 'ascension', 0, 0, 0, 1, NULL),
(12, 0, 1, 'FR-PENTECOST', 'pentecost', 0, 0, 0, 1, NULL),
(13, 0, 3, 'IT-LIBEAZIONE', '', 25, 4, 0, 1, NULL),
(14, 0, 3, 'IT-EPIPHANY', '', 1, 6, 0, 1, NULL),
(15, 0, 3, 'IT-REPUBBLICA', '', 2, 6, 0, 1, NULL),
(16, 0, 3, 'IT-TUTTISANTIT', '', 1, 11, 0, 1, NULL),
(17, 0, 3, 'IT-IMMACULE', '', 8, 12, 0, 1, NULL),
(18, 0, 3, 'IT-SAINTSTEFAN', '', 26, 12, 0, 1, NULL),
(19, 0, 4, 'ES-EASTER', 'easter', 0, 0, 0, 1, NULL),
(20, 0, 4, 'ES-REYE', '', 1, 6, 0, 1, NULL),
(21, 0, 4, 'ES-HISPANIDAD', '', 12, 10, 0, 1, NULL),
(22, 0, 4, 'ES-TOUSSAINT', '', 1, 11, 0, 1, NULL),
(23, 0, 4, 'ES-CONSTITUIZION', '', 6, 12, 0, 1, NULL),
(24, 0, 4, 'ES-IMMACULE', '', 8, 12, 0, 1, NULL),
(25, 0, 41, 'AT-EASTER', 'eastermonday', 0, 0, 0, 1, NULL),
(26, 0, 41, 'AT-ASCENSION', 'ascension', 0, 0, 0, 1, NULL),
(27, 0, 41, 'AT-PENTECOST', 'pentecost', 0, 0, 0, 1, NULL),
(28, 0, 41, 'AT-FRONLEICHNAM', 'fronleichnam', 0, 0, 0, 1, NULL),
(29, 0, 41, 'AT-KONEGIE', '', 1, 6, 0, 1, NULL),
(30, 0, 41, 'AT-26OKT', '', 26, 10, 0, 1, NULL),
(31, 0, 41, 'AT-TOUSSAINT', '', 1, 11, 0, 1, NULL),
(32, 0, 41, 'AT-IMMACULE', '', 8, 12, 0, 1, NULL),
(33, 0, 41, 'AT-24DEC', '', 24, 12, 0, 1, NULL),
(34, 0, 41, 'AT-SAINTSTEFAN', '', 26, 12, 0, 1, NULL),
(35, 0, 41, 'AT-Silvester', '', 31, 12, 0, 1, NULL),
(36, 0, 117, 'IN-REPUBLICDAY', '', 26, 1, 0, 1, NULL),
(37, 0, 117, 'IN-GANDI', '', 2, 10, 0, 1, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `llx_c_incoterms`
--

CREATE TABLE `llx_c_incoterms` (
  `rowid` int(11) NOT NULL,
  `code` varchar(3) NOT NULL,
  `label` varchar(100) DEFAULT NULL,
  `libelle` varchar(255) NOT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `llx_c_incoterms`
--

INSERT INTO `llx_c_incoterms` (`rowid`, `code`, `label`, `libelle`, `active`) VALUES
(1, 'EXW', 'Ex Works', 'Ex Works, au départ non chargé, non dédouané sortie d\'usine (uniquement adapté aux flux domestiques, nationaux)', 1),
(2, 'FCA', 'Free Carrier', 'Free Carrier, marchandises dédouanées et chargées dans le pays de départ, chez le vendeur ou chez le commissionnaire de transport de l\'acheteur', 1),
(3, 'FAS', 'Free Alongside Ship', 'Free Alongside Ship, sur le quai du port de départ', 1),
(4, 'FOB', 'Free On Board', 'Free On Board, chargé sur le bateau, les frais de chargement dans celui-ci étant fonction du liner term indiqué par la compagnie maritime (à la charge du vendeur)', 1),
(5, 'CFR', 'Cost and Freight', 'Cost and Freight, chargé dans le bateau, livraison au port de départ, frais payés jusqu\'au port d\'arrivée, sans assurance pour le transport, non déchargé du navire à destination (les frais de déchargement sont inclus ou non au port d\'arrivée)', 1),
(6, 'CIF', 'Cost, Insurance, Freight', 'Cost, Insurance and Freight, chargé sur le bateau, frais jusqu\'au port d\'arrivée, avec l\'assurance marchandise transportée souscrite par le vendeur pour le compte de l\'acheteur', 1),
(7, 'CPT', 'Carriage Paid To', 'Carriage Paid To, livraison au premier transporteur, frais jusqu\'au déchargement du mode de transport, sans assurance pour le transport', 1),
(8, 'CIP', 'Carriage Insurance Paid', 'Carriage and Insurance Paid to, idem CPT, avec assurance marchandise transportée souscrite par le vendeur pour le compte de l\'acheteur', 1),
(9, 'DAT', 'Delivered At Terminal', 'Delivered At Terminal, marchandises (déchargées) livrées sur quai, dans un terminal maritime, fluvial, aérien, routier ou ferroviaire désigné (dédouanement import, et post-acheminement payés par l\'acheteur)', 1),
(10, 'DAP', 'Delivered At Place', 'Delivered At Place, marchandises (non déchargées) mises à disposition de l\'acheteur dans le pays d\'importation au lieu précisé dans le contrat (déchargement, dédouanement import payé par l\'acheteur)', 1),
(11, 'DDP', 'Delivered Duty Paid', 'Delivered Duty Paid, marchandises (non déchargées) livrées à destination finale, dédouanement import et taxes à la charge du vendeur ; l\'acheteur prend en charge uniquement le déchargement (si exclusion des taxes type TVA, le préciser clairement)', 1),
(12, 'DPU', 'Delivered at Place Unloaded', 'Delivered at Place unloaded', 1);

-- --------------------------------------------------------

--
-- Structure de la table `llx_c_input_method`
--

CREATE TABLE `llx_c_input_method` (
  `rowid` int(11) NOT NULL,
  `code` varchar(30) DEFAULT NULL,
  `libelle` varchar(60) DEFAULT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1,
  `module` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `llx_c_input_method`
--

INSERT INTO `llx_c_input_method` (`rowid`, `code`, `libelle`, `active`, `module`) VALUES
(1, 'OrderByMail', 'Courrier', 1, NULL),
(2, 'OrderByFax', 'Fax', 1, NULL),
(3, 'OrderByEMail', 'EMail', 1, NULL),
(4, 'OrderByPhone', 'Téléphone', 1, NULL),
(5, 'OrderByWWW', 'En ligne', 1, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `llx_c_input_reason`
--

CREATE TABLE `llx_c_input_reason` (
  `rowid` int(11) NOT NULL,
  `code` varchar(30) DEFAULT NULL,
  `label` varchar(60) DEFAULT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1,
  `module` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `llx_c_input_reason`
--

INSERT INTO `llx_c_input_reason` (`rowid`, `code`, `label`, `active`, `module`) VALUES
(1, 'SRC_INTE', 'Web site', 1, NULL),
(2, 'SRC_CAMP_MAIL', 'Mailing campaign', 1, NULL),
(3, 'SRC_CAMP_PHO', 'Phone campaign', 1, NULL),
(4, 'SRC_CAMP_FAX', 'Fax campaign', 1, NULL),
(5, 'SRC_COMM', 'Commercial contact', 1, NULL),
(6, 'SRC_SHOP', 'Shop contact', 1, NULL),
(7, 'SRC_CAMP_EMAIL', 'EMailing campaign', 1, NULL),
(8, 'SRC_WOM', 'Word of mouth', 1, NULL),
(9, 'SRC_PARTNER', 'Partner', 1, NULL),
(10, 'SRC_EMPLOYEE', 'Employee', 1, NULL),
(11, 'SRC_SPONSORING', 'Sponsorship', 1, NULL),
(12, 'SRC_CUSTOMER', 'Incoming contact of a customer', 1, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `llx_c_lead_status`
--

CREATE TABLE `llx_c_lead_status` (
  `rowid` int(11) NOT NULL,
  `code` varchar(10) DEFAULT NULL,
  `label` varchar(50) DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `percent` double(5,2) DEFAULT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `llx_c_lead_status`
--

INSERT INTO `llx_c_lead_status` (`rowid`, `code`, `label`, `position`, `percent`, `active`) VALUES
(1, 'PROSP', 'Prospection', 10, 0.00, 1),
(2, 'QUAL', 'Qualification', 20, 20.00, 1),
(3, 'PROPO', 'Proposal', 30, 40.00, 1),
(4, 'NEGO', 'Negotiation', 40, 60.00, 1),
(5, 'PENDING', 'Pending', 50, 50.00, 0),
(6, 'WON', 'Won', 60, 100.00, 1),
(7, 'LOST', 'Lost', 70, 0.00, 1);

-- --------------------------------------------------------

--
-- Structure de la table `llx_c_paiement`
--

CREATE TABLE `llx_c_paiement` (
  `id` int(11) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `code` varchar(6) NOT NULL,
  `libelle` varchar(62) DEFAULT NULL,
  `type` smallint(6) DEFAULT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1,
  `accountancy_code` varchar(32) DEFAULT NULL,
  `module` varchar(32) DEFAULT NULL,
  `position` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `llx_c_paiement`
--

INSERT INTO `llx_c_paiement` (`id`, `entity`, `code`, `libelle`, `type`, `active`, `accountancy_code`, `module`, `position`) VALUES
(1, 1, 'TIP', 'TIP', 2, 0, NULL, NULL, 0),
(2, 1, 'VIR', 'Transfer', 2, 1, NULL, NULL, 0),
(3, 1, 'PRE', 'Debit order', 2, 1, NULL, NULL, 0),
(4, 1, 'LIQ', 'Cash', 2, 1, NULL, NULL, 0),
(6, 1, 'CB', 'Credit card', 2, 1, NULL, NULL, 0),
(7, 1, 'CHQ', 'Cheque', 2, 1, NULL, NULL, 0),
(50, 1, 'VAD', 'Online payment', 2, 0, NULL, NULL, 0),
(51, 1, 'TRA', 'Traite', 2, 0, NULL, NULL, 0),
(52, 1, 'LCR', 'LCR', 2, 0, NULL, NULL, 0),
(53, 1, 'FAC', 'Factor', 2, 0, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Structure de la table `llx_c_paper_format`
--

CREATE TABLE `llx_c_paper_format` (
  `rowid` int(11) NOT NULL,
  `code` varchar(16) NOT NULL,
  `label` varchar(50) NOT NULL,
  `width` float(6,2) DEFAULT 0.00,
  `height` float(6,2) DEFAULT 0.00,
  `unit` varchar(5) NOT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1,
  `module` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `llx_c_paper_format`
--

INSERT INTO `llx_c_paper_format` (`rowid`, `code`, `label`, `width`, `height`, `unit`, `active`, `module`) VALUES
(1, 'EU4A0', 'Format 4A0', 1682.00, 2378.00, 'mm', 1, NULL),
(2, 'EU2A0', 'Format 2A0', 1189.00, 1682.00, 'mm', 1, NULL),
(3, 'EUA0', 'Format A0', 840.00, 1189.00, 'mm', 1, NULL),
(4, 'EUA1', 'Format A1', 594.00, 840.00, 'mm', 1, NULL),
(5, 'EUA2', 'Format A2', 420.00, 594.00, 'mm', 1, NULL),
(6, 'EUA3', 'Format A3', 297.00, 420.00, 'mm', 1, NULL),
(7, 'EUA4', 'Format A4', 210.00, 297.00, 'mm', 1, NULL),
(8, 'EUA5', 'Format A5', 148.00, 210.00, 'mm', 1, NULL),
(9, 'EUA6', 'Format A6', 105.00, 148.00, 'mm', 1, NULL),
(100, 'USLetter', 'Format Letter (A)', 216.00, 279.00, 'mm', 1, NULL),
(105, 'USLegal', 'Format Legal', 216.00, 356.00, 'mm', 1, NULL),
(110, 'USExecutive', 'Format Executive', 190.00, 254.00, 'mm', 1, NULL),
(115, 'USLedger', 'Format Ledger/Tabloid (B)', 279.00, 432.00, 'mm', 1, NULL),
(200, 'CAP1', 'Format Canadian P1', 560.00, 860.00, 'mm', 1, NULL),
(205, 'CAP2', 'Format Canadian P2', 430.00, 560.00, 'mm', 1, NULL),
(210, 'CAP3', 'Format Canadian P3', 280.00, 430.00, 'mm', 1, NULL),
(215, 'CAP4', 'Format Canadian P4', 215.00, 280.00, 'mm', 1, NULL),
(220, 'CAP5', 'Format Canadian P5', 140.00, 215.00, 'mm', 1, NULL),
(225, 'CAP6', 'Format Canadian P6', 107.00, 140.00, 'mm', 1, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `llx_c_partnership_type`
--

CREATE TABLE `llx_c_partnership_type` (
  `rowid` int(11) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `code` varchar(32) NOT NULL,
  `label` varchar(64) NOT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_c_payment_term`
--

CREATE TABLE `llx_c_payment_term` (
  `rowid` int(11) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `code` varchar(16) DEFAULT NULL,
  `sortorder` smallint(6) DEFAULT NULL,
  `active` tinyint(4) DEFAULT 1,
  `libelle` varchar(255) DEFAULT NULL,
  `libelle_facture` text DEFAULT NULL,
  `type_cdr` tinyint(4) DEFAULT NULL,
  `nbjour` smallint(6) DEFAULT NULL,
  `decalage` smallint(6) DEFAULT NULL,
  `module` varchar(32) DEFAULT NULL,
  `position` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `llx_c_payment_term`
--

INSERT INTO `llx_c_payment_term` (`rowid`, `entity`, `code`, `sortorder`, `active`, `libelle`, `libelle_facture`, `type_cdr`, `nbjour`, `decalage`, `module`, `position`) VALUES
(1, 1, 'RECEP', 1, 1, 'Due upon receipt', 'Due upon receipt', 0, 1, NULL, NULL, 0),
(2, 1, '30D', 2, 1, '30 days', 'Due in 30 days', 0, 30, NULL, NULL, 0),
(3, 1, '30DENDMONTH', 3, 1, '30 days end of month', 'Due in 30 days, end of month', 1, 30, NULL, NULL, 0),
(4, 1, '60D', 4, 1, '60 days', 'Due in 60 days, end of month', 0, 60, NULL, NULL, 0),
(5, 1, '60DENDMONTH', 5, 1, '60 days end of month', 'Due in 60 days, end of month', 1, 60, NULL, NULL, 0),
(6, 1, 'PT_ORDER', 6, 1, 'Due on order', 'Due on order', 0, 1, NULL, NULL, 0),
(7, 1, 'PT_DELIVERY', 7, 1, 'Due on delivery', 'Due on delivery', 0, 1, NULL, NULL, 0),
(8, 1, 'PT_5050', 8, 1, '50 and 50', '50% on order, 50% on delivery', 0, 1, NULL, NULL, 0),
(9, 1, '10D', 9, 1, '10 days', 'Due in 10 days', 0, 10, NULL, NULL, 0),
(10, 1, '10DENDMONTH', 10, 1, '10 days end of month', 'Due in 10 days, end of month', 1, 10, NULL, NULL, 0),
(11, 1, '14D', 11, 1, '14 days', 'Due in 14 days', 0, 14, NULL, NULL, 0),
(12, 1, '14DENDMONTH', 12, 1, '14 days end of month', 'Due in 14 days, end of month', 1, 14, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Structure de la table `llx_c_price_expression`
--

CREATE TABLE `llx_c_price_expression` (
  `rowid` int(11) NOT NULL,
  `title` varchar(20) NOT NULL,
  `expression` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_c_price_global_variable`
--

CREATE TABLE `llx_c_price_global_variable` (
  `rowid` int(11) NOT NULL,
  `code` varchar(20) NOT NULL,
  `description` text DEFAULT NULL,
  `value` double(24,8) DEFAULT 0.00000000
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_c_price_global_variable_updater`
--

CREATE TABLE `llx_c_price_global_variable_updater` (
  `rowid` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `description` text DEFAULT NULL,
  `parameters` text DEFAULT NULL,
  `fk_variable` int(11) NOT NULL,
  `update_interval` int(11) DEFAULT 0,
  `next_update` int(11) DEFAULT 0,
  `last_status` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_c_productbatch_qcstatus`
--

CREATE TABLE `llx_c_productbatch_qcstatus` (
  `rowid` int(11) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `code` varchar(16) NOT NULL,
  `label` varchar(50) NOT NULL,
  `active` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `llx_c_productbatch_qcstatus`
--

INSERT INTO `llx_c_productbatch_qcstatus` (`rowid`, `entity`, `code`, `label`, `active`) VALUES
(1, 1, 'OK', 'InWorkingOrder', 1),
(2, 1, 'KO', 'OutOfOrder', 1);

-- --------------------------------------------------------

--
-- Structure de la table `llx_c_product_nature`
--

CREATE TABLE `llx_c_product_nature` (
  `rowid` int(11) NOT NULL,
  `code` tinyint(4) NOT NULL,
  `label` varchar(100) DEFAULT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `llx_c_product_nature`
--

INSERT INTO `llx_c_product_nature` (`rowid`, `code`, `label`, `active`) VALUES
(1, 0, 'RowMaterial', 1),
(2, 1, 'Finished', 1);

-- --------------------------------------------------------

--
-- Structure de la table `llx_c_propalst`
--

CREATE TABLE `llx_c_propalst` (
  `id` smallint(6) NOT NULL,
  `code` varchar(12) NOT NULL,
  `label` varchar(30) DEFAULT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `llx_c_propalst`
--

INSERT INTO `llx_c_propalst` (`id`, `code`, `label`, `active`) VALUES
(0, 'PR_DRAFT', 'Brouillon', 1),
(1, 'PR_OPEN', 'Ouverte', 1),
(2, 'PR_SIGNED', 'Signée', 1),
(3, 'PR_NOTSIGNED', 'Non Signée', 1),
(4, 'PR_FAC', 'Facturée', 1);

-- --------------------------------------------------------

--
-- Structure de la table `llx_c_prospectcontactlevel`
--

CREATE TABLE `llx_c_prospectcontactlevel` (
  `code` varchar(12) NOT NULL,
  `label` varchar(30) DEFAULT NULL,
  `sortorder` smallint(6) DEFAULT NULL,
  `active` smallint(6) NOT NULL DEFAULT 1,
  `module` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `llx_c_prospectcontactlevel`
--

INSERT INTO `llx_c_prospectcontactlevel` (`code`, `label`, `sortorder`, `active`, `module`) VALUES
('PL_HIGH', 'High', 4, 1, NULL),
('PL_LOW', 'Low', 2, 1, NULL),
('PL_MEDIUM', 'Medium', 3, 1, NULL),
('PL_NONE', 'None', 1, 1, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `llx_c_prospectlevel`
--

CREATE TABLE `llx_c_prospectlevel` (
  `code` varchar(12) NOT NULL,
  `label` varchar(30) DEFAULT NULL,
  `sortorder` smallint(6) DEFAULT NULL,
  `active` smallint(6) NOT NULL DEFAULT 1,
  `module` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `llx_c_prospectlevel`
--

INSERT INTO `llx_c_prospectlevel` (`code`, `label`, `sortorder`, `active`, `module`) VALUES
('PL_HIGH', 'High', 4, 1, NULL),
('PL_LOW', 'Low', 2, 1, NULL),
('PL_MEDIUM', 'Medium', 3, 1, NULL),
('PL_NONE', 'None', 1, 1, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `llx_c_recruitment_origin`
--

CREATE TABLE `llx_c_recruitment_origin` (
  `rowid` int(11) NOT NULL,
  `code` varchar(32) NOT NULL,
  `label` varchar(64) NOT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_c_regions`
--

CREATE TABLE `llx_c_regions` (
  `rowid` int(11) NOT NULL,
  `code_region` int(11) NOT NULL,
  `fk_pays` int(11) NOT NULL,
  `cheflieu` varchar(50) DEFAULT NULL,
  `tncc` int(11) DEFAULT NULL,
  `nom` varchar(100) DEFAULT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `llx_c_regions`
--

INSERT INTO `llx_c_regions` (`rowid`, `code_region`, `fk_pays`, `cheflieu`, `tncc`, `nom`, `active`) VALUES
(1, 0, 0, '0', 0, '-', 1),
(2, 1301, 13, '', 0, 'Algerie', 1),
(3, 34000, 34, 'AD', NULL, 'Andorra', 1),
(4, 35001, 35, 'AO', NULL, 'Angola', 1),
(5, 2301, 23, '', 0, 'Norte', 1),
(6, 2302, 23, '', 0, 'Litoral', 1),
(7, 2303, 23, '', 0, 'Cuyana', 1),
(8, 2304, 23, '', 0, 'Central', 1),
(9, 2305, 23, '', 0, 'Patagonia', 1),
(10, 2801, 28, '', 0, 'Australia', 1),
(11, 4101, 41, '', 0, 'Österreich', 1),
(12, 4601, 46, '', 0, 'Barbados', 1),
(13, 201, 2, '', 1, 'Flandre', 1),
(14, 202, 2, '', 2, 'Wallonie', 1),
(15, 203, 2, '', 3, 'Bruxelles-Capitale', 1),
(16, 5201, 52, '', 0, 'Chuquisaca', 1),
(17, 5202, 52, '', 0, 'La Paz', 1),
(18, 5203, 52, '', 0, 'Cochabamba', 1),
(19, 5204, 52, '', 0, 'Oruro', 1),
(20, 5205, 52, '', 0, 'Potosí', 1),
(21, 5206, 52, '', 0, 'Tarija', 1),
(22, 5207, 52, '', 0, 'Santa Cruz', 1),
(23, 5208, 52, '', 0, 'El Beni', 1),
(24, 5209, 52, '', 0, 'Pando', 1),
(25, 5601, 56, '', 0, 'Brasil', 1),
(26, 1401, 14, '', 0, 'Canada', 1),
(27, 6701, 67, NULL, NULL, 'Tarapacá', 1),
(28, 6702, 67, NULL, NULL, 'Antofagasta', 1),
(29, 6703, 67, NULL, NULL, 'Atacama', 1),
(30, 6704, 67, NULL, NULL, 'Coquimbo', 1),
(31, 6705, 67, NULL, NULL, 'Valparaíso', 1),
(32, 6706, 67, NULL, NULL, 'General Bernardo O Higgins', 1),
(33, 6707, 67, NULL, NULL, 'Maule', 1),
(34, 6708, 67, NULL, NULL, 'Biobío', 1),
(35, 6709, 67, NULL, NULL, 'Raucanía', 1),
(36, 6710, 67, NULL, NULL, 'Los Lagos', 1),
(37, 6711, 67, NULL, NULL, 'Aysén General Carlos Ibáñez del Campo', 1),
(38, 6712, 67, NULL, NULL, 'Magallanes y Antártica Chilena', 1),
(39, 6713, 67, NULL, NULL, 'Metropolitana de Santiago', 1),
(40, 6714, 67, NULL, NULL, 'Los Ríos', 1),
(41, 6715, 67, NULL, NULL, 'Arica y Parinacota', 1),
(42, 901, 9, '京', 0, '北京市', 1),
(43, 902, 9, '津', 0, '天津市', 1),
(44, 903, 9, '沪', 0, '上海市', 1),
(45, 904, 9, '渝', 0, '重庆市', 1),
(46, 905, 9, '冀', 0, '河北省', 1),
(47, 906, 9, '晋', 0, '山西省', 1),
(48, 907, 9, '辽', 0, '辽宁省', 1),
(49, 908, 9, '吉', 0, '吉林省', 1),
(50, 909, 9, '黑', 0, '黑龙江省', 1),
(51, 910, 9, '苏', 0, '江苏省', 1),
(52, 911, 9, '浙', 0, '浙江省', 1),
(53, 912, 9, '皖', 0, '安徽省', 1),
(54, 913, 9, '闽', 0, '福建省', 1),
(55, 914, 9, '赣', 0, '江西省', 1),
(56, 915, 9, '鲁', 0, '山东省', 1),
(57, 916, 9, '豫', 0, '河南省', 1),
(58, 917, 9, '鄂', 0, '湖北省', 1),
(59, 918, 9, '湘', 0, '湖南省', 1),
(60, 919, 9, '粤', 0, '广东省', 1),
(61, 920, 9, '琼', 0, '海南省', 1),
(62, 921, 9, '川', 0, '四川省', 1),
(63, 922, 9, '贵', 0, '贵州省', 1),
(64, 923, 9, '云', 0, '云南省', 1),
(65, 924, 9, '陕', 0, '陕西省', 1),
(66, 925, 9, '甘', 0, '甘肃省', 1),
(67, 926, 9, '青', 0, '青海省', 1),
(68, 927, 9, '台', 0, '台湾省', 1),
(69, 928, 9, '蒙', 0, '内蒙古自治区', 1),
(70, 929, 9, '桂', 0, '广西壮族自治区', 1),
(71, 930, 9, '藏', 0, '西藏自治区', 1),
(72, 931, 9, '宁', 0, '宁夏回族自治区', 1),
(73, 932, 9, '新', 0, '新疆维吾尔自治区', 1),
(74, 933, 9, '港', 0, '香港特别行政区', 1),
(75, 934, 9, '澳', 0, '澳门特别行政区', 1),
(76, 7001, 70, '', 0, 'Colombie', 1),
(77, 8001, 80, '', 0, 'Nordjylland', 1),
(78, 8002, 80, '', 0, 'Midtjylland', 1),
(79, 8003, 80, '', 0, 'Syddanmark', 1),
(80, 8004, 80, '', 0, 'Hovedstaden', 1),
(81, 8005, 80, '', 0, 'Sjælland', 1),
(82, 1, 1, '97105', 3, 'Guadeloupe', 1),
(83, 2, 1, '97209', 3, 'Martinique', 1),
(84, 3, 1, '97302', 3, 'Guyane', 1),
(85, 4, 1, '97411', 3, 'Réunion', 1),
(86, 6, 1, '97601', 3, 'Mayotte', 1),
(87, 11, 1, '75056', 1, 'Île-de-France', 1),
(88, 24, 1, '45234', 2, 'Centre-Val de Loire', 1),
(89, 27, 1, '21231', 0, 'Bourgogne-Franche-Comté', 1),
(90, 28, 1, '76540', 0, 'Normandie', 1),
(91, 32, 1, '59350', 4, 'Hauts-de-France', 1),
(92, 44, 1, '67482', 2, 'Grand Est', 1),
(93, 52, 1, '44109', 4, 'Pays de la Loire', 1),
(94, 53, 1, '35238', 0, 'Bretagne', 1),
(95, 75, 1, '33063', 0, 'Nouvelle-Aquitaine', 1),
(96, 76, 1, '31355', 1, 'Occitanie', 1),
(97, 84, 1, '69123', 1, 'Auvergne-Rhône-Alpes', 1),
(98, 93, 1, '13055', 0, 'Provence-Alpes-Côte d\'Azur', 1),
(99, 94, 1, '2A004', 0, 'Corse', 1),
(100, 501, 5, '', 0, 'Deutschland', 1),
(101, 10201, 102, NULL, NULL, 'Αττική', 1),
(102, 10202, 102, NULL, NULL, 'Στερεά Ελλάδα', 1),
(103, 10203, 102, NULL, NULL, 'Κεντρική Μακεδονία', 1),
(104, 10204, 102, NULL, NULL, 'Κρήτη', 1),
(105, 10205, 102, NULL, NULL, 'Ανατολική Μακεδονία και Θράκη', 1),
(106, 10206, 102, NULL, NULL, 'Ήπειρος', 1),
(107, 10207, 102, NULL, NULL, 'Ιόνια νησιά', 1),
(108, 10208, 102, NULL, NULL, 'Βόρειο Αιγαίο', 1),
(109, 10209, 102, NULL, NULL, 'Πελοπόννησος', 1),
(110, 10210, 102, NULL, NULL, 'Νότιο Αιγαίο', 1),
(111, 10211, 102, NULL, NULL, 'Δυτική Ελλάδα', 1),
(112, 10212, 102, NULL, NULL, 'Θεσσαλία', 1),
(113, 10213, 102, NULL, NULL, 'Δυτική Μακεδονία', 1),
(114, 11401, 114, '', 0, 'Honduras', 1),
(115, 180100, 18, 'HU1', NULL, 'Közép-Magyarország', 1),
(116, 182100, 18, 'HU21', NULL, 'Közép-Dunántúl', 1),
(117, 182200, 18, 'HU22', NULL, 'Nyugat-Dunántúl', 1),
(118, 182300, 18, 'HU23', NULL, 'Dél-Dunántúl', 1),
(119, 183100, 18, 'HU31', NULL, 'Észak-Magyarország', 1),
(120, 183200, 18, 'HU32', NULL, 'Észak-Alföld', 1),
(121, 183300, 18, 'HU33', NULL, 'Dél-Alföld', 1),
(122, 11701, 117, '', 0, 'India', 1),
(123, 11801, 118, '', 0, 'Indonesia', 1),
(124, 301, 3, NULL, 1, 'Abruzzo', 1),
(125, 302, 3, NULL, 1, 'Basilicata', 1),
(126, 303, 3, NULL, 1, 'Calabria', 1),
(127, 304, 3, NULL, 1, 'Campania', 1),
(128, 305, 3, NULL, 1, 'Emilia-Romagna', 1),
(129, 306, 3, NULL, 1, 'Friuli-Venezia Giulia', 1),
(130, 307, 3, NULL, 1, 'Lazio', 1),
(131, 308, 3, NULL, 1, 'Liguria', 1),
(132, 309, 3, NULL, 1, 'Lombardia', 1),
(133, 310, 3, NULL, 1, 'Marche', 1),
(134, 311, 3, NULL, 1, 'Molise', 1),
(135, 312, 3, NULL, 1, 'Piemonte', 1),
(136, 313, 3, NULL, 1, 'Puglia', 1),
(137, 314, 3, NULL, 1, 'Sardegna', 1),
(138, 315, 3, NULL, 1, 'Sicilia', 1),
(139, 316, 3, NULL, 1, 'Toscana', 1),
(140, 317, 3, NULL, 1, 'Trentino-Alto Adige', 1),
(141, 318, 3, NULL, 1, 'Umbria', 1),
(142, 319, 3, NULL, 1, 'Valle d Aosta', 1),
(143, 320, 3, NULL, 1, 'Veneto', 1),
(144, 14001, 140, '', 0, 'Diekirch', 1),
(145, 14002, 140, '', 0, 'Grevenmacher', 1),
(146, 14003, 140, '', 0, 'Luxembourg', 1),
(147, 15201, 152, '', 0, 'Rivière Noire', 1),
(148, 15202, 152, '', 0, 'Flacq', 1),
(149, 15203, 152, '', 0, 'Grand Port', 1),
(150, 15204, 152, '', 0, 'Moka', 1),
(151, 15205, 152, '', 0, 'Pamplemousses', 1),
(152, 15206, 152, '', 0, 'Plaines Wilhems', 1),
(153, 15207, 152, '', 0, 'Port-Louis', 1),
(154, 15208, 152, '', 0, 'Rivière du Rempart', 1),
(155, 15209, 152, '', 0, 'Savanne', 1),
(156, 15210, 152, '', 0, 'Rodrigues', 1),
(157, 15211, 152, '', 0, 'Les îles Agaléga', 1),
(158, 15212, 152, '', 0, 'Les écueils des Cargados Carajos', 1),
(159, 15401, 154, '', 0, 'Mexique', 1),
(160, 1201, 12, '', 0, 'Tanger-Tétouan', 1),
(161, 1202, 12, '', 0, 'Gharb-Chrarda-Beni Hssen', 1),
(162, 1203, 12, '', 0, 'Taza-Al Hoceima-Taounate', 1),
(163, 1204, 12, '', 0, 'L\'Oriental', 1),
(164, 1205, 12, '', 0, 'Fès-Boulemane', 1),
(165, 1206, 12, '', 0, 'Meknès-Tafialet', 1),
(166, 1207, 12, '', 0, 'Rabat-Salé-Zemour-Zaër', 1),
(167, 1208, 12, '', 0, 'Grand Cassablanca', 1),
(168, 1209, 12, '', 0, 'Chaouia-Ouardigha', 1),
(169, 1210, 12, '', 0, 'Doukahla-Adba', 1),
(170, 1211, 12, '', 0, 'Marrakech-Tensift-Al Haouz', 1),
(171, 1212, 12, '', 0, 'Tadla-Azilal', 1),
(172, 1213, 12, '', 0, 'Sous-Massa-Drâa', 1),
(173, 1214, 12, '', 0, 'Guelmim-Es Smara', 1),
(174, 1215, 12, '', 0, 'Laâyoune-Boujdour-Sakia el Hamra', 1),
(175, 1216, 12, '', 0, 'Oued Ed-Dahab Lagouira', 1),
(176, 1701, 17, '', 0, 'Provincies van Nederland ', 1),
(177, 17801, 178, '', 0, 'Panama', 1),
(178, 18101, 181, '', 0, 'Amazonas', 1),
(179, 18102, 181, '', 0, 'Ancash', 1),
(180, 18103, 181, '', 0, 'Apurimac', 1),
(181, 18104, 181, '', 0, 'Arequipa', 1),
(182, 18105, 181, '', 0, 'Ayacucho', 1),
(183, 18106, 181, '', 0, 'Cajamarca', 1),
(184, 18107, 181, '', 0, 'Callao', 1),
(185, 18108, 181, '', 0, 'Cuzco', 1),
(186, 18109, 181, '', 0, 'Huancavelica', 1),
(187, 18110, 181, '', 0, 'Huanuco', 1),
(188, 18111, 181, '', 0, 'Ica', 1),
(189, 18112, 181, '', 0, 'Junin', 1),
(190, 18113, 181, '', 0, 'La Libertad', 1),
(191, 18114, 181, '', 0, 'Lambayeque', 1),
(192, 18115, 181, '', 0, 'Lima Metropolitana', 1),
(193, 18116, 181, '', 0, 'Lima', 1),
(194, 18117, 181, '', 0, 'Loreto', 1),
(195, 18118, 181, '', 0, 'Madre de Dios', 1),
(196, 18119, 181, '', 0, 'Moquegua', 1),
(197, 18120, 181, '', 0, 'Pasco', 1),
(198, 18121, 181, '', 0, 'Piura', 1),
(199, 18122, 181, '', 0, 'Puno', 1),
(200, 18123, 181, '', 0, 'San Martín', 1),
(201, 18124, 181, '', 0, 'Tacna', 1),
(202, 18125, 181, '', 0, 'Tumbes', 1),
(203, 18126, 181, '', 0, 'Ucayali', 1),
(204, 15001, 25, 'PT', NULL, 'Portugal', 1),
(205, 15002, 25, 'PT9', NULL, 'Azores-Madeira', 1),
(206, 18801, 188, '', 0, 'Romania', 1),
(207, 8601, 86, NULL, NULL, 'Central', 1),
(208, 8602, 86, NULL, NULL, 'Oriental', 1),
(209, 8603, 86, NULL, NULL, 'Occidental', 1),
(210, 20203, 202, 'SI03', NULL, 'East Slovenia', 1),
(211, 20204, 202, 'SI04', NULL, 'West Slovenia', 1),
(212, 401, 4, '', 0, 'Andalucia', 1),
(213, 402, 4, '', 0, 'Aragón', 1),
(214, 403, 4, '', 0, 'Castilla y León', 1),
(215, 404, 4, '', 0, 'Castilla la Mancha', 1),
(216, 405, 4, '', 0, 'Canarias', 1),
(217, 406, 4, '', 0, 'Cataluña', 1),
(218, 407, 4, '', 0, 'Comunidad de Ceuta', 1),
(219, 408, 4, '', 0, 'Comunidad Foral de Navarra', 1),
(220, 409, 4, '', 0, 'Comunidad de Melilla', 1),
(221, 410, 4, '', 0, 'Cantabria', 1),
(222, 411, 4, '', 0, 'Comunidad Valenciana', 1),
(223, 412, 4, '', 0, 'Extemadura', 1),
(224, 413, 4, '', 0, 'Galicia', 1),
(225, 414, 4, '', 0, 'Islas Baleares', 1),
(226, 415, 4, '', 0, 'La Rioja', 1),
(227, 416, 4, '', 0, 'Comunidad de Madrid', 1),
(228, 417, 4, '', 0, 'Región de Murcia', 1),
(229, 418, 4, '', 0, 'Principado de Asturias', 1),
(230, 419, 4, '', 0, 'Pais Vasco', 1),
(231, 420, 4, '', 0, 'Otros', 1),
(232, 601, 6, '', 1, 'Cantons', 1),
(233, 21301, 213, 'TW', NULL, 'Taiwan', 1),
(234, 1001, 10, '', 0, 'Ariana', 1),
(235, 1002, 10, '', 0, 'Béja', 1),
(236, 1003, 10, '', 0, 'Ben Arous', 1),
(237, 1004, 10, '', 0, 'Bizerte', 1),
(238, 1005, 10, '', 0, 'Gabès', 1),
(239, 1006, 10, '', 0, 'Gafsa', 1),
(240, 1007, 10, '', 0, 'Jendouba', 1),
(241, 1008, 10, '', 0, 'Kairouan', 1),
(242, 1009, 10, '', 0, 'Kasserine', 1),
(243, 1010, 10, '', 0, 'Kébili', 1),
(244, 1011, 10, '', 0, 'La Manouba', 1),
(245, 1012, 10, '', 0, 'Le Kef', 1),
(246, 1013, 10, '', 0, 'Mahdia', 1),
(247, 1014, 10, '', 0, 'Médenine', 1),
(248, 1015, 10, '', 0, 'Monastir', 1),
(249, 1016, 10, '', 0, 'Nabeul', 1),
(250, 1017, 10, '', 0, 'Sfax', 1),
(251, 1018, 10, '', 0, 'Sidi Bouzid', 1),
(252, 1019, 10, '', 0, 'Siliana', 1),
(253, 1020, 10, '', 0, 'Sousse', 1),
(254, 1021, 10, '', 0, 'Tataouine', 1),
(255, 1022, 10, '', 0, 'Tozeur', 1),
(256, 1023, 10, '', 0, 'Tunis', 1),
(257, 1024, 10, '', 0, 'Zaghouan', 1),
(258, 22701, 227, '', 0, 'United Arab Emirates', 1),
(259, 701, 7, '', 0, 'England', 1),
(260, 702, 7, '', 0, 'Wales', 1),
(261, 703, 7, '', 0, 'Scotland', 1),
(262, 704, 7, '', 0, 'Northern Ireland', 1),
(263, 1101, 11, '', 0, 'United-States', 1),
(264, 23201, 232, '', 0, 'Los Andes', 1),
(265, 23202, 232, '', 0, 'Capital', 1),
(266, 23203, 232, '', 0, 'Central', 1),
(267, 23204, 232, '', 0, 'Cento Occidental', 1),
(268, 23205, 232, '', 0, 'Guayana', 1),
(269, 23206, 232, '', 0, 'Insular', 1),
(270, 23207, 232, '', 0, 'Los Llanos', 1),
(271, 23208, 232, '', 0, 'Nor-Oriental', 1),
(272, 23209, 232, '', 0, 'Zuliana', 1);

-- --------------------------------------------------------

--
-- Structure de la table `llx_c_revenuestamp`
--

CREATE TABLE `llx_c_revenuestamp` (
  `rowid` int(11) NOT NULL,
  `fk_pays` int(11) NOT NULL,
  `taux` double NOT NULL,
  `revenuestamp_type` varchar(16) NOT NULL DEFAULT 'fixed',
  `note` varchar(128) DEFAULT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1,
  `accountancy_code_sell` varchar(32) DEFAULT NULL,
  `accountancy_code_buy` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `llx_c_revenuestamp`
--

INSERT INTO `llx_c_revenuestamp` (`rowid`, `fk_pays`, `taux`, `revenuestamp_type`, `note`, `active`, `accountancy_code_sell`, `accountancy_code_buy`) VALUES
(101, 10, 0.4, 'fixed', 'Revenue stamp tunisia', 1, NULL, NULL),
(1541, 154, 1.5, 'percent', 'Revenue stamp mexico', 1, NULL, NULL),
(1542, 154, 3, 'percent', 'Revenue stamp mexico', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `llx_c_shipment_mode`
--

CREATE TABLE `llx_c_shipment_mode` (
  `rowid` int(11) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `code` varchar(30) NOT NULL,
  `libelle` varchar(50) NOT NULL,
  `description` text DEFAULT NULL,
  `tracking` varchar(255) DEFAULT NULL,
  `active` tinyint(4) DEFAULT 0,
  `module` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `llx_c_shipment_mode`
--

INSERT INTO `llx_c_shipment_mode` (`rowid`, `entity`, `tms`, `code`, `libelle`, `description`, `tracking`, `active`, `module`) VALUES
(1, 1, '2024-07-16 13:31:58', 'CATCH', 'In-Store Collection', 'In-store collection by the customer', '', 1, NULL),
(2, 1, '2024-07-16 13:31:58', 'TRANS', 'Generic transport service', 'Generic transport service', '', 1, NULL),
(3, 1, '2024-07-16 13:31:58', 'COLSUI', 'Colissimo Suivi', 'Colissimo Suivi', 'https://www.laposte.fr/outils/suivre-vos-envois?code={TRACKID}', 0, NULL),
(4, 1, '2024-07-16 13:31:58', 'LETTREMAX', 'Lettre Max', 'Courrier Suivi et Lettre Max', 'https://www.laposte.fr/outils/suivre-vos-envois?code={TRACKID}', 0, NULL),
(5, 1, '2024-07-16 13:31:58', 'UPS', 'UPS', 'United Parcel Service', 'http://wwwapps.ups.com/etracking/tracking.cgi?InquiryNumber2=&InquiryNumber3=&tracknums_displayed=3&loc=fr_FR&TypeOfInquiryNumber=T&HTMLVersion=4.0&InquiryNumber22=&InquiryNumber32=&track=Track&Suivi.x=64&Suivi.y=7&Suivi=Valider&InquiryNumber1={TRACKID}', 1, NULL),
(6, 1, '2024-07-16 13:31:58', 'KIALA', 'KIALA', 'Relais Kiala', 'http://www.kiala.fr/tnt/delivery/{TRACKID}', 0, NULL),
(7, 1, '2024-07-16 13:31:58', 'GLS', 'GLS', 'General Logistics Systems', 'https://gls-group.eu/FR/fr/suivi-colis?match={TRACKID}', 0, NULL),
(8, 1, '2024-07-16 13:31:58', 'CHRONO', 'Chronopost', 'Chronopost', 'http://www.chronopost.fr/expedier/inputLTNumbersNoJahia.do?listeNumeros={TRACKID}', 0, NULL),
(9, 1, '2024-07-16 13:31:58', 'INPERSON', 'In person at your site', NULL, NULL, 0, NULL),
(10, 1, '2024-07-16 13:31:58', 'FEDEX', 'Fedex', NULL, 'https://www.fedex.com/apps/fedextrack/index.html?tracknumbers={TRACKID}', 0, NULL),
(11, 1, '2024-07-16 13:31:58', 'TNT', 'TNT', NULL, 'https://www.tnt.com/express/fr_fr/site/outils-expedition/suivi.html?searchType=con&cons=={TRACKID}', 0, NULL),
(12, 1, '2024-07-16 13:31:58', 'DHL', 'DHL', NULL, 'https://www.dhl.com/fr-fr/home/tracking/tracking-global-forwarding.html?submit=1&tracking-id={TRACKID}', 0, NULL),
(13, 1, '2024-07-16 13:31:58', 'DPD', 'DPD', NULL, 'https://www.dpd.fr/trace/{TRACKID}', 0, NULL),
(14, 1, '2024-07-16 13:31:58', 'MAINFREIGHT', 'Mainfreight', NULL, 'https://www.mainfreight.com/track?{TRACKID}', 0, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `llx_c_shipment_package_type`
--

CREATE TABLE `llx_c_shipment_package_type` (
  `rowid` int(11) NOT NULL,
  `label` varchar(50) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `active` int(11) NOT NULL DEFAULT 1,
  `entity` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_c_socialnetworks`
--

CREATE TABLE `llx_c_socialnetworks` (
  `rowid` int(11) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `code` varchar(100) DEFAULT NULL,
  `label` varchar(150) DEFAULT NULL,
  `url` text DEFAULT NULL,
  `icon` varchar(20) DEFAULT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `llx_c_socialnetworks`
--

INSERT INTO `llx_c_socialnetworks` (`rowid`, `entity`, `code`, `label`, `url`, `icon`, `active`) VALUES
(1, 1, '500px', '500px', '{socialid}', 'fa-500px', 0),
(2, 1, 'dailymotion', 'Dailymotion', '{socialid}', '', 0),
(3, 1, 'diaspora', 'Diaspora', '{socialid}', '', 0),
(4, 1, 'discord', 'Discord', '{socialid}', 'fa-discord', 0),
(5, 1, 'facebook', 'Facebook', 'https://www.facebook.com/{socialid}', 'fa-facebook', 1),
(6, 1, 'flickr', 'Flickr', '{socialid}', 'fa-flickr', 0),
(7, 1, 'gifycat', 'Gificat', '{socialid}', '', 0),
(8, 1, 'giphy', 'Giphy', '{socialid}', '', 0),
(9, 1, 'googleplus', 'GooglePlus', 'https://www.googleplus.com/{socialid}', 'fa-google-plus-g', 0),
(10, 1, 'instagram', 'Instagram', 'https://www.instagram.com/{socialid}', 'fa-instagram', 1),
(11, 1, 'linkedin', 'LinkedIn', 'https://www.linkedin.com/{socialid}', 'fa-linkedin', 1),
(12, 1, 'mastodon', 'Mastodon', '{socialid}', '', 0),
(13, 1, 'meetup', 'Meetup', '{socialid}', 'fa-meetup', 0),
(14, 1, 'periscope', 'Periscope', '{socialid}', '', 0),
(15, 1, 'pinterest', 'Pinterest', '{socialid}', 'fa-pinterest', 0),
(16, 1, 'quora', 'Quora', '{socialid}', '', 0),
(17, 1, 'reddit', 'Reddit', '{socialid}', 'fa-reddit', 0),
(18, 1, 'slack', 'Slack', '{socialid}', 'fa-slack', 0),
(19, 1, 'snapchat', 'Snapchat', '{socialid}', 'fa-snapchat', 1),
(20, 1, 'skype', 'Skype', 'https://www.skype.com/{socialid}', 'fa-skype', 1),
(21, 1, 'tripadvisor', 'Tripadvisor', '{socialid}', '', 0),
(22, 1, 'tumblr', 'Tumblr', 'https://www.tumblr.com/{socialid}', 'fa-tumblr', 0),
(23, 1, 'twitch', 'Twitch', '{socialid}', '', 0),
(24, 1, 'twitter', 'Twitter', 'https://www.twitter.com/{socialid}', 'fa-twitter', 1),
(25, 1, 'vero', 'Vero', 'https://vero.co/{socialid}', '', 0),
(26, 1, 'viadeo', 'Viadeo', 'https://fr.viadeo.com/fr/{socialid}', 'fa-viadeo', 0),
(27, 1, 'viber', 'Viber', '{socialid}', '', 0),
(28, 1, 'vimeo', 'Vimeo', '{socialid}', '', 0),
(29, 1, 'whatsapp', 'Whatsapp', '{socialid}', 'fa-whatsapp', 1),
(30, 1, 'wikipedia', 'Wikipedia', '{socialid}', '', 0),
(31, 1, 'xing', 'Xing', '{socialid}', 'fa-xing', 0),
(32, 1, 'youtube', 'Youtube', 'https://www.youtube.com/{socialid}', 'fa-youtube', 1);

-- --------------------------------------------------------

--
-- Structure de la table `llx_c_stcomm`
--

CREATE TABLE `llx_c_stcomm` (
  `id` int(11) NOT NULL,
  `code` varchar(12) NOT NULL,
  `libelle` varchar(30) DEFAULT NULL,
  `picto` varchar(128) DEFAULT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `llx_c_stcomm`
--

INSERT INTO `llx_c_stcomm` (`id`, `code`, `libelle`, `picto`, `active`) VALUES
(-1, 'ST_NO', 'Do not contact', NULL, 1),
(0, 'ST_NEVER', 'Never contacted', NULL, 1),
(1, 'ST_TODO', 'To contact', NULL, 1),
(2, 'ST_PEND', 'Contact in progress', NULL, 1),
(3, 'ST_DONE', 'Contacted', NULL, 1);

-- --------------------------------------------------------

--
-- Structure de la table `llx_c_stcommcontact`
--

CREATE TABLE `llx_c_stcommcontact` (
  `id` int(11) NOT NULL,
  `code` varchar(12) NOT NULL,
  `libelle` varchar(30) DEFAULT NULL,
  `picto` varchar(128) DEFAULT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `llx_c_stcommcontact`
--

INSERT INTO `llx_c_stcommcontact` (`id`, `code`, `libelle`, `picto`, `active`) VALUES
(-1, 'ST_NO', 'Do not contact', NULL, 1),
(0, 'ST_NEVER', 'Never contacted', NULL, 1),
(1, 'ST_TODO', 'To contact', NULL, 1),
(2, 'ST_PEND', 'Contact in progress', NULL, 1),
(3, 'ST_DONE', 'Contacted', NULL, 1);

-- --------------------------------------------------------

--
-- Structure de la table `llx_c_ticket_category`
--

CREATE TABLE `llx_c_ticket_category` (
  `rowid` int(11) NOT NULL,
  `entity` int(11) DEFAULT 1,
  `code` varchar(32) NOT NULL,
  `label` varchar(128) NOT NULL,
  `public` int(11) DEFAULT 0,
  `use_default` int(11) DEFAULT 1,
  `fk_parent` int(11) NOT NULL DEFAULT 0,
  `force_severity` varchar(32) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `pos` int(11) NOT NULL DEFAULT 0,
  `active` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `llx_c_ticket_category`
--

INSERT INTO `llx_c_ticket_category` (`rowid`, `entity`, `code`, `label`, `public`, `use_default`, `fk_parent`, `force_severity`, `description`, `pos`, `active`) VALUES
(1, 1, 'OTHER', 'Other', 0, 1, 0, NULL, NULL, 10, 1);

-- --------------------------------------------------------

--
-- Structure de la table `llx_c_ticket_resolution`
--

CREATE TABLE `llx_c_ticket_resolution` (
  `rowid` int(11) NOT NULL,
  `entity` int(11) DEFAULT 1,
  `code` varchar(32) NOT NULL,
  `pos` varchar(32) NOT NULL,
  `label` varchar(128) NOT NULL,
  `active` int(11) DEFAULT 1,
  `use_default` int(11) DEFAULT 1,
  `description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `llx_c_ticket_resolution`
--

INSERT INTO `llx_c_ticket_resolution` (`rowid`, `entity`, `code`, `pos`, `label`, `active`, `use_default`, `description`) VALUES
(1, 1, 'SOLVED', '10', 'Solved', 1, 0, NULL),
(2, 1, 'CANCELED', '50', 'Canceled', 1, 0, NULL),
(3, 1, 'OTHER', '90', 'Other', 1, 0, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `llx_c_ticket_severity`
--

CREATE TABLE `llx_c_ticket_severity` (
  `rowid` int(11) NOT NULL,
  `entity` int(11) DEFAULT 1,
  `code` varchar(32) NOT NULL,
  `pos` varchar(32) NOT NULL,
  `label` varchar(128) NOT NULL,
  `color` varchar(10) DEFAULT NULL,
  `active` int(11) DEFAULT 1,
  `use_default` int(11) DEFAULT 1,
  `description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `llx_c_ticket_severity`
--

INSERT INTO `llx_c_ticket_severity` (`rowid`, `entity`, `code`, `pos`, `label`, `color`, `active`, `use_default`, `description`) VALUES
(1, 1, 'LOW', '10', 'Low', '', 1, 0, NULL),
(2, 1, 'NORMAL', '20', 'Normal', '', 1, 1, NULL),
(3, 1, 'HIGH', '30', 'High', '', 1, 0, NULL),
(4, 1, 'BLOCKING', '40', 'Critical / blocking', '', 1, 0, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `llx_c_ticket_type`
--

CREATE TABLE `llx_c_ticket_type` (
  `rowid` int(11) NOT NULL,
  `entity` int(11) DEFAULT 1,
  `code` varchar(32) NOT NULL,
  `pos` varchar(32) NOT NULL,
  `label` varchar(128) NOT NULL,
  `active` int(11) DEFAULT 1,
  `use_default` int(11) DEFAULT 1,
  `description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `llx_c_ticket_type`
--

INSERT INTO `llx_c_ticket_type` (`rowid`, `entity`, `code`, `pos`, `label`, `active`, `use_default`, `description`) VALUES
(1, 1, 'COM', '10', 'Commercial question', 1, 0, NULL),
(2, 1, 'HELP', '15', 'Request for functionnal help', 1, 0, NULL),
(3, 1, 'ISSUE', '20', 'Issue or bug', 1, 0, NULL),
(4, 1, 'PROBLEM', '22', 'Problem', 0, 0, NULL),
(5, 1, 'REQUEST', '25', 'Change or enhancement request', 1, 0, NULL),
(6, 1, 'PROJECT', '30', 'Project', 0, 0, NULL),
(7, 1, 'OTHER', '40', 'Other', 1, 0, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `llx_c_transport_mode`
--

CREATE TABLE `llx_c_transport_mode` (
  `rowid` int(11) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `code` varchar(3) NOT NULL,
  `label` varchar(255) NOT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `llx_c_transport_mode`
--

INSERT INTO `llx_c_transport_mode` (`rowid`, `entity`, `code`, `label`, `active`) VALUES
(1, 1, 'MAR', 'Transport maritime (y compris camions ou wagons sur bateau)', 1),
(2, 1, 'TRA', 'Transport par chemin de fer (y compris camions sur wagon)', 1),
(3, 1, 'ROU', 'Transport par route', 1),
(4, 1, 'AIR', 'Transport par air', 1),
(5, 1, 'POS', 'Envois postaux', 1),
(6, 1, 'OLE', 'Installations de transport fixe (oléoduc)', 1),
(7, 1, 'NAV', 'Transport par navigation intérieure', 1),
(8, 1, 'PRO', 'Propulsion propre', 1);

-- --------------------------------------------------------

--
-- Structure de la table `llx_c_tva`
--

CREATE TABLE `llx_c_tva` (
  `rowid` int(11) NOT NULL,
  `fk_pays` int(11) NOT NULL,
  `code` varchar(10) DEFAULT '',
  `taux` double NOT NULL,
  `localtax1` varchar(20) NOT NULL DEFAULT '0',
  `localtax1_type` varchar(10) NOT NULL DEFAULT '0',
  `localtax2` varchar(20) NOT NULL DEFAULT '0',
  `localtax2_type` varchar(10) NOT NULL DEFAULT '0',
  `recuperableonly` int(11) NOT NULL DEFAULT 0,
  `note` varchar(128) DEFAULT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1,
  `accountancy_code_sell` varchar(32) DEFAULT NULL,
  `accountancy_code_buy` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `llx_c_tva`
--

INSERT INTO `llx_c_tva` (`rowid`, `fk_pays`, `code`, `taux`, `localtax1`, `localtax1_type`, `localtax2`, `localtax2_type`, `recuperableonly`, `note`, `active`, `accountancy_code_sell`, `accountancy_code_buy`) VALUES
(11, 1, '', 0, '0', '0', '0', '0', 0, 'VAT rate 0 ou non applicable', 1, NULL, NULL),
(12, 1, '', 20, '0', '0', '0', '0', 0, 'VAT rate - standard (France hors DOM-TOM)', 1, NULL, NULL),
(13, 1, '', 10, '0', '0', '0', '0', 0, 'VAT rate - reduced', 1, NULL, NULL),
(14, 1, '', 5.5, '0', '0', '0', '0', 0, 'VAT rate - reduced (France hors DOM-TOM)', 1, NULL, NULL),
(15, 1, '', 2.1, '0', '0', '0', '0', 0, 'VAT rate - super-reduced', 1, NULL, NULL),
(16, 1, '85', 8.5, '0', '0', '0', '0', 0, 'VAT rate - standard (DOM sauf Guyane et Saint-Martin)', 0, NULL, NULL),
(17, 1, '85NPR', 8.5, '0', '0', '0', '0', 1, 'VAT rate - standard (DOM sauf Guyane et Saint-Martin), non perçu par le vendeur mais récupérable par acheteur', 0, NULL, NULL),
(18, 1, '85NPROM', 8.5, '2', '3', '0', '0', 1, 'VAT rate - standard (DOM sauf Guyane et Saint-Martin), NPR, Octroi de Mer', 0, NULL, NULL),
(19, 1, '85NPROMOMR', 8.5, '2', '3', '2.5', '3', 1, 'VAT rate - standard (DOM sauf Guyane et Saint-Martin), NPR, Octroi de Mer et Octroi de Mer Regional', 0, NULL, NULL),
(21, 2, '', 0, '0', '0', '0', '0', 0, 'VAT rate 0 ou non applicable', 1, NULL, NULL),
(22, 2, '', 6, '0', '0', '0', '0', 0, 'VAT rate - reduced', 1, NULL, NULL),
(23, 2, '', 21, '0', '0', '0', '0', 0, 'VAT rate - standard', 1, NULL, NULL),
(24, 2, '', 12, '0', '0', '0', '0', 0, 'VAT rate - reduced', 1, NULL, NULL),
(51, 5, '', 0, '0', '0', '0', '0', 0, 'No VAT', 1, NULL, NULL),
(52, 5, '', 7, '0', '0', '0', '0', 0, 'ermäßigte USt.', 1, NULL, NULL),
(91, 9, '', 0, '0', '0', '0', '0', 0, 'VAT rate 0', 1, NULL, NULL),
(92, 9, '', 13, '0', '0', '0', '0', 0, 'VAT rate - reduced 0', 1, NULL, NULL),
(93, 9, '', 3, '0', '0', '0', '0', 0, 'VAT rate -  super-reduced 0', 1, NULL, NULL),
(94, 9, '', 17, '0', '0', '0', '0', 0, 'VAT rate - standard', 1, NULL, NULL),
(131, 13, '', 0, '0', '0', '0', '0', 0, 'TVA 0%', 1, NULL, NULL),
(132, 13, '', 9, '0', '0', '0', '0', 0, 'TVA 9%', 1, NULL, NULL),
(133, 13, '', 19, '0', '0', '0', '0', 0, 'TVA 19%', 1, NULL, NULL),
(141, 14, '', 0, '0', '0', '0', '0', 0, 'VAT rate 0', 1, NULL, NULL),
(142, 14, '', 7, '0', '0', '0', '0', 0, 'VAT rate - standard', 1, NULL, NULL),
(143, 14, '', 5, '9.975', '1', '0', '0', 0, 'GST/TPS and PST/TVQ rate for Province', 1, NULL, NULL),
(231, 23, '', 0, '0', '0', '0', '0', 0, 'IVA Rate 0', 1, NULL, NULL),
(232, 23, '', 10.5, '0', '0', '0', '0', 0, 'IVA reduced rate', 1, NULL, NULL),
(233, 23, '', 21, '0', '0', '0', '0', 0, 'IVA standard rate', 1, NULL, NULL),
(241, 24, '', 0, '0', '0', '0', '0', 0, 'VAT rate 0', 1, NULL, NULL),
(242, 24, '', 19.25, '0', '0', '0', '0', 0, 'VAT rate - standard', 1, NULL, NULL),
(281, 28, '', 0, '0', '0', '0', '0', 0, 'VAT rate 0', 1, NULL, NULL),
(282, 28, '', 10, '0', '0', '0', '0', 0, 'VAT rate - standard', 1, NULL, NULL),
(351, 35, '', 0, '0', '0', '0', '0', 0, 'VAT rate 0', 1, NULL, NULL),
(352, 35, '', 7, '0', '0', '0', '0', 0, 'VAT rate - reduced', 1, NULL, NULL),
(353, 35, '', 14, '0', '0', '0', '0', 0, 'VAT rate - standard', 1, NULL, NULL),
(411, 41, '', 0, '0', '0', '0', '0', 0, 'VAT rate 0', 1, NULL, NULL),
(412, 41, '', 10, '0', '0', '0', '0', 0, 'VAT rate - reduced', 1, NULL, NULL),
(413, 41, '', 20, '0', '0', '0', '0', 0, 'VAT rate - standard', 1, NULL, NULL),
(561, 56, '', 0, '0', '0', '0', '0', 0, 'VAT rate - reduced', 1, NULL, NULL),
(591, 59, '', 0, '0', '0', '0', '0', 0, 'VAT rate 0', 1, NULL, NULL),
(592, 59, '', 7, '0', '0', '0', '0', 0, 'VAT rate - reduced', 1, NULL, NULL),
(593, 59, '', 20, '0', '0', '0', '0', 0, 'VAT rate - standard', 1, NULL, NULL),
(671, 67, '', 0, '0', '0', '0', '0', 0, 'VAT rate 0', 1, NULL, NULL),
(672, 67, '', 19, '0', '0', '0', '0', 0, 'VAT rate - standard', 1, NULL, NULL),
(721, 72, '', 0, '0', '0', '0', '0', 0, 'VAT rate 0', 1, NULL, NULL),
(722, 72, '', 18, '0.9', '1', '0', '0', 0, 'VAT rate 18+0.9', 1, NULL, NULL),
(781, 78, '', 0, '0', '0', '0', '0', 0, 'VAT rate 0', 1, NULL, NULL),
(782, 78, '', 9, '0', '0', '0', '0', 0, 'VAT rate 9', 1, NULL, NULL),
(783, 78, '', 5, '0', '0', '0', '0', 0, 'VAT rate 5', 1, NULL, NULL),
(784, 78, '', 19, '0', '0', '0', '0', 0, 'VAT rate - standard', 1, NULL, NULL),
(801, 80, '', 0, '0', '0', '0', '0', 0, 'VAT rate 0', 1, NULL, NULL),
(802, 80, '', 25, '0', '0', '0', '0', 0, 'VAT rate - standard', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `llx_c_typent`
--

CREATE TABLE `llx_c_typent` (
  `id` int(11) NOT NULL,
  `code` varchar(12) NOT NULL,
  `libelle` varchar(64) DEFAULT NULL,
  `fk_country` int(11) DEFAULT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1,
  `module` varchar(32) DEFAULT NULL,
  `position` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `llx_c_typent`
--

INSERT INTO `llx_c_typent` (`id`, `code`, `libelle`, `fk_country`, `active`, `module`, `position`) VALUES
(1, 'TE_STARTUP', 'Start-up', NULL, 0, NULL, 0),
(2, 'TE_GROUP', 'Grand groupe', NULL, 1, NULL, 0),
(3, 'TE_MEDIUM', 'PME/PMI', NULL, 1, NULL, 0),
(4, 'TE_SMALL', 'TPE', NULL, 1, NULL, 0),
(5, 'TE_ADMIN', 'Administration', NULL, 1, NULL, 0),
(6, 'TE_WHOLE', 'Grossiste', NULL, 0, NULL, 0),
(7, 'TE_RETAIL', 'Revendeur', NULL, 0, NULL, 0),
(8, 'TE_PRIVATE', 'Particulier', NULL, 1, NULL, 0),
(100, 'TE_OTHER', 'Autres', NULL, 1, NULL, 0),
(231, 'TE_A_RI', 'Responsable Inscripto (typo A)', 23, 0, NULL, 0),
(232, 'TE_B_RNI', 'Responsable No Inscripto (typo B)', 23, 0, NULL, 0),
(233, 'TE_C_FE', 'Consumidor Final/Exento (typo C)', 23, 0, NULL, 0);

-- --------------------------------------------------------

--
-- Structure de la table `llx_c_type_contact`
--

CREATE TABLE `llx_c_type_contact` (
  `rowid` int(11) NOT NULL,
  `element` varchar(30) NOT NULL,
  `source` varchar(8) NOT NULL DEFAULT 'external',
  `code` varchar(32) NOT NULL,
  `libelle` varchar(64) NOT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1,
  `module` varchar(32) DEFAULT NULL,
  `position` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `llx_c_type_contact`
--

INSERT INTO `llx_c_type_contact` (`rowid`, `element`, `source`, `code`, `libelle`, `active`, `module`, `position`) VALUES
(10, 'contrat', 'internal', 'SALESREPSIGN', 'Commercial signataire du contrat', 1, NULL, 0),
(11, 'contrat', 'internal', 'SALESREPFOLL', 'Commercial suivi du contrat', 1, NULL, 0),
(20, 'contrat', 'external', 'BILLING', 'Contact client facturation contrat', 1, NULL, 0),
(21, 'contrat', 'external', 'CUSTOMER', 'Contact client suivi contrat', 1, NULL, 0),
(22, 'contrat', 'external', 'SALESREPSIGN', 'Contact client signataire contrat', 1, NULL, 0),
(31, 'propal', 'internal', 'SALESREPFOLL', 'Commercial à l\'origine de la propale', 1, NULL, 0),
(40, 'propal', 'external', 'BILLING', 'Contact client facturation propale', 1, NULL, 0),
(41, 'propal', 'external', 'CUSTOMER', 'Contact client suivi propale', 1, NULL, 0),
(42, 'propal', 'external', 'SHIPPING', 'Contact client livraison propale', 1, NULL, 0),
(50, 'facture', 'internal', 'SALESREPFOLL', 'Responsable suivi du paiement', 1, NULL, 0),
(60, 'facture', 'external', 'BILLING', 'Contact client facturation', 1, NULL, 0),
(61, 'facture', 'external', 'SHIPPING', 'Contact client livraison', 1, NULL, 0),
(62, 'facture', 'external', 'SERVICE', 'Contact client prestation', 1, NULL, 0),
(70, 'invoice_supplier', 'internal', 'SALESREPFOLL', 'Responsable suivi du paiement', 1, NULL, 0),
(71, 'invoice_supplier', 'external', 'BILLING', 'Contact fournisseur facturation', 1, NULL, 0),
(72, 'invoice_supplier', 'external', 'SHIPPING', 'Contact fournisseur livraison', 1, NULL, 0),
(73, 'invoice_supplier', 'external', 'SERVICE', 'Contact fournisseur prestation', 1, NULL, 0),
(80, 'agenda', 'internal', 'ACTOR', 'Responsable', 1, NULL, 0),
(81, 'agenda', 'internal', 'GUEST', 'Guest', 1, NULL, 0),
(85, 'agenda', 'external', 'ACTOR', 'Responsable', 1, NULL, 0),
(86, 'agenda', 'external', 'GUEST', 'Guest', 1, NULL, 0),
(91, 'commande', 'internal', 'SALESREPFOLL', 'Responsable suivi de la commande', 1, NULL, 0),
(100, 'commande', 'external', 'BILLING', 'Contact client facturation commande', 1, NULL, 0),
(101, 'commande', 'external', 'CUSTOMER', 'Contact client suivi commande', 1, NULL, 0),
(102, 'commande', 'external', 'SHIPPING', 'Contact client livraison commande', 1, NULL, 0),
(110, 'supplier_proposal', 'internal', 'SALESREPFOLL', 'Responsable suivi de la demande', 1, NULL, 0),
(111, 'supplier_proposal', 'external', 'BILLING', 'Contact fournisseur facturation', 1, NULL, 0),
(112, 'supplier_proposal', 'external', 'SHIPPING', 'Contact fournisseur livraison', 1, NULL, 0),
(113, 'supplier_proposal', 'external', 'SERVICE', 'Contact fournisseur prestation', 1, NULL, 0),
(120, 'fichinter', 'internal', 'INTERREPFOLL', 'Responsable suivi de l\'intervention', 1, NULL, 0),
(121, 'fichinter', 'internal', 'INTERVENING', 'Intervenant', 1, NULL, 0),
(130, 'fichinter', 'external', 'BILLING', 'Contact client facturation intervention', 1, NULL, 0),
(131, 'fichinter', 'external', 'CUSTOMER', 'Contact client suivi de l\'intervention', 1, NULL, 0),
(140, 'order_supplier', 'internal', 'SALESREPFOLL', 'Responsable suivi de la commande', 1, NULL, 0),
(141, 'order_supplier', 'internal', 'SHIPPING', 'Responsable réception de la commande', 1, NULL, 0),
(142, 'order_supplier', 'external', 'BILLING', 'Contact fournisseur facturation commande', 1, NULL, 0),
(143, 'order_supplier', 'external', 'CUSTOMER', 'Contact fournisseur suivi commande', 1, NULL, 0),
(145, 'order_supplier', 'external', 'SHIPPING', 'Contact fournisseur livraison commande', 1, NULL, 0),
(150, 'dolresource', 'internal', 'USERINCHARGE', 'In charge of resource', 1, NULL, 0),
(151, 'dolresource', 'external', 'THIRDINCHARGE', 'In charge of resource', 1, NULL, 0),
(155, 'ticket', 'internal', 'SUPPORTTEC', 'Utilisateur contact support', 1, NULL, 0),
(156, 'ticket', 'internal', 'CONTRIBUTOR', 'Intervenant', 1, NULL, 0),
(157, 'ticket', 'external', 'SUPPORTCLI', 'Contact client suivi incident', 1, NULL, 0),
(158, 'ticket', 'external', 'CONTRIBUTOR', 'Intervenant', 1, NULL, 0),
(160, 'project', 'internal', 'PROJECTLEADER', 'Chef de Projet', 1, NULL, 0),
(161, 'project', 'internal', 'PROJECTCONTRIBUTOR', 'Intervenant', 1, NULL, 0),
(170, 'project', 'external', 'PROJECTLEADER', 'Chef de Projet', 1, NULL, 0),
(171, 'project', 'external', 'PROJECTCONTRIBUTOR', 'Intervenant', 1, NULL, 0),
(180, 'project_task', 'internal', 'TASKEXECUTIVE', 'Responsable', 1, NULL, 0),
(181, 'project_task', 'internal', 'TASKCONTRIBUTOR', 'Intervenant', 1, NULL, 0),
(190, 'project_task', 'external', 'TASKEXECUTIVE', 'Responsable', 1, NULL, 0),
(191, 'project_task', 'external', 'TASKCONTRIBUTOR', 'Intervenant', 1, NULL, 0),
(210, 'conferenceorbooth', 'internal', 'MANAGER', 'Conference or Booth manager', 1, NULL, 0),
(211, 'conferenceorbooth', 'external', 'SPEAKER', 'Conference Speaker', 1, NULL, 0),
(212, 'conferenceorbooth', 'external', 'RESPONSIBLE', 'Booth responsible', 1, NULL, 0);

-- --------------------------------------------------------

--
-- Structure de la table `llx_c_type_container`
--

CREATE TABLE `llx_c_type_container` (
  `rowid` int(11) NOT NULL,
  `code` varchar(32) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `label` varchar(64) NOT NULL,
  `module` varchar(32) DEFAULT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `llx_c_type_container`
--

INSERT INTO `llx_c_type_container` (`rowid`, `code`, `entity`, `label`, `module`, `active`) VALUES
(1, 'page', 1, 'Page', 'system', 1),
(2, 'banner', 1, 'Banner', 'system', 1),
(3, 'blogpost', 1, 'BlogPost', 'system', 1),
(4, 'menu', 1, 'Menu', 'system', 1),
(5, 'other', 1, 'Other', 'system', 1);

-- --------------------------------------------------------

--
-- Structure de la table `llx_c_type_fees`
--

CREATE TABLE `llx_c_type_fees` (
  `id` int(11) NOT NULL,
  `code` varchar(12) NOT NULL,
  `label` varchar(30) DEFAULT NULL,
  `type` int(11) DEFAULT 0,
  `accountancy_code` varchar(32) DEFAULT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1,
  `module` varchar(32) DEFAULT NULL,
  `position` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `llx_c_type_fees`
--

INSERT INTO `llx_c_type_fees` (`id`, `code`, `label`, `type`, `accountancy_code`, `active`, `module`, `position`) VALUES
(1, 'TF_OTHER', 'Other', 0, NULL, 1, NULL, 0),
(2, 'TF_TRIP', 'Transportation', 0, NULL, 1, NULL, 0),
(3, 'TF_LUNCH', 'Lunch', 0, NULL, 1, NULL, 0),
(4, 'EX_KME', 'ExpLabelKm', 0, NULL, 1, NULL, 0),
(5, 'EX_FUE', 'ExpLabelFuelCV', 0, NULL, 0, NULL, 0),
(6, 'EX_HOT', 'ExpLabelHotel', 0, NULL, 0, NULL, 0),
(7, 'EX_PAR', 'ExpLabelParkingCV', 0, NULL, 0, NULL, 0),
(8, 'EX_TOL', 'ExpLabelTollCV', 0, NULL, 0, NULL, 0),
(9, 'EX_TAX', 'ExpLabelVariousTaxes', 0, NULL, 0, NULL, 0),
(10, 'EX_IND', 'ExpLabelIndemnityTransSubscrip', 0, NULL, 0, NULL, 0),
(11, 'EX_SUM', 'ExpLabelMaintenanceSupply', 0, NULL, 0, NULL, 0),
(12, 'EX_SUO', 'ExpLabelOfficeSupplies', 0, NULL, 0, NULL, 0),
(13, 'EX_CAR', 'ExpLabelCarRental', 0, NULL, 0, NULL, 0),
(14, 'EX_DOC', 'ExpLabelDocumentation', 0, NULL, 0, NULL, 0),
(15, 'EX_CUR', 'ExpLabelCustomersReceiving', 0, NULL, 0, NULL, 0),
(16, 'EX_OTR', 'ExpLabelOtherReceiving', 0, NULL, 0, NULL, 0),
(17, 'EX_POS', 'ExpLabelPostage', 0, NULL, 0, NULL, 0),
(18, 'EX_CAM', 'ExpLabelMaintenanceRepairCV', 0, NULL, 0, NULL, 0),
(19, 'EX_EMM', 'ExpLabelEmployeesMeal', 0, NULL, 0, NULL, 0),
(20, 'EX_GUM', 'ExpLabelGuestsMeal', 0, NULL, 0, NULL, 0),
(21, 'EX_BRE', 'ExpLabelBreakfast', 0, NULL, 0, NULL, 0),
(22, 'EX_FUE_VP', 'ExpLabelFuelPV', 0, NULL, 0, NULL, 0),
(23, 'EX_TOL_VP', 'ExpLabelTollPV', 0, NULL, 0, NULL, 0),
(24, 'EX_PAR_VP', 'ExpLabelParkingPV', 0, NULL, 0, NULL, 0),
(25, 'EX_CAM_VP', 'ExpLabelMaintenanceRepairPV', 0, NULL, 0, NULL, 0);

-- --------------------------------------------------------

--
-- Structure de la table `llx_c_type_resource`
--

CREATE TABLE `llx_c_type_resource` (
  `rowid` int(11) NOT NULL,
  `code` varchar(32) NOT NULL,
  `label` varchar(64) NOT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `llx_c_type_resource`
--

INSERT INTO `llx_c_type_resource` (`rowid`, `code`, `label`, `active`) VALUES
(1, 'RES_ROOMS', 'Rooms', 1),
(2, 'RES_CARS', 'Cars', 1);

-- --------------------------------------------------------

--
-- Structure de la table `llx_c_units`
--

CREATE TABLE `llx_c_units` (
  `rowid` int(11) NOT NULL,
  `code` varchar(3) DEFAULT NULL,
  `scale` int(11) DEFAULT NULL,
  `label` varchar(50) DEFAULT NULL,
  `short_label` varchar(5) DEFAULT NULL,
  `unit_type` varchar(10) DEFAULT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `llx_c_units`
--

INSERT INTO `llx_c_units` (`rowid`, `code`, `scale`, `label`, `short_label`, `unit_type`, `active`) VALUES
(1, 'T', 3, 'WeightUnitton', 'T', 'weight', 1),
(2, 'KG', 0, 'WeightUnitkg', 'kg', 'weight', 1),
(3, 'G', -3, 'WeightUnitg', 'g', 'weight', 1),
(4, 'MG', -6, 'WeightUnitmg', 'mg', 'weight', 1),
(5, 'OZ', 98, 'WeightUnitounce', 'Oz', 'weight', 1),
(6, 'LB', 99, 'WeightUnitpound', 'lb', 'weight', 1),
(7, 'M', 0, 'SizeUnitm', 'm', 'size', 1),
(8, 'DM', -1, 'SizeUnitdm', 'dm', 'size', 1),
(9, 'CM', -2, 'SizeUnitcm', 'cm', 'size', 1),
(10, 'MM', -3, 'SizeUnitmm', 'mm', 'size', 1),
(11, 'FT', 98, 'SizeUnitfoot', 'ft', 'size', 1),
(12, 'IN', 99, 'SizeUnitinch', 'in', 'size', 1),
(13, 'M2', 0, 'SurfaceUnitm2', 'm2', 'surface', 1),
(14, 'DM2', -2, 'SurfaceUnitdm2', 'dm2', 'surface', 1),
(15, 'CM2', -4, 'SurfaceUnitcm2', 'cm2', 'surface', 1),
(16, 'MM2', -6, 'SurfaceUnitmm2', 'mm2', 'surface', 1),
(17, 'FT2', 98, 'SurfaceUnitfoot2', 'ft2', 'surface', 1),
(18, 'IN2', 99, 'SurfaceUnitinch2', 'in2', 'surface', 1),
(19, 'M3', 0, 'VolumeUnitm3', 'm3', 'volume', 1),
(20, 'DM3', -3, 'VolumeUnitdm3', 'dm3', 'volume', 1),
(21, 'CM3', -6, 'VolumeUnitcm3', 'cm3', 'volume', 1),
(22, 'MM3', -9, 'VolumeUnitmm3', 'mm3', 'volume', 1),
(23, 'FT3', 88, 'VolumeUnitfoot3', 'ft3', 'volume', 1),
(24, 'IN3', 89, 'VolumeUnitinch3', 'in3', 'volume', 1),
(25, 'OZ3', 97, 'VolumeUnitounce', 'Oz', 'volume', 1),
(26, 'L', 98, 'VolumeUnitlitre', 'L', 'volume', 1),
(27, 'GAL', 99, 'VolumeUnitgallon', 'gal', 'volume', 1),
(28, 'P', 0, 'Piece', 'p', 'qty', 1),
(29, 'SET', 0, 'Set', 'set', 'qty', 1),
(30, 'S', 0, 'second', 's', 'time', 1),
(31, 'MI', 60, 'minute', 'i', 'time', 1),
(32, 'H', 3600, 'hour', 'h', 'time', 1),
(33, 'D', 86400, 'day', 'd', 'time', 1),
(34, 'W', 604800, 'week', 'w', 'time', 1),
(35, 'MO', 2629800, 'month', 'm', 'time', 1),
(36, 'Y', 31557600, 'year', 'y', 'time', 1);

-- --------------------------------------------------------

--
-- Structure de la table `llx_c_ziptown`
--

CREATE TABLE `llx_c_ziptown` (
  `rowid` int(11) NOT NULL,
  `code` varchar(5) DEFAULT NULL,
  `fk_county` int(11) DEFAULT NULL,
  `fk_pays` int(11) NOT NULL DEFAULT 0,
  `zip` varchar(10) NOT NULL,
  `town` varchar(180) NOT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_default_values`
--

CREATE TABLE `llx_default_values` (
  `rowid` int(11) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `type` varchar(10) DEFAULT NULL,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `page` varchar(255) DEFAULT NULL,
  `param` varchar(255) DEFAULT NULL,
  `value` varchar(128) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_delivery`
--

CREATE TABLE `llx_delivery` (
  `rowid` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `ref` varchar(30) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `fk_soc` int(11) NOT NULL,
  `ref_ext` varchar(255) DEFAULT NULL,
  `ref_int` varchar(255) DEFAULT NULL,
  `ref_customer` varchar(255) DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  `fk_user_author` int(11) DEFAULT NULL,
  `date_valid` datetime DEFAULT NULL,
  `fk_user_valid` int(11) DEFAULT NULL,
  `date_delivery` datetime DEFAULT NULL,
  `fk_address` int(11) DEFAULT NULL,
  `fk_statut` smallint(6) DEFAULT 0,
  `total_ht` double(24,8) DEFAULT 0.00000000,
  `note_private` text DEFAULT NULL,
  `note_public` text DEFAULT NULL,
  `model_pdf` varchar(255) DEFAULT NULL,
  `last_main_doc` varchar(255) DEFAULT NULL,
  `fk_incoterms` int(11) DEFAULT NULL,
  `location_incoterms` varchar(255) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `extraparams` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_deliverydet`
--

CREATE TABLE `llx_deliverydet` (
  `rowid` int(11) NOT NULL,
  `fk_delivery` int(11) DEFAULT NULL,
  `fk_origin_line` int(11) DEFAULT NULL,
  `fk_product` int(11) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `qty` double DEFAULT NULL,
  `subprice` double(24,8) DEFAULT 0.00000000,
  `total_ht` double(24,8) DEFAULT 0.00000000,
  `rang` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_deliverydet_extrafields`
--

CREATE TABLE `llx_deliverydet_extrafields` (
  `rowid` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_delivery_extrafields`
--

CREATE TABLE `llx_delivery_extrafields` (
  `rowid` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_deplacement`
--

CREATE TABLE `llx_deplacement` (
  `rowid` int(11) NOT NULL,
  `ref` varchar(30) DEFAULT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `datec` datetime NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `dated` datetime DEFAULT NULL,
  `fk_user` int(11) NOT NULL,
  `fk_user_author` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `type` varchar(12) NOT NULL,
  `fk_statut` int(11) NOT NULL DEFAULT 1,
  `km` double DEFAULT NULL,
  `fk_soc` int(11) DEFAULT NULL,
  `fk_projet` int(11) DEFAULT 0,
  `note_private` text DEFAULT NULL,
  `note_public` text DEFAULT NULL,
  `extraparams` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_document_model`
--

CREATE TABLE `llx_document_model` (
  `rowid` int(11) NOT NULL,
  `nom` varchar(50) DEFAULT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `type` varchar(64) NOT NULL,
  `libelle` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `llx_document_model`
--

INSERT INTO `llx_document_model` (`rowid`, `nom`, `entity`, `type`, `libelle`, `description`) VALUES
(1, 'standard', 1, 'stock', NULL, NULL),
(2, 'stdmovement', 1, 'mouvement', NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `llx_don`
--

CREATE TABLE `llx_don` (
  `rowid` int(11) NOT NULL,
  `ref` varchar(30) DEFAULT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_statut` smallint(6) NOT NULL DEFAULT 0,
  `datedon` datetime DEFAULT NULL,
  `amount` double(24,8) DEFAULT 0.00000000,
  `fk_payment` int(11) DEFAULT NULL,
  `paid` smallint(6) NOT NULL DEFAULT 0,
  `fk_soc` int(11) DEFAULT NULL,
  `firstname` varchar(50) DEFAULT NULL,
  `lastname` varchar(50) DEFAULT NULL,
  `societe` varchar(50) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `zip` varchar(30) DEFAULT NULL,
  `town` varchar(50) DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL,
  `fk_country` int(11) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(24) DEFAULT NULL,
  `phone_mobile` varchar(24) DEFAULT NULL,
  `public` smallint(6) NOT NULL DEFAULT 1,
  `fk_projet` int(11) DEFAULT NULL,
  `datec` datetime DEFAULT NULL,
  `fk_user_author` int(11) NOT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `date_valid` datetime DEFAULT NULL,
  `fk_user_valid` int(11) DEFAULT NULL,
  `note_private` text DEFAULT NULL,
  `note_public` text DEFAULT NULL,
  `model_pdf` varchar(255) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `extraparams` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_don_extrafields`
--

CREATE TABLE `llx_don_extrafields` (
  `rowid` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_ecm_directories`
--

CREATE TABLE `llx_ecm_directories` (
  `rowid` int(11) NOT NULL,
  `label` varchar(64) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `fk_parent` int(11) DEFAULT NULL,
  `description` varchar(255) NOT NULL,
  `cachenbofdoc` int(11) NOT NULL DEFAULT 0,
  `fullpath` varchar(750) DEFAULT NULL,
  `extraparams` varchar(255) DEFAULT NULL,
  `date_c` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_user_c` int(11) DEFAULT NULL,
  `fk_user_m` int(11) DEFAULT NULL,
  `note_private` text DEFAULT NULL,
  `note_public` text DEFAULT NULL,
  `acl` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_ecm_directories_extrafields`
--

CREATE TABLE `llx_ecm_directories_extrafields` (
  `rowid` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_ecm_files`
--

CREATE TABLE `llx_ecm_files` (
  `rowid` int(11) NOT NULL,
  `ref` varchar(128) DEFAULT NULL,
  `label` varchar(128) NOT NULL,
  `share` varchar(128) DEFAULT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `filepath` varchar(255) NOT NULL,
  `filename` varchar(255) NOT NULL,
  `src_object_type` varchar(64) DEFAULT NULL,
  `src_object_id` int(11) DEFAULT NULL,
  `fullpath_orig` varchar(750) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `keywords` varchar(750) DEFAULT NULL,
  `cover` text DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `gen_or_uploaded` varchar(12) DEFAULT NULL,
  `extraparams` varchar(255) DEFAULT NULL,
  `date_c` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_user_c` int(11) DEFAULT NULL,
  `fk_user_m` int(11) DEFAULT NULL,
  `note_private` text DEFAULT NULL,
  `note_public` text DEFAULT NULL,
  `acl` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_ecm_files_extrafields`
--

CREATE TABLE `llx_ecm_files_extrafields` (
  `rowid` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_element_contact`
--

CREATE TABLE `llx_element_contact` (
  `rowid` int(11) NOT NULL,
  `datecreate` datetime DEFAULT NULL,
  `statut` smallint(6) DEFAULT 5,
  `element_id` int(11) NOT NULL,
  `fk_c_type_contact` int(11) NOT NULL,
  `fk_socpeople` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_element_element`
--

CREATE TABLE `llx_element_element` (
  `rowid` int(11) NOT NULL,
  `fk_source` int(11) NOT NULL,
  `sourcetype` varchar(32) NOT NULL,
  `fk_target` int(11) NOT NULL,
  `targettype` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_element_resources`
--

CREATE TABLE `llx_element_resources` (
  `rowid` int(11) NOT NULL,
  `element_id` int(11) DEFAULT NULL,
  `element_type` varchar(64) DEFAULT NULL,
  `resource_id` int(11) DEFAULT NULL,
  `resource_type` varchar(64) DEFAULT NULL,
  `busy` int(11) DEFAULT NULL,
  `mandatory` int(11) DEFAULT NULL,
  `duree` double DEFAULT NULL,
  `fk_user_create` int(11) DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_emailcollector_emailcollector`
--

CREATE TABLE `llx_emailcollector_emailcollector` (
  `rowid` int(11) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `ref` varchar(128) NOT NULL,
  `label` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `host` varchar(255) DEFAULT NULL,
  `hostcharset` varchar(16) DEFAULT 'UTF-8',
  `login` varchar(128) DEFAULT NULL,
  `password` varchar(128) DEFAULT NULL,
  `source_directory` varchar(255) NOT NULL,
  `target_directory` varchar(255) DEFAULT NULL,
  `maxemailpercollect` int(11) DEFAULT 100,
  `datelastresult` datetime DEFAULT NULL,
  `codelastresult` varchar(16) DEFAULT NULL,
  `lastresult` varchar(255) DEFAULT NULL,
  `datelastok` datetime DEFAULT NULL,
  `note_public` text DEFAULT NULL,
  `note_private` text DEFAULT NULL,
  `date_creation` datetime NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_user_creat` int(11) NOT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_emailcollector_emailcollectoraction`
--

CREATE TABLE `llx_emailcollector_emailcollectoraction` (
  `rowid` int(11) NOT NULL,
  `fk_emailcollector` int(11) NOT NULL,
  `type` varchar(128) NOT NULL,
  `actionparam` varchar(255) DEFAULT NULL,
  `date_creation` datetime NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_user_creat` int(11) NOT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `position` int(11) DEFAULT 0,
  `import_key` varchar(14) DEFAULT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_emailcollector_emailcollectorfilter`
--

CREATE TABLE `llx_emailcollector_emailcollectorfilter` (
  `rowid` int(11) NOT NULL,
  `fk_emailcollector` int(11) NOT NULL,
  `type` varchar(128) NOT NULL,
  `rulevalue` varchar(128) DEFAULT NULL,
  `date_creation` datetime NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_user_creat` int(11) NOT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_entrepot`
--

CREATE TABLE `llx_entrepot` (
  `rowid` int(11) NOT NULL,
  `ref` varchar(255) NOT NULL,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `entity` int(11) NOT NULL DEFAULT 1,
  `fk_project` int(11) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `lieu` varchar(64) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `zip` varchar(10) DEFAULT NULL,
  `town` varchar(50) DEFAULT NULL,
  `fk_departement` int(11) DEFAULT NULL,
  `fk_pays` int(11) DEFAULT 0,
  `phone` varchar(20) DEFAULT NULL,
  `fax` varchar(20) DEFAULT NULL,
  `statut` tinyint(4) DEFAULT 1,
  `fk_user_author` int(11) DEFAULT NULL,
  `model_pdf` varchar(255) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `fk_parent` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `llx_entrepot`
--

INSERT INTO `llx_entrepot` (`rowid`, `ref`, `datec`, `tms`, `entity`, `fk_project`, `description`, `lieu`, `address`, `zip`, `town`, `fk_departement`, `fk_pays`, `phone`, `fax`, `statut`, `fk_user_author`, `model_pdf`, `import_key`, `fk_parent`) VALUES
(1, 'A', '2024-07-16 13:40:43', '2024-07-16 13:43:07', 1, NULL, '', 'Epitech Marseille', '1 place jules guesde', '13003', 'Marseille', NULL, 0, '', '', 1, 1, NULL, NULL, NULL),
(2, 'B', '2024-07-16 13:40:49', '2024-07-16 13:44:08', 1, NULL, '', 'Epitech Lyon', '2 rue du professeur charles appleton', '69007', 'Lyon', NULL, 0, '', '', 1, 1, NULL, NULL, NULL),
(3, 'C', '2024-07-16 13:40:54', '2024-07-16 13:44:57', 1, NULL, '', 'Epitech Paris', '14-16 rue voltaire', '94270', 'Le Kremlin-Bicêtre', NULL, 0, '', '', 1, 1, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `llx_entrepot_extrafields`
--

CREATE TABLE `llx_entrepot_extrafields` (
  `rowid` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_establishment`
--

CREATE TABLE `llx_establishment` (
  `rowid` int(11) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `ref` varchar(30) DEFAULT NULL,
  `name` varchar(128) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `zip` varchar(25) DEFAULT NULL,
  `town` varchar(50) DEFAULT NULL,
  `fk_state` int(11) DEFAULT 0,
  `fk_country` int(11) DEFAULT 0,
  `profid1` varchar(20) DEFAULT NULL,
  `profid2` varchar(20) DEFAULT NULL,
  `profid3` varchar(20) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `fk_user_author` int(11) NOT NULL,
  `fk_user_mod` int(11) DEFAULT NULL,
  `datec` datetime NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `status` tinyint(4) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_eventorganization_conferenceorboothattendee`
--

CREATE TABLE `llx_eventorganization_conferenceorboothattendee` (
  `rowid` int(11) NOT NULL,
  `ref` varchar(128) NOT NULL,
  `fk_soc` int(11) DEFAULT NULL,
  `fk_actioncomm` int(11) DEFAULT NULL,
  `fk_project` int(11) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `date_subscription` datetime DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `note_public` text DEFAULT NULL,
  `note_private` text DEFAULT NULL,
  `date_creation` datetime NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_user_creat` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `last_main_doc` varchar(255) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `model_pdf` varchar(255) DEFAULT NULL,
  `status` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_eventorganization_conferenceorboothattendee_extrafields`
--

CREATE TABLE `llx_eventorganization_conferenceorboothattendee_extrafields` (
  `rowid` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_events`
--

CREATE TABLE `llx_events` (
  `rowid` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `type` varchar(32) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `prefix_session` varchar(255) DEFAULT NULL,
  `dateevent` datetime DEFAULT NULL,
  `fk_user` int(11) DEFAULT NULL,
  `description` varchar(250) NOT NULL,
  `ip` varchar(250) NOT NULL,
  `user_agent` varchar(255) DEFAULT NULL,
  `fk_object` int(11) DEFAULT NULL,
  `authentication_method` varchar(64) DEFAULT NULL,
  `fk_oauth_token` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_event_element`
--

CREATE TABLE `llx_event_element` (
  `rowid` int(11) NOT NULL,
  `fk_source` int(11) NOT NULL,
  `fk_target` int(11) NOT NULL,
  `targettype` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_expedition`
--

CREATE TABLE `llx_expedition` (
  `rowid` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `ref` varchar(30) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `fk_soc` int(11) NOT NULL,
  `fk_projet` int(11) DEFAULT NULL,
  `ref_ext` varchar(255) DEFAULT NULL,
  `ref_int` varchar(255) DEFAULT NULL,
  `ref_customer` varchar(255) DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  `fk_user_author` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `date_valid` datetime DEFAULT NULL,
  `fk_user_valid` int(11) DEFAULT NULL,
  `date_delivery` datetime DEFAULT NULL,
  `date_expedition` datetime DEFAULT NULL,
  `fk_address` int(11) DEFAULT NULL,
  `fk_shipping_method` int(11) DEFAULT NULL,
  `tracking_number` varchar(50) DEFAULT NULL,
  `fk_statut` smallint(6) DEFAULT 0,
  `billed` smallint(6) DEFAULT 0,
  `height` float DEFAULT NULL,
  `width` float DEFAULT NULL,
  `size_units` int(11) DEFAULT NULL,
  `size` float DEFAULT NULL,
  `weight_units` int(11) DEFAULT NULL,
  `weight` float DEFAULT NULL,
  `note_private` text DEFAULT NULL,
  `note_public` text DEFAULT NULL,
  `model_pdf` varchar(255) DEFAULT NULL,
  `last_main_doc` varchar(255) DEFAULT NULL,
  `fk_incoterms` int(11) DEFAULT NULL,
  `location_incoterms` varchar(255) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `extraparams` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_expeditiondet`
--

CREATE TABLE `llx_expeditiondet` (
  `rowid` int(11) NOT NULL,
  `fk_expedition` int(11) NOT NULL,
  `fk_origin_line` int(11) DEFAULT NULL,
  `fk_entrepot` int(11) DEFAULT NULL,
  `qty` double DEFAULT NULL,
  `rang` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_expeditiondet_batch`
--

CREATE TABLE `llx_expeditiondet_batch` (
  `rowid` int(11) NOT NULL,
  `fk_expeditiondet` int(11) NOT NULL,
  `eatby` date DEFAULT NULL,
  `sellby` date DEFAULT NULL,
  `batch` varchar(128) DEFAULT NULL,
  `qty` double NOT NULL DEFAULT 0,
  `fk_origin_stock` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_expeditiondet_extrafields`
--

CREATE TABLE `llx_expeditiondet_extrafields` (
  `rowid` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_expedition_extrafields`
--

CREATE TABLE `llx_expedition_extrafields` (
  `rowid` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_expedition_package`
--

CREATE TABLE `llx_expedition_package` (
  `rowid` int(11) NOT NULL,
  `fk_expedition` int(11) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `value` double(24,8) DEFAULT 0.00000000,
  `fk_package_type` int(11) DEFAULT NULL,
  `height` float DEFAULT NULL,
  `width` float DEFAULT NULL,
  `size` float DEFAULT NULL,
  `size_units` int(11) DEFAULT NULL,
  `weight` float DEFAULT NULL,
  `weight_units` int(11) DEFAULT NULL,
  `dangerous_goods` smallint(6) DEFAULT 0,
  `tail_lift` smallint(6) DEFAULT 0,
  `rang` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_expensereport`
--

CREATE TABLE `llx_expensereport` (
  `rowid` int(11) NOT NULL,
  `ref` varchar(50) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `ref_number_int` int(11) DEFAULT NULL,
  `ref_ext` int(11) DEFAULT NULL,
  `total_ht` double(24,8) DEFAULT 0.00000000,
  `total_tva` double(24,8) DEFAULT 0.00000000,
  `localtax1` double(24,8) DEFAULT 0.00000000,
  `localtax2` double(24,8) DEFAULT 0.00000000,
  `total_ttc` double(24,8) DEFAULT 0.00000000,
  `date_debut` date NOT NULL,
  `date_fin` date NOT NULL,
  `date_create` datetime NOT NULL,
  `date_valid` datetime DEFAULT NULL,
  `date_approve` datetime DEFAULT NULL,
  `date_refuse` datetime DEFAULT NULL,
  `date_cancel` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_user_author` int(11) NOT NULL,
  `fk_user_creat` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `fk_user_valid` int(11) DEFAULT NULL,
  `fk_user_validator` int(11) DEFAULT NULL,
  `fk_user_approve` int(11) DEFAULT NULL,
  `fk_user_refuse` int(11) DEFAULT NULL,
  `fk_user_cancel` int(11) DEFAULT NULL,
  `fk_statut` int(11) NOT NULL,
  `fk_c_paiement` int(11) DEFAULT NULL,
  `paid` smallint(6) NOT NULL DEFAULT 0,
  `note_public` text DEFAULT NULL,
  `note_private` text DEFAULT NULL,
  `detail_refuse` varchar(255) DEFAULT NULL,
  `detail_cancel` varchar(255) DEFAULT NULL,
  `integration_compta` int(11) DEFAULT NULL,
  `fk_bank_account` int(11) DEFAULT NULL,
  `model_pdf` varchar(50) DEFAULT NULL,
  `last_main_doc` varchar(255) DEFAULT NULL,
  `fk_multicurrency` int(11) DEFAULT NULL,
  `multicurrency_code` varchar(255) DEFAULT NULL,
  `multicurrency_tx` double(24,8) DEFAULT 1.00000000,
  `multicurrency_total_ht` double(24,8) DEFAULT 0.00000000,
  `multicurrency_total_tva` double(24,8) DEFAULT 0.00000000,
  `multicurrency_total_ttc` double(24,8) DEFAULT 0.00000000,
  `import_key` varchar(14) DEFAULT NULL,
  `extraparams` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_expensereport_det`
--

CREATE TABLE `llx_expensereport_det` (
  `rowid` int(11) NOT NULL,
  `fk_expensereport` int(11) NOT NULL,
  `docnumber` varchar(128) DEFAULT NULL,
  `fk_c_type_fees` int(11) NOT NULL,
  `fk_c_exp_tax_cat` int(11) DEFAULT NULL,
  `fk_projet` int(11) DEFAULT NULL,
  `comments` text NOT NULL,
  `product_type` int(11) DEFAULT -1,
  `qty` double NOT NULL,
  `subprice` double(24,8) NOT NULL DEFAULT 0.00000000,
  `value_unit` double(24,8) NOT NULL,
  `remise_percent` double DEFAULT NULL,
  `vat_src_code` varchar(10) DEFAULT '',
  `tva_tx` double(6,3) DEFAULT NULL,
  `localtax1_tx` double(6,3) DEFAULT 0.000,
  `localtax1_type` varchar(10) DEFAULT NULL,
  `localtax2_tx` double(6,3) DEFAULT 0.000,
  `localtax2_type` varchar(10) DEFAULT NULL,
  `total_ht` double(24,8) NOT NULL DEFAULT 0.00000000,
  `total_tva` double(24,8) NOT NULL DEFAULT 0.00000000,
  `total_localtax1` double(24,8) DEFAULT 0.00000000,
  `total_localtax2` double(24,8) DEFAULT 0.00000000,
  `total_ttc` double(24,8) NOT NULL DEFAULT 0.00000000,
  `date` date NOT NULL,
  `info_bits` int(11) DEFAULT 0,
  `special_code` int(11) DEFAULT 0,
  `fk_multicurrency` int(11) DEFAULT NULL,
  `multicurrency_code` varchar(255) DEFAULT NULL,
  `multicurrency_subprice` double(24,8) DEFAULT 0.00000000,
  `multicurrency_total_ht` double(24,8) DEFAULT 0.00000000,
  `multicurrency_total_tva` double(24,8) DEFAULT 0.00000000,
  `multicurrency_total_ttc` double(24,8) DEFAULT 0.00000000,
  `fk_facture` int(11) DEFAULT 0,
  `fk_ecm_files` int(11) DEFAULT NULL,
  `fk_code_ventilation` int(11) DEFAULT 0,
  `rang` int(11) DEFAULT 0,
  `import_key` varchar(14) DEFAULT NULL,
  `rule_warning_message` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_expensereport_extrafields`
--

CREATE TABLE `llx_expensereport_extrafields` (
  `rowid` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_expensereport_ik`
--

CREATE TABLE `llx_expensereport_ik` (
  `rowid` int(11) NOT NULL,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_c_exp_tax_cat` int(11) NOT NULL DEFAULT 0,
  `fk_range` int(11) NOT NULL DEFAULT 0,
  `coef` double NOT NULL DEFAULT 0,
  `ikoffset` double NOT NULL DEFAULT 0,
  `active` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `llx_expensereport_ik`
--

INSERT INTO `llx_expensereport_ik` (`rowid`, `datec`, `tms`, `fk_c_exp_tax_cat`, `fk_range`, `coef`, `ikoffset`, `active`) VALUES
(1, NULL, '2024-07-16 13:32:00', 4, 1, 0.41, 0, 1),
(2, NULL, '2024-07-16 13:32:00', 4, 2, 0.244, 824, 1),
(3, NULL, '2024-07-16 13:32:00', 4, 3, 0.286, 0, 1),
(4, NULL, '2024-07-16 13:32:00', 5, 4, 0.493, 0, 1),
(5, NULL, '2024-07-16 13:32:00', 5, 5, 0.277, 1082, 1),
(6, NULL, '2024-07-16 13:32:00', 5, 6, 0.332, 0, 1),
(7, NULL, '2024-07-16 13:32:00', 6, 7, 0.543, 0, 1),
(8, NULL, '2024-07-16 13:32:00', 6, 8, 0.305, 1180, 1),
(9, NULL, '2024-07-16 13:32:00', 6, 9, 0.364, 0, 1),
(10, NULL, '2024-07-16 13:32:00', 7, 10, 0.568, 0, 1),
(11, NULL, '2024-07-16 13:32:00', 7, 11, 0.32, 1244, 1),
(12, NULL, '2024-07-16 13:32:00', 7, 12, 0.382, 0, 1),
(13, NULL, '2024-07-16 13:32:00', 8, 13, 0.595, 0, 1),
(14, NULL, '2024-07-16 13:32:00', 8, 14, 0.337, 1288, 1),
(15, NULL, '2024-07-16 13:32:00', 8, 15, 0.401, 0, 1);

-- --------------------------------------------------------

--
-- Structure de la table `llx_expensereport_rules`
--

CREATE TABLE `llx_expensereport_rules` (
  `rowid` int(11) NOT NULL,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `dates` datetime NOT NULL,
  `datee` datetime NOT NULL,
  `amount` double(24,8) NOT NULL,
  `restrictive` tinyint(4) NOT NULL,
  `fk_user` int(11) DEFAULT NULL,
  `fk_usergroup` int(11) DEFAULT NULL,
  `fk_c_type_fees` int(11) NOT NULL,
  `code_expense_rules_type` varchar(50) NOT NULL,
  `is_for_all` tinyint(4) DEFAULT 0,
  `entity` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_export_compta`
--

CREATE TABLE `llx_export_compta` (
  `rowid` int(11) NOT NULL,
  `ref` varchar(12) NOT NULL,
  `date_export` datetime NOT NULL,
  `fk_user` int(11) NOT NULL,
  `note` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_export_model`
--

CREATE TABLE `llx_export_model` (
  `rowid` int(11) NOT NULL,
  `entity` int(11) DEFAULT 0,
  `fk_user` int(11) NOT NULL DEFAULT 0,
  `label` varchar(50) NOT NULL,
  `type` varchar(64) NOT NULL,
  `field` text NOT NULL,
  `filter` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_extrafields`
--

CREATE TABLE `llx_extrafields` (
  `rowid` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `elementtype` varchar(64) NOT NULL DEFAULT 'member',
  `label` varchar(255) NOT NULL,
  `type` varchar(8) DEFAULT NULL,
  `size` varchar(8) DEFAULT NULL,
  `fieldcomputed` text DEFAULT NULL,
  `fielddefault` varchar(255) DEFAULT NULL,
  `fieldunique` int(11) DEFAULT 0,
  `fieldrequired` int(11) DEFAULT 0,
  `perms` varchar(255) DEFAULT NULL,
  `enabled` varchar(255) DEFAULT NULL,
  `pos` int(11) DEFAULT 0,
  `alwayseditable` int(11) DEFAULT 0,
  `param` text DEFAULT NULL,
  `list` varchar(255) DEFAULT '1',
  `printable` int(11) DEFAULT 0,
  `totalizable` tinyint(1) DEFAULT 0,
  `langs` varchar(64) DEFAULT NULL,
  `help` text DEFAULT NULL,
  `fk_user_author` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_facture`
--

CREATE TABLE `llx_facture` (
  `rowid` int(11) NOT NULL,
  `ref` varchar(30) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `ref_ext` varchar(255) DEFAULT NULL,
  `ref_int` varchar(255) DEFAULT NULL,
  `ref_client` varchar(255) DEFAULT NULL,
  `type` smallint(6) NOT NULL DEFAULT 0,
  `fk_soc` int(11) NOT NULL,
  `datec` datetime DEFAULT NULL,
  `datef` date DEFAULT NULL,
  `date_pointoftax` date DEFAULT NULL,
  `date_valid` date DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `date_closing` datetime DEFAULT NULL,
  `paye` smallint(6) NOT NULL DEFAULT 0,
  `remise_percent` double DEFAULT 0,
  `remise_absolue` double DEFAULT 0,
  `remise` double DEFAULT 0,
  `close_code` varchar(16) DEFAULT NULL,
  `close_note` varchar(128) DEFAULT NULL,
  `total_tva` double(24,8) DEFAULT 0.00000000,
  `localtax1` double(24,8) DEFAULT 0.00000000,
  `localtax2` double(24,8) DEFAULT 0.00000000,
  `revenuestamp` double(24,8) DEFAULT 0.00000000,
  `total_ht` double(24,8) DEFAULT 0.00000000,
  `total_ttc` double(24,8) DEFAULT 0.00000000,
  `fk_statut` smallint(6) NOT NULL DEFAULT 0,
  `fk_user_author` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `fk_user_valid` int(11) DEFAULT NULL,
  `fk_user_closing` int(11) DEFAULT NULL,
  `module_source` varchar(32) DEFAULT NULL,
  `pos_source` varchar(32) DEFAULT NULL,
  `fk_fac_rec_source` int(11) DEFAULT NULL,
  `fk_facture_source` int(11) DEFAULT NULL,
  `fk_projet` int(11) DEFAULT NULL,
  `increment` varchar(10) DEFAULT NULL,
  `fk_account` int(11) DEFAULT NULL,
  `fk_currency` varchar(3) DEFAULT NULL,
  `fk_cond_reglement` int(11) NOT NULL DEFAULT 1,
  `fk_mode_reglement` int(11) DEFAULT NULL,
  `date_lim_reglement` date DEFAULT NULL,
  `note_private` text DEFAULT NULL,
  `note_public` text DEFAULT NULL,
  `model_pdf` varchar(255) DEFAULT NULL,
  `last_main_doc` varchar(255) DEFAULT NULL,
  `fk_incoterms` int(11) DEFAULT NULL,
  `location_incoterms` varchar(255) DEFAULT NULL,
  `fk_transport_mode` int(11) DEFAULT NULL,
  `situation_cycle_ref` smallint(6) DEFAULT NULL,
  `situation_counter` smallint(6) DEFAULT NULL,
  `situation_final` smallint(6) DEFAULT NULL,
  `retained_warranty` double DEFAULT NULL,
  `retained_warranty_date_limit` date DEFAULT NULL,
  `retained_warranty_fk_cond_reglement` int(11) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `extraparams` varchar(255) DEFAULT NULL,
  `fk_multicurrency` int(11) DEFAULT NULL,
  `multicurrency_code` varchar(255) DEFAULT NULL,
  `multicurrency_tx` double(24,8) DEFAULT 1.00000000,
  `multicurrency_total_ht` double(24,8) DEFAULT 0.00000000,
  `multicurrency_total_tva` double(24,8) DEFAULT 0.00000000,
  `multicurrency_total_ttc` double(24,8) DEFAULT 0.00000000
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_facturedet`
--

CREATE TABLE `llx_facturedet` (
  `rowid` int(11) NOT NULL,
  `fk_facture` int(11) NOT NULL,
  `fk_parent_line` int(11) DEFAULT NULL,
  `fk_product` int(11) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `vat_src_code` varchar(10) DEFAULT '',
  `tva_tx` double(6,3) DEFAULT NULL,
  `localtax1_tx` double(6,3) DEFAULT 0.000,
  `localtax1_type` varchar(10) DEFAULT NULL,
  `localtax2_tx` double(6,3) DEFAULT 0.000,
  `localtax2_type` varchar(10) DEFAULT NULL,
  `qty` double DEFAULT NULL,
  `remise_percent` double DEFAULT 0,
  `remise` double DEFAULT 0,
  `fk_remise_except` int(11) DEFAULT NULL,
  `subprice` double(24,8) DEFAULT NULL,
  `price` double(24,8) DEFAULT NULL,
  `total_ht` double(24,8) DEFAULT NULL,
  `total_tva` double(24,8) DEFAULT NULL,
  `total_localtax1` double(24,8) DEFAULT 0.00000000,
  `total_localtax2` double(24,8) DEFAULT 0.00000000,
  `total_ttc` double(24,8) DEFAULT NULL,
  `product_type` int(11) DEFAULT 0,
  `date_start` datetime DEFAULT NULL,
  `date_end` datetime DEFAULT NULL,
  `info_bits` int(11) DEFAULT 0,
  `buy_price_ht` double(24,8) DEFAULT 0.00000000,
  `fk_product_fournisseur_price` int(11) DEFAULT NULL,
  `special_code` int(11) DEFAULT 0,
  `rang` int(11) DEFAULT 0,
  `fk_contract_line` int(11) DEFAULT NULL,
  `fk_unit` int(11) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `fk_code_ventilation` int(11) NOT NULL DEFAULT 0,
  `situation_percent` double DEFAULT 100,
  `fk_prev_id` int(11) DEFAULT NULL,
  `fk_user_author` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `fk_multicurrency` int(11) DEFAULT NULL,
  `multicurrency_code` varchar(255) DEFAULT NULL,
  `multicurrency_subprice` double(24,8) DEFAULT 0.00000000,
  `multicurrency_total_ht` double(24,8) DEFAULT 0.00000000,
  `multicurrency_total_tva` double(24,8) DEFAULT 0.00000000,
  `multicurrency_total_ttc` double(24,8) DEFAULT 0.00000000,
  `ref_ext` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_facturedet_extrafields`
--

CREATE TABLE `llx_facturedet_extrafields` (
  `rowid` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_facturedet_rec`
--

CREATE TABLE `llx_facturedet_rec` (
  `rowid` int(11) NOT NULL,
  `fk_facture` int(11) NOT NULL,
  `fk_parent_line` int(11) DEFAULT NULL,
  `fk_product` int(11) DEFAULT NULL,
  `product_type` int(11) DEFAULT 0,
  `label` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `vat_src_code` varchar(10) DEFAULT '',
  `tva_tx` double(6,3) DEFAULT NULL,
  `localtax1_tx` double(6,3) DEFAULT 0.000,
  `localtax1_type` varchar(10) DEFAULT NULL,
  `localtax2_tx` double(6,3) DEFAULT 0.000,
  `localtax2_type` varchar(10) DEFAULT NULL,
  `qty` double DEFAULT NULL,
  `remise_percent` double DEFAULT 0,
  `remise` double DEFAULT 0,
  `subprice` double(24,8) DEFAULT NULL,
  `price` double(24,8) DEFAULT NULL,
  `total_ht` double(24,8) DEFAULT NULL,
  `total_tva` double(24,8) DEFAULT NULL,
  `total_localtax1` double(24,8) DEFAULT 0.00000000,
  `total_localtax2` double(24,8) DEFAULT 0.00000000,
  `total_ttc` double(24,8) DEFAULT NULL,
  `date_start_fill` int(11) DEFAULT 0,
  `date_end_fill` int(11) DEFAULT 0,
  `info_bits` int(11) DEFAULT 0,
  `buy_price_ht` double(24,8) DEFAULT 0.00000000,
  `fk_product_fournisseur_price` int(11) DEFAULT NULL,
  `special_code` int(10) UNSIGNED DEFAULT 0,
  `rang` int(11) DEFAULT 0,
  `fk_contract_line` int(11) DEFAULT NULL,
  `fk_unit` int(11) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `fk_user_author` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `fk_multicurrency` int(11) DEFAULT NULL,
  `multicurrency_code` varchar(255) DEFAULT NULL,
  `multicurrency_subprice` double(24,8) DEFAULT 0.00000000,
  `multicurrency_total_ht` double(24,8) DEFAULT 0.00000000,
  `multicurrency_total_tva` double(24,8) DEFAULT 0.00000000,
  `multicurrency_total_ttc` double(24,8) DEFAULT 0.00000000
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_facturedet_rec_extrafields`
--

CREATE TABLE `llx_facturedet_rec_extrafields` (
  `rowid` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_facture_extrafields`
--

CREATE TABLE `llx_facture_extrafields` (
  `rowid` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_facture_fourn`
--

CREATE TABLE `llx_facture_fourn` (
  `rowid` int(11) NOT NULL,
  `ref` varchar(180) NOT NULL,
  `ref_supplier` varchar(180) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `ref_ext` varchar(255) DEFAULT NULL,
  `type` smallint(6) NOT NULL DEFAULT 0,
  `fk_soc` int(11) NOT NULL,
  `datec` datetime DEFAULT NULL,
  `datef` date DEFAULT NULL,
  `date_pointoftax` date DEFAULT NULL,
  `date_valid` date DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `date_closing` datetime DEFAULT NULL,
  `libelle` varchar(255) DEFAULT NULL,
  `paye` smallint(6) NOT NULL DEFAULT 0,
  `amount` double(24,8) NOT NULL DEFAULT 0.00000000,
  `remise` double(24,8) DEFAULT 0.00000000,
  `close_code` varchar(16) DEFAULT NULL,
  `close_note` varchar(128) DEFAULT NULL,
  `tva` double(24,8) DEFAULT 0.00000000,
  `localtax1` double(24,8) DEFAULT 0.00000000,
  `localtax2` double(24,8) DEFAULT 0.00000000,
  `total` double(24,8) DEFAULT 0.00000000,
  `total_ht` double(24,8) DEFAULT 0.00000000,
  `total_tva` double(24,8) DEFAULT 0.00000000,
  `total_ttc` double(24,8) DEFAULT 0.00000000,
  `fk_statut` smallint(6) NOT NULL DEFAULT 0,
  `fk_user_author` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `fk_user_valid` int(11) DEFAULT NULL,
  `fk_user_closing` int(11) DEFAULT NULL,
  `fk_facture_source` int(11) DEFAULT NULL,
  `fk_projet` int(11) DEFAULT NULL,
  `fk_account` int(11) DEFAULT NULL,
  `fk_cond_reglement` int(11) DEFAULT NULL,
  `fk_mode_reglement` int(11) DEFAULT NULL,
  `date_lim_reglement` date DEFAULT NULL,
  `note_private` text DEFAULT NULL,
  `note_public` text DEFAULT NULL,
  `fk_incoterms` int(11) DEFAULT NULL,
  `location_incoterms` varchar(255) DEFAULT NULL,
  `fk_transport_mode` int(11) DEFAULT NULL,
  `model_pdf` varchar(255) DEFAULT NULL,
  `last_main_doc` varchar(255) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `extraparams` varchar(255) DEFAULT NULL,
  `fk_multicurrency` int(11) DEFAULT NULL,
  `multicurrency_code` varchar(255) DEFAULT NULL,
  `multicurrency_tx` double(24,8) DEFAULT 1.00000000,
  `multicurrency_total_ht` double(24,8) DEFAULT 0.00000000,
  `multicurrency_total_tva` double(24,8) DEFAULT 0.00000000,
  `multicurrency_total_ttc` double(24,8) DEFAULT 0.00000000
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_facture_fourn_det`
--

CREATE TABLE `llx_facture_fourn_det` (
  `rowid` int(11) NOT NULL,
  `fk_facture_fourn` int(11) NOT NULL,
  `fk_parent_line` int(11) DEFAULT NULL,
  `fk_product` int(11) DEFAULT NULL,
  `ref` varchar(50) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `pu_ht` double(24,8) DEFAULT NULL,
  `pu_ttc` double(24,8) DEFAULT NULL,
  `qty` double DEFAULT NULL,
  `remise_percent` double DEFAULT 0,
  `fk_remise_except` int(11) DEFAULT NULL,
  `vat_src_code` varchar(10) DEFAULT '',
  `tva_tx` double(6,3) DEFAULT NULL,
  `localtax1_tx` double(6,3) DEFAULT 0.000,
  `localtax1_type` varchar(10) DEFAULT NULL,
  `localtax2_tx` double(6,3) DEFAULT 0.000,
  `localtax2_type` varchar(10) DEFAULT NULL,
  `total_ht` double(24,8) DEFAULT NULL,
  `tva` double(24,8) DEFAULT NULL,
  `total_localtax1` double(24,8) DEFAULT 0.00000000,
  `total_localtax2` double(24,8) DEFAULT 0.00000000,
  `total_ttc` double(24,8) DEFAULT NULL,
  `product_type` int(11) DEFAULT 0,
  `date_start` datetime DEFAULT NULL,
  `date_end` datetime DEFAULT NULL,
  `info_bits` int(11) DEFAULT 0,
  `fk_code_ventilation` int(11) NOT NULL DEFAULT 0,
  `special_code` int(11) DEFAULT 0,
  `rang` int(11) DEFAULT 0,
  `import_key` varchar(14) DEFAULT NULL,
  `fk_unit` int(11) DEFAULT NULL,
  `fk_multicurrency` int(11) DEFAULT NULL,
  `multicurrency_code` varchar(255) DEFAULT NULL,
  `multicurrency_subprice` double(24,8) DEFAULT 0.00000000,
  `multicurrency_total_ht` double(24,8) DEFAULT 0.00000000,
  `multicurrency_total_tva` double(24,8) DEFAULT 0.00000000,
  `multicurrency_total_ttc` double(24,8) DEFAULT 0.00000000
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_facture_fourn_det_extrafields`
--

CREATE TABLE `llx_facture_fourn_det_extrafields` (
  `rowid` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_facture_fourn_extrafields`
--

CREATE TABLE `llx_facture_fourn_extrafields` (
  `rowid` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_facture_rec`
--

CREATE TABLE `llx_facture_rec` (
  `rowid` int(11) NOT NULL,
  `titre` varchar(200) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `fk_soc` int(11) NOT NULL,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `suspended` int(11) DEFAULT 0,
  `amount` double(24,8) NOT NULL DEFAULT 0.00000000,
  `remise` double DEFAULT 0,
  `remise_percent` double DEFAULT 0,
  `remise_absolue` double DEFAULT 0,
  `vat_src_code` varchar(10) DEFAULT '',
  `total_tva` double(24,8) DEFAULT 0.00000000,
  `localtax1` double(24,8) DEFAULT 0.00000000,
  `localtax2` double(24,8) DEFAULT 0.00000000,
  `revenuestamp` double(24,8) DEFAULT 0.00000000,
  `total_ht` double(24,8) DEFAULT 0.00000000,
  `total_ttc` double(24,8) DEFAULT 0.00000000,
  `fk_user_author` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `fk_projet` int(11) DEFAULT NULL,
  `fk_cond_reglement` int(11) NOT NULL DEFAULT 1,
  `fk_mode_reglement` int(11) DEFAULT 0,
  `date_lim_reglement` date DEFAULT NULL,
  `fk_account` int(11) DEFAULT NULL,
  `note_private` text DEFAULT NULL,
  `note_public` text DEFAULT NULL,
  `modelpdf` varchar(255) DEFAULT NULL,
  `fk_multicurrency` int(11) DEFAULT NULL,
  `multicurrency_code` varchar(255) DEFAULT NULL,
  `multicurrency_tx` double(24,8) DEFAULT 1.00000000,
  `multicurrency_total_ht` double(24,8) DEFAULT 0.00000000,
  `multicurrency_total_tva` double(24,8) DEFAULT 0.00000000,
  `multicurrency_total_ttc` double(24,8) DEFAULT 0.00000000,
  `usenewprice` int(11) DEFAULT 0,
  `frequency` int(11) DEFAULT NULL,
  `unit_frequency` varchar(2) DEFAULT 'm',
  `date_when` datetime DEFAULT NULL,
  `date_last_gen` datetime DEFAULT NULL,
  `nb_gen_done` int(11) DEFAULT NULL,
  `nb_gen_max` int(11) DEFAULT NULL,
  `auto_validate` int(11) DEFAULT 0,
  `generate_pdf` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_facture_rec_extrafields`
--

CREATE TABLE `llx_facture_rec_extrafields` (
  `rowid` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_fichinter`
--

CREATE TABLE `llx_fichinter` (
  `rowid` int(11) NOT NULL,
  `fk_soc` int(11) NOT NULL,
  `fk_projet` int(11) DEFAULT 0,
  `fk_contrat` int(11) DEFAULT 0,
  `ref` varchar(30) NOT NULL,
  `ref_ext` varchar(255) DEFAULT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `datec` datetime DEFAULT NULL,
  `date_valid` datetime DEFAULT NULL,
  `datei` date DEFAULT NULL,
  `fk_user_author` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `fk_user_valid` int(11) DEFAULT NULL,
  `fk_statut` smallint(6) DEFAULT 0,
  `dateo` date DEFAULT NULL,
  `datee` date DEFAULT NULL,
  `datet` date DEFAULT NULL,
  `duree` double DEFAULT NULL,
  `description` text DEFAULT NULL,
  `note_private` text DEFAULT NULL,
  `note_public` text DEFAULT NULL,
  `model_pdf` varchar(255) DEFAULT NULL,
  `last_main_doc` varchar(255) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `extraparams` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_fichinterdet`
--

CREATE TABLE `llx_fichinterdet` (
  `rowid` int(11) NOT NULL,
  `fk_fichinter` int(11) DEFAULT NULL,
  `fk_parent_line` int(11) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `description` text DEFAULT NULL,
  `duree` int(11) DEFAULT NULL,
  `rang` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_fichinterdet_extrafields`
--

CREATE TABLE `llx_fichinterdet_extrafields` (
  `rowid` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_fichinterdet_rec`
--

CREATE TABLE `llx_fichinterdet_rec` (
  `rowid` int(11) NOT NULL,
  `fk_fichinter` int(11) NOT NULL,
  `date` datetime DEFAULT NULL,
  `description` text DEFAULT NULL,
  `duree` int(11) DEFAULT NULL,
  `rang` int(11) DEFAULT 0,
  `total_ht` double(24,8) DEFAULT NULL,
  `subprice` double(24,8) DEFAULT NULL,
  `fk_parent_line` int(11) DEFAULT NULL,
  `fk_product` int(11) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `tva_tx` double(6,3) DEFAULT NULL,
  `localtax1_tx` double(6,3) DEFAULT 0.000,
  `localtax1_type` varchar(1) DEFAULT NULL,
  `localtax2_tx` double(6,3) DEFAULT 0.000,
  `localtax2_type` varchar(1) DEFAULT NULL,
  `qty` double DEFAULT NULL,
  `remise_percent` double DEFAULT 0,
  `remise` double DEFAULT 0,
  `fk_remise_except` int(11) DEFAULT NULL,
  `price` double(24,8) DEFAULT NULL,
  `total_tva` double(24,8) DEFAULT NULL,
  `total_localtax1` double(24,8) DEFAULT 0.00000000,
  `total_localtax2` double(24,8) DEFAULT 0.00000000,
  `total_ttc` double(24,8) DEFAULT NULL,
  `product_type` int(11) DEFAULT 0,
  `date_start` datetime DEFAULT NULL,
  `date_end` datetime DEFAULT NULL,
  `info_bits` int(11) DEFAULT 0,
  `buy_price_ht` double(24,8) DEFAULT 0.00000000,
  `fk_product_fournisseur_price` int(11) DEFAULT NULL,
  `fk_code_ventilation` int(11) NOT NULL DEFAULT 0,
  `fk_export_commpta` int(11) NOT NULL DEFAULT 0,
  `special_code` int(10) UNSIGNED DEFAULT 0,
  `fk_unit` int(11) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_fichinter_extrafields`
--

CREATE TABLE `llx_fichinter_extrafields` (
  `rowid` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_fichinter_rec`
--

CREATE TABLE `llx_fichinter_rec` (
  `rowid` int(11) NOT NULL,
  `titre` varchar(50) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `fk_soc` int(11) DEFAULT NULL,
  `datec` datetime DEFAULT NULL,
  `fk_contrat` int(11) DEFAULT 0,
  `fk_user_author` int(11) DEFAULT NULL,
  `fk_projet` int(11) DEFAULT NULL,
  `duree` double DEFAULT NULL,
  `description` text DEFAULT NULL,
  `modelpdf` varchar(50) DEFAULT NULL,
  `note_private` text DEFAULT NULL,
  `note_public` text DEFAULT NULL,
  `frequency` int(11) DEFAULT NULL,
  `unit_frequency` varchar(2) DEFAULT 'm',
  `date_when` datetime DEFAULT NULL,
  `date_last_gen` datetime DEFAULT NULL,
  `nb_gen_done` int(11) DEFAULT NULL,
  `nb_gen_max` int(11) DEFAULT NULL,
  `auto_validate` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_holiday`
--

CREATE TABLE `llx_holiday` (
  `rowid` int(11) NOT NULL,
  `ref` varchar(30) NOT NULL,
  `ref_ext` varchar(255) DEFAULT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `fk_user` int(11) NOT NULL,
  `fk_user_create` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `fk_type` int(11) NOT NULL,
  `date_create` datetime NOT NULL,
  `description` varchar(255) NOT NULL,
  `date_debut` date NOT NULL,
  `date_fin` date NOT NULL,
  `halfday` int(11) DEFAULT 0,
  `statut` int(11) NOT NULL DEFAULT 1,
  `fk_validator` int(11) NOT NULL,
  `date_valid` datetime DEFAULT NULL,
  `fk_user_valid` int(11) DEFAULT NULL,
  `date_refuse` datetime DEFAULT NULL,
  `fk_user_refuse` int(11) DEFAULT NULL,
  `date_cancel` datetime DEFAULT NULL,
  `fk_user_cancel` int(11) DEFAULT NULL,
  `detail_refuse` varchar(250) DEFAULT NULL,
  `note_private` text DEFAULT NULL,
  `note_public` text DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `import_key` varchar(14) DEFAULT NULL,
  `extraparams` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_holiday_config`
--

CREATE TABLE `llx_holiday_config` (
  `rowid` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `value` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `llx_holiday_config`
--

INSERT INTO `llx_holiday_config` (`rowid`, `name`, `value`) VALUES
(1, 'lastUpdate', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `llx_holiday_extrafields`
--

CREATE TABLE `llx_holiday_extrafields` (
  `rowid` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_holiday_logs`
--

CREATE TABLE `llx_holiday_logs` (
  `rowid` int(11) NOT NULL,
  `date_action` datetime NOT NULL,
  `fk_user_action` int(11) NOT NULL,
  `fk_user_update` int(11) NOT NULL,
  `fk_type` int(11) NOT NULL,
  `type_action` varchar(255) NOT NULL,
  `prev_solde` varchar(255) NOT NULL,
  `new_solde` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_holiday_users`
--

CREATE TABLE `llx_holiday_users` (
  `fk_user` int(11) NOT NULL,
  `fk_type` int(11) NOT NULL,
  `nb_holiday` double NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_import_model`
--

CREATE TABLE `llx_import_model` (
  `rowid` int(11) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 0,
  `fk_user` int(11) NOT NULL DEFAULT 0,
  `label` varchar(50) NOT NULL,
  `type` varchar(64) NOT NULL,
  `field` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_intracommreport`
--

CREATE TABLE `llx_intracommreport` (
  `rowid` int(11) NOT NULL,
  `ref` varchar(30) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `type_declaration` varchar(32) DEFAULT NULL,
  `periods` varchar(32) DEFAULT NULL,
  `mode` varchar(32) DEFAULT NULL,
  `content_xml` text DEFAULT NULL,
  `type_export` varchar(10) DEFAULT NULL,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_inventory`
--

CREATE TABLE `llx_inventory` (
  `rowid` int(11) NOT NULL,
  `entity` int(11) DEFAULT 0,
  `ref` varchar(48) DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_user_creat` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `fk_user_valid` int(11) DEFAULT NULL,
  `fk_warehouse` int(11) DEFAULT NULL,
  `fk_product` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT 0,
  `title` varchar(255) NOT NULL,
  `date_inventory` datetime DEFAULT NULL,
  `date_validation` datetime DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_inventorydet`
--

CREATE TABLE `llx_inventorydet` (
  `rowid` int(11) NOT NULL,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_inventory` int(11) DEFAULT 0,
  `fk_warehouse` int(11) DEFAULT 0,
  `fk_product` int(11) DEFAULT 0,
  `batch` varchar(128) DEFAULT NULL,
  `qty_stock` double DEFAULT NULL,
  `qty_view` double DEFAULT NULL,
  `qty_regulated` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_knowledgemanagement_knowledgerecord`
--

CREATE TABLE `llx_knowledgemanagement_knowledgerecord` (
  `rowid` int(11) NOT NULL,
  `ref` varchar(128) NOT NULL,
  `date_creation` datetime NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `last_main_doc` varchar(255) DEFAULT NULL,
  `fk_user_creat` int(11) NOT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `fk_user_valid` int(11) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `model_pdf` varchar(255) DEFAULT NULL,
  `question` text NOT NULL,
  `answer` text DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `fk_ticket` int(11) DEFAULT NULL,
  `fk_c_ticket_category` int(11) DEFAULT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_knowledgemanagement_knowledgerecord_extrafields`
--

CREATE TABLE `llx_knowledgemanagement_knowledgerecord_extrafields` (
  `rowid` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_links`
--

CREATE TABLE `llx_links` (
  `rowid` int(11) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `datea` datetime NOT NULL,
  `url` varchar(255) NOT NULL,
  `label` varchar(255) NOT NULL,
  `objecttype` varchar(255) NOT NULL,
  `objectid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_loan`
--

CREATE TABLE `llx_loan` (
  `rowid` int(11) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `label` varchar(80) NOT NULL,
  `fk_bank` int(11) DEFAULT NULL,
  `capital` double(24,8) NOT NULL DEFAULT 0.00000000,
  `insurance_amount` double(24,8) DEFAULT 0.00000000,
  `datestart` date DEFAULT NULL,
  `dateend` date DEFAULT NULL,
  `nbterm` double DEFAULT NULL,
  `rate` double NOT NULL,
  `note_private` text DEFAULT NULL,
  `note_public` text DEFAULT NULL,
  `capital_position` double(24,8) DEFAULT 0.00000000,
  `date_position` date DEFAULT NULL,
  `paid` smallint(6) NOT NULL DEFAULT 0,
  `accountancy_account_capital` varchar(32) DEFAULT NULL,
  `accountancy_account_insurance` varchar(32) DEFAULT NULL,
  `accountancy_account_interest` varchar(32) DEFAULT NULL,
  `fk_projet` int(11) DEFAULT NULL,
  `fk_user_author` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_loan_schedule`
--

CREATE TABLE `llx_loan_schedule` (
  `rowid` int(11) NOT NULL,
  `fk_loan` int(11) DEFAULT NULL,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `datep` datetime DEFAULT NULL,
  `amount_capital` double(24,8) DEFAULT 0.00000000,
  `amount_insurance` double(24,8) DEFAULT 0.00000000,
  `amount_interest` double(24,8) DEFAULT 0.00000000,
  `fk_typepayment` int(11) NOT NULL,
  `num_payment` varchar(50) DEFAULT NULL,
  `note_private` text DEFAULT NULL,
  `note_public` text DEFAULT NULL,
  `fk_bank` int(11) NOT NULL,
  `fk_payment_loan` int(11) DEFAULT NULL,
  `fk_user_creat` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_localtax`
--

CREATE TABLE `llx_localtax` (
  `rowid` int(11) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `localtaxtype` tinyint(4) DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `datep` date DEFAULT NULL,
  `datev` date DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `fk_bank` int(11) DEFAULT NULL,
  `fk_user_creat` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_mailing`
--

CREATE TABLE `llx_mailing` (
  `rowid` int(11) NOT NULL,
  `statut` smallint(6) DEFAULT 0,
  `titre` varchar(128) DEFAULT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `sujet` varchar(128) DEFAULT NULL,
  `body` mediumtext DEFAULT NULL,
  `bgcolor` varchar(8) DEFAULT NULL,
  `bgimage` varchar(255) DEFAULT NULL,
  `cible` varchar(60) DEFAULT NULL,
  `nbemail` int(11) DEFAULT NULL,
  `email_from` varchar(160) DEFAULT NULL,
  `email_replyto` varchar(160) DEFAULT NULL,
  `email_errorsto` varchar(160) DEFAULT NULL,
  `tag` varchar(128) DEFAULT NULL,
  `date_creat` datetime DEFAULT NULL,
  `date_valid` datetime DEFAULT NULL,
  `date_appro` datetime DEFAULT NULL,
  `date_envoi` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_user_creat` int(11) DEFAULT NULL,
  `fk_user_valid` int(11) DEFAULT NULL,
  `fk_user_appro` int(11) DEFAULT NULL,
  `extraparams` varchar(255) DEFAULT NULL,
  `joined_file1` varchar(255) DEFAULT NULL,
  `joined_file2` varchar(255) DEFAULT NULL,
  `joined_file3` varchar(255) DEFAULT NULL,
  `joined_file4` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_mailing_cibles`
--

CREATE TABLE `llx_mailing_cibles` (
  `rowid` int(11) NOT NULL,
  `fk_mailing` int(11) NOT NULL,
  `fk_contact` int(11) NOT NULL,
  `lastname` varchar(160) DEFAULT NULL,
  `firstname` varchar(160) DEFAULT NULL,
  `email` varchar(160) NOT NULL,
  `other` varchar(255) DEFAULT NULL,
  `tag` varchar(64) DEFAULT NULL,
  `statut` smallint(6) NOT NULL DEFAULT 0,
  `source_url` varchar(255) DEFAULT NULL,
  `source_id` int(11) DEFAULT NULL,
  `source_type` varchar(16) DEFAULT NULL,
  `date_envoi` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `error_text` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_mailing_unsubscribe`
--

CREATE TABLE `llx_mailing_unsubscribe` (
  `rowid` int(11) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `email` varchar(255) DEFAULT NULL,
  `unsubscribegroup` varchar(128) DEFAULT '',
  `ip` varchar(128) DEFAULT NULL,
  `date_creat` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_menu`
--

CREATE TABLE `llx_menu` (
  `rowid` int(11) NOT NULL,
  `menu_handler` varchar(16) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `module` varchar(255) DEFAULT NULL,
  `type` varchar(4) NOT NULL,
  `mainmenu` varchar(100) NOT NULL,
  `leftmenu` varchar(100) DEFAULT NULL,
  `fk_menu` int(11) NOT NULL,
  `fk_mainmenu` varchar(100) DEFAULT NULL,
  `fk_leftmenu` varchar(100) DEFAULT NULL,
  `position` int(11) NOT NULL,
  `url` varchar(255) NOT NULL,
  `target` varchar(100) DEFAULT NULL,
  `titre` varchar(255) NOT NULL,
  `prefix` varchar(255) DEFAULT NULL,
  `langs` varchar(100) DEFAULT NULL,
  `level` smallint(6) DEFAULT NULL,
  `perms` text DEFAULT NULL,
  `enabled` text DEFAULT NULL,
  `usertype` int(11) NOT NULL DEFAULT 0,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_mrp_mo`
--

CREATE TABLE `llx_mrp_mo` (
  `rowid` int(11) NOT NULL,
  `ref` varchar(128) NOT NULL DEFAULT '(PROV)',
  `entity` int(11) NOT NULL DEFAULT 1,
  `label` varchar(255) DEFAULT NULL,
  `qty` double NOT NULL,
  `fk_warehouse` int(11) DEFAULT NULL,
  `fk_soc` int(11) DEFAULT NULL,
  `note_public` text DEFAULT NULL,
  `note_private` text DEFAULT NULL,
  `date_creation` datetime NOT NULL,
  `date_valid` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_user_creat` int(11) NOT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `fk_user_valid` int(11) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `model_pdf` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `fk_product` int(11) NOT NULL,
  `date_start_planned` datetime DEFAULT NULL,
  `date_end_planned` datetime DEFAULT NULL,
  `fk_bom` int(11) DEFAULT NULL,
  `fk_project` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_mrp_mo_extrafields`
--

CREATE TABLE `llx_mrp_mo_extrafields` (
  `rowid` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_mrp_production`
--

CREATE TABLE `llx_mrp_production` (
  `rowid` int(11) NOT NULL,
  `fk_mo` int(11) NOT NULL,
  `origin_id` int(11) DEFAULT NULL,
  `origin_type` varchar(10) DEFAULT NULL,
  `position` int(11) NOT NULL DEFAULT 0,
  `fk_product` int(11) NOT NULL,
  `fk_warehouse` int(11) DEFAULT NULL,
  `qty` double NOT NULL DEFAULT 1,
  `qty_frozen` smallint(6) DEFAULT 0,
  `disable_stock_change` smallint(6) DEFAULT 0,
  `batch` varchar(128) DEFAULT NULL,
  `role` varchar(10) DEFAULT NULL,
  `fk_mrp_production` int(11) DEFAULT NULL,
  `fk_stock_movement` int(11) DEFAULT NULL,
  `date_creation` datetime NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_user_creat` int(11) NOT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_multicurrency`
--

CREATE TABLE `llx_multicurrency` (
  `rowid` int(11) NOT NULL,
  `date_create` datetime DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `entity` int(11) DEFAULT 1,
  `fk_user` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_multicurrency_rate`
--

CREATE TABLE `llx_multicurrency_rate` (
  `rowid` int(11) NOT NULL,
  `date_sync` datetime DEFAULT NULL,
  `rate` double NOT NULL DEFAULT 0,
  `fk_multicurrency` int(11) NOT NULL,
  `entity` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_notify`
--

CREATE TABLE `llx_notify` (
  `rowid` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `daten` datetime DEFAULT NULL,
  `fk_action` int(11) NOT NULL,
  `fk_soc` int(11) DEFAULT NULL,
  `fk_contact` int(11) DEFAULT NULL,
  `fk_user` int(11) DEFAULT NULL,
  `type` varchar(16) DEFAULT 'email',
  `type_target` varchar(16) DEFAULT NULL,
  `objet_type` varchar(24) NOT NULL,
  `objet_id` int(11) NOT NULL,
  `email` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_notify_def`
--

CREATE TABLE `llx_notify_def` (
  `rowid` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `datec` date DEFAULT NULL,
  `fk_action` int(11) NOT NULL,
  `fk_soc` int(11) DEFAULT NULL,
  `fk_contact` int(11) DEFAULT NULL,
  `fk_user` int(11) DEFAULT NULL,
  `type` varchar(16) DEFAULT 'email'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_notify_def_object`
--

CREATE TABLE `llx_notify_def_object` (
  `id` int(11) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `objet_type` varchar(16) DEFAULT NULL,
  `objet_id` int(11) NOT NULL,
  `type_notif` varchar(16) DEFAULT 'browser',
  `date_notif` datetime DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `moreparam` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_oauth_state`
--

CREATE TABLE `llx_oauth_state` (
  `rowid` int(11) NOT NULL,
  `service` varchar(36) DEFAULT NULL,
  `state` varchar(128) DEFAULT NULL,
  `fk_user` int(11) DEFAULT NULL,
  `fk_adherent` int(11) DEFAULT NULL,
  `entity` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_oauth_token`
--

CREATE TABLE `llx_oauth_token` (
  `rowid` int(11) NOT NULL,
  `service` varchar(36) DEFAULT NULL,
  `token` text DEFAULT NULL,
  `tokenstring` text DEFAULT NULL,
  `fk_soc` int(11) DEFAULT NULL,
  `fk_user` int(11) DEFAULT NULL,
  `fk_adherent` int(11) DEFAULT NULL,
  `restricted_ips` varchar(200) DEFAULT NULL,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `entity` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_object_lang`
--

CREATE TABLE `llx_object_lang` (
  `rowid` int(11) NOT NULL,
  `fk_object` int(11) NOT NULL DEFAULT 0,
  `type_object` varchar(32) NOT NULL,
  `property` varchar(32) NOT NULL,
  `lang` varchar(5) NOT NULL DEFAULT '',
  `value` text DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_onlinesignature`
--

CREATE TABLE `llx_onlinesignature` (
  `rowid` int(11) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `object_type` varchar(32) NOT NULL,
  `object_id` int(11) NOT NULL,
  `datec` datetime NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `name` varchar(255) NOT NULL,
  `ip` varchar(128) DEFAULT NULL,
  `pathoffile` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_opensurvey_comments`
--

CREATE TABLE `llx_opensurvey_comments` (
  `id_comment` int(10) UNSIGNED NOT NULL,
  `id_sondage` char(16) NOT NULL,
  `comment` text NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `usercomment` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_opensurvey_formquestions`
--

CREATE TABLE `llx_opensurvey_formquestions` (
  `rowid` int(11) NOT NULL,
  `id_sondage` varchar(16) DEFAULT NULL,
  `question` text DEFAULT NULL,
  `available_answers` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_opensurvey_sondage`
--

CREATE TABLE `llx_opensurvey_sondage` (
  `id_sondage` varchar(16) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `commentaires` text DEFAULT NULL,
  `mail_admin` varchar(128) DEFAULT NULL,
  `nom_admin` varchar(64) DEFAULT NULL,
  `fk_user_creat` int(11) NOT NULL,
  `titre` text NOT NULL,
  `date_fin` datetime DEFAULT NULL,
  `status` int(11) DEFAULT 1,
  `format` varchar(2) NOT NULL,
  `mailsonde` tinyint(4) NOT NULL DEFAULT 0,
  `allow_comments` tinyint(4) NOT NULL DEFAULT 1,
  `allow_spy` tinyint(4) NOT NULL DEFAULT 1,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `sujet` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_opensurvey_user_formanswers`
--

CREATE TABLE `llx_opensurvey_user_formanswers` (
  `fk_user_survey` int(11) NOT NULL,
  `fk_question` int(11) NOT NULL,
  `reponses` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_opensurvey_user_studs`
--

CREATE TABLE `llx_opensurvey_user_studs` (
  `id_users` int(11) NOT NULL,
  `nom` varchar(64) NOT NULL,
  `id_sondage` varchar(16) NOT NULL,
  `reponses` varchar(100) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_overwrite_trans`
--

CREATE TABLE `llx_overwrite_trans` (
  `rowid` int(11) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `lang` varchar(5) DEFAULT NULL,
  `transkey` varchar(128) DEFAULT NULL,
  `transvalue` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_paiement`
--

CREATE TABLE `llx_paiement` (
  `rowid` int(11) NOT NULL,
  `ref` varchar(30) DEFAULT NULL,
  `ref_ext` varchar(255) DEFAULT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `datep` datetime DEFAULT NULL,
  `amount` double(24,8) DEFAULT 0.00000000,
  `multicurrency_amount` double(24,8) DEFAULT 0.00000000,
  `fk_paiement` int(11) NOT NULL,
  `num_paiement` varchar(50) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `ext_payment_id` varchar(128) DEFAULT NULL,
  `ext_payment_site` varchar(128) DEFAULT NULL,
  `fk_bank` int(11) NOT NULL DEFAULT 0,
  `fk_user_creat` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `statut` smallint(6) NOT NULL DEFAULT 0,
  `fk_export_compta` int(11) NOT NULL DEFAULT 0,
  `pos_change` double(24,8) DEFAULT 0.00000000
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_paiementcharge`
--

CREATE TABLE `llx_paiementcharge` (
  `rowid` int(11) NOT NULL,
  `fk_charge` int(11) DEFAULT NULL,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `datep` datetime DEFAULT NULL,
  `amount` double(24,8) DEFAULT 0.00000000,
  `fk_typepaiement` int(11) NOT NULL,
  `num_paiement` varchar(50) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `fk_bank` int(11) NOT NULL,
  `fk_user_creat` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_paiementfourn`
--

CREATE TABLE `llx_paiementfourn` (
  `rowid` int(11) NOT NULL,
  `ref` varchar(30) DEFAULT NULL,
  `entity` int(11) DEFAULT 1,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `datec` datetime DEFAULT NULL,
  `datep` datetime DEFAULT NULL,
  `amount` double(24,8) DEFAULT 0.00000000,
  `multicurrency_amount` double(24,8) DEFAULT 0.00000000,
  `fk_user_author` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `fk_paiement` int(11) NOT NULL,
  `num_paiement` varchar(50) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `fk_bank` int(11) NOT NULL,
  `statut` smallint(6) NOT NULL DEFAULT 0,
  `model_pdf` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_paiementfourn_facturefourn`
--

CREATE TABLE `llx_paiementfourn_facturefourn` (
  `rowid` int(11) NOT NULL,
  `fk_paiementfourn` int(11) DEFAULT NULL,
  `fk_facturefourn` int(11) DEFAULT NULL,
  `amount` double(24,8) DEFAULT 0.00000000,
  `multicurrency_code` varchar(255) DEFAULT NULL,
  `multicurrency_tx` double(24,8) DEFAULT 1.00000000,
  `multicurrency_amount` double(24,8) DEFAULT 0.00000000
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_paiement_facture`
--

CREATE TABLE `llx_paiement_facture` (
  `rowid` int(11) NOT NULL,
  `fk_paiement` int(11) DEFAULT NULL,
  `fk_facture` int(11) DEFAULT NULL,
  `amount` double(24,8) DEFAULT 0.00000000,
  `multicurrency_code` varchar(255) DEFAULT NULL,
  `multicurrency_tx` double(24,8) DEFAULT 1.00000000,
  `multicurrency_amount` double(24,8) DEFAULT 0.00000000
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_partnership`
--

CREATE TABLE `llx_partnership` (
  `rowid` int(11) NOT NULL,
  `ref` varchar(128) NOT NULL DEFAULT '(PROV)',
  `status` smallint(6) NOT NULL DEFAULT 0,
  `fk_soc` int(11) DEFAULT NULL,
  `fk_member` int(11) DEFAULT NULL,
  `date_partnership_start` date NOT NULL,
  `date_partnership_end` date DEFAULT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `reason_decline_or_cancel` text DEFAULT NULL,
  `date_creation` datetime NOT NULL,
  `fk_user_creat` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_user_modif` int(11) DEFAULT NULL,
  `note_private` text DEFAULT NULL,
  `note_public` text DEFAULT NULL,
  `last_main_doc` varchar(255) DEFAULT NULL,
  `count_last_url_check_error` int(11) DEFAULT 0,
  `last_check_backlink` datetime DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `model_pdf` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_partnership_extrafields`
--

CREATE TABLE `llx_partnership_extrafields` (
  `rowid` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_payment_donation`
--

CREATE TABLE `llx_payment_donation` (
  `rowid` int(11) NOT NULL,
  `fk_donation` int(11) DEFAULT NULL,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `datep` datetime DEFAULT NULL,
  `amount` double(24,8) DEFAULT 0.00000000,
  `fk_typepayment` int(11) NOT NULL,
  `num_payment` varchar(50) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `ext_payment_id` varchar(128) DEFAULT NULL,
  `ext_payment_site` varchar(128) DEFAULT NULL,
  `fk_bank` int(11) NOT NULL,
  `fk_user_creat` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_payment_expensereport`
--

CREATE TABLE `llx_payment_expensereport` (
  `rowid` int(11) NOT NULL,
  `fk_expensereport` int(11) DEFAULT NULL,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `datep` datetime DEFAULT NULL,
  `amount` double(24,8) DEFAULT 0.00000000,
  `fk_typepayment` int(11) NOT NULL,
  `num_payment` varchar(50) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `fk_bank` int(11) NOT NULL,
  `fk_user_creat` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_payment_loan`
--

CREATE TABLE `llx_payment_loan` (
  `rowid` int(11) NOT NULL,
  `fk_loan` int(11) DEFAULT NULL,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `datep` datetime DEFAULT NULL,
  `amount_capital` double(24,8) DEFAULT 0.00000000,
  `amount_insurance` double(24,8) DEFAULT 0.00000000,
  `amount_interest` double(24,8) DEFAULT 0.00000000,
  `fk_typepayment` int(11) NOT NULL,
  `num_payment` varchar(50) DEFAULT NULL,
  `note_private` text DEFAULT NULL,
  `note_public` text DEFAULT NULL,
  `fk_bank` int(11) NOT NULL,
  `fk_user_creat` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_payment_salary`
--

CREATE TABLE `llx_payment_salary` (
  `rowid` int(11) NOT NULL,
  `ref` varchar(30) DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `datec` datetime DEFAULT NULL,
  `fk_user` int(11) DEFAULT NULL,
  `datep` date DEFAULT NULL,
  `datev` date DEFAULT NULL,
  `salary` double(24,8) DEFAULT NULL,
  `amount` double(24,8) NOT NULL DEFAULT 0.00000000,
  `fk_projet` int(11) DEFAULT NULL,
  `fk_typepayment` int(11) NOT NULL,
  `num_payment` varchar(50) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `datesp` date DEFAULT NULL,
  `dateep` date DEFAULT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `note` text DEFAULT NULL,
  `fk_bank` int(11) DEFAULT NULL,
  `fk_user_author` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `fk_salary` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_payment_various`
--

CREATE TABLE `llx_payment_various` (
  `rowid` int(11) NOT NULL,
  `ref` varchar(30) DEFAULT NULL,
  `num_payment` varchar(50) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `datec` datetime DEFAULT NULL,
  `datep` date DEFAULT NULL,
  `datev` date DEFAULT NULL,
  `sens` smallint(6) NOT NULL DEFAULT 0,
  `amount` double(24,8) NOT NULL DEFAULT 0.00000000,
  `fk_typepayment` int(11) NOT NULL,
  `accountancy_code` varchar(32) DEFAULT NULL,
  `subledger_account` varchar(32) DEFAULT NULL,
  `fk_projet` int(11) DEFAULT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `note` text DEFAULT NULL,
  `fk_bank` int(11) DEFAULT NULL,
  `fk_user_author` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_payment_vat`
--

CREATE TABLE `llx_payment_vat` (
  `rowid` int(11) NOT NULL,
  `fk_tva` int(11) DEFAULT NULL,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `datep` datetime DEFAULT NULL,
  `amount` double(24,8) DEFAULT 0.00000000,
  `fk_typepaiement` int(11) NOT NULL,
  `num_paiement` varchar(50) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `fk_bank` int(11) NOT NULL,
  `fk_user_creat` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_pos_cash_fence`
--

CREATE TABLE `llx_pos_cash_fence` (
  `rowid` int(11) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `ref` varchar(64) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `opening` double(24,8) DEFAULT 0.00000000,
  `cash` double(24,8) DEFAULT 0.00000000,
  `card` double(24,8) DEFAULT 0.00000000,
  `cheque` double(24,8) DEFAULT 0.00000000,
  `status` int(11) DEFAULT NULL,
  `date_creation` datetime NOT NULL,
  `date_valid` datetime DEFAULT NULL,
  `day_close` int(11) DEFAULT NULL,
  `month_close` int(11) DEFAULT NULL,
  `year_close` int(11) DEFAULT NULL,
  `posmodule` varchar(30) DEFAULT NULL,
  `posnumber` varchar(30) DEFAULT NULL,
  `fk_user_creat` int(11) DEFAULT NULL,
  `fk_user_valid` int(11) DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `import_key` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_prelevement_bons`
--

CREATE TABLE `llx_prelevement_bons` (
  `rowid` int(11) NOT NULL,
  `type` varchar(16) DEFAULT 'debit-order',
  `ref` varchar(12) DEFAULT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `datec` datetime DEFAULT NULL,
  `amount` double(24,8) DEFAULT 0.00000000,
  `statut` smallint(6) DEFAULT 0,
  `credite` smallint(6) DEFAULT 0,
  `note` text DEFAULT NULL,
  `date_trans` datetime DEFAULT NULL,
  `method_trans` smallint(6) DEFAULT NULL,
  `fk_user_trans` int(11) DEFAULT NULL,
  `date_credit` datetime DEFAULT NULL,
  `fk_user_credit` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_prelevement_facture`
--

CREATE TABLE `llx_prelevement_facture` (
  `rowid` int(11) NOT NULL,
  `fk_facture` int(11) DEFAULT NULL,
  `fk_facture_fourn` int(11) DEFAULT NULL,
  `fk_prelevement_lignes` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_prelevement_facture_demande`
--

CREATE TABLE `llx_prelevement_facture_demande` (
  `rowid` int(11) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `fk_facture` int(11) DEFAULT NULL,
  `fk_facture_fourn` int(11) DEFAULT NULL,
  `sourcetype` varchar(32) DEFAULT NULL,
  `amount` double(24,8) NOT NULL,
  `date_demande` datetime NOT NULL,
  `traite` smallint(6) DEFAULT 0,
  `date_traite` datetime DEFAULT NULL,
  `fk_prelevement_bons` int(11) DEFAULT NULL,
  `fk_user_demande` int(11) NOT NULL,
  `code_banque` varchar(128) DEFAULT NULL,
  `code_guichet` varchar(6) DEFAULT NULL,
  `number` varchar(255) DEFAULT NULL,
  `cle_rib` varchar(5) DEFAULT NULL,
  `ext_payment_id` varchar(128) DEFAULT NULL,
  `ext_payment_site` varchar(128) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_prelevement_lignes`
--

CREATE TABLE `llx_prelevement_lignes` (
  `rowid` int(11) NOT NULL,
  `fk_prelevement_bons` int(11) DEFAULT NULL,
  `fk_soc` int(11) NOT NULL,
  `statut` smallint(6) DEFAULT 0,
  `client_nom` varchar(255) DEFAULT NULL,
  `amount` double(24,8) DEFAULT 0.00000000,
  `code_banque` varchar(128) DEFAULT NULL,
  `code_guichet` varchar(6) DEFAULT NULL,
  `number` varchar(255) DEFAULT NULL,
  `cle_rib` varchar(5) DEFAULT NULL,
  `note` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_prelevement_rejet`
--

CREATE TABLE `llx_prelevement_rejet` (
  `rowid` int(11) NOT NULL,
  `fk_prelevement_lignes` int(11) DEFAULT NULL,
  `date_rejet` datetime DEFAULT NULL,
  `motif` int(11) DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  `fk_user_creation` int(11) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `afacturer` tinyint(4) DEFAULT 0,
  `fk_facture` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_printing`
--

CREATE TABLE `llx_printing` (
  `rowid` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `datec` datetime DEFAULT NULL,
  `printer_name` text NOT NULL,
  `printer_location` text NOT NULL,
  `printer_id` varchar(255) NOT NULL,
  `copy` int(11) NOT NULL DEFAULT 1,
  `module` varchar(16) NOT NULL,
  `driver` varchar(16) NOT NULL,
  `userid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_product`
--

CREATE TABLE `llx_product` (
  `rowid` int(11) NOT NULL,
  `ref` varchar(128) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `ref_ext` varchar(128) DEFAULT NULL,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_parent` int(11) DEFAULT 0,
  `label` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `note_public` text DEFAULT NULL,
  `note` text DEFAULT NULL,
  `customcode` varchar(32) DEFAULT NULL,
  `fk_country` int(11) DEFAULT NULL,
  `fk_state` int(11) DEFAULT NULL,
  `price` double(24,8) DEFAULT 0.00000000,
  `price_ttc` double(24,8) DEFAULT 0.00000000,
  `price_min` double(24,8) DEFAULT 0.00000000,
  `price_min_ttc` double(24,8) DEFAULT 0.00000000,
  `price_base_type` varchar(3) DEFAULT 'HT',
  `cost_price` double(24,8) DEFAULT NULL,
  `default_vat_code` varchar(10) DEFAULT NULL,
  `tva_tx` double(6,3) DEFAULT NULL,
  `recuperableonly` int(11) NOT NULL DEFAULT 0,
  `localtax1_tx` double(6,3) DEFAULT 0.000,
  `localtax1_type` varchar(10) NOT NULL DEFAULT '0',
  `localtax2_tx` double(6,3) DEFAULT 0.000,
  `localtax2_type` varchar(10) NOT NULL DEFAULT '0',
  `fk_user_author` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `tosell` tinyint(4) DEFAULT 1,
  `tobuy` tinyint(4) DEFAULT 1,
  `onportal` tinyint(4) DEFAULT 0,
  `tobatch` tinyint(4) NOT NULL DEFAULT 0,
  `batch_mask` varchar(32) DEFAULT NULL,
  `fk_product_type` int(11) DEFAULT 0,
  `duration` varchar(6) DEFAULT NULL,
  `seuil_stock_alerte` float DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `barcode` varchar(180) DEFAULT NULL,
  `fk_barcode_type` int(11) DEFAULT NULL,
  `accountancy_code_sell` varchar(32) DEFAULT NULL,
  `accountancy_code_sell_intra` varchar(32) DEFAULT NULL,
  `accountancy_code_sell_export` varchar(32) DEFAULT NULL,
  `accountancy_code_buy` varchar(32) DEFAULT NULL,
  `accountancy_code_buy_intra` varchar(32) DEFAULT NULL,
  `accountancy_code_buy_export` varchar(32) DEFAULT NULL,
  `partnumber` varchar(32) DEFAULT NULL,
  `net_measure` float DEFAULT NULL,
  `net_measure_units` tinyint(4) DEFAULT NULL,
  `weight` float DEFAULT NULL,
  `weight_units` tinyint(4) DEFAULT NULL,
  `length` float DEFAULT NULL,
  `length_units` tinyint(4) DEFAULT NULL,
  `width` float DEFAULT NULL,
  `width_units` tinyint(4) DEFAULT NULL,
  `height` float DEFAULT NULL,
  `height_units` tinyint(4) DEFAULT NULL,
  `surface` float DEFAULT NULL,
  `surface_units` tinyint(4) DEFAULT NULL,
  `volume` float DEFAULT NULL,
  `volume_units` tinyint(4) DEFAULT NULL,
  `stock` double DEFAULT NULL,
  `pmp` double(24,8) NOT NULL DEFAULT 0.00000000,
  `fifo` double(24,8) DEFAULT NULL,
  `lifo` double(24,8) DEFAULT NULL,
  `fk_default_warehouse` int(11) DEFAULT NULL,
  `canvas` varchar(32) DEFAULT NULL,
  `finished` tinyint(4) DEFAULT NULL,
  `lifetime` int(11) DEFAULT NULL,
  `qc_frequency` int(11) DEFAULT NULL,
  `hidden` tinyint(4) DEFAULT 0,
  `import_key` varchar(14) DEFAULT NULL,
  `model_pdf` varchar(255) DEFAULT NULL,
  `fk_price_expression` int(11) DEFAULT NULL,
  `desiredstock` float DEFAULT 0,
  `fk_unit` int(11) DEFAULT NULL,
  `price_autogen` tinyint(4) DEFAULT 0,
  `fk_project` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `llx_product`
--

INSERT INTO `llx_product` (`rowid`, `ref`, `entity`, `ref_ext`, `datec`, `tms`, `fk_parent`, `label`, `description`, `note_public`, `note`, `customcode`, `fk_country`, `fk_state`, `price`, `price_ttc`, `price_min`, `price_min_ttc`, `price_base_type`, `cost_price`, `default_vat_code`, `tva_tx`, `recuperableonly`, `localtax1_tx`, `localtax1_type`, `localtax2_tx`, `localtax2_type`, `fk_user_author`, `fk_user_modif`, `tosell`, `tobuy`, `onportal`, `tobatch`, `batch_mask`, `fk_product_type`, `duration`, `seuil_stock_alerte`, `url`, `barcode`, `fk_barcode_type`, `accountancy_code_sell`, `accountancy_code_sell_intra`, `accountancy_code_sell_export`, `accountancy_code_buy`, `accountancy_code_buy_intra`, `accountancy_code_buy_export`, `partnumber`, `net_measure`, `net_measure_units`, `weight`, `weight_units`, `length`, `length_units`, `width`, `width_units`, `height`, `height_units`, `surface`, `surface_units`, `volume`, `volume_units`, `stock`, `pmp`, `fifo`, `lifo`, `fk_default_warehouse`, `canvas`, `finished`, `lifetime`, `qc_frequency`, `hidden`, `import_key`, `model_pdf`, `fk_price_expression`, `desiredstock`, `fk_unit`, `price_autogen`, `fk_project`) VALUES
(1, 'Eau', 1, NULL, '2024-07-16 13:41:10', '2024-07-16 13:41:10', 0, 'Bouteille d\'eau', '', NULL, '', '', NULL, NULL, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 'HT', NULL, NULL, 0.000, 0, 0.000, '0', 0.000, '0', 1, 1, 1, 1, 0, 0, '', 0, '', 0, NULL, NULL, NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0.00000000, NULL, NULL, 1, '', NULL, NULL, NULL, 0, NULL, NULL, NULL, 0, NULL, 0, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `llx_product_association`
--

CREATE TABLE `llx_product_association` (
  `rowid` int(11) NOT NULL,
  `fk_product_pere` int(11) NOT NULL DEFAULT 0,
  `fk_product_fils` int(11) NOT NULL DEFAULT 0,
  `qty` double DEFAULT NULL,
  `incdec` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_product_attribute`
--

CREATE TABLE `llx_product_attribute` (
  `rowid` int(11) NOT NULL,
  `ref` varchar(255) NOT NULL,
  `ref_ext` varchar(255) DEFAULT NULL,
  `label` varchar(255) NOT NULL,
  `rang` int(11) NOT NULL DEFAULT 0,
  `entity` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_product_attribute_combination`
--

CREATE TABLE `llx_product_attribute_combination` (
  `rowid` int(11) NOT NULL,
  `fk_product_parent` int(11) NOT NULL,
  `fk_product_child` int(11) NOT NULL,
  `variation_price` double(24,8) NOT NULL,
  `variation_price_percentage` int(11) DEFAULT NULL,
  `variation_weight` double NOT NULL,
  `variation_ref_ext` varchar(255) DEFAULT NULL,
  `entity` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_product_attribute_combination2val`
--

CREATE TABLE `llx_product_attribute_combination2val` (
  `rowid` int(11) NOT NULL,
  `fk_prod_combination` int(11) NOT NULL,
  `fk_prod_attr` int(11) NOT NULL,
  `fk_prod_attr_val` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_product_attribute_combination_price_level`
--

CREATE TABLE `llx_product_attribute_combination_price_level` (
  `rowid` int(11) NOT NULL,
  `fk_product_attribute_combination` int(11) NOT NULL DEFAULT 1,
  `fk_price_level` int(11) NOT NULL DEFAULT 1,
  `variation_price` double(24,8) NOT NULL,
  `variation_price_percentage` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_product_attribute_value`
--

CREATE TABLE `llx_product_attribute_value` (
  `rowid` int(11) NOT NULL,
  `fk_product_attribute` int(11) NOT NULL,
  `ref` varchar(180) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  `entity` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_product_batch`
--

CREATE TABLE `llx_product_batch` (
  `rowid` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_product_stock` int(11) NOT NULL,
  `eatby` datetime DEFAULT NULL,
  `sellby` datetime DEFAULT NULL,
  `batch` varchar(128) NOT NULL,
  `qty` double NOT NULL DEFAULT 0,
  `import_key` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_product_customer_price`
--

CREATE TABLE `llx_product_customer_price` (
  `rowid` int(11) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_product` int(11) NOT NULL,
  `fk_soc` int(11) NOT NULL,
  `ref_customer` varchar(30) DEFAULT NULL,
  `price` double(24,8) DEFAULT 0.00000000,
  `price_ttc` double(24,8) DEFAULT 0.00000000,
  `price_min` double(24,8) DEFAULT 0.00000000,
  `price_min_ttc` double(24,8) DEFAULT 0.00000000,
  `price_base_type` varchar(3) DEFAULT 'HT',
  `default_vat_code` varchar(10) DEFAULT NULL,
  `tva_tx` double(6,3) DEFAULT NULL,
  `recuperableonly` int(11) NOT NULL DEFAULT 0,
  `localtax1_tx` double(6,3) DEFAULT 0.000,
  `localtax1_type` varchar(10) NOT NULL DEFAULT '0',
  `localtax2_tx` double(6,3) DEFAULT 0.000,
  `localtax2_type` varchar(10) NOT NULL DEFAULT '0',
  `fk_user` int(11) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_product_customer_price_log`
--

CREATE TABLE `llx_product_customer_price_log` (
  `rowid` int(11) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `datec` datetime DEFAULT NULL,
  `fk_product` int(11) NOT NULL,
  `fk_soc` int(11) NOT NULL DEFAULT 0,
  `ref_customer` varchar(30) DEFAULT NULL,
  `price` double(24,8) DEFAULT 0.00000000,
  `price_ttc` double(24,8) DEFAULT 0.00000000,
  `price_min` double(24,8) DEFAULT 0.00000000,
  `price_min_ttc` double(24,8) DEFAULT 0.00000000,
  `price_base_type` varchar(3) DEFAULT 'HT',
  `default_vat_code` varchar(10) DEFAULT NULL,
  `tva_tx` double(6,3) DEFAULT NULL,
  `recuperableonly` int(11) NOT NULL DEFAULT 0,
  `localtax1_tx` double(6,3) DEFAULT 0.000,
  `localtax1_type` varchar(10) NOT NULL DEFAULT '0',
  `localtax2_tx` double(6,3) DEFAULT 0.000,
  `localtax2_type` varchar(10) NOT NULL DEFAULT '0',
  `fk_user` int(11) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_product_extrafields`
--

CREATE TABLE `llx_product_extrafields` (
  `rowid` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_product_fournisseur_price`
--

CREATE TABLE `llx_product_fournisseur_price` (
  `rowid` int(11) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_product` int(11) DEFAULT NULL,
  `fk_soc` int(11) DEFAULT NULL,
  `ref_fourn` varchar(30) DEFAULT NULL,
  `desc_fourn` text DEFAULT NULL,
  `fk_availability` int(11) DEFAULT NULL,
  `price` double(24,8) DEFAULT 0.00000000,
  `quantity` double DEFAULT NULL,
  `remise_percent` double NOT NULL DEFAULT 0,
  `remise` double NOT NULL DEFAULT 0,
  `unitprice` double(24,8) DEFAULT 0.00000000,
  `charges` double(24,8) DEFAULT 0.00000000,
  `default_vat_code` varchar(10) DEFAULT NULL,
  `barcode` varchar(180) DEFAULT NULL,
  `fk_barcode_type` int(11) DEFAULT NULL,
  `tva_tx` double(6,3) NOT NULL,
  `localtax1_tx` double(6,3) DEFAULT 0.000,
  `localtax1_type` varchar(10) NOT NULL DEFAULT '0',
  `localtax2_tx` double(6,3) DEFAULT 0.000,
  `localtax2_type` varchar(10) NOT NULL DEFAULT '0',
  `info_bits` int(11) NOT NULL DEFAULT 0,
  `fk_user` int(11) DEFAULT NULL,
  `fk_supplier_price_expression` int(11) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `delivery_time_days` int(11) DEFAULT NULL,
  `supplier_reputation` varchar(10) DEFAULT NULL,
  `packaging` varchar(64) DEFAULT NULL,
  `fk_multicurrency` int(11) DEFAULT NULL,
  `multicurrency_code` varchar(255) DEFAULT NULL,
  `multicurrency_tx` double(24,8) DEFAULT 1.00000000,
  `multicurrency_unitprice` double(24,8) DEFAULT NULL,
  `multicurrency_price` double(24,8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_product_fournisseur_price_extrafields`
--

CREATE TABLE `llx_product_fournisseur_price_extrafields` (
  `rowid` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_product_fournisseur_price_log`
--

CREATE TABLE `llx_product_fournisseur_price_log` (
  `rowid` int(11) NOT NULL,
  `datec` datetime DEFAULT NULL,
  `fk_product_fournisseur` int(11) NOT NULL,
  `price` double(24,8) DEFAULT 0.00000000,
  `quantity` double DEFAULT NULL,
  `fk_user` int(11) DEFAULT NULL,
  `fk_multicurrency` int(11) DEFAULT NULL,
  `multicurrency_code` varchar(255) DEFAULT NULL,
  `multicurrency_tx` double(24,8) DEFAULT 1.00000000,
  `multicurrency_unitprice` double(24,8) DEFAULT NULL,
  `multicurrency_price` double(24,8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_product_lang`
--

CREATE TABLE `llx_product_lang` (
  `rowid` int(11) NOT NULL,
  `fk_product` int(11) NOT NULL DEFAULT 0,
  `lang` varchar(5) NOT NULL DEFAULT '0',
  `label` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `note` text DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_product_lot`
--

CREATE TABLE `llx_product_lot` (
  `rowid` int(11) NOT NULL,
  `entity` int(11) DEFAULT 1,
  `fk_product` int(11) NOT NULL,
  `batch` varchar(128) DEFAULT NULL,
  `eatby` date DEFAULT NULL,
  `sellby` date DEFAULT NULL,
  `eol_date` datetime DEFAULT NULL,
  `manufacturing_date` datetime DEFAULT NULL,
  `scrapping_date` datetime DEFAULT NULL,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_user_creat` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `import_key` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_product_lot_extrafields`
--

CREATE TABLE `llx_product_lot_extrafields` (
  `rowid` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_product_perentity`
--

CREATE TABLE `llx_product_perentity` (
  `rowid` int(11) NOT NULL,
  `fk_product` int(11) DEFAULT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `accountancy_code_sell` varchar(32) DEFAULT NULL,
  `accountancy_code_sell_intra` varchar(32) DEFAULT NULL,
  `accountancy_code_sell_export` varchar(32) DEFAULT NULL,
  `accountancy_code_buy` varchar(32) DEFAULT NULL,
  `accountancy_code_buy_intra` varchar(32) DEFAULT NULL,
  `accountancy_code_buy_export` varchar(32) DEFAULT NULL,
  `pmp` double(24,8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_product_price`
--

CREATE TABLE `llx_product_price` (
  `rowid` int(11) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_product` int(11) NOT NULL,
  `date_price` datetime NOT NULL,
  `price_level` smallint(6) DEFAULT 1,
  `price` double(24,8) DEFAULT NULL,
  `price_ttc` double(24,8) DEFAULT NULL,
  `price_min` double(24,8) DEFAULT NULL,
  `price_min_ttc` double(24,8) DEFAULT NULL,
  `price_base_type` varchar(3) DEFAULT 'HT',
  `default_vat_code` varchar(10) DEFAULT NULL,
  `tva_tx` double(6,3) NOT NULL DEFAULT 0.000,
  `recuperableonly` int(11) NOT NULL DEFAULT 0,
  `localtax1_tx` double(6,3) DEFAULT 0.000,
  `localtax1_type` varchar(10) NOT NULL DEFAULT '0',
  `localtax2_tx` double(6,3) DEFAULT 0.000,
  `localtax2_type` varchar(10) NOT NULL DEFAULT '0',
  `fk_user_author` int(11) DEFAULT NULL,
  `tosell` tinyint(4) DEFAULT 1,
  `price_by_qty` int(11) NOT NULL DEFAULT 0,
  `fk_price_expression` int(11) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `fk_multicurrency` int(11) DEFAULT NULL,
  `multicurrency_code` varchar(255) DEFAULT NULL,
  `multicurrency_tx` double(24,8) DEFAULT 1.00000000,
  `multicurrency_price` double(24,8) DEFAULT NULL,
  `multicurrency_price_ttc` double(24,8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `llx_product_price`
--

INSERT INTO `llx_product_price` (`rowid`, `entity`, `tms`, `fk_product`, `date_price`, `price_level`, `price`, `price_ttc`, `price_min`, `price_min_ttc`, `price_base_type`, `default_vat_code`, `tva_tx`, `recuperableonly`, `localtax1_tx`, `localtax1_type`, `localtax2_tx`, `localtax2_type`, `fk_user_author`, `tosell`, `price_by_qty`, `fk_price_expression`, `import_key`, `fk_multicurrency`, `multicurrency_code`, `multicurrency_tx`, `multicurrency_price`, `multicurrency_price_ttc`) VALUES
(1, 1, '2024-07-16 13:41:10', 1, '2024-07-16 13:41:10', 1, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 'HT', NULL, 0.000, 0, 0.000, '0', 0.000, '0', 1, 1, 0, NULL, NULL, NULL, NULL, 1.00000000, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `llx_product_pricerules`
--

CREATE TABLE `llx_product_pricerules` (
  `rowid` int(11) NOT NULL,
  `level` int(11) NOT NULL,
  `fk_level` int(11) NOT NULL,
  `var_percent` double NOT NULL,
  `var_min_percent` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_product_price_by_qty`
--

CREATE TABLE `llx_product_price_by_qty` (
  `rowid` int(11) NOT NULL,
  `fk_product_price` int(11) NOT NULL,
  `price` double(24,8) DEFAULT 0.00000000,
  `price_base_type` varchar(3) DEFAULT 'HT',
  `quantity` double DEFAULT NULL,
  `remise_percent` double NOT NULL DEFAULT 0,
  `remise` double NOT NULL DEFAULT 0,
  `unitprice` double(24,8) DEFAULT 0.00000000,
  `fk_user_creat` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `fk_multicurrency` int(11) DEFAULT NULL,
  `multicurrency_code` varchar(255) DEFAULT NULL,
  `multicurrency_tx` double(24,8) DEFAULT 1.00000000,
  `multicurrency_price` double(24,8) DEFAULT NULL,
  `multicurrency_price_ttc` double(24,8) DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `import_key` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_product_stock`
--

CREATE TABLE `llx_product_stock` (
  `rowid` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_product` int(11) NOT NULL,
  `fk_entrepot` int(11) NOT NULL,
  `reel` double DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_product_warehouse_properties`
--

CREATE TABLE `llx_product_warehouse_properties` (
  `rowid` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_product` int(11) NOT NULL,
  `fk_entrepot` int(11) NOT NULL,
  `seuil_stock_alerte` float DEFAULT 0,
  `desiredstock` float DEFAULT 0,
  `import_key` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_projet`
--

CREATE TABLE `llx_projet` (
  `rowid` int(11) NOT NULL,
  `fk_soc` int(11) DEFAULT NULL,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `dateo` date DEFAULT NULL,
  `datee` date DEFAULT NULL,
  `ref` varchar(50) DEFAULT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `fk_user_creat` int(11) NOT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `public` int(11) DEFAULT NULL,
  `fk_statut` int(11) NOT NULL DEFAULT 0,
  `fk_opp_status` int(11) DEFAULT NULL,
  `opp_percent` double(5,2) DEFAULT NULL,
  `fk_opp_status_end` int(11) DEFAULT NULL,
  `date_close` datetime DEFAULT NULL,
  `fk_user_close` int(11) DEFAULT NULL,
  `note_private` text DEFAULT NULL,
  `note_public` text DEFAULT NULL,
  `email_msgid` varchar(175) DEFAULT NULL,
  `opp_amount` double(24,8) DEFAULT NULL,
  `budget_amount` double(24,8) DEFAULT NULL,
  `usage_opportunity` int(11) DEFAULT 0,
  `usage_task` int(11) DEFAULT 1,
  `usage_bill_time` int(11) DEFAULT 0,
  `usage_organize_event` int(11) DEFAULT 0,
  `accept_conference_suggestions` int(11) DEFAULT 0,
  `accept_booth_suggestions` int(11) DEFAULT 0,
  `price_registration` double(24,8) DEFAULT NULL,
  `price_booth` double(24,8) DEFAULT NULL,
  `model_pdf` varchar(255) DEFAULT NULL,
  `last_main_doc` varchar(255) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_projet_extrafields`
--

CREATE TABLE `llx_projet_extrafields` (
  `rowid` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_projet_task`
--

CREATE TABLE `llx_projet_task` (
  `rowid` int(11) NOT NULL,
  `ref` varchar(50) DEFAULT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `fk_projet` int(11) NOT NULL,
  `fk_task_parent` int(11) NOT NULL DEFAULT 0,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `dateo` datetime DEFAULT NULL,
  `datee` datetime DEFAULT NULL,
  `datev` datetime DEFAULT NULL,
  `label` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `duration_effective` double DEFAULT 0,
  `planned_workload` double DEFAULT 0,
  `progress` int(11) DEFAULT 0,
  `priority` int(11) DEFAULT 0,
  `fk_user_creat` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `fk_user_valid` int(11) DEFAULT NULL,
  `fk_statut` smallint(6) NOT NULL DEFAULT 0,
  `note_private` text DEFAULT NULL,
  `note_public` text DEFAULT NULL,
  `rang` int(11) DEFAULT 0,
  `model_pdf` varchar(255) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_projet_task_extrafields`
--

CREATE TABLE `llx_projet_task_extrafields` (
  `rowid` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_projet_task_time`
--

CREATE TABLE `llx_projet_task_time` (
  `rowid` int(11) NOT NULL,
  `fk_task` int(11) NOT NULL,
  `task_date` date DEFAULT NULL,
  `task_datehour` datetime DEFAULT NULL,
  `task_date_withhour` int(11) DEFAULT 0,
  `task_duration` double DEFAULT NULL,
  `fk_user` int(11) DEFAULT NULL,
  `thm` double(24,8) DEFAULT NULL,
  `invoice_id` int(11) DEFAULT NULL,
  `invoice_line_id` int(11) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `note` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_propal`
--

CREATE TABLE `llx_propal` (
  `rowid` int(11) NOT NULL,
  `ref` varchar(30) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `ref_ext` varchar(255) DEFAULT NULL,
  `ref_int` varchar(255) DEFAULT NULL,
  `ref_client` varchar(255) DEFAULT NULL,
  `fk_soc` int(11) DEFAULT NULL,
  `fk_projet` int(11) DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `datec` datetime DEFAULT NULL,
  `datep` date DEFAULT NULL,
  `fin_validite` datetime DEFAULT NULL,
  `date_valid` datetime DEFAULT NULL,
  `date_signature` datetime DEFAULT NULL,
  `date_cloture` datetime DEFAULT NULL,
  `fk_user_author` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `fk_user_valid` int(11) DEFAULT NULL,
  `fk_user_signature` int(11) DEFAULT NULL,
  `fk_user_cloture` int(11) DEFAULT NULL,
  `fk_statut` smallint(6) NOT NULL DEFAULT 0,
  `price` double DEFAULT 0,
  `remise_percent` double DEFAULT 0,
  `remise_absolue` double DEFAULT 0,
  `remise` double DEFAULT 0,
  `total_ht` double(24,8) DEFAULT 0.00000000,
  `total_tva` double(24,8) DEFAULT 0.00000000,
  `localtax1` double(24,8) DEFAULT 0.00000000,
  `localtax2` double(24,8) DEFAULT 0.00000000,
  `total_ttc` double(24,8) DEFAULT 0.00000000,
  `fk_account` int(11) DEFAULT NULL,
  `fk_currency` varchar(3) DEFAULT NULL,
  `fk_cond_reglement` int(11) DEFAULT NULL,
  `fk_mode_reglement` int(11) DEFAULT NULL,
  `note_private` text DEFAULT NULL,
  `note_public` text DEFAULT NULL,
  `model_pdf` varchar(255) DEFAULT NULL,
  `last_main_doc` varchar(255) DEFAULT NULL,
  `date_livraison` date DEFAULT NULL,
  `fk_shipping_method` int(11) DEFAULT NULL,
  `fk_warehouse` int(11) DEFAULT NULL,
  `fk_availability` int(11) DEFAULT NULL,
  `fk_input_reason` int(11) DEFAULT NULL,
  `fk_incoterms` int(11) DEFAULT NULL,
  `location_incoterms` varchar(255) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `extraparams` varchar(255) DEFAULT NULL,
  `fk_delivery_address` int(11) DEFAULT NULL,
  `fk_multicurrency` int(11) DEFAULT NULL,
  `multicurrency_code` varchar(255) DEFAULT NULL,
  `multicurrency_tx` double(24,8) DEFAULT 1.00000000,
  `multicurrency_total_ht` double(24,8) DEFAULT 0.00000000,
  `multicurrency_total_tva` double(24,8) DEFAULT 0.00000000,
  `multicurrency_total_ttc` double(24,8) DEFAULT 0.00000000
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_propaldet`
--

CREATE TABLE `llx_propaldet` (
  `rowid` int(11) NOT NULL,
  `fk_propal` int(11) NOT NULL,
  `fk_parent_line` int(11) DEFAULT NULL,
  `fk_product` int(11) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `fk_remise_except` int(11) DEFAULT NULL,
  `vat_src_code` varchar(10) DEFAULT '',
  `tva_tx` double(6,3) DEFAULT 0.000,
  `localtax1_tx` double(6,3) DEFAULT 0.000,
  `localtax1_type` varchar(10) DEFAULT NULL,
  `localtax2_tx` double(6,3) DEFAULT 0.000,
  `localtax2_type` varchar(10) DEFAULT NULL,
  `qty` double DEFAULT NULL,
  `remise_percent` double DEFAULT 0,
  `remise` double DEFAULT 0,
  `price` double DEFAULT NULL,
  `subprice` double(24,8) DEFAULT 0.00000000,
  `total_ht` double(24,8) DEFAULT 0.00000000,
  `total_tva` double(24,8) DEFAULT 0.00000000,
  `total_localtax1` double(24,8) DEFAULT 0.00000000,
  `total_localtax2` double(24,8) DEFAULT 0.00000000,
  `total_ttc` double(24,8) DEFAULT 0.00000000,
  `product_type` int(11) DEFAULT 0,
  `date_start` datetime DEFAULT NULL,
  `date_end` datetime DEFAULT NULL,
  `info_bits` int(11) DEFAULT 0,
  `buy_price_ht` double(24,8) DEFAULT 0.00000000,
  `fk_product_fournisseur_price` int(11) DEFAULT NULL,
  `special_code` int(11) DEFAULT 0,
  `rang` int(11) DEFAULT 0,
  `fk_unit` int(11) DEFAULT NULL,
  `fk_multicurrency` int(11) DEFAULT NULL,
  `multicurrency_code` varchar(255) DEFAULT NULL,
  `multicurrency_subprice` double(24,8) DEFAULT 0.00000000,
  `multicurrency_total_ht` double(24,8) DEFAULT 0.00000000,
  `multicurrency_total_tva` double(24,8) DEFAULT 0.00000000,
  `multicurrency_total_ttc` double(24,8) DEFAULT 0.00000000
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_propaldet_extrafields`
--

CREATE TABLE `llx_propaldet_extrafields` (
  `rowid` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_propal_extrafields`
--

CREATE TABLE `llx_propal_extrafields` (
  `rowid` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_propal_merge_pdf_product`
--

CREATE TABLE `llx_propal_merge_pdf_product` (
  `rowid` int(11) NOT NULL,
  `fk_product` int(11) NOT NULL,
  `file_name` varchar(200) NOT NULL,
  `lang` varchar(5) DEFAULT NULL,
  `fk_user_author` int(11) DEFAULT NULL,
  `fk_user_mod` int(11) NOT NULL,
  `datec` datetime NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `import_key` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_reception`
--

CREATE TABLE `llx_reception` (
  `rowid` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `ref` varchar(30) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `fk_soc` int(11) NOT NULL,
  `fk_projet` int(11) DEFAULT NULL,
  `ref_ext` varchar(30) DEFAULT NULL,
  `ref_int` varchar(30) DEFAULT NULL,
  `ref_supplier` varchar(30) DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  `fk_user_author` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `date_valid` datetime DEFAULT NULL,
  `fk_user_valid` int(11) DEFAULT NULL,
  `date_delivery` datetime DEFAULT NULL,
  `date_reception` datetime DEFAULT NULL,
  `fk_shipping_method` int(11) DEFAULT NULL,
  `tracking_number` varchar(50) DEFAULT NULL,
  `fk_statut` smallint(6) DEFAULT 0,
  `billed` smallint(6) DEFAULT 0,
  `height` float DEFAULT NULL,
  `width` float DEFAULT NULL,
  `size_units` int(11) DEFAULT NULL,
  `size` float DEFAULT NULL,
  `weight_units` int(11) DEFAULT NULL,
  `weight` float DEFAULT NULL,
  `note_private` text DEFAULT NULL,
  `note_public` text DEFAULT NULL,
  `model_pdf` varchar(255) DEFAULT NULL,
  `fk_incoterms` int(11) DEFAULT NULL,
  `location_incoterms` varchar(255) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `extraparams` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_reception_extrafields`
--

CREATE TABLE `llx_reception_extrafields` (
  `rowid` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_recruitment_recruitmentcandidature`
--

CREATE TABLE `llx_recruitment_recruitmentcandidature` (
  `rowid` int(11) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `ref` varchar(128) NOT NULL DEFAULT '(PROV)',
  `fk_recruitmentjobposition` int(11) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `note_public` text DEFAULT NULL,
  `note_private` text DEFAULT NULL,
  `date_creation` datetime NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_user_creat` int(11) NOT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `model_pdf` varchar(255) DEFAULT NULL,
  `status` smallint(6) NOT NULL,
  `firstname` varchar(128) DEFAULT NULL,
  `lastname` varchar(128) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(64) DEFAULT NULL,
  `date_birth` date DEFAULT NULL,
  `remuneration_requested` int(11) DEFAULT NULL,
  `remuneration_proposed` int(11) DEFAULT NULL,
  `email_msgid` varchar(175) DEFAULT NULL,
  `fk_recruitment_origin` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_recruitment_recruitmentcandidature_extrafields`
--

CREATE TABLE `llx_recruitment_recruitmentcandidature_extrafields` (
  `rowid` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_recruitment_recruitmentjobposition`
--

CREATE TABLE `llx_recruitment_recruitmentjobposition` (
  `rowid` int(11) NOT NULL,
  `ref` varchar(128) NOT NULL DEFAULT '(PROV)',
  `entity` int(11) NOT NULL DEFAULT 1,
  `label` varchar(255) NOT NULL,
  `qty` int(11) NOT NULL DEFAULT 1,
  `fk_soc` int(11) DEFAULT NULL,
  `fk_project` int(11) DEFAULT NULL,
  `fk_user_recruiter` int(11) DEFAULT NULL,
  `email_recruiter` varchar(255) DEFAULT NULL,
  `fk_user_supervisor` int(11) DEFAULT NULL,
  `fk_establishment` int(11) DEFAULT NULL,
  `date_planned` date DEFAULT NULL,
  `remuneration_suggested` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `note_public` text DEFAULT NULL,
  `note_private` text DEFAULT NULL,
  `date_creation` datetime NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_user_creat` int(11) NOT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `last_main_doc` varchar(255) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `model_pdf` varchar(255) DEFAULT NULL,
  `status` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_recruitment_recruitmentjobposition_extrafields`
--

CREATE TABLE `llx_recruitment_recruitmentjobposition_extrafields` (
  `rowid` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_resource`
--

CREATE TABLE `llx_resource` (
  `rowid` int(11) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `ref` varchar(255) DEFAULT NULL,
  `asset_number` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `fk_code_type_resource` varchar(32) DEFAULT NULL,
  `datec` datetime DEFAULT NULL,
  `date_valid` datetime DEFAULT NULL,
  `fk_user_author` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `fk_user_valid` int(11) DEFAULT NULL,
  `fk_statut` smallint(6) NOT NULL DEFAULT 0,
  `note_public` text DEFAULT NULL,
  `note_private` text DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `extraparams` varchar(255) DEFAULT NULL,
  `fk_country` int(11) DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_resource_extrafields`
--

CREATE TABLE `llx_resource_extrafields` (
  `rowid` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_rights_def`
--

CREATE TABLE `llx_rights_def` (
  `id` int(11) NOT NULL,
  `libelle` varchar(255) DEFAULT NULL,
  `module` varchar(64) DEFAULT NULL,
  `module_position` int(11) NOT NULL DEFAULT 0,
  `family_position` int(11) NOT NULL DEFAULT 0,
  `entity` int(11) NOT NULL DEFAULT 1,
  `perms` varchar(50) DEFAULT NULL,
  `subperms` varchar(50) DEFAULT NULL,
  `type` varchar(1) DEFAULT NULL,
  `bydefault` tinyint(4) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `llx_rights_def`
--

INSERT INTO `llx_rights_def` (`id`, `libelle`, `module`, `module_position`, `family_position`, `entity`, `perms`, `subperms`, `type`, `bydefault`) VALUES
(31, 'Read products', 'produit', 0, 0, 1, 'lire', NULL, 'r', 0),
(32, 'Create/modify products', 'produit', 0, 0, 1, 'creer', NULL, 'w', 0),
(34, 'Delete products', 'produit', 0, 0, 1, 'supprimer', NULL, 'd', 0),
(38, 'Export products', 'produit', 0, 0, 1, 'export', NULL, 'r', 0),
(39, 'Ignore minimum price', 'produit', 0, 0, 1, 'ignore_price_min_advance', NULL, 'r', 0),
(1001, 'Lire les stocks', 'stock', 0, 0, 1, 'lire', NULL, 'r', 0),
(1002, 'Creer/Modifier les stocks', 'stock', 0, 0, 1, 'creer', NULL, 'w', 0),
(1003, 'Supprimer les stocks', 'stock', 0, 0, 1, 'supprimer', NULL, 'd', 0),
(1004, 'Lire mouvements de stocks', 'stock', 0, 0, 1, 'mouvement', 'lire', 'r', 0),
(1005, 'Creer/modifier mouvements de stocks', 'stock', 0, 0, 1, 'mouvement', 'creer', 'w', 0),
(1011, 'inventoryReadPermission', 'stock', 0, 0, 1, 'inventory_advance', 'read', 'w', 0),
(1012, 'inventoryCreatePermission', 'stock', 0, 0, 1, 'inventory_advance', 'write', 'w', 0);

-- --------------------------------------------------------

--
-- Structure de la table `llx_salary`
--

CREATE TABLE `llx_salary` (
  `rowid` int(11) NOT NULL,
  `ref` varchar(30) DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `datec` datetime DEFAULT NULL,
  `fk_user` int(11) NOT NULL,
  `datep` date DEFAULT NULL,
  `datev` date DEFAULT NULL,
  `salary` double(24,8) DEFAULT NULL,
  `amount` double(24,8) NOT NULL DEFAULT 0.00000000,
  `fk_projet` int(11) DEFAULT NULL,
  `fk_typepayment` int(11) NOT NULL,
  `num_payment` varchar(50) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `datesp` date DEFAULT NULL,
  `dateep` date DEFAULT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `note` text DEFAULT NULL,
  `fk_bank` int(11) DEFAULT NULL,
  `paye` smallint(6) NOT NULL DEFAULT 0,
  `fk_account` int(11) DEFAULT NULL,
  `fk_user_author` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_salary_extrafields`
--

CREATE TABLE `llx_salary_extrafields` (
  `rowid` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_session`
--

CREATE TABLE `llx_session` (
  `session_id` varchar(50) NOT NULL,
  `session_variable` text DEFAULT NULL,
  `last_accessed` datetime NOT NULL,
  `fk_user` int(11) NOT NULL,
  `remote_ip` varchar(64) DEFAULT NULL,
  `user_agent` varchar(128) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_societe`
--

CREATE TABLE `llx_societe` (
  `rowid` int(11) NOT NULL,
  `nom` varchar(128) DEFAULT NULL,
  `name_alias` varchar(128) DEFAULT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `ref_ext` varchar(255) DEFAULT NULL,
  `ref_int` varchar(255) DEFAULT NULL,
  `statut` tinyint(4) DEFAULT 0,
  `parent` int(11) DEFAULT NULL,
  `status` tinyint(4) DEFAULT 1,
  `code_client` varchar(24) DEFAULT NULL,
  `code_fournisseur` varchar(24) DEFAULT NULL,
  `code_compta` varchar(24) DEFAULT NULL,
  `code_compta_fournisseur` varchar(24) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `zip` varchar(25) DEFAULT NULL,
  `town` varchar(50) DEFAULT NULL,
  `fk_departement` int(11) DEFAULT 0,
  `fk_pays` int(11) DEFAULT 0,
  `fk_account` int(11) DEFAULT 0,
  `phone` varchar(20) DEFAULT NULL,
  `fax` varchar(20) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `email` varchar(128) DEFAULT NULL,
  `socialnetworks` text DEFAULT NULL,
  `skype` varchar(255) DEFAULT NULL,
  `twitter` varchar(255) DEFAULT NULL,
  `facebook` varchar(255) DEFAULT NULL,
  `linkedin` varchar(255) DEFAULT NULL,
  `instagram` varchar(255) DEFAULT NULL,
  `snapchat` varchar(255) DEFAULT NULL,
  `googleplus` varchar(255) DEFAULT NULL,
  `youtube` varchar(255) DEFAULT NULL,
  `whatsapp` varchar(255) DEFAULT NULL,
  `fk_effectif` int(11) DEFAULT 0,
  `fk_typent` int(11) DEFAULT NULL,
  `fk_forme_juridique` int(11) DEFAULT 0,
  `fk_currency` varchar(3) DEFAULT NULL,
  `siren` varchar(128) DEFAULT NULL,
  `siret` varchar(128) DEFAULT NULL,
  `ape` varchar(128) DEFAULT NULL,
  `idprof4` varchar(128) DEFAULT NULL,
  `idprof5` varchar(128) DEFAULT NULL,
  `idprof6` varchar(128) DEFAULT NULL,
  `tva_intra` varchar(20) DEFAULT NULL,
  `capital` double(24,8) DEFAULT NULL,
  `fk_stcomm` int(11) NOT NULL DEFAULT 0,
  `note_private` text DEFAULT NULL,
  `note_public` text DEFAULT NULL,
  `model_pdf` varchar(255) DEFAULT NULL,
  `prefix_comm` varchar(5) DEFAULT NULL,
  `client` tinyint(4) DEFAULT 0,
  `fournisseur` tinyint(4) DEFAULT 0,
  `supplier_account` varchar(32) DEFAULT NULL,
  `fk_prospectlevel` varchar(12) DEFAULT NULL,
  `fk_incoterms` int(11) DEFAULT NULL,
  `location_incoterms` varchar(255) DEFAULT NULL,
  `customer_bad` tinyint(4) DEFAULT 0,
  `customer_rate` double DEFAULT 0,
  `supplier_rate` double DEFAULT 0,
  `remise_client` double DEFAULT 0,
  `remise_supplier` double DEFAULT 0,
  `mode_reglement` tinyint(4) DEFAULT NULL,
  `cond_reglement` tinyint(4) DEFAULT NULL,
  `transport_mode` tinyint(4) DEFAULT NULL,
  `mode_reglement_supplier` tinyint(4) DEFAULT NULL,
  `cond_reglement_supplier` tinyint(4) DEFAULT NULL,
  `transport_mode_supplier` tinyint(4) DEFAULT NULL,
  `fk_shipping_method` int(11) DEFAULT NULL,
  `tva_assuj` tinyint(4) DEFAULT 1,
  `localtax1_assuj` tinyint(4) DEFAULT 0,
  `localtax1_value` double(6,3) DEFAULT NULL,
  `localtax2_assuj` tinyint(4) DEFAULT 0,
  `localtax2_value` double(6,3) DEFAULT NULL,
  `barcode` varchar(180) DEFAULT NULL,
  `fk_barcode_type` int(11) DEFAULT 0,
  `price_level` int(11) DEFAULT NULL,
  `outstanding_limit` double(24,8) DEFAULT NULL,
  `order_min_amount` double(24,8) DEFAULT NULL,
  `supplier_order_min_amount` double(24,8) DEFAULT NULL,
  `default_lang` varchar(6) DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `logo_squarred` varchar(255) DEFAULT NULL,
  `canvas` varchar(32) DEFAULT NULL,
  `fk_warehouse` int(11) DEFAULT NULL,
  `webservices_url` varchar(255) DEFAULT NULL,
  `webservices_key` varchar(128) DEFAULT NULL,
  `accountancy_code_sell` varchar(32) DEFAULT NULL,
  `accountancy_code_buy` varchar(32) DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `datec` datetime DEFAULT NULL,
  `fk_user_creat` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `fk_multicurrency` int(11) DEFAULT NULL,
  `multicurrency_code` varchar(255) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_societe_account`
--

CREATE TABLE `llx_societe_account` (
  `rowid` int(11) NOT NULL,
  `entity` int(11) DEFAULT 1,
  `login` varchar(128) NOT NULL,
  `pass_encoding` varchar(24) DEFAULT NULL,
  `pass_crypted` varchar(128) DEFAULT NULL,
  `pass_temp` varchar(128) DEFAULT NULL,
  `fk_soc` int(11) DEFAULT NULL,
  `fk_website` int(11) DEFAULT NULL,
  `site` varchar(128) DEFAULT NULL,
  `site_account` varchar(128) DEFAULT NULL,
  `key_account` varchar(128) DEFAULT NULL,
  `note_private` text DEFAULT NULL,
  `date_last_login` datetime DEFAULT NULL,
  `date_previous_login` datetime DEFAULT NULL,
  `date_creation` datetime NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_user_creat` int(11) NOT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_societe_address`
--

CREATE TABLE `llx_societe_address` (
  `rowid` int(11) NOT NULL,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `label` varchar(30) DEFAULT NULL,
  `fk_soc` int(11) DEFAULT 0,
  `name` varchar(60) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `zip` varchar(10) DEFAULT NULL,
  `town` varchar(50) DEFAULT NULL,
  `fk_pays` int(11) DEFAULT 0,
  `phone` varchar(20) DEFAULT NULL,
  `fax` varchar(20) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `fk_user_creat` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_societe_commerciaux`
--

CREATE TABLE `llx_societe_commerciaux` (
  `rowid` int(11) NOT NULL,
  `fk_soc` int(11) DEFAULT NULL,
  `fk_user` int(11) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_societe_contacts`
--

CREATE TABLE `llx_societe_contacts` (
  `rowid` int(11) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `date_creation` datetime NOT NULL,
  `fk_soc` int(11) NOT NULL,
  `fk_c_type_contact` int(11) NOT NULL,
  `fk_socpeople` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `import_key` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_societe_extrafields`
--

CREATE TABLE `llx_societe_extrafields` (
  `rowid` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_societe_perentity`
--

CREATE TABLE `llx_societe_perentity` (
  `rowid` int(11) NOT NULL,
  `fk_soc` int(11) DEFAULT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `accountancy_code_sell` varchar(32) DEFAULT NULL,
  `accountancy_code_buy` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_societe_prices`
--

CREATE TABLE `llx_societe_prices` (
  `rowid` int(11) NOT NULL,
  `fk_soc` int(11) DEFAULT 0,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `datec` datetime DEFAULT NULL,
  `fk_user_author` int(11) DEFAULT NULL,
  `price_level` tinyint(4) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_societe_remise`
--

CREATE TABLE `llx_societe_remise` (
  `rowid` int(11) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `fk_soc` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `datec` datetime DEFAULT NULL,
  `fk_user_author` int(11) DEFAULT NULL,
  `remise_client` double(6,3) NOT NULL DEFAULT 0.000,
  `note` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_societe_remise_except`
--

CREATE TABLE `llx_societe_remise_except` (
  `rowid` int(11) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `fk_soc` int(11) NOT NULL,
  `discount_type` int(11) NOT NULL DEFAULT 0,
  `datec` datetime DEFAULT NULL,
  `amount_ht` double(24,8) NOT NULL,
  `amount_tva` double(24,8) NOT NULL DEFAULT 0.00000000,
  `amount_ttc` double(24,8) NOT NULL DEFAULT 0.00000000,
  `tva_tx` double(6,3) NOT NULL DEFAULT 0.000,
  `vat_src_code` varchar(10) DEFAULT '',
  `fk_user` int(11) NOT NULL,
  `fk_facture_line` int(11) DEFAULT NULL,
  `fk_facture` int(11) DEFAULT NULL,
  `fk_facture_source` int(11) DEFAULT NULL,
  `fk_invoice_supplier_line` int(11) DEFAULT NULL,
  `fk_invoice_supplier` int(11) DEFAULT NULL,
  `fk_invoice_supplier_source` int(11) DEFAULT NULL,
  `description` text NOT NULL,
  `multicurrency_amount_ht` double(24,8) NOT NULL DEFAULT 0.00000000,
  `multicurrency_amount_tva` double(24,8) NOT NULL DEFAULT 0.00000000,
  `multicurrency_amount_ttc` double(24,8) NOT NULL DEFAULT 0.00000000
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_societe_remise_supplier`
--

CREATE TABLE `llx_societe_remise_supplier` (
  `rowid` int(11) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `fk_soc` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `datec` datetime DEFAULT NULL,
  `fk_user_author` int(11) DEFAULT NULL,
  `remise_supplier` double(6,3) NOT NULL DEFAULT 0.000,
  `note` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_societe_rib`
--

CREATE TABLE `llx_societe_rib` (
  `rowid` int(11) NOT NULL,
  `type` varchar(32) NOT NULL DEFAULT 'ban',
  `label` varchar(200) DEFAULT NULL,
  `fk_soc` int(11) NOT NULL,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `bank` varchar(255) DEFAULT NULL,
  `code_banque` varchar(128) DEFAULT NULL,
  `code_guichet` varchar(6) DEFAULT NULL,
  `number` varchar(255) DEFAULT NULL,
  `cle_rib` varchar(5) DEFAULT NULL,
  `bic` varchar(20) DEFAULT NULL,
  `iban_prefix` varchar(34) DEFAULT NULL,
  `domiciliation` varchar(255) DEFAULT NULL,
  `proprio` varchar(60) DEFAULT NULL,
  `owner_address` varchar(255) DEFAULT NULL,
  `default_rib` smallint(6) NOT NULL DEFAULT 0,
  `rum` varchar(32) DEFAULT NULL,
  `date_rum` date DEFAULT NULL,
  `frstrecur` varchar(16) DEFAULT 'FRST',
  `last_four` varchar(4) DEFAULT NULL,
  `card_type` varchar(255) DEFAULT NULL,
  `cvn` varchar(255) DEFAULT NULL,
  `exp_date_month` int(11) DEFAULT NULL,
  `exp_date_year` int(11) DEFAULT NULL,
  `country_code` varchar(10) DEFAULT NULL,
  `approved` int(11) DEFAULT 0,
  `email` varchar(255) DEFAULT NULL,
  `ending_date` date DEFAULT NULL,
  `max_total_amount_of_all_payments` double(24,8) DEFAULT NULL,
  `preapproval_key` varchar(255) DEFAULT NULL,
  `starting_date` date DEFAULT NULL,
  `total_amount_of_all_payments` double(24,8) DEFAULT NULL,
  `stripe_card_ref` varchar(128) DEFAULT NULL,
  `stripe_account` varchar(128) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `ipaddress` varchar(68) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `import_key` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_socpeople`
--

CREATE TABLE `llx_socpeople` (
  `rowid` int(11) NOT NULL,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_soc` int(11) DEFAULT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `ref_ext` varchar(255) DEFAULT NULL,
  `civility` varchar(6) DEFAULT NULL,
  `lastname` varchar(50) DEFAULT NULL,
  `firstname` varchar(50) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `zip` varchar(25) DEFAULT NULL,
  `town` varchar(255) DEFAULT NULL,
  `fk_departement` int(11) DEFAULT NULL,
  `fk_pays` int(11) DEFAULT 0,
  `birthday` date DEFAULT NULL,
  `poste` varchar(255) DEFAULT NULL,
  `phone` varchar(30) DEFAULT NULL,
  `phone_perso` varchar(30) DEFAULT NULL,
  `phone_mobile` varchar(30) DEFAULT NULL,
  `fax` varchar(30) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `socialnetworks` text DEFAULT NULL,
  `jabberid` varchar(255) DEFAULT NULL,
  `skype` varchar(255) DEFAULT NULL,
  `twitter` varchar(255) DEFAULT NULL,
  `facebook` varchar(255) DEFAULT NULL,
  `linkedin` varchar(255) DEFAULT NULL,
  `instagram` varchar(255) DEFAULT NULL,
  `snapchat` varchar(255) DEFAULT NULL,
  `googleplus` varchar(255) DEFAULT NULL,
  `youtube` varchar(255) DEFAULT NULL,
  `whatsapp` varchar(255) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `no_email` smallint(6) NOT NULL DEFAULT 0,
  `priv` smallint(6) NOT NULL DEFAULT 0,
  `fk_prospectcontactlevel` varchar(12) DEFAULT NULL,
  `fk_stcommcontact` int(11) NOT NULL DEFAULT 0,
  `fk_user_creat` int(11) DEFAULT 0,
  `fk_user_modif` int(11) DEFAULT NULL,
  `note_private` text DEFAULT NULL,
  `note_public` text DEFAULT NULL,
  `default_lang` varchar(6) DEFAULT NULL,
  `canvas` varchar(32) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `statut` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_socpeople_extrafields`
--

CREATE TABLE `llx_socpeople_extrafields` (
  `rowid` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_stock_mouvement`
--

CREATE TABLE `llx_stock_mouvement` (
  `rowid` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `datem` datetime DEFAULT NULL,
  `fk_product` int(11) NOT NULL,
  `batch` varchar(128) DEFAULT NULL,
  `eatby` date DEFAULT NULL,
  `sellby` date DEFAULT NULL,
  `fk_entrepot` int(11) NOT NULL,
  `value` double DEFAULT NULL,
  `price` double(24,8) DEFAULT 0.00000000,
  `type_mouvement` smallint(6) DEFAULT NULL,
  `fk_user_author` int(11) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `inventorycode` varchar(128) DEFAULT NULL,
  `fk_project` int(11) DEFAULT NULL,
  `fk_origin` int(11) DEFAULT NULL,
  `origintype` varchar(32) DEFAULT NULL,
  `model_pdf` varchar(255) DEFAULT NULL,
  `fk_projet` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_subscription`
--

CREATE TABLE `llx_subscription` (
  `rowid` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `datec` datetime DEFAULT NULL,
  `fk_adherent` int(11) DEFAULT NULL,
  `fk_type` int(11) DEFAULT NULL,
  `dateadh` datetime DEFAULT NULL,
  `datef` datetime DEFAULT NULL,
  `subscription` double(24,8) DEFAULT NULL,
  `fk_bank` int(11) DEFAULT NULL,
  `fk_user_creat` int(11) DEFAULT NULL,
  `fk_user_valid` int(11) DEFAULT NULL,
  `note` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_supplier_proposal`
--

CREATE TABLE `llx_supplier_proposal` (
  `rowid` int(11) NOT NULL,
  `ref` varchar(30) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `ref_ext` varchar(255) DEFAULT NULL,
  `ref_int` varchar(255) DEFAULT NULL,
  `fk_soc` int(11) DEFAULT NULL,
  `fk_projet` int(11) DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `datec` datetime DEFAULT NULL,
  `date_valid` datetime DEFAULT NULL,
  `date_cloture` datetime DEFAULT NULL,
  `fk_user_author` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `fk_user_valid` int(11) DEFAULT NULL,
  `fk_user_cloture` int(11) DEFAULT NULL,
  `fk_statut` smallint(6) NOT NULL DEFAULT 0,
  `price` double DEFAULT 0,
  `remise_percent` double DEFAULT 0,
  `remise_absolue` double DEFAULT 0,
  `remise` double DEFAULT 0,
  `total_ht` double(24,8) DEFAULT 0.00000000,
  `total_tva` double(24,8) DEFAULT 0.00000000,
  `localtax1` double(24,8) DEFAULT 0.00000000,
  `localtax2` double(24,8) DEFAULT 0.00000000,
  `total_ttc` double(24,8) DEFAULT 0.00000000,
  `fk_account` int(11) DEFAULT NULL,
  `fk_currency` varchar(3) DEFAULT NULL,
  `fk_cond_reglement` int(11) DEFAULT NULL,
  `fk_mode_reglement` int(11) DEFAULT NULL,
  `note_private` text DEFAULT NULL,
  `note_public` text DEFAULT NULL,
  `model_pdf` varchar(255) DEFAULT NULL,
  `last_main_doc` varchar(255) DEFAULT NULL,
  `date_livraison` date DEFAULT NULL,
  `fk_shipping_method` int(11) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `extraparams` varchar(255) DEFAULT NULL,
  `fk_multicurrency` int(11) DEFAULT NULL,
  `multicurrency_code` varchar(255) DEFAULT NULL,
  `multicurrency_tx` double(24,8) DEFAULT 1.00000000,
  `multicurrency_total_ht` double(24,8) DEFAULT 0.00000000,
  `multicurrency_total_tva` double(24,8) DEFAULT 0.00000000,
  `multicurrency_total_ttc` double(24,8) DEFAULT 0.00000000
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_supplier_proposaldet`
--

CREATE TABLE `llx_supplier_proposaldet` (
  `rowid` int(11) NOT NULL,
  `fk_supplier_proposal` int(11) NOT NULL,
  `fk_parent_line` int(11) DEFAULT NULL,
  `fk_product` int(11) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `fk_remise_except` int(11) DEFAULT NULL,
  `vat_src_code` varchar(10) DEFAULT '',
  `tva_tx` double(6,3) DEFAULT 0.000,
  `localtax1_tx` double(6,3) DEFAULT 0.000,
  `localtax1_type` varchar(10) DEFAULT NULL,
  `localtax2_tx` double(6,3) DEFAULT 0.000,
  `localtax2_type` varchar(10) DEFAULT NULL,
  `qty` double DEFAULT NULL,
  `remise_percent` double DEFAULT 0,
  `remise` double DEFAULT 0,
  `price` double DEFAULT NULL,
  `subprice` double(24,8) DEFAULT 0.00000000,
  `total_ht` double(24,8) DEFAULT 0.00000000,
  `total_tva` double(24,8) DEFAULT 0.00000000,
  `total_localtax1` double(24,8) DEFAULT 0.00000000,
  `total_localtax2` double(24,8) DEFAULT 0.00000000,
  `total_ttc` double(24,8) DEFAULT 0.00000000,
  `product_type` int(11) DEFAULT 0,
  `date_start` datetime DEFAULT NULL,
  `date_end` datetime DEFAULT NULL,
  `info_bits` int(11) DEFAULT 0,
  `buy_price_ht` double(24,8) DEFAULT 0.00000000,
  `fk_product_fournisseur_price` int(11) DEFAULT NULL,
  `special_code` int(11) DEFAULT 0,
  `rang` int(11) DEFAULT 0,
  `ref_fourn` varchar(30) DEFAULT NULL,
  `fk_multicurrency` int(11) DEFAULT NULL,
  `multicurrency_code` varchar(255) DEFAULT NULL,
  `multicurrency_subprice` double(24,8) DEFAULT 0.00000000,
  `multicurrency_total_ht` double(24,8) DEFAULT 0.00000000,
  `multicurrency_total_tva` double(24,8) DEFAULT 0.00000000,
  `multicurrency_total_ttc` double(24,8) DEFAULT 0.00000000,
  `fk_unit` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_supplier_proposaldet_extrafields`
--

CREATE TABLE `llx_supplier_proposaldet_extrafields` (
  `rowid` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_supplier_proposal_extrafields`
--

CREATE TABLE `llx_supplier_proposal_extrafields` (
  `rowid` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_takepos_floor_tables`
--

CREATE TABLE `llx_takepos_floor_tables` (
  `rowid` int(11) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `label` varchar(255) DEFAULT NULL,
  `leftpos` float DEFAULT NULL,
  `toppos` float DEFAULT NULL,
  `floor` smallint(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_ticket`
--

CREATE TABLE `llx_ticket` (
  `rowid` int(11) NOT NULL,
  `entity` int(11) DEFAULT 1,
  `ref` varchar(128) NOT NULL,
  `track_id` varchar(128) NOT NULL,
  `fk_soc` int(11) DEFAULT 0,
  `fk_project` int(11) DEFAULT 0,
  `origin_email` varchar(128) DEFAULT NULL,
  `fk_user_create` int(11) DEFAULT NULL,
  `fk_user_assign` int(11) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `fk_statut` int(11) DEFAULT NULL,
  `resolution` int(11) DEFAULT NULL,
  `progress` varchar(100) DEFAULT NULL,
  `timing` varchar(20) DEFAULT NULL,
  `type_code` varchar(32) DEFAULT NULL,
  `category_code` varchar(32) DEFAULT NULL,
  `severity_code` varchar(32) DEFAULT NULL,
  `datec` datetime DEFAULT NULL,
  `date_read` datetime DEFAULT NULL,
  `date_close` datetime DEFAULT NULL,
  `notify_tiers_at_create` tinyint(4) DEFAULT NULL,
  `email_msgid` varchar(255) DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `import_key` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_ticket_extrafields`
--

CREATE TABLE `llx_ticket_extrafields` (
  `rowid` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_tva`
--

CREATE TABLE `llx_tva` (
  `rowid` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `datec` datetime DEFAULT NULL,
  `datep` date DEFAULT NULL,
  `datev` date DEFAULT NULL,
  `amount` double(24,8) NOT NULL DEFAULT 0.00000000,
  `fk_typepayment` int(11) DEFAULT NULL,
  `num_payment` varchar(50) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `note` text DEFAULT NULL,
  `paye` smallint(6) NOT NULL DEFAULT 0,
  `fk_account` int(11) DEFAULT NULL,
  `fk_user_creat` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_user`
--

CREATE TABLE `llx_user` (
  `rowid` int(11) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `ref_ext` varchar(50) DEFAULT NULL,
  `ref_int` varchar(50) DEFAULT NULL,
  `admin` smallint(6) DEFAULT 0,
  `employee` tinyint(4) DEFAULT 1,
  `fk_establishment` int(11) DEFAULT 0,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_user_creat` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `login` varchar(50) NOT NULL,
  `pass_encoding` varchar(24) DEFAULT NULL,
  `pass` varchar(128) DEFAULT NULL,
  `pass_crypted` varchar(128) DEFAULT NULL,
  `pass_temp` varchar(128) DEFAULT NULL,
  `api_key` varchar(128) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `civility` varchar(6) DEFAULT NULL,
  `lastname` varchar(50) DEFAULT NULL,
  `firstname` varchar(50) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `zip` varchar(25) DEFAULT NULL,
  `town` varchar(50) DEFAULT NULL,
  `fk_state` int(11) DEFAULT 0,
  `fk_country` int(11) DEFAULT 0,
  `birth` date DEFAULT NULL,
  `job` varchar(128) DEFAULT NULL,
  `office_phone` varchar(20) DEFAULT NULL,
  `office_fax` varchar(20) DEFAULT NULL,
  `user_mobile` varchar(20) DEFAULT NULL,
  `personal_mobile` varchar(20) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `personal_email` varchar(255) DEFAULT NULL,
  `signature` text DEFAULT NULL,
  `socialnetworks` text DEFAULT NULL,
  `fk_soc` int(11) DEFAULT NULL,
  `fk_socpeople` int(11) DEFAULT NULL,
  `fk_member` int(11) DEFAULT NULL,
  `fk_user` int(11) DEFAULT NULL,
  `fk_user_expense_validator` int(11) DEFAULT NULL,
  `fk_user_holiday_validator` int(11) DEFAULT NULL,
  `idpers1` varchar(128) DEFAULT NULL,
  `idpers2` varchar(128) DEFAULT NULL,
  `idpers3` varchar(128) DEFAULT NULL,
  `note_public` text DEFAULT NULL,
  `note` text DEFAULT NULL,
  `model_pdf` varchar(255) DEFAULT NULL,
  `datelastlogin` datetime DEFAULT NULL,
  `datepreviouslogin` datetime DEFAULT NULL,
  `datelastpassvalidation` datetime DEFAULT NULL,
  `datestartvalidity` datetime DEFAULT NULL,
  `dateendvalidity` datetime DEFAULT NULL,
  `iplastlogin` varchar(250) DEFAULT NULL,
  `ippreviouslogin` varchar(250) DEFAULT NULL,
  `egroupware_id` int(11) DEFAULT NULL,
  `ldap_sid` varchar(255) DEFAULT NULL,
  `openid` varchar(255) DEFAULT NULL,
  `statut` tinyint(4) DEFAULT 1,
  `photo` varchar(255) DEFAULT NULL,
  `lang` varchar(6) DEFAULT NULL,
  `color` varchar(6) DEFAULT NULL,
  `barcode` varchar(255) DEFAULT NULL,
  `fk_barcode_type` int(11) DEFAULT 0,
  `accountancy_code` varchar(32) DEFAULT NULL,
  `nb_holiday` int(11) DEFAULT 0,
  `thm` double(24,8) DEFAULT NULL,
  `tjm` double(24,8) DEFAULT NULL,
  `salary` double(24,8) DEFAULT NULL,
  `salaryextra` double(24,8) DEFAULT NULL,
  `dateemployment` date DEFAULT NULL,
  `dateemploymentend` date DEFAULT NULL,
  `weeklyhours` double(16,8) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `default_range` int(11) DEFAULT NULL,
  `default_c_exp_tax_cat` int(11) DEFAULT NULL,
  `fk_warehouse` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `llx_user`
--

INSERT INTO `llx_user` (`rowid`, `entity`, `ref_ext`, `ref_int`, `admin`, `employee`, `fk_establishment`, `datec`, `tms`, `fk_user_creat`, `fk_user_modif`, `login`, `pass_encoding`, `pass`, `pass_crypted`, `pass_temp`, `api_key`, `gender`, `civility`, `lastname`, `firstname`, `address`, `zip`, `town`, `fk_state`, `fk_country`, `birth`, `job`, `office_phone`, `office_fax`, `user_mobile`, `personal_mobile`, `email`, `personal_email`, `signature`, `socialnetworks`, `fk_soc`, `fk_socpeople`, `fk_member`, `fk_user`, `fk_user_expense_validator`, `fk_user_holiday_validator`, `idpers1`, `idpers2`, `idpers3`, `note_public`, `note`, `model_pdf`, `datelastlogin`, `datepreviouslogin`, `datelastpassvalidation`, `datestartvalidity`, `dateendvalidity`, `iplastlogin`, `ippreviouslogin`, `egroupware_id`, `ldap_sid`, `openid`, `statut`, `photo`, `lang`, `color`, `barcode`, `fk_barcode_type`, `accountancy_code`, `nb_holiday`, `thm`, `tjm`, `salary`, `salaryextra`, `dateemployment`, `dateemploymentend`, `weeklyhours`, `import_key`, `default_range`, `default_c_exp_tax_cat`, `fk_warehouse`) VALUES
(1, 0, NULL, NULL, 1, 1, 0, NULL, '2024-07-16 13:59:28', NULL, NULL, 'admin', NULL, NULL, '21232f297a57a5a743894a0e4a801fc3', NULL, '1ZtIVnP5bQ9QMK983qXoii1kd3c72dRQ', NULL, '', 'SuperAdmin', '', '', '', '', NULL, NULL, NULL, '', '', '', '', '', '', '', '', '[]', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', NULL, '2024-07-16 14:11:11', '2024-07-16 13:35:52', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, '', NULL, 0, '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `llx_usergroup`
--

CREATE TABLE `llx_usergroup` (
  `rowid` int(11) NOT NULL,
  `nom` varchar(180) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `note` text DEFAULT NULL,
  `model_pdf` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_usergroup_extrafields`
--

CREATE TABLE `llx_usergroup_extrafields` (
  `rowid` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_usergroup_rights`
--

CREATE TABLE `llx_usergroup_rights` (
  `rowid` int(11) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `fk_usergroup` int(11) NOT NULL,
  `fk_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_usergroup_user`
--

CREATE TABLE `llx_usergroup_user` (
  `rowid` int(11) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `fk_user` int(11) NOT NULL,
  `fk_usergroup` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_user_alert`
--

CREATE TABLE `llx_user_alert` (
  `rowid` int(11) NOT NULL,
  `type` int(11) DEFAULT NULL,
  `fk_contact` int(11) DEFAULT NULL,
  `fk_user` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_user_clicktodial`
--

CREATE TABLE `llx_user_clicktodial` (
  `fk_user` int(11) NOT NULL,
  `url` varchar(255) DEFAULT NULL,
  `login` varchar(32) DEFAULT NULL,
  `pass` varchar(64) DEFAULT NULL,
  `poste` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_user_employment`
--

CREATE TABLE `llx_user_employment` (
  `rowid` int(11) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `ref` varchar(50) DEFAULT NULL,
  `ref_ext` varchar(50) DEFAULT NULL,
  `fk_user` int(11) DEFAULT NULL,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_user_creat` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `job` varchar(128) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `salary` double(24,8) DEFAULT NULL,
  `salaryextra` double(24,8) DEFAULT NULL,
  `weeklyhours` double(16,8) DEFAULT NULL,
  `dateemployment` date DEFAULT NULL,
  `dateemploymentend` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_user_extrafields`
--

CREATE TABLE `llx_user_extrafields` (
  `rowid` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_user_param`
--

CREATE TABLE `llx_user_param` (
  `fk_user` int(11) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `param` varchar(180) NOT NULL,
  `value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_user_rib`
--

CREATE TABLE `llx_user_rib` (
  `rowid` int(11) NOT NULL,
  `fk_user` int(11) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `label` varchar(30) DEFAULT NULL,
  `bank` varchar(255) DEFAULT NULL,
  `code_banque` varchar(128) DEFAULT NULL,
  `code_guichet` varchar(6) DEFAULT NULL,
  `number` varchar(255) DEFAULT NULL,
  `cle_rib` varchar(5) DEFAULT NULL,
  `bic` varchar(11) DEFAULT NULL,
  `iban_prefix` varchar(34) DEFAULT NULL,
  `domiciliation` varchar(255) DEFAULT NULL,
  `proprio` varchar(60) DEFAULT NULL,
  `owner_address` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_user_rights`
--

CREATE TABLE `llx_user_rights` (
  `rowid` int(11) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `fk_user` int(11) NOT NULL,
  `fk_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `llx_user_rights`
--

INSERT INTO `llx_user_rights` (`rowid`, `entity`, `fk_user`, `fk_id`) VALUES
(8, 1, 1, 31),
(3, 1, 1, 32),
(5, 1, 1, 34),
(7, 1, 1, 38),
(9, 1, 1, 39),
(14, 1, 1, 1001),
(13, 1, 1, 1002),
(15, 1, 1, 1003),
(17, 1, 1, 1004),
(18, 1, 1, 1005),
(20, 1, 1, 1011),
(21, 1, 1, 1012),
(10, 1, 1, 3301);

-- --------------------------------------------------------

--
-- Structure de la table `llx_website`
--

CREATE TABLE `llx_website` (
  `rowid` int(11) NOT NULL,
  `type_container` varchar(16) NOT NULL DEFAULT 'page',
  `entity` int(11) NOT NULL DEFAULT 1,
  `ref` varchar(128) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `maincolor` varchar(16) DEFAULT NULL,
  `maincolorbis` varchar(16) DEFAULT NULL,
  `lang` varchar(8) DEFAULT NULL,
  `otherlang` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT 1,
  `fk_default_home` int(11) DEFAULT NULL,
  `use_manifest` int(11) DEFAULT NULL,
  `virtualhost` varchar(255) DEFAULT NULL,
  `fk_user_creat` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  `position` int(11) DEFAULT 0,
  `lastaccess` datetime DEFAULT NULL,
  `pageviews_month` bigint(20) UNSIGNED DEFAULT 0,
  `pageviews_total` bigint(20) UNSIGNED DEFAULT 0,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `import_key` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_website_extrafields`
--

CREATE TABLE `llx_website_extrafields` (
  `rowid` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_website_page`
--

CREATE TABLE `llx_website_page` (
  `rowid` int(11) NOT NULL,
  `fk_website` int(11) NOT NULL,
  `type_container` varchar(16) NOT NULL DEFAULT 'page',
  `pageurl` varchar(255) NOT NULL,
  `aliasalt` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `keywords` varchar(255) DEFAULT NULL,
  `lang` varchar(6) DEFAULT NULL,
  `fk_page` int(11) DEFAULT NULL,
  `allowed_in_frames` int(11) DEFAULT 0,
  `htmlheader` text DEFAULT NULL,
  `content` mediumtext DEFAULT NULL,
  `status` int(11) DEFAULT 1,
  `grabbed_from` varchar(255) DEFAULT NULL,
  `fk_user_creat` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `author_alias` varchar(64) DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `import_key` varchar(14) DEFAULT NULL,
  `object_type` varchar(255) DEFAULT NULL,
  `fk_object` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_workstation_workstation`
--

CREATE TABLE `llx_workstation_workstation` (
  `rowid` int(11) NOT NULL,
  `ref` varchar(128) NOT NULL DEFAULT '(PROV)',
  `label` varchar(255) DEFAULT NULL,
  `type` varchar(7) DEFAULT NULL,
  `note_public` text DEFAULT NULL,
  `entity` int(11) DEFAULT 1,
  `note_private` text DEFAULT NULL,
  `date_creation` datetime NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_user_creat` int(11) NOT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `status` smallint(6) NOT NULL,
  `nb_operators_required` int(11) DEFAULT NULL,
  `thm_operator_estimated` double DEFAULT NULL,
  `thm_machine_estimated` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_workstation_workstation_resource`
--

CREATE TABLE `llx_workstation_workstation_resource` (
  `rowid` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_resource` int(11) DEFAULT NULL,
  `fk_workstation` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_workstation_workstation_usergroup`
--

CREATE TABLE `llx_workstation_workstation_usergroup` (
  `rowid` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_usergroup` int(11) DEFAULT NULL,
  `fk_workstation` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `llx_zapier_hook`
--

CREATE TABLE `llx_zapier_hook` (
  `rowid` int(11) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `url` varchar(255) DEFAULT NULL,
  `event` varchar(255) DEFAULT NULL,
  `module` varchar(128) DEFAULT NULL,
  `action` varchar(128) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `date_creation` datetime NOT NULL,
  `fk_user` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `import_key` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `llx_accounting_account`
--
ALTER TABLE `llx_accounting_account`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_accounting_account` (`account_number`,`entity`,`fk_pcg_version`),
  ADD KEY `idx_accounting_account_fk_pcg_version` (`fk_pcg_version`),
  ADD KEY `idx_accounting_account_account_parent` (`account_parent`);

--
-- Index pour la table `llx_accounting_bookkeeping`
--
ALTER TABLE `llx_accounting_bookkeeping`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_accounting_bookkeeping_fk_doc` (`fk_doc`),
  ADD KEY `idx_accounting_bookkeeping_fk_docdet` (`fk_docdet`),
  ADD KEY `idx_accounting_bookkeeping_doc_date` (`doc_date`),
  ADD KEY `idx_accounting_bookkeeping_numero_compte` (`numero_compte`,`entity`),
  ADD KEY `idx_accounting_bookkeeping_code_journal` (`code_journal`,`entity`),
  ADD KEY `idx_accounting_bookkeeping_piece_num` (`piece_num`,`entity`);

--
-- Index pour la table `llx_accounting_bookkeeping_tmp`
--
ALTER TABLE `llx_accounting_bookkeeping_tmp`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_accounting_bookkeeping_tmp_doc_date` (`doc_date`),
  ADD KEY `idx_accounting_bookkeeping_tmp_fk_docdet` (`fk_docdet`),
  ADD KEY `idx_accounting_bookkeeping_tmp_numero_compte` (`numero_compte`),
  ADD KEY `idx_accounting_bookkeeping_tmp_code_journal` (`code_journal`);

--
-- Index pour la table `llx_accounting_fiscalyear`
--
ALTER TABLE `llx_accounting_fiscalyear`
  ADD PRIMARY KEY (`rowid`);

--
-- Index pour la table `llx_accounting_groups_account`
--
ALTER TABLE `llx_accounting_groups_account`
  ADD PRIMARY KEY (`rowid`);

--
-- Index pour la table `llx_accounting_journal`
--
ALTER TABLE `llx_accounting_journal`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_accounting_journal_code` (`code`,`entity`);

--
-- Index pour la table `llx_accounting_system`
--
ALTER TABLE `llx_accounting_system`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_accounting_system_pcg_version` (`pcg_version`);

--
-- Index pour la table `llx_actioncomm`
--
ALTER TABLE `llx_actioncomm`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uk_actioncomm_ref` (`ref`,`entity`),
  ADD KEY `idx_actioncomm_fk_soc` (`fk_soc`),
  ADD KEY `idx_actioncomm_fk_contact` (`fk_contact`),
  ADD KEY `idx_actioncomm_code` (`code`),
  ADD KEY `idx_actioncomm_fk_element` (`fk_element`),
  ADD KEY `idx_actioncomm_fk_user_action` (`fk_user_action`),
  ADD KEY `idx_actioncomm_fk_project` (`fk_project`),
  ADD KEY `idx_actioncomm_datep` (`datep`),
  ADD KEY `idx_actioncomm_datep2` (`datep2`),
  ADD KEY `idx_actioncomm_recurid` (`recurid`),
  ADD KEY `idx_actioncomm_ref_ext` (`ref_ext`);

--
-- Index pour la table `llx_actioncomm_extrafields`
--
ALTER TABLE `llx_actioncomm_extrafields`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_actioncomm_extrafields` (`fk_object`);

--
-- Index pour la table `llx_actioncomm_reminder`
--
ALTER TABLE `llx_actioncomm_reminder`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_actioncomm_reminder_unique` (`fk_actioncomm`,`fk_user`,`typeremind`,`offsetvalue`,`offsetunit`),
  ADD KEY `idx_actioncomm_reminder_dateremind` (`dateremind`),
  ADD KEY `idx_actioncomm_reminder_fk_user` (`fk_user`),
  ADD KEY `idx_actioncomm_reminder_status` (`status`);

--
-- Index pour la table `llx_actioncomm_resources`
--
ALTER TABLE `llx_actioncomm_resources`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_actioncomm_resources` (`fk_actioncomm`,`element_type`,`fk_element`),
  ADD KEY `idx_actioncomm_resources_fk_element` (`fk_element`);

--
-- Index pour la table `llx_adherent`
--
ALTER TABLE `llx_adherent`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_adherent_ref` (`ref`,`entity`),
  ADD UNIQUE KEY `uk_adherent_login` (`login`,`entity`),
  ADD UNIQUE KEY `uk_adherent_fk_soc` (`fk_soc`),
  ADD KEY `idx_adherent_fk_adherent_type` (`fk_adherent_type`);

--
-- Index pour la table `llx_adherent_extrafields`
--
ALTER TABLE `llx_adherent_extrafields`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_adherent_extrafields` (`fk_object`);

--
-- Index pour la table `llx_adherent_type`
--
ALTER TABLE `llx_adherent_type`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_adherent_type_libelle` (`libelle`,`entity`);

--
-- Index pour la table `llx_adherent_type_extrafields`
--
ALTER TABLE `llx_adherent_type_extrafields`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_adherent_type_extrafields` (`fk_object`);

--
-- Index pour la table `llx_adherent_type_lang`
--
ALTER TABLE `llx_adherent_type_lang`
  ADD PRIMARY KEY (`rowid`);

--
-- Index pour la table `llx_advtargetemailing`
--
ALTER TABLE `llx_advtargetemailing`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_advtargetemailing_name` (`name`);

--
-- Index pour la table `llx_asset`
--
ALTER TABLE `llx_asset`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_asset_rowid` (`rowid`),
  ADD KEY `idx_asset_ref` (`ref`),
  ADD KEY `idx_asset_entity` (`entity`),
  ADD KEY `idx_asset_fk_asset_type` (`fk_asset_type`);

--
-- Index pour la table `llx_asset_extrafields`
--
ALTER TABLE `llx_asset_extrafields`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_asset_extrafields` (`fk_object`);

--
-- Index pour la table `llx_asset_type`
--
ALTER TABLE `llx_asset_type`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_asset_type_label` (`label`,`entity`);

--
-- Index pour la table `llx_asset_type_extrafields`
--
ALTER TABLE `llx_asset_type_extrafields`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_asset_type_extrafields` (`fk_object`);

--
-- Index pour la table `llx_bank`
--
ALTER TABLE `llx_bank`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_bank_datev` (`datev`),
  ADD KEY `idx_bank_dateo` (`dateo`),
  ADD KEY `idx_bank_fk_account` (`fk_account`),
  ADD KEY `idx_bank_rappro` (`rappro`),
  ADD KEY `idx_bank_num_releve` (`num_releve`);

--
-- Index pour la table `llx_bank_account`
--
ALTER TABLE `llx_bank_account`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_bank_account_label` (`label`,`entity`),
  ADD KEY `idx_fk_accountancy_journal` (`fk_accountancy_journal`);

--
-- Index pour la table `llx_bank_account_extrafields`
--
ALTER TABLE `llx_bank_account_extrafields`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_bank_account_extrafields` (`fk_object`);

--
-- Index pour la table `llx_bank_categ`
--
ALTER TABLE `llx_bank_categ`
  ADD PRIMARY KEY (`rowid`);

--
-- Index pour la table `llx_bank_class`
--
ALTER TABLE `llx_bank_class`
  ADD UNIQUE KEY `uk_bank_class_lineid` (`lineid`,`fk_categ`);

--
-- Index pour la table `llx_bank_url`
--
ALTER TABLE `llx_bank_url`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_bank_url` (`fk_bank`,`url_id`,`type`);

--
-- Index pour la table `llx_blockedlog`
--
ALTER TABLE `llx_blockedlog`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `signature` (`signature`),
  ADD KEY `fk_object_element` (`fk_object`,`element`),
  ADD KEY `entity` (`entity`),
  ADD KEY `fk_user` (`fk_user`),
  ADD KEY `entity_action` (`entity`,`action`),
  ADD KEY `entity_action_certified` (`entity`,`action`,`certified`);

--
-- Index pour la table `llx_blockedlog_authority`
--
ALTER TABLE `llx_blockedlog_authority`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `signature` (`signature`);

--
-- Index pour la table `llx_bom_bom`
--
ALTER TABLE `llx_bom_bom`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_bom_bom_ref` (`ref`,`entity`),
  ADD KEY `idx_bom_bom_rowid` (`rowid`),
  ADD KEY `idx_bom_bom_ref` (`ref`),
  ADD KEY `llx_bom_bom_fk_user_creat` (`fk_user_creat`),
  ADD KEY `idx_bom_bom_status` (`status`),
  ADD KEY `idx_bom_bom_fk_product` (`fk_product`);

--
-- Index pour la table `llx_bom_bomline`
--
ALTER TABLE `llx_bom_bomline`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_bom_bomline_rowid` (`rowid`),
  ADD KEY `idx_bom_bomline_fk_product` (`fk_product`),
  ADD KEY `idx_bom_bomline_fk_bom` (`fk_bom`);

--
-- Index pour la table `llx_bom_bomline_extrafields`
--
ALTER TABLE `llx_bom_bomline_extrafields`
  ADD PRIMARY KEY (`rowid`);

--
-- Index pour la table `llx_bom_bom_extrafields`
--
ALTER TABLE `llx_bom_bom_extrafields`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_bom_bom_extrafields_fk_object` (`fk_object`);

--
-- Index pour la table `llx_bookmark`
--
ALTER TABLE `llx_bookmark`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_bookmark_title` (`fk_user`,`entity`,`title`);

--
-- Index pour la table `llx_bordereau_cheque`
--
ALTER TABLE `llx_bordereau_cheque`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_bordereau_cheque` (`ref`,`entity`);

--
-- Index pour la table `llx_boxes`
--
ALTER TABLE `llx_boxes`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_boxes` (`entity`,`box_id`,`position`,`fk_user`),
  ADD KEY `idx_boxes_boxid` (`box_id`),
  ADD KEY `idx_boxes_fk_user` (`fk_user`);

--
-- Index pour la table `llx_boxes_def`
--
ALTER TABLE `llx_boxes_def`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_boxes_def` (`file`,`entity`,`note`);

--
-- Index pour la table `llx_budget`
--
ALTER TABLE `llx_budget`
  ADD PRIMARY KEY (`rowid`);

--
-- Index pour la table `llx_budget_lines`
--
ALTER TABLE `llx_budget_lines`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_budget_lines` (`fk_budget`,`fk_project_ids`);

--
-- Index pour la table `llx_categorie`
--
ALTER TABLE `llx_categorie`
  ADD PRIMARY KEY (`rowid`);

--
-- Index pour la table `llx_categories_extrafields`
--
ALTER TABLE `llx_categories_extrafields`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_categories_extrafields` (`fk_object`);

--
-- Index pour la table `llx_categorie_account`
--
ALTER TABLE `llx_categorie_account`
  ADD PRIMARY KEY (`fk_categorie`,`fk_account`),
  ADD KEY `idx_categorie_account_fk_categorie` (`fk_categorie`),
  ADD KEY `idx_categorie_account_fk_account` (`fk_account`);

--
-- Index pour la table `llx_categorie_actioncomm`
--
ALTER TABLE `llx_categorie_actioncomm`
  ADD PRIMARY KEY (`fk_categorie`,`fk_actioncomm`),
  ADD KEY `idx_categorie_actioncomm_fk_categorie` (`fk_categorie`),
  ADD KEY `idx_categorie_actioncomm_fk_actioncomm` (`fk_actioncomm`);

--
-- Index pour la table `llx_categorie_contact`
--
ALTER TABLE `llx_categorie_contact`
  ADD PRIMARY KEY (`fk_categorie`,`fk_socpeople`),
  ADD KEY `idx_categorie_contact_fk_categorie` (`fk_categorie`),
  ADD KEY `idx_categorie_contact_fk_socpeople` (`fk_socpeople`);

--
-- Index pour la table `llx_categorie_fournisseur`
--
ALTER TABLE `llx_categorie_fournisseur`
  ADD PRIMARY KEY (`fk_categorie`,`fk_soc`),
  ADD KEY `idx_categorie_fournisseur_fk_categorie` (`fk_categorie`),
  ADD KEY `idx_categorie_fournisseur_fk_societe` (`fk_soc`);

--
-- Index pour la table `llx_categorie_lang`
--
ALTER TABLE `llx_categorie_lang`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_category_lang` (`fk_category`,`lang`);

--
-- Index pour la table `llx_categorie_member`
--
ALTER TABLE `llx_categorie_member`
  ADD PRIMARY KEY (`fk_categorie`,`fk_member`),
  ADD KEY `idx_categorie_member_fk_categorie` (`fk_categorie`),
  ADD KEY `idx_categorie_member_fk_member` (`fk_member`);

--
-- Index pour la table `llx_categorie_product`
--
ALTER TABLE `llx_categorie_product`
  ADD PRIMARY KEY (`fk_categorie`,`fk_product`),
  ADD KEY `idx_categorie_product_fk_categorie` (`fk_categorie`),
  ADD KEY `idx_categorie_product_fk_product` (`fk_product`);

--
-- Index pour la table `llx_categorie_project`
--
ALTER TABLE `llx_categorie_project`
  ADD PRIMARY KEY (`fk_categorie`,`fk_project`),
  ADD KEY `idx_categorie_project_fk_categorie` (`fk_categorie`),
  ADD KEY `idx_categorie_project_fk_project` (`fk_project`);

--
-- Index pour la table `llx_categorie_societe`
--
ALTER TABLE `llx_categorie_societe`
  ADD PRIMARY KEY (`fk_categorie`,`fk_soc`),
  ADD KEY `idx_categorie_societe_fk_categorie` (`fk_categorie`),
  ADD KEY `idx_categorie_societe_fk_societe` (`fk_soc`);

--
-- Index pour la table `llx_categorie_user`
--
ALTER TABLE `llx_categorie_user`
  ADD PRIMARY KEY (`fk_categorie`,`fk_user`),
  ADD KEY `idx_categorie_user_fk_categorie` (`fk_categorie`),
  ADD KEY `idx_categorie_user_fk_user` (`fk_user`);

--
-- Index pour la table `llx_categorie_warehouse`
--
ALTER TABLE `llx_categorie_warehouse`
  ADD PRIMARY KEY (`fk_categorie`,`fk_warehouse`),
  ADD KEY `idx_categorie_warehouse_fk_categorie` (`fk_categorie`),
  ADD KEY `idx_categorie_warehouse_fk_warehouse` (`fk_warehouse`);

--
-- Index pour la table `llx_categorie_website_page`
--
ALTER TABLE `llx_categorie_website_page`
  ADD PRIMARY KEY (`fk_categorie`,`fk_website_page`),
  ADD KEY `idx_categorie_website_page_fk_categorie` (`fk_categorie`),
  ADD KEY `idx_categorie_website_page_fk_website_page` (`fk_website_page`);

--
-- Index pour la table `llx_chargesociales`
--
ALTER TABLE `llx_chargesociales`
  ADD PRIMARY KEY (`rowid`);

--
-- Index pour la table `llx_commande`
--
ALTER TABLE `llx_commande`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_commande_ref` (`ref`,`entity`),
  ADD KEY `idx_commande_fk_soc` (`fk_soc`),
  ADD KEY `idx_commande_fk_user_author` (`fk_user_author`),
  ADD KEY `idx_commande_fk_user_valid` (`fk_user_valid`),
  ADD KEY `idx_commande_fk_user_cloture` (`fk_user_cloture`),
  ADD KEY `idx_commande_fk_projet` (`fk_projet`),
  ADD KEY `idx_commande_fk_account` (`fk_account`),
  ADD KEY `idx_commande_fk_currency` (`fk_currency`);

--
-- Index pour la table `llx_commandedet`
--
ALTER TABLE `llx_commandedet`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_commandedet_fk_commande` (`fk_commande`),
  ADD KEY `idx_commandedet_fk_product` (`fk_product`),
  ADD KEY `fk_commandedet_fk_unit` (`fk_unit`),
  ADD KEY `fk_commandedet_fk_commandefourndet` (`fk_commandefourndet`);

--
-- Index pour la table `llx_commandedet_extrafields`
--
ALTER TABLE `llx_commandedet_extrafields`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_commandedet_extrafields` (`fk_object`);

--
-- Index pour la table `llx_commande_extrafields`
--
ALTER TABLE `llx_commande_extrafields`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_commande_extrafields` (`fk_object`);

--
-- Index pour la table `llx_commande_fournisseur`
--
ALTER TABLE `llx_commande_fournisseur`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_commande_fournisseur_ref` (`ref`,`fk_soc`,`entity`),
  ADD KEY `idx_commande_fournisseur_fk_soc` (`fk_soc`),
  ADD KEY `billed` (`billed`);

--
-- Index pour la table `llx_commande_fournisseurdet`
--
ALTER TABLE `llx_commande_fournisseurdet`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `fk_commande_fournisseurdet_fk_unit` (`fk_unit`),
  ADD KEY `idx_commande_fournisseurdet_fk_commande` (`fk_commande`),
  ADD KEY `idx_commande_fournisseurdet_fk_product` (`fk_product`);

--
-- Index pour la table `llx_commande_fournisseurdet_extrafields`
--
ALTER TABLE `llx_commande_fournisseurdet_extrafields`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_commande_fournisseurdet_extrafields` (`fk_object`);

--
-- Index pour la table `llx_commande_fournisseur_dispatch`
--
ALTER TABLE `llx_commande_fournisseur_dispatch`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_commande_fournisseur_dispatch_fk_commande` (`fk_commande`),
  ADD KEY `idx_commande_fournisseur_dispatch_fk_reception` (`fk_reception`);

--
-- Index pour la table `llx_commande_fournisseur_dispatch_extrafields`
--
ALTER TABLE `llx_commande_fournisseur_dispatch_extrafields`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_commande_fournisseur_dispatch_extrafields` (`fk_object`);

--
-- Index pour la table `llx_commande_fournisseur_extrafields`
--
ALTER TABLE `llx_commande_fournisseur_extrafields`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_commande_fournisseur_extrafields` (`fk_object`);

--
-- Index pour la table `llx_commande_fournisseur_log`
--
ALTER TABLE `llx_commande_fournisseur_log`
  ADD PRIMARY KEY (`rowid`);

--
-- Index pour la table `llx_comment`
--
ALTER TABLE `llx_comment`
  ADD PRIMARY KEY (`rowid`);

--
-- Index pour la table `llx_const`
--
ALTER TABLE `llx_const`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_const` (`name`,`entity`);

--
-- Index pour la table `llx_contrat`
--
ALTER TABLE `llx_contrat`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_contrat_ref` (`ref`,`entity`),
  ADD KEY `idx_contrat_fk_soc` (`fk_soc`),
  ADD KEY `idx_contrat_fk_user_author` (`fk_user_author`);

--
-- Index pour la table `llx_contratdet`
--
ALTER TABLE `llx_contratdet`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_contratdet_fk_contrat` (`fk_contrat`),
  ADD KEY `idx_contratdet_fk_product` (`fk_product`),
  ADD KEY `idx_contratdet_date_ouverture_prevue` (`date_ouverture_prevue`),
  ADD KEY `idx_contratdet_date_ouverture` (`date_ouverture`),
  ADD KEY `idx_contratdet_date_fin_validite` (`date_fin_validite`),
  ADD KEY `fk_contratdet_fk_unit` (`fk_unit`);

--
-- Index pour la table `llx_contratdet_extrafields`
--
ALTER TABLE `llx_contratdet_extrafields`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_contratdet_extrafields` (`fk_object`);

--
-- Index pour la table `llx_contratdet_log`
--
ALTER TABLE `llx_contratdet_log`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_contratdet_log_fk_contratdet` (`fk_contratdet`),
  ADD KEY `idx_contratdet_log_date` (`date`);

--
-- Index pour la table `llx_contrat_extrafields`
--
ALTER TABLE `llx_contrat_extrafields`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_contrat_extrafields` (`fk_object`);

--
-- Index pour la table `llx_cronjob`
--
ALTER TABLE `llx_cronjob`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_cronjob_status` (`status`),
  ADD KEY `idx_cronjob_datelastrun` (`datelastrun`),
  ADD KEY `idx_cronjob_datenextrun` (`datenextrun`),
  ADD KEY `idx_cronjob_datestart` (`datestart`),
  ADD KEY `idx_cronjob_dateend` (`dateend`);

--
-- Index pour la table `llx_c_accounting_category`
--
ALTER TABLE `llx_c_accounting_category`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_c_accounting_category` (`code`,`entity`);

--
-- Index pour la table `llx_c_actioncomm`
--
ALTER TABLE `llx_c_actioncomm`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uk_c_actioncomm` (`code`);

--
-- Index pour la table `llx_c_action_trigger`
--
ALTER TABLE `llx_c_action_trigger`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_action_trigger_code` (`code`),
  ADD KEY `idx_action_trigger_rang` (`rang`);

--
-- Index pour la table `llx_c_availability`
--
ALTER TABLE `llx_c_availability`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_c_availability` (`code`);

--
-- Index pour la table `llx_c_barcode_type`
--
ALTER TABLE `llx_c_barcode_type`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_c_barcode_type` (`code`,`entity`);

--
-- Index pour la table `llx_c_chargesociales`
--
ALTER TABLE `llx_c_chargesociales`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `llx_c_civility`
--
ALTER TABLE `llx_c_civility`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_c_civility` (`code`);

--
-- Index pour la table `llx_c_country`
--
ALTER TABLE `llx_c_country`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `idx_c_country_code` (`code`),
  ADD UNIQUE KEY `idx_c_country_label` (`label`),
  ADD UNIQUE KEY `idx_c_country_code_iso` (`code_iso`);

--
-- Index pour la table `llx_c_currencies`
--
ALTER TABLE `llx_c_currencies`
  ADD PRIMARY KEY (`code_iso`),
  ADD UNIQUE KEY `uk_c_currencies_code_iso` (`code_iso`);

--
-- Index pour la table `llx_c_departements`
--
ALTER TABLE `llx_c_departements`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_departements` (`code_departement`,`fk_region`),
  ADD KEY `idx_departements_fk_region` (`fk_region`);

--
-- Index pour la table `llx_c_ecotaxe`
--
ALTER TABLE `llx_c_ecotaxe`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_c_ecotaxe` (`code`);

--
-- Index pour la table `llx_c_effectif`
--
ALTER TABLE `llx_c_effectif`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uk_c_effectif` (`code`);

--
-- Index pour la table `llx_c_email_senderprofile`
--
ALTER TABLE `llx_c_email_senderprofile`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_c_email_senderprofile` (`entity`,`label`,`email`);

--
-- Index pour la table `llx_c_email_templates`
--
ALTER TABLE `llx_c_email_templates`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_c_email_templates` (`entity`,`label`,`lang`),
  ADD KEY `idx_type` (`type_template`);

--
-- Index pour la table `llx_c_exp_tax_cat`
--
ALTER TABLE `llx_c_exp_tax_cat`
  ADD PRIMARY KEY (`rowid`);

--
-- Index pour la table `llx_c_exp_tax_range`
--
ALTER TABLE `llx_c_exp_tax_range`
  ADD PRIMARY KEY (`rowid`);

--
-- Index pour la table `llx_c_field_list`
--
ALTER TABLE `llx_c_field_list`
  ADD PRIMARY KEY (`rowid`);

--
-- Index pour la table `llx_c_format_cards`
--
ALTER TABLE `llx_c_format_cards`
  ADD PRIMARY KEY (`rowid`);

--
-- Index pour la table `llx_c_forme_juridique`
--
ALTER TABLE `llx_c_forme_juridique`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_c_forme_juridique` (`code`);

--
-- Index pour la table `llx_c_holiday_types`
--
ALTER TABLE `llx_c_holiday_types`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_c_holiday_types` (`code`);

--
-- Index pour la table `llx_c_hrm_department`
--
ALTER TABLE `llx_c_hrm_department`
  ADD PRIMARY KEY (`rowid`);

--
-- Index pour la table `llx_c_hrm_function`
--
ALTER TABLE `llx_c_hrm_function`
  ADD PRIMARY KEY (`rowid`);

--
-- Index pour la table `llx_c_hrm_public_holiday`
--
ALTER TABLE `llx_c_hrm_public_holiday`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uk_c_hrm_public_holiday` (`entity`,`code`),
  ADD UNIQUE KEY `uk_c_hrm_public_holiday2` (`entity`,`fk_country`,`dayrule`,`day`,`month`,`year`);

--
-- Index pour la table `llx_c_incoterms`
--
ALTER TABLE `llx_c_incoterms`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_c_incoterms` (`code`);

--
-- Index pour la table `llx_c_input_method`
--
ALTER TABLE `llx_c_input_method`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_c_input_method` (`code`);

--
-- Index pour la table `llx_c_input_reason`
--
ALTER TABLE `llx_c_input_reason`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_c_input_reason` (`code`);

--
-- Index pour la table `llx_c_lead_status`
--
ALTER TABLE `llx_c_lead_status`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_c_lead_status_code` (`code`);

--
-- Index pour la table `llx_c_paiement`
--
ALTER TABLE `llx_c_paiement`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uk_c_paiement_code` (`entity`,`code`);

--
-- Index pour la table `llx_c_paper_format`
--
ALTER TABLE `llx_c_paper_format`
  ADD PRIMARY KEY (`rowid`);

--
-- Index pour la table `llx_c_partnership_type`
--
ALTER TABLE `llx_c_partnership_type`
  ADD PRIMARY KEY (`rowid`);

--
-- Index pour la table `llx_c_payment_term`
--
ALTER TABLE `llx_c_payment_term`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_c_payment_term_code` (`entity`,`code`);

--
-- Index pour la table `llx_c_price_expression`
--
ALTER TABLE `llx_c_price_expression`
  ADD PRIMARY KEY (`rowid`);

--
-- Index pour la table `llx_c_price_global_variable`
--
ALTER TABLE `llx_c_price_global_variable`
  ADD PRIMARY KEY (`rowid`);

--
-- Index pour la table `llx_c_price_global_variable_updater`
--
ALTER TABLE `llx_c_price_global_variable_updater`
  ADD PRIMARY KEY (`rowid`);

--
-- Index pour la table `llx_c_productbatch_qcstatus`
--
ALTER TABLE `llx_c_productbatch_qcstatus`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_c_productbatch_qcstatus` (`code`,`entity`);

--
-- Index pour la table `llx_c_product_nature`
--
ALTER TABLE `llx_c_product_nature`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_c_product_nature` (`code`);

--
-- Index pour la table `llx_c_propalst`
--
ALTER TABLE `llx_c_propalst`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uk_c_propalst` (`code`);

--
-- Index pour la table `llx_c_prospectcontactlevel`
--
ALTER TABLE `llx_c_prospectcontactlevel`
  ADD PRIMARY KEY (`code`);

--
-- Index pour la table `llx_c_prospectlevel`
--
ALTER TABLE `llx_c_prospectlevel`
  ADD PRIMARY KEY (`code`);

--
-- Index pour la table `llx_c_recruitment_origin`
--
ALTER TABLE `llx_c_recruitment_origin`
  ADD PRIMARY KEY (`rowid`);

--
-- Index pour la table `llx_c_regions`
--
ALTER TABLE `llx_c_regions`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_code_region` (`code_region`),
  ADD KEY `idx_c_regions_fk_pays` (`fk_pays`);

--
-- Index pour la table `llx_c_revenuestamp`
--
ALTER TABLE `llx_c_revenuestamp`
  ADD PRIMARY KEY (`rowid`);

--
-- Index pour la table `llx_c_shipment_mode`
--
ALTER TABLE `llx_c_shipment_mode`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_c_shipment_mode` (`code`,`entity`);

--
-- Index pour la table `llx_c_shipment_package_type`
--
ALTER TABLE `llx_c_shipment_package_type`
  ADD PRIMARY KEY (`rowid`);

--
-- Index pour la table `llx_c_socialnetworks`
--
ALTER TABLE `llx_c_socialnetworks`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `idx_c_socialnetworks_code` (`code`);

--
-- Index pour la table `llx_c_stcomm`
--
ALTER TABLE `llx_c_stcomm`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uk_c_stcomm` (`code`);

--
-- Index pour la table `llx_c_stcommcontact`
--
ALTER TABLE `llx_c_stcommcontact`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uk_c_stcommcontact` (`code`);

--
-- Index pour la table `llx_c_ticket_category`
--
ALTER TABLE `llx_c_ticket_category`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_code` (`code`,`entity`);

--
-- Index pour la table `llx_c_ticket_resolution`
--
ALTER TABLE `llx_c_ticket_resolution`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_code` (`code`,`entity`);

--
-- Index pour la table `llx_c_ticket_severity`
--
ALTER TABLE `llx_c_ticket_severity`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_code` (`code`,`entity`);

--
-- Index pour la table `llx_c_ticket_type`
--
ALTER TABLE `llx_c_ticket_type`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_code` (`code`,`entity`);

--
-- Index pour la table `llx_c_transport_mode`
--
ALTER TABLE `llx_c_transport_mode`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_c_transport_mode` (`code`,`entity`);

--
-- Index pour la table `llx_c_tva`
--
ALTER TABLE `llx_c_tva`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_c_tva_id` (`fk_pays`,`code`,`taux`,`recuperableonly`);

--
-- Index pour la table `llx_c_typent`
--
ALTER TABLE `llx_c_typent`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uk_c_typent` (`code`);

--
-- Index pour la table `llx_c_type_contact`
--
ALTER TABLE `llx_c_type_contact`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_c_type_contact_id` (`element`,`source`,`code`);

--
-- Index pour la table `llx_c_type_container`
--
ALTER TABLE `llx_c_type_container`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_c_type_container_id` (`code`,`entity`);

--
-- Index pour la table `llx_c_type_fees`
--
ALTER TABLE `llx_c_type_fees`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uk_c_type_fees` (`code`);

--
-- Index pour la table `llx_c_type_resource`
--
ALTER TABLE `llx_c_type_resource`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_c_type_resource_id` (`label`,`code`);

--
-- Index pour la table `llx_c_units`
--
ALTER TABLE `llx_c_units`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_c_units_code` (`code`);

--
-- Index pour la table `llx_c_ziptown`
--
ALTER TABLE `llx_c_ziptown`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_ziptown_fk_pays` (`zip`,`town`,`fk_pays`),
  ADD KEY `idx_c_ziptown_fk_county` (`fk_county`),
  ADD KEY `idx_c_ziptown_fk_pays` (`fk_pays`),
  ADD KEY `idx_c_ziptown_zip` (`zip`);

--
-- Index pour la table `llx_default_values`
--
ALTER TABLE `llx_default_values`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_default_values` (`type`,`entity`,`user_id`,`page`,`param`);

--
-- Index pour la table `llx_delivery`
--
ALTER TABLE `llx_delivery`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `idx_delivery_uk_ref` (`ref`,`entity`),
  ADD KEY `idx_delivery_fk_soc` (`fk_soc`),
  ADD KEY `idx_delivery_fk_user_author` (`fk_user_author`),
  ADD KEY `idx_delivery_fk_user_valid` (`fk_user_valid`);

--
-- Index pour la table `llx_deliverydet`
--
ALTER TABLE `llx_deliverydet`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_deliverydet_fk_delivery` (`fk_delivery`);

--
-- Index pour la table `llx_deliverydet_extrafields`
--
ALTER TABLE `llx_deliverydet_extrafields`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_deliverydet_extrafields` (`fk_object`);

--
-- Index pour la table `llx_delivery_extrafields`
--
ALTER TABLE `llx_delivery_extrafields`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_delivery_extrafields` (`fk_object`);

--
-- Index pour la table `llx_deplacement`
--
ALTER TABLE `llx_deplacement`
  ADD PRIMARY KEY (`rowid`);

--
-- Index pour la table `llx_document_model`
--
ALTER TABLE `llx_document_model`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_document_model` (`nom`,`type`,`entity`);

--
-- Index pour la table `llx_don`
--
ALTER TABLE `llx_don`
  ADD PRIMARY KEY (`rowid`);

--
-- Index pour la table `llx_don_extrafields`
--
ALTER TABLE `llx_don_extrafields`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_don_extrafields` (`fk_object`);

--
-- Index pour la table `llx_ecm_directories`
--
ALTER TABLE `llx_ecm_directories`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_ecm_directories` (`label`,`fk_parent`,`entity`),
  ADD KEY `idx_ecm_directories_fk_user_c` (`fk_user_c`),
  ADD KEY `idx_ecm_directories_fk_user_m` (`fk_user_m`);

--
-- Index pour la table `llx_ecm_directories_extrafields`
--
ALTER TABLE `llx_ecm_directories_extrafields`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_ecm_directories_extrafields` (`fk_object`);

--
-- Index pour la table `llx_ecm_files`
--
ALTER TABLE `llx_ecm_files`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_ecm_files` (`filepath`,`filename`,`entity`),
  ADD KEY `idx_ecm_files_label` (`label`);

--
-- Index pour la table `llx_ecm_files_extrafields`
--
ALTER TABLE `llx_ecm_files_extrafields`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_ecm_files_extrafields` (`fk_object`);

--
-- Index pour la table `llx_element_contact`
--
ALTER TABLE `llx_element_contact`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `idx_element_contact_idx1` (`element_id`,`fk_c_type_contact`,`fk_socpeople`),
  ADD KEY `fk_element_contact_fk_c_type_contact` (`fk_c_type_contact`),
  ADD KEY `idx_element_contact_fk_socpeople` (`fk_socpeople`);

--
-- Index pour la table `llx_element_element`
--
ALTER TABLE `llx_element_element`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `idx_element_element_idx1` (`fk_source`,`sourcetype`,`fk_target`,`targettype`),
  ADD KEY `idx_element_element_fk_target` (`fk_target`);

--
-- Index pour la table `llx_element_resources`
--
ALTER TABLE `llx_element_resources`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `idx_element_resources_idx1` (`resource_id`,`resource_type`,`element_id`,`element_type`),
  ADD KEY `idx_element_element_element_id` (`element_id`);

--
-- Index pour la table `llx_emailcollector_emailcollector`
--
ALTER TABLE `llx_emailcollector_emailcollector`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_emailcollector_emailcollector_ref` (`ref`,`entity`),
  ADD KEY `idx_emailcollector_entity` (`entity`),
  ADD KEY `idx_emailcollector_status` (`status`);

--
-- Index pour la table `llx_emailcollector_emailcollectoraction`
--
ALTER TABLE `llx_emailcollector_emailcollectoraction`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_emailcollector_emailcollectoraction` (`fk_emailcollector`,`type`),
  ADD KEY `idx_emailcollector_fk_emailcollector` (`fk_emailcollector`);

--
-- Index pour la table `llx_emailcollector_emailcollectorfilter`
--
ALTER TABLE `llx_emailcollector_emailcollectorfilter`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_emailcollector_emailcollectorfilter` (`fk_emailcollector`,`type`,`rulevalue`),
  ADD KEY `idx_emailcollector_fk_emailcollector` (`fk_emailcollector`);

--
-- Index pour la table `llx_entrepot`
--
ALTER TABLE `llx_entrepot`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_entrepot_label` (`ref`,`entity`);

--
-- Index pour la table `llx_entrepot_extrafields`
--
ALTER TABLE `llx_entrepot_extrafields`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_entrepot_extrafields` (`fk_object`);

--
-- Index pour la table `llx_establishment`
--
ALTER TABLE `llx_establishment`
  ADD PRIMARY KEY (`rowid`);

--
-- Index pour la table `llx_eventorganization_conferenceorboothattendee`
--
ALTER TABLE `llx_eventorganization_conferenceorboothattendee`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_eventorganization_conferenceorboothattendee` (`fk_soc`,`fk_project`,`fk_actioncomm`,`email`),
  ADD KEY `idx_eventorganization_conferenceorboothattendee_rowid` (`rowid`),
  ADD KEY `idx_eventorganization_conferenceorboothattendee_ref` (`ref`),
  ADD KEY `idx_eventorganization_conferenceorboothattendee_fk_soc` (`fk_soc`),
  ADD KEY `idx_eventorganization_conferenceorboothattendee_fk_actioncomm` (`fk_actioncomm`),
  ADD KEY `idx_eventorganization_conferenceorboothattendee_fk_project` (`fk_project`),
  ADD KEY `idx_eventorganization_conferenceorboothattendee_email` (`email`),
  ADD KEY `idx_eventorganization_conferenceorboothattendee_status` (`status`);

--
-- Index pour la table `llx_eventorganization_conferenceorboothattendee_extrafields`
--
ALTER TABLE `llx_eventorganization_conferenceorboothattendee_extrafields`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_conferenceorboothattendee_fk_object` (`fk_object`);

--
-- Index pour la table `llx_events`
--
ALTER TABLE `llx_events`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_events_dateevent` (`dateevent`);

--
-- Index pour la table `llx_event_element`
--
ALTER TABLE `llx_event_element`
  ADD PRIMARY KEY (`rowid`);

--
-- Index pour la table `llx_expedition`
--
ALTER TABLE `llx_expedition`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `idx_expedition_uk_ref` (`ref`,`entity`),
  ADD KEY `idx_expedition_fk_soc` (`fk_soc`),
  ADD KEY `idx_expedition_fk_user_author` (`fk_user_author`),
  ADD KEY `idx_expedition_fk_user_valid` (`fk_user_valid`),
  ADD KEY `idx_expedition_fk_shipping_method` (`fk_shipping_method`);

--
-- Index pour la table `llx_expeditiondet`
--
ALTER TABLE `llx_expeditiondet`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_expeditiondet_fk_expedition` (`fk_expedition`),
  ADD KEY `idx_expeditiondet_fk_origin_line` (`fk_origin_line`);

--
-- Index pour la table `llx_expeditiondet_batch`
--
ALTER TABLE `llx_expeditiondet_batch`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_fk_expeditiondet` (`fk_expeditiondet`);

--
-- Index pour la table `llx_expeditiondet_extrafields`
--
ALTER TABLE `llx_expeditiondet_extrafields`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_expeditiondet_extrafields` (`fk_object`);

--
-- Index pour la table `llx_expedition_extrafields`
--
ALTER TABLE `llx_expedition_extrafields`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_expedition_extrafields` (`fk_object`);

--
-- Index pour la table `llx_expedition_package`
--
ALTER TABLE `llx_expedition_package`
  ADD PRIMARY KEY (`rowid`);

--
-- Index pour la table `llx_expensereport`
--
ALTER TABLE `llx_expensereport`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `idx_expensereport_uk_ref` (`ref`,`entity`),
  ADD KEY `idx_expensereport_date_debut` (`date_debut`),
  ADD KEY `idx_expensereport_date_fin` (`date_fin`),
  ADD KEY `idx_expensereport_fk_statut` (`fk_statut`),
  ADD KEY `idx_expensereport_fk_user_author` (`fk_user_author`),
  ADD KEY `idx_expensereport_fk_user_valid` (`fk_user_valid`),
  ADD KEY `idx_expensereport_fk_user_approve` (`fk_user_approve`),
  ADD KEY `idx_expensereport_fk_refuse` (`fk_user_approve`);

--
-- Index pour la table `llx_expensereport_det`
--
ALTER TABLE `llx_expensereport_det`
  ADD PRIMARY KEY (`rowid`);

--
-- Index pour la table `llx_expensereport_extrafields`
--
ALTER TABLE `llx_expensereport_extrafields`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_expensereport_extrafields` (`fk_object`);

--
-- Index pour la table `llx_expensereport_ik`
--
ALTER TABLE `llx_expensereport_ik`
  ADD PRIMARY KEY (`rowid`);

--
-- Index pour la table `llx_expensereport_rules`
--
ALTER TABLE `llx_expensereport_rules`
  ADD PRIMARY KEY (`rowid`);

--
-- Index pour la table `llx_export_compta`
--
ALTER TABLE `llx_export_compta`
  ADD PRIMARY KEY (`rowid`);

--
-- Index pour la table `llx_export_model`
--
ALTER TABLE `llx_export_model`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_export_model` (`label`,`type`);

--
-- Index pour la table `llx_extrafields`
--
ALTER TABLE `llx_extrafields`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_extrafields_name` (`name`,`entity`,`elementtype`);

--
-- Index pour la table `llx_facture`
--
ALTER TABLE `llx_facture`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_facture_ref` (`ref`,`entity`),
  ADD KEY `idx_facture_fk_soc` (`fk_soc`),
  ADD KEY `idx_facture_fk_user_author` (`fk_user_author`),
  ADD KEY `idx_facture_fk_user_valid` (`fk_user_valid`),
  ADD KEY `idx_facture_fk_facture_source` (`fk_facture_source`),
  ADD KEY `idx_facture_fk_projet` (`fk_projet`),
  ADD KEY `idx_facture_fk_account` (`fk_account`),
  ADD KEY `idx_facture_fk_currency` (`fk_currency`),
  ADD KEY `idx_facture_fk_statut` (`fk_statut`);

--
-- Index pour la table `llx_facturedet`
--
ALTER TABLE `llx_facturedet`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_fk_remise_except` (`fk_remise_except`,`fk_facture`),
  ADD KEY `idx_facturedet_fk_facture` (`fk_facture`),
  ADD KEY `idx_facturedet_fk_product` (`fk_product`),
  ADD KEY `idx_facturedet_fk_code_ventilation` (`fk_code_ventilation`),
  ADD KEY `fk_facturedet_fk_unit` (`fk_unit`);

--
-- Index pour la table `llx_facturedet_extrafields`
--
ALTER TABLE `llx_facturedet_extrafields`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_facturedet_extrafields` (`fk_object`);

--
-- Index pour la table `llx_facturedet_rec`
--
ALTER TABLE `llx_facturedet_rec`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `fk_facturedet_rec_fk_unit` (`fk_unit`);

--
-- Index pour la table `llx_facturedet_rec_extrafields`
--
ALTER TABLE `llx_facturedet_rec_extrafields`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_facturedet_rec_extrafields` (`fk_object`);

--
-- Index pour la table `llx_facture_extrafields`
--
ALTER TABLE `llx_facture_extrafields`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_facture_extrafields` (`fk_object`);

--
-- Index pour la table `llx_facture_fourn`
--
ALTER TABLE `llx_facture_fourn`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_facture_fourn_ref` (`ref`,`entity`),
  ADD UNIQUE KEY `uk_facture_fourn_ref_supplier` (`ref_supplier`,`fk_soc`,`entity`),
  ADD KEY `idx_facture_fourn_date_lim_reglement` (`date_lim_reglement`),
  ADD KEY `idx_facture_fourn_fk_soc` (`fk_soc`),
  ADD KEY `idx_facture_fourn_fk_user_author` (`fk_user_author`),
  ADD KEY `idx_facture_fourn_fk_user_valid` (`fk_user_valid`),
  ADD KEY `idx_facture_fourn_fk_projet` (`fk_projet`);

--
-- Index pour la table `llx_facture_fourn_det`
--
ALTER TABLE `llx_facture_fourn_det`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_fk_remise_except` (`fk_remise_except`,`fk_facture_fourn`),
  ADD KEY `idx_facture_fourn_det_fk_facture` (`fk_facture_fourn`),
  ADD KEY `idx_facture_fourn_det_fk_product` (`fk_product`),
  ADD KEY `idx_facture_fourn_det_fk_code_ventilation` (`fk_code_ventilation`),
  ADD KEY `fk_facture_fourn_det_fk_unit` (`fk_unit`);

--
-- Index pour la table `llx_facture_fourn_det_extrafields`
--
ALTER TABLE `llx_facture_fourn_det_extrafields`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_facture_fourn_det_extrafields` (`fk_object`);

--
-- Index pour la table `llx_facture_fourn_extrafields`
--
ALTER TABLE `llx_facture_fourn_extrafields`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_facture_fourn_extrafields` (`fk_object`);

--
-- Index pour la table `llx_facture_rec`
--
ALTER TABLE `llx_facture_rec`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `idx_facture_rec_uk_titre` (`titre`,`entity`),
  ADD KEY `idx_facture_rec_fk_soc` (`fk_soc`),
  ADD KEY `idx_facture_rec_fk_user_author` (`fk_user_author`),
  ADD KEY `idx_facture_rec_fk_projet` (`fk_projet`);

--
-- Index pour la table `llx_facture_rec_extrafields`
--
ALTER TABLE `llx_facture_rec_extrafields`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_facture_rec_extrafields` (`fk_object`);

--
-- Index pour la table `llx_fichinter`
--
ALTER TABLE `llx_fichinter`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_fichinter_ref` (`ref`,`entity`),
  ADD KEY `idx_fichinter_fk_soc` (`fk_soc`);

--
-- Index pour la table `llx_fichinterdet`
--
ALTER TABLE `llx_fichinterdet`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_fichinterdet_fk_fichinter` (`fk_fichinter`);

--
-- Index pour la table `llx_fichinterdet_extrafields`
--
ALTER TABLE `llx_fichinterdet_extrafields`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_ficheinterdet_extrafields` (`fk_object`);

--
-- Index pour la table `llx_fichinterdet_rec`
--
ALTER TABLE `llx_fichinterdet_rec`
  ADD PRIMARY KEY (`rowid`);

--
-- Index pour la table `llx_fichinter_extrafields`
--
ALTER TABLE `llx_fichinter_extrafields`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_ficheinter_extrafields` (`fk_object`);

--
-- Index pour la table `llx_fichinter_rec`
--
ALTER TABLE `llx_fichinter_rec`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `idx_fichinter_rec_uk_titre` (`titre`,`entity`),
  ADD KEY `idx_fichinter_rec_fk_soc` (`fk_soc`),
  ADD KEY `idx_fichinter_rec_fk_user_author` (`fk_user_author`),
  ADD KEY `idx_fichinter_rec_fk_projet` (`fk_projet`);

--
-- Index pour la table `llx_holiday`
--
ALTER TABLE `llx_holiday`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_holiday_entity` (`entity`),
  ADD KEY `idx_holiday_fk_user` (`fk_user`),
  ADD KEY `idx_holiday_fk_user_create` (`fk_user_create`),
  ADD KEY `idx_holiday_date_create` (`date_create`),
  ADD KEY `idx_holiday_date_debut` (`date_debut`),
  ADD KEY `idx_holiday_date_fin` (`date_fin`),
  ADD KEY `idx_holiday_fk_validator` (`fk_validator`);

--
-- Index pour la table `llx_holiday_config`
--
ALTER TABLE `llx_holiday_config`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `idx_holiday_config` (`name`);

--
-- Index pour la table `llx_holiday_extrafields`
--
ALTER TABLE `llx_holiday_extrafields`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_holiday_extrafields` (`fk_object`);

--
-- Index pour la table `llx_holiday_logs`
--
ALTER TABLE `llx_holiday_logs`
  ADD PRIMARY KEY (`rowid`);

--
-- Index pour la table `llx_holiday_users`
--
ALTER TABLE `llx_holiday_users`
  ADD UNIQUE KEY `uk_holiday_users` (`fk_user`,`fk_type`);

--
-- Index pour la table `llx_import_model`
--
ALTER TABLE `llx_import_model`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_import_model` (`label`,`type`);

--
-- Index pour la table `llx_intracommreport`
--
ALTER TABLE `llx_intracommreport`
  ADD PRIMARY KEY (`rowid`);

--
-- Index pour la table `llx_inventory`
--
ALTER TABLE `llx_inventory`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_inventory_ref` (`ref`,`entity`),
  ADD KEY `idx_inventory_tms` (`tms`),
  ADD KEY `idx_inventory_date_creation` (`date_creation`);

--
-- Index pour la table `llx_inventorydet`
--
ALTER TABLE `llx_inventorydet`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_inventorydet` (`fk_inventory`,`fk_warehouse`,`fk_product`,`batch`),
  ADD KEY `idx_inventorydet_tms` (`tms`),
  ADD KEY `idx_inventorydet_datec` (`datec`),
  ADD KEY `idx_inventorydet_fk_inventory` (`fk_inventory`);

--
-- Index pour la table `llx_knowledgemanagement_knowledgerecord`
--
ALTER TABLE `llx_knowledgemanagement_knowledgerecord`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_knowledgemanagement_knowledgerecord_rowid` (`rowid`),
  ADD KEY `idx_knowledgemanagement_knowledgerecord_ref` (`ref`),
  ADD KEY `llx_knowledgemanagement_knowledgerecord_fk_user_creat` (`fk_user_creat`),
  ADD KEY `idx_knowledgemanagement_knowledgerecord_status` (`status`);

--
-- Index pour la table `llx_knowledgemanagement_knowledgerecord_extrafields`
--
ALTER TABLE `llx_knowledgemanagement_knowledgerecord_extrafields`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_knowledgerecord_fk_object` (`fk_object`);

--
-- Index pour la table `llx_links`
--
ALTER TABLE `llx_links`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_links` (`objectid`,`label`);

--
-- Index pour la table `llx_loan`
--
ALTER TABLE `llx_loan`
  ADD PRIMARY KEY (`rowid`);

--
-- Index pour la table `llx_loan_schedule`
--
ALTER TABLE `llx_loan_schedule`
  ADD PRIMARY KEY (`rowid`);

--
-- Index pour la table `llx_localtax`
--
ALTER TABLE `llx_localtax`
  ADD PRIMARY KEY (`rowid`);

--
-- Index pour la table `llx_mailing`
--
ALTER TABLE `llx_mailing`
  ADD PRIMARY KEY (`rowid`);

--
-- Index pour la table `llx_mailing_cibles`
--
ALTER TABLE `llx_mailing_cibles`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_mailing_cibles` (`fk_mailing`,`email`),
  ADD KEY `idx_mailing_cibles_email` (`email`),
  ADD KEY `idx_mailing_cibles_tag` (`tag`);

--
-- Index pour la table `llx_mailing_unsubscribe`
--
ALTER TABLE `llx_mailing_unsubscribe`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_mailing_unsubscribe` (`email`,`entity`,`unsubscribegroup`);

--
-- Index pour la table `llx_menu`
--
ALTER TABLE `llx_menu`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `idx_menu_uk_menu` (`menu_handler`,`fk_menu`,`position`,`url`,`entity`),
  ADD KEY `idx_menu_menuhandler_type` (`menu_handler`,`type`);

--
-- Index pour la table `llx_mrp_mo`
--
ALTER TABLE `llx_mrp_mo`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_mrp_mo_ref` (`ref`),
  ADD KEY `idx_mrp_mo_entity` (`entity`),
  ADD KEY `idx_mrp_mo_fk_soc` (`fk_soc`),
  ADD KEY `fk_mrp_mo_fk_user_creat` (`fk_user_creat`),
  ADD KEY `idx_mrp_mo_status` (`status`),
  ADD KEY `idx_mrp_mo_fk_product` (`fk_product`),
  ADD KEY `idx_mrp_mo_date_start_planned` (`date_start_planned`),
  ADD KEY `idx_mrp_mo_date_end_planned` (`date_end_planned`),
  ADD KEY `idx_mrp_mo_fk_bom` (`fk_bom`),
  ADD KEY `idx_mrp_mo_fk_project` (`fk_project`);

--
-- Index pour la table `llx_mrp_mo_extrafields`
--
ALTER TABLE `llx_mrp_mo_extrafields`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_mrp_mo_fk_object` (`fk_object`);

--
-- Index pour la table `llx_mrp_production`
--
ALTER TABLE `llx_mrp_production`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `fk_mrp_production_product` (`fk_product`),
  ADD KEY `fk_mrp_production_stock_movement` (`fk_stock_movement`),
  ADD KEY `idx_mrp_production_fk_mo` (`fk_mo`);

--
-- Index pour la table `llx_multicurrency`
--
ALTER TABLE `llx_multicurrency`
  ADD PRIMARY KEY (`rowid`);

--
-- Index pour la table `llx_multicurrency_rate`
--
ALTER TABLE `llx_multicurrency_rate`
  ADD PRIMARY KEY (`rowid`);

--
-- Index pour la table `llx_notify`
--
ALTER TABLE `llx_notify`
  ADD PRIMARY KEY (`rowid`);

--
-- Index pour la table `llx_notify_def`
--
ALTER TABLE `llx_notify_def`
  ADD PRIMARY KEY (`rowid`);

--
-- Index pour la table `llx_notify_def_object`
--
ALTER TABLE `llx_notify_def_object`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `llx_oauth_state`
--
ALTER TABLE `llx_oauth_state`
  ADD PRIMARY KEY (`rowid`);

--
-- Index pour la table `llx_oauth_token`
--
ALTER TABLE `llx_oauth_token`
  ADD PRIMARY KEY (`rowid`);

--
-- Index pour la table `llx_object_lang`
--
ALTER TABLE `llx_object_lang`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_object_lang` (`fk_object`,`type_object`,`property`,`lang`);

--
-- Index pour la table `llx_onlinesignature`
--
ALTER TABLE `llx_onlinesignature`
  ADD PRIMARY KEY (`rowid`);

--
-- Index pour la table `llx_opensurvey_comments`
--
ALTER TABLE `llx_opensurvey_comments`
  ADD PRIMARY KEY (`id_comment`),
  ADD KEY `idx_id_comment` (`id_comment`),
  ADD KEY `idx_id_sondage` (`id_sondage`);

--
-- Index pour la table `llx_opensurvey_formquestions`
--
ALTER TABLE `llx_opensurvey_formquestions`
  ADD PRIMARY KEY (`rowid`);

--
-- Index pour la table `llx_opensurvey_sondage`
--
ALTER TABLE `llx_opensurvey_sondage`
  ADD PRIMARY KEY (`id_sondage`),
  ADD KEY `idx_date_fin` (`date_fin`);

--
-- Index pour la table `llx_opensurvey_user_studs`
--
ALTER TABLE `llx_opensurvey_user_studs`
  ADD PRIMARY KEY (`id_users`),
  ADD KEY `idx_opensurvey_user_studs_id_users` (`id_users`),
  ADD KEY `idx_opensurvey_user_studs_nom` (`nom`),
  ADD KEY `idx_opensurvey_user_studs_id_sondage` (`id_sondage`);

--
-- Index pour la table `llx_overwrite_trans`
--
ALTER TABLE `llx_overwrite_trans`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_overwrite_trans` (`lang`,`transkey`);

--
-- Index pour la table `llx_paiement`
--
ALTER TABLE `llx_paiement`
  ADD PRIMARY KEY (`rowid`);

--
-- Index pour la table `llx_paiementcharge`
--
ALTER TABLE `llx_paiementcharge`
  ADD PRIMARY KEY (`rowid`);

--
-- Index pour la table `llx_paiementfourn`
--
ALTER TABLE `llx_paiementfourn`
  ADD PRIMARY KEY (`rowid`);

--
-- Index pour la table `llx_paiementfourn_facturefourn`
--
ALTER TABLE `llx_paiementfourn_facturefourn`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_paiementfourn_facturefourn` (`fk_paiementfourn`,`fk_facturefourn`),
  ADD KEY `idx_paiementfourn_facturefourn_fk_facture` (`fk_facturefourn`),
  ADD KEY `idx_paiementfourn_facturefourn_fk_paiement` (`fk_paiementfourn`);

--
-- Index pour la table `llx_paiement_facture`
--
ALTER TABLE `llx_paiement_facture`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_paiement_facture` (`fk_paiement`,`fk_facture`),
  ADD KEY `idx_paiement_facture_fk_facture` (`fk_facture`),
  ADD KEY `idx_paiement_facture_fk_paiement` (`fk_paiement`);

--
-- Index pour la table `llx_partnership`
--
ALTER TABLE `llx_partnership`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_partnership_ref` (`ref`,`entity`),
  ADD KEY `idx_partnership_entity` (`entity`);

--
-- Index pour la table `llx_partnership_extrafields`
--
ALTER TABLE `llx_partnership_extrafields`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_partnership_extrafields` (`fk_object`);

--
-- Index pour la table `llx_payment_donation`
--
ALTER TABLE `llx_payment_donation`
  ADD PRIMARY KEY (`rowid`);

--
-- Index pour la table `llx_payment_expensereport`
--
ALTER TABLE `llx_payment_expensereport`
  ADD PRIMARY KEY (`rowid`);

--
-- Index pour la table `llx_payment_loan`
--
ALTER TABLE `llx_payment_loan`
  ADD PRIMARY KEY (`rowid`);

--
-- Index pour la table `llx_payment_salary`
--
ALTER TABLE `llx_payment_salary`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_payment_salary_ref` (`num_payment`),
  ADD KEY `idx_payment_salary_user` (`fk_user`,`entity`),
  ADD KEY `idx_payment_salary_datep` (`datep`),
  ADD KEY `idx_payment_salary_datesp` (`datesp`),
  ADD KEY `idx_payment_salary_dateep` (`dateep`);

--
-- Index pour la table `llx_payment_various`
--
ALTER TABLE `llx_payment_various`
  ADD PRIMARY KEY (`rowid`);

--
-- Index pour la table `llx_payment_vat`
--
ALTER TABLE `llx_payment_vat`
  ADD PRIMARY KEY (`rowid`);

--
-- Index pour la table `llx_pos_cash_fence`
--
ALTER TABLE `llx_pos_cash_fence`
  ADD PRIMARY KEY (`rowid`);

--
-- Index pour la table `llx_prelevement_bons`
--
ALTER TABLE `llx_prelevement_bons`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_prelevement_bons_ref` (`ref`,`entity`);

--
-- Index pour la table `llx_prelevement_facture`
--
ALTER TABLE `llx_prelevement_facture`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_prelevement_facture_fk_prelevement_lignes` (`fk_prelevement_lignes`);

--
-- Index pour la table `llx_prelevement_facture_demande`
--
ALTER TABLE `llx_prelevement_facture_demande`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_prelevement_facture_demande_fk_facture` (`fk_facture`),
  ADD KEY `idx_prelevement_facture_demande_fk_facture_fourn` (`fk_facture_fourn`);

--
-- Index pour la table `llx_prelevement_lignes`
--
ALTER TABLE `llx_prelevement_lignes`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_prelevement_lignes_fk_prelevement_bons` (`fk_prelevement_bons`);

--
-- Index pour la table `llx_prelevement_rejet`
--
ALTER TABLE `llx_prelevement_rejet`
  ADD PRIMARY KEY (`rowid`);

--
-- Index pour la table `llx_printing`
--
ALTER TABLE `llx_printing`
  ADD PRIMARY KEY (`rowid`);

--
-- Index pour la table `llx_product`
--
ALTER TABLE `llx_product`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_product_ref` (`ref`,`entity`),
  ADD UNIQUE KEY `uk_product_barcode` (`barcode`,`fk_barcode_type`,`entity`),
  ADD KEY `idx_product_label` (`label`),
  ADD KEY `idx_product_barcode` (`barcode`),
  ADD KEY `idx_product_import_key` (`import_key`),
  ADD KEY `idx_product_seuil_stock_alerte` (`seuil_stock_alerte`),
  ADD KEY `idx_product_fk_country` (`fk_country`),
  ADD KEY `idx_product_fk_user_author` (`fk_user_author`),
  ADD KEY `idx_product_fk_barcode_type` (`fk_barcode_type`),
  ADD KEY `idx_product_fk_project` (`fk_project`),
  ADD KEY `fk_product_fk_unit` (`fk_unit`),
  ADD KEY `fk_product_finished` (`finished`),
  ADD KEY `fk_product_default_warehouse` (`fk_default_warehouse`);

--
-- Index pour la table `llx_product_association`
--
ALTER TABLE `llx_product_association`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_product_association` (`fk_product_pere`,`fk_product_fils`),
  ADD KEY `idx_product_association_fils` (`fk_product_fils`);

--
-- Index pour la table `llx_product_attribute`
--
ALTER TABLE `llx_product_attribute`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_product_attribute_ref` (`ref`);

--
-- Index pour la table `llx_product_attribute_combination`
--
ALTER TABLE `llx_product_attribute_combination`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_product_att_com_product_parent` (`fk_product_parent`),
  ADD KEY `idx_product_att_com_product_child` (`fk_product_child`);

--
-- Index pour la table `llx_product_attribute_combination2val`
--
ALTER TABLE `llx_product_attribute_combination2val`
  ADD PRIMARY KEY (`rowid`);

--
-- Index pour la table `llx_product_attribute_combination_price_level`
--
ALTER TABLE `llx_product_attribute_combination_price_level`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `fk_product_attribute_combination` (`fk_product_attribute_combination`,`fk_price_level`);

--
-- Index pour la table `llx_product_attribute_value`
--
ALTER TABLE `llx_product_attribute_value`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_product_attribute_value` (`fk_product_attribute`,`ref`);

--
-- Index pour la table `llx_product_batch`
--
ALTER TABLE `llx_product_batch`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_product_batch` (`fk_product_stock`,`batch`),
  ADD KEY `idx_fk_product_stock` (`fk_product_stock`),
  ADD KEY `idx_batch` (`batch`);

--
-- Index pour la table `llx_product_customer_price`
--
ALTER TABLE `llx_product_customer_price`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_customer_price_fk_product_fk_soc` (`fk_product`,`fk_soc`),
  ADD KEY `idx_product_customer_price_fk_user` (`fk_user`),
  ADD KEY `idx_product_customer_price_fk_soc` (`fk_soc`);

--
-- Index pour la table `llx_product_customer_price_log`
--
ALTER TABLE `llx_product_customer_price_log`
  ADD PRIMARY KEY (`rowid`);

--
-- Index pour la table `llx_product_extrafields`
--
ALTER TABLE `llx_product_extrafields`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_product_extrafields` (`fk_object`);

--
-- Index pour la table `llx_product_fournisseur_price`
--
ALTER TABLE `llx_product_fournisseur_price`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_product_fournisseur_price_ref` (`ref_fourn`,`fk_soc`,`quantity`,`entity`),
  ADD UNIQUE KEY `uk_product_barcode` (`barcode`,`fk_barcode_type`,`entity`),
  ADD KEY `idx_product_fournisseur_price_fk_user` (`fk_user`),
  ADD KEY `idx_product_fourn_price_fk_product` (`fk_product`,`entity`),
  ADD KEY `idx_product_fourn_price_fk_soc` (`fk_soc`,`entity`),
  ADD KEY `idx_product_barcode` (`barcode`),
  ADD KEY `idx_product_fk_barcode_type` (`fk_barcode_type`);

--
-- Index pour la table `llx_product_fournisseur_price_extrafields`
--
ALTER TABLE `llx_product_fournisseur_price_extrafields`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_product_fournisseur_price_extrafields` (`fk_object`);

--
-- Index pour la table `llx_product_fournisseur_price_log`
--
ALTER TABLE `llx_product_fournisseur_price_log`
  ADD PRIMARY KEY (`rowid`);

--
-- Index pour la table `llx_product_lang`
--
ALTER TABLE `llx_product_lang`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_product_lang` (`fk_product`,`lang`);

--
-- Index pour la table `llx_product_lot`
--
ALTER TABLE `llx_product_lot`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_product_lot` (`fk_product`,`batch`);

--
-- Index pour la table `llx_product_lot_extrafields`
--
ALTER TABLE `llx_product_lot_extrafields`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_product_lot_extrafields` (`fk_object`);

--
-- Index pour la table `llx_product_perentity`
--
ALTER TABLE `llx_product_perentity`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_product_perentity` (`fk_product`,`entity`),
  ADD KEY `idx_product_perentity_fk_product` (`fk_product`);

--
-- Index pour la table `llx_product_price`
--
ALTER TABLE `llx_product_price`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_product_price_fk_user_author` (`fk_user_author`),
  ADD KEY `idx_product_price_fk_product` (`fk_product`);

--
-- Index pour la table `llx_product_pricerules`
--
ALTER TABLE `llx_product_pricerules`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `unique_level` (`level`);

--
-- Index pour la table `llx_product_price_by_qty`
--
ALTER TABLE `llx_product_price_by_qty`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_product_price_by_qty_level` (`fk_product_price`,`quantity`),
  ADD KEY `idx_product_price_by_qty_fk_product_price` (`fk_product_price`);

--
-- Index pour la table `llx_product_stock`
--
ALTER TABLE `llx_product_stock`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_product_stock` (`fk_product`,`fk_entrepot`),
  ADD KEY `idx_product_stock_fk_product` (`fk_product`),
  ADD KEY `idx_product_stock_fk_entrepot` (`fk_entrepot`);

--
-- Index pour la table `llx_product_warehouse_properties`
--
ALTER TABLE `llx_product_warehouse_properties`
  ADD PRIMARY KEY (`rowid`);

--
-- Index pour la table `llx_projet`
--
ALTER TABLE `llx_projet`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_projet_ref` (`ref`,`entity`),
  ADD KEY `idx_projet_fk_soc` (`fk_soc`);

--
-- Index pour la table `llx_projet_extrafields`
--
ALTER TABLE `llx_projet_extrafields`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_projet_extrafields` (`fk_object`);

--
-- Index pour la table `llx_projet_task`
--
ALTER TABLE `llx_projet_task`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_projet_task_ref` (`ref`,`entity`),
  ADD KEY `idx_projet_task_fk_projet` (`fk_projet`),
  ADD KEY `idx_projet_task_fk_user_creat` (`fk_user_creat`),
  ADD KEY `idx_projet_task_fk_user_valid` (`fk_user_valid`);

--
-- Index pour la table `llx_projet_task_extrafields`
--
ALTER TABLE `llx_projet_task_extrafields`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_projet_task_extrafields` (`fk_object`);

--
-- Index pour la table `llx_projet_task_time`
--
ALTER TABLE `llx_projet_task_time`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_projet_task_time_task` (`fk_task`),
  ADD KEY `idx_projet_task_time_date` (`task_date`),
  ADD KEY `idx_projet_task_time_datehour` (`task_datehour`);

--
-- Index pour la table `llx_propal`
--
ALTER TABLE `llx_propal`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_propal_ref` (`ref`,`entity`),
  ADD KEY `idx_propal_fk_soc` (`fk_soc`),
  ADD KEY `idx_propal_fk_user_author` (`fk_user_author`),
  ADD KEY `idx_propal_fk_user_valid` (`fk_user_valid`),
  ADD KEY `idx_propal_fk_user_signature` (`fk_user_signature`),
  ADD KEY `idx_propal_fk_user_cloture` (`fk_user_cloture`),
  ADD KEY `idx_propal_fk_projet` (`fk_projet`),
  ADD KEY `idx_propal_fk_account` (`fk_account`),
  ADD KEY `idx_propal_fk_currency` (`fk_currency`),
  ADD KEY `idx_propal_fk_warehouse` (`fk_warehouse`);

--
-- Index pour la table `llx_propaldet`
--
ALTER TABLE `llx_propaldet`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_propaldet_fk_propal` (`fk_propal`),
  ADD KEY `idx_propaldet_fk_product` (`fk_product`),
  ADD KEY `fk_propaldet_fk_unit` (`fk_unit`);

--
-- Index pour la table `llx_propaldet_extrafields`
--
ALTER TABLE `llx_propaldet_extrafields`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_propaldet_extrafields` (`fk_object`);

--
-- Index pour la table `llx_propal_extrafields`
--
ALTER TABLE `llx_propal_extrafields`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_propal_extrafields` (`fk_object`);

--
-- Index pour la table `llx_propal_merge_pdf_product`
--
ALTER TABLE `llx_propal_merge_pdf_product`
  ADD PRIMARY KEY (`rowid`);

--
-- Index pour la table `llx_reception`
--
ALTER TABLE `llx_reception`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `idx_reception_uk_ref` (`ref`,`entity`),
  ADD KEY `idx_reception_fk_soc` (`fk_soc`),
  ADD KEY `idx_reception_fk_user_author` (`fk_user_author`),
  ADD KEY `idx_reception_fk_user_valid` (`fk_user_valid`),
  ADD KEY `idx_reception_fk_shipping_method` (`fk_shipping_method`);

--
-- Index pour la table `llx_reception_extrafields`
--
ALTER TABLE `llx_reception_extrafields`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_reception_extrafields` (`fk_object`);

--
-- Index pour la table `llx_recruitment_recruitmentcandidature`
--
ALTER TABLE `llx_recruitment_recruitmentcandidature`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_recruitmentcandidature_email_msgid` (`email_msgid`),
  ADD KEY `idx_recruitment_recruitmentcandidature_rowid` (`rowid`),
  ADD KEY `idx_recruitment_recruitmentcandidature_ref` (`ref`),
  ADD KEY `llx_recruitment_recruitmentcandidature_fk_user_creat` (`fk_user_creat`),
  ADD KEY `idx_recruitment_recruitmentcandidature_status` (`status`);

--
-- Index pour la table `llx_recruitment_recruitmentcandidature_extrafields`
--
ALTER TABLE `llx_recruitment_recruitmentcandidature_extrafields`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_recruitmentcandidature_fk_object` (`fk_object`);

--
-- Index pour la table `llx_recruitment_recruitmentjobposition`
--
ALTER TABLE `llx_recruitment_recruitmentjobposition`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_recruitment_recruitmentjobposition_rowid` (`rowid`),
  ADD KEY `idx_recruitment_recruitmentjobposition_ref` (`ref`),
  ADD KEY `idx_recruitment_recruitmentjobposition_fk_soc` (`fk_soc`),
  ADD KEY `idx_recruitment_recruitmentjobposition_fk_project` (`fk_project`),
  ADD KEY `llx_recruitment_recruitmentjobposition_fk_user_recruiter` (`fk_user_recruiter`),
  ADD KEY `llx_recruitment_recruitmentjobposition_fk_user_supervisor` (`fk_user_supervisor`),
  ADD KEY `llx_recruitment_recruitmentjobposition_fk_establishment` (`fk_establishment`),
  ADD KEY `llx_recruitment_recruitmentjobposition_fk_user_creat` (`fk_user_creat`),
  ADD KEY `idx_recruitment_recruitmentjobposition_status` (`status`);

--
-- Index pour la table `llx_recruitment_recruitmentjobposition_extrafields`
--
ALTER TABLE `llx_recruitment_recruitmentjobposition_extrafields`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_recruitmentjobposition_fk_object` (`fk_object`);

--
-- Index pour la table `llx_resource`
--
ALTER TABLE `llx_resource`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_resource_ref` (`ref`,`entity`),
  ADD KEY `fk_code_type_resource_idx` (`fk_code_type_resource`),
  ADD KEY `idx_resource_fk_country` (`fk_country`);

--
-- Index pour la table `llx_resource_extrafields`
--
ALTER TABLE `llx_resource_extrafields`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_resource_extrafields` (`fk_object`);

--
-- Index pour la table `llx_rights_def`
--
ALTER TABLE `llx_rights_def`
  ADD PRIMARY KEY (`id`,`entity`);

--
-- Index pour la table `llx_salary`
--
ALTER TABLE `llx_salary`
  ADD PRIMARY KEY (`rowid`);

--
-- Index pour la table `llx_salary_extrafields`
--
ALTER TABLE `llx_salary_extrafields`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_salary_extrafields` (`fk_object`);

--
-- Index pour la table `llx_session`
--
ALTER TABLE `llx_session`
  ADD PRIMARY KEY (`session_id`);

--
-- Index pour la table `llx_societe`
--
ALTER TABLE `llx_societe`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_societe_prefix_comm` (`prefix_comm`,`entity`),
  ADD UNIQUE KEY `uk_societe_code_client` (`code_client`,`entity`),
  ADD UNIQUE KEY `uk_societe_code_fournisseur` (`code_fournisseur`,`entity`),
  ADD UNIQUE KEY `uk_societe_barcode` (`barcode`,`fk_barcode_type`,`entity`),
  ADD KEY `idx_societe_user_creat` (`fk_user_creat`),
  ADD KEY `idx_societe_user_modif` (`fk_user_modif`),
  ADD KEY `idx_societe_stcomm` (`fk_stcomm`),
  ADD KEY `idx_societe_pays` (`fk_pays`),
  ADD KEY `idx_societe_account` (`fk_account`),
  ADD KEY `idx_societe_prospectlevel` (`fk_prospectlevel`),
  ADD KEY `idx_societe_typent` (`fk_typent`),
  ADD KEY `idx_societe_forme_juridique` (`fk_forme_juridique`),
  ADD KEY `idx_societe_shipping_method` (`fk_shipping_method`);

--
-- Index pour la table `llx_societe_account`
--
ALTER TABLE `llx_societe_account`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_societe_account_login_website_soc` (`entity`,`fk_soc`,`login`,`site`,`fk_website`),
  ADD UNIQUE KEY `uk_societe_account_key_account_soc` (`entity`,`fk_soc`,`key_account`,`site`,`fk_website`),
  ADD KEY `idx_societe_account_rowid` (`rowid`),
  ADD KEY `idx_societe_account_login` (`login`),
  ADD KEY `idx_societe_account_status` (`status`),
  ADD KEY `idx_societe_account_fk_website` (`fk_website`),
  ADD KEY `idx_societe_account_fk_soc` (`fk_soc`);

--
-- Index pour la table `llx_societe_address`
--
ALTER TABLE `llx_societe_address`
  ADD PRIMARY KEY (`rowid`);

--
-- Index pour la table `llx_societe_commerciaux`
--
ALTER TABLE `llx_societe_commerciaux`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_societe_commerciaux` (`fk_soc`,`fk_user`);

--
-- Index pour la table `llx_societe_contacts`
--
ALTER TABLE `llx_societe_contacts`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `idx_societe_contacts_idx1` (`entity`,`fk_soc`,`fk_c_type_contact`,`fk_socpeople`),
  ADD KEY `fk_societe_contacts_fk_c_type_contact` (`fk_c_type_contact`),
  ADD KEY `fk_societe_contacts_fk_soc` (`fk_soc`),
  ADD KEY `fk_societe_contacts_fk_socpeople` (`fk_socpeople`);

--
-- Index pour la table `llx_societe_extrafields`
--
ALTER TABLE `llx_societe_extrafields`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_societe_extrafields` (`fk_object`);

--
-- Index pour la table `llx_societe_perentity`
--
ALTER TABLE `llx_societe_perentity`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_societe_perentity` (`fk_soc`,`entity`),
  ADD KEY `idx_societe_perentity_fk_soc` (`fk_soc`);

--
-- Index pour la table `llx_societe_prices`
--
ALTER TABLE `llx_societe_prices`
  ADD PRIMARY KEY (`rowid`);

--
-- Index pour la table `llx_societe_remise`
--
ALTER TABLE `llx_societe_remise`
  ADD PRIMARY KEY (`rowid`);

--
-- Index pour la table `llx_societe_remise_except`
--
ALTER TABLE `llx_societe_remise_except`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_societe_remise_except_fk_user` (`fk_user`),
  ADD KEY `idx_societe_remise_except_fk_soc` (`fk_soc`),
  ADD KEY `idx_societe_remise_except_fk_facture_line` (`fk_facture_line`),
  ADD KEY `idx_societe_remise_except_fk_facture` (`fk_facture`),
  ADD KEY `idx_societe_remise_except_fk_facture_source` (`fk_facture_source`),
  ADD KEY `idx_societe_remise_except_discount_type` (`discount_type`),
  ADD KEY `fk_soc_remise_fk_invoice_supplier_line` (`fk_invoice_supplier_line`),
  ADD KEY `fk_societe_remise_fk_invoice_supplier_source` (`fk_invoice_supplier`);

--
-- Index pour la table `llx_societe_remise_supplier`
--
ALTER TABLE `llx_societe_remise_supplier`
  ADD PRIMARY KEY (`rowid`);

--
-- Index pour la table `llx_societe_rib`
--
ALTER TABLE `llx_societe_rib`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_societe_rib` (`label`,`fk_soc`),
  ADD KEY `llx_societe_rib_fk_societe` (`fk_soc`);

--
-- Index pour la table `llx_socpeople`
--
ALTER TABLE `llx_socpeople`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_socpeople_fk_soc` (`fk_soc`),
  ADD KEY `idx_socpeople_fk_user_creat` (`fk_user_creat`);

--
-- Index pour la table `llx_socpeople_extrafields`
--
ALTER TABLE `llx_socpeople_extrafields`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_socpeople_extrafields` (`fk_object`);

--
-- Index pour la table `llx_stock_mouvement`
--
ALTER TABLE `llx_stock_mouvement`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_stock_mouvement_fk_product` (`fk_product`),
  ADD KEY `idx_stock_mouvement_fk_entrepot` (`fk_entrepot`);

--
-- Index pour la table `llx_subscription`
--
ALTER TABLE `llx_subscription`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_subscription` (`fk_adherent`,`dateadh`);

--
-- Index pour la table `llx_supplier_proposal`
--
ALTER TABLE `llx_supplier_proposal`
  ADD PRIMARY KEY (`rowid`);

--
-- Index pour la table `llx_supplier_proposaldet`
--
ALTER TABLE `llx_supplier_proposaldet`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_supplier_proposaldet_fk_supplier_proposal` (`fk_supplier_proposal`),
  ADD KEY `idx_supplier_proposaldet_fk_product` (`fk_product`),
  ADD KEY `fk_supplier_proposaldet_fk_unit` (`fk_unit`);

--
-- Index pour la table `llx_supplier_proposaldet_extrafields`
--
ALTER TABLE `llx_supplier_proposaldet_extrafields`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_supplier_proposaldet_extrafields` (`fk_object`);

--
-- Index pour la table `llx_supplier_proposal_extrafields`
--
ALTER TABLE `llx_supplier_proposal_extrafields`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_supplier_proposal_extrafields` (`fk_object`);

--
-- Index pour la table `llx_takepos_floor_tables`
--
ALTER TABLE `llx_takepos_floor_tables`
  ADD PRIMARY KEY (`rowid`);

--
-- Index pour la table `llx_ticket`
--
ALTER TABLE `llx_ticket`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_ticket_track_id` (`track_id`),
  ADD UNIQUE KEY `uk_ticket_ref` (`ref`,`entity`),
  ADD KEY `idx_ticket_entity` (`entity`),
  ADD KEY `idx_ticket_fk_soc` (`fk_soc`),
  ADD KEY `idx_ticket_fk_user_assign` (`fk_user_assign`),
  ADD KEY `idx_ticket_fk_project` (`fk_project`),
  ADD KEY `idx_ticket_fk_statut` (`fk_statut`);

--
-- Index pour la table `llx_ticket_extrafields`
--
ALTER TABLE `llx_ticket_extrafields`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_ticket_extrafields` (`fk_object`);

--
-- Index pour la table `llx_tva`
--
ALTER TABLE `llx_tva`
  ADD PRIMARY KEY (`rowid`);

--
-- Index pour la table `llx_user`
--
ALTER TABLE `llx_user`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_user_login` (`login`,`entity`),
  ADD UNIQUE KEY `uk_user_fk_socpeople` (`fk_socpeople`),
  ADD UNIQUE KEY `uk_user_fk_member` (`fk_member`),
  ADD UNIQUE KEY `uk_user_api_key` (`api_key`),
  ADD KEY `idx_user_fk_societe` (`fk_soc`);

--
-- Index pour la table `llx_usergroup`
--
ALTER TABLE `llx_usergroup`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_usergroup_name` (`nom`,`entity`);

--
-- Index pour la table `llx_usergroup_extrafields`
--
ALTER TABLE `llx_usergroup_extrafields`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_usergroup_extrafields` (`fk_object`);

--
-- Index pour la table `llx_usergroup_rights`
--
ALTER TABLE `llx_usergroup_rights`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_usergroup_rights` (`entity`,`fk_usergroup`,`fk_id`),
  ADD KEY `fk_usergroup_rights_fk_usergroup` (`fk_usergroup`);

--
-- Index pour la table `llx_usergroup_user`
--
ALTER TABLE `llx_usergroup_user`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_usergroup_user` (`entity`,`fk_user`,`fk_usergroup`),
  ADD KEY `fk_usergroup_user_fk_user` (`fk_user`),
  ADD KEY `fk_usergroup_user_fk_usergroup` (`fk_usergroup`);

--
-- Index pour la table `llx_user_alert`
--
ALTER TABLE `llx_user_alert`
  ADD PRIMARY KEY (`rowid`);

--
-- Index pour la table `llx_user_clicktodial`
--
ALTER TABLE `llx_user_clicktodial`
  ADD PRIMARY KEY (`fk_user`);

--
-- Index pour la table `llx_user_employment`
--
ALTER TABLE `llx_user_employment`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_user_employment` (`ref`,`entity`),
  ADD KEY `fk_user_employment_fk_user` (`fk_user`);

--
-- Index pour la table `llx_user_extrafields`
--
ALTER TABLE `llx_user_extrafields`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_user_extrafields` (`fk_object`);

--
-- Index pour la table `llx_user_param`
--
ALTER TABLE `llx_user_param`
  ADD UNIQUE KEY `uk_user_param` (`fk_user`,`param`,`entity`);

--
-- Index pour la table `llx_user_rib`
--
ALTER TABLE `llx_user_rib`
  ADD PRIMARY KEY (`rowid`);

--
-- Index pour la table `llx_user_rights`
--
ALTER TABLE `llx_user_rights`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_user_rights` (`entity`,`fk_user`,`fk_id`),
  ADD KEY `fk_user_rights_fk_user_user` (`fk_user`);

--
-- Index pour la table `llx_website`
--
ALTER TABLE `llx_website`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_website_ref` (`ref`,`entity`);

--
-- Index pour la table `llx_website_extrafields`
--
ALTER TABLE `llx_website_extrafields`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_website_extrafields` (`fk_object`);

--
-- Index pour la table `llx_website_page`
--
ALTER TABLE `llx_website_page`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_website_page_url` (`fk_website`,`pageurl`);

--
-- Index pour la table `llx_workstation_workstation`
--
ALTER TABLE `llx_workstation_workstation`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_workstation_workstation_rowid` (`rowid`),
  ADD KEY `idx_workstation_workstation_ref` (`ref`),
  ADD KEY `fk_workstation_workstation_fk_user_creat` (`fk_user_creat`),
  ADD KEY `idx_workstation_workstation_status` (`status`);

--
-- Index pour la table `llx_workstation_workstation_resource`
--
ALTER TABLE `llx_workstation_workstation_resource`
  ADD PRIMARY KEY (`rowid`);

--
-- Index pour la table `llx_workstation_workstation_usergroup`
--
ALTER TABLE `llx_workstation_workstation_usergroup`
  ADD PRIMARY KEY (`rowid`);

--
-- Index pour la table `llx_zapier_hook`
--
ALTER TABLE `llx_zapier_hook`
  ADD PRIMARY KEY (`rowid`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `llx_accounting_account`
--
ALTER TABLE `llx_accounting_account`
  MODIFY `rowid` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15812;

--
-- AUTO_INCREMENT pour la table `llx_accounting_bookkeeping`
--
ALTER TABLE `llx_accounting_bookkeeping`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_accounting_bookkeeping_tmp`
--
ALTER TABLE `llx_accounting_bookkeeping_tmp`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_accounting_fiscalyear`
--
ALTER TABLE `llx_accounting_fiscalyear`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_accounting_groups_account`
--
ALTER TABLE `llx_accounting_groups_account`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_accounting_journal`
--
ALTER TABLE `llx_accounting_journal`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `llx_accounting_system`
--
ALTER TABLE `llx_accounting_system`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT pour la table `llx_actioncomm`
--
ALTER TABLE `llx_actioncomm`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_actioncomm_extrafields`
--
ALTER TABLE `llx_actioncomm_extrafields`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_actioncomm_reminder`
--
ALTER TABLE `llx_actioncomm_reminder`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_actioncomm_resources`
--
ALTER TABLE `llx_actioncomm_resources`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_adherent`
--
ALTER TABLE `llx_adherent`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_adherent_extrafields`
--
ALTER TABLE `llx_adherent_extrafields`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_adherent_type`
--
ALTER TABLE `llx_adherent_type`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_adherent_type_extrafields`
--
ALTER TABLE `llx_adherent_type_extrafields`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_adherent_type_lang`
--
ALTER TABLE `llx_adherent_type_lang`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_advtargetemailing`
--
ALTER TABLE `llx_advtargetemailing`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_asset`
--
ALTER TABLE `llx_asset`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_asset_extrafields`
--
ALTER TABLE `llx_asset_extrafields`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_asset_type`
--
ALTER TABLE `llx_asset_type`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_asset_type_extrafields`
--
ALTER TABLE `llx_asset_type_extrafields`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_bank`
--
ALTER TABLE `llx_bank`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_bank_account`
--
ALTER TABLE `llx_bank_account`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_bank_account_extrafields`
--
ALTER TABLE `llx_bank_account_extrafields`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_bank_categ`
--
ALTER TABLE `llx_bank_categ`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_bank_url`
--
ALTER TABLE `llx_bank_url`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_blockedlog`
--
ALTER TABLE `llx_blockedlog`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_blockedlog_authority`
--
ALTER TABLE `llx_blockedlog_authority`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_bom_bom`
--
ALTER TABLE `llx_bom_bom`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_bom_bomline`
--
ALTER TABLE `llx_bom_bomline`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_bom_bomline_extrafields`
--
ALTER TABLE `llx_bom_bomline_extrafields`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_bom_bom_extrafields`
--
ALTER TABLE `llx_bom_bom_extrafields`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_bookmark`
--
ALTER TABLE `llx_bookmark`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_bordereau_cheque`
--
ALTER TABLE `llx_bordereau_cheque`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_boxes`
--
ALTER TABLE `llx_boxes`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pour la table `llx_boxes_def`
--
ALTER TABLE `llx_boxes_def`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `llx_budget`
--
ALTER TABLE `llx_budget`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_budget_lines`
--
ALTER TABLE `llx_budget_lines`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_categorie`
--
ALTER TABLE `llx_categorie`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_categories_extrafields`
--
ALTER TABLE `llx_categories_extrafields`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_categorie_lang`
--
ALTER TABLE `llx_categorie_lang`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_chargesociales`
--
ALTER TABLE `llx_chargesociales`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_commande`
--
ALTER TABLE `llx_commande`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_commandedet`
--
ALTER TABLE `llx_commandedet`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_commandedet_extrafields`
--
ALTER TABLE `llx_commandedet_extrafields`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_commande_extrafields`
--
ALTER TABLE `llx_commande_extrafields`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_commande_fournisseur`
--
ALTER TABLE `llx_commande_fournisseur`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_commande_fournisseurdet`
--
ALTER TABLE `llx_commande_fournisseurdet`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_commande_fournisseurdet_extrafields`
--
ALTER TABLE `llx_commande_fournisseurdet_extrafields`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_commande_fournisseur_dispatch`
--
ALTER TABLE `llx_commande_fournisseur_dispatch`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_commande_fournisseur_dispatch_extrafields`
--
ALTER TABLE `llx_commande_fournisseur_dispatch_extrafields`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_commande_fournisseur_extrafields`
--
ALTER TABLE `llx_commande_fournisseur_extrafields`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_commande_fournisseur_log`
--
ALTER TABLE `llx_commande_fournisseur_log`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_comment`
--
ALTER TABLE `llx_comment`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_const`
--
ALTER TABLE `llx_const`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT pour la table `llx_contrat`
--
ALTER TABLE `llx_contrat`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_contratdet`
--
ALTER TABLE `llx_contratdet`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_contratdet_extrafields`
--
ALTER TABLE `llx_contratdet_extrafields`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_contratdet_log`
--
ALTER TABLE `llx_contratdet_log`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_contrat_extrafields`
--
ALTER TABLE `llx_contrat_extrafields`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_cronjob`
--
ALTER TABLE `llx_cronjob`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_c_accounting_category`
--
ALTER TABLE `llx_c_accounting_category`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `llx_c_action_trigger`
--
ALTER TABLE `llx_c_action_trigger`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=111;

--
-- AUTO_INCREMENT pour la table `llx_c_availability`
--
ALTER TABLE `llx_c_availability`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `llx_c_barcode_type`
--
ALTER TABLE `llx_c_barcode_type`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_c_chargesociales`
--
ALTER TABLE `llx_c_chargesociales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4110;

--
-- AUTO_INCREMENT pour la table `llx_c_civility`
--
ALTER TABLE `llx_c_civility`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pour la table `llx_c_departements`
--
ALTER TABLE `llx_c_departements`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1541;

--
-- AUTO_INCREMENT pour la table `llx_c_ecotaxe`
--
ALTER TABLE `llx_c_ecotaxe`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT pour la table `llx_c_email_senderprofile`
--
ALTER TABLE `llx_c_email_senderprofile`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_c_email_templates`
--
ALTER TABLE `llx_c_email_templates`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT pour la table `llx_c_exp_tax_cat`
--
ALTER TABLE `llx_c_exp_tax_cat`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT pour la table `llx_c_exp_tax_range`
--
ALTER TABLE `llx_c_exp_tax_range`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT pour la table `llx_c_field_list`
--
ALTER TABLE `llx_c_field_list`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_c_format_cards`
--
ALTER TABLE `llx_c_format_cards`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT pour la table `llx_c_forme_juridique`
--
ALTER TABLE `llx_c_forme_juridique`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=259;

--
-- AUTO_INCREMENT pour la table `llx_c_holiday_types`
--
ALTER TABLE `llx_c_holiday_types`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `llx_c_hrm_public_holiday`
--
ALTER TABLE `llx_c_hrm_public_holiday`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT pour la table `llx_c_incoterms`
--
ALTER TABLE `llx_c_incoterms`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT pour la table `llx_c_input_method`
--
ALTER TABLE `llx_c_input_method`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `llx_c_input_reason`
--
ALTER TABLE `llx_c_input_reason`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT pour la table `llx_c_lead_status`
--
ALTER TABLE `llx_c_lead_status`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `llx_c_paiement`
--
ALTER TABLE `llx_c_paiement`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT pour la table `llx_c_paper_format`
--
ALTER TABLE `llx_c_paper_format`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=226;

--
-- AUTO_INCREMENT pour la table `llx_c_partnership_type`
--
ALTER TABLE `llx_c_partnership_type`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_c_payment_term`
--
ALTER TABLE `llx_c_payment_term`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT pour la table `llx_c_price_expression`
--
ALTER TABLE `llx_c_price_expression`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_c_price_global_variable`
--
ALTER TABLE `llx_c_price_global_variable`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_c_price_global_variable_updater`
--
ALTER TABLE `llx_c_price_global_variable_updater`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_c_productbatch_qcstatus`
--
ALTER TABLE `llx_c_productbatch_qcstatus`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `llx_c_product_nature`
--
ALTER TABLE `llx_c_product_nature`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `llx_c_recruitment_origin`
--
ALTER TABLE `llx_c_recruitment_origin`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_c_regions`
--
ALTER TABLE `llx_c_regions`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=273;

--
-- AUTO_INCREMENT pour la table `llx_c_revenuestamp`
--
ALTER TABLE `llx_c_revenuestamp`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1543;

--
-- AUTO_INCREMENT pour la table `llx_c_shipment_mode`
--
ALTER TABLE `llx_c_shipment_mode`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT pour la table `llx_c_shipment_package_type`
--
ALTER TABLE `llx_c_shipment_package_type`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_c_socialnetworks`
--
ALTER TABLE `llx_c_socialnetworks`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT pour la table `llx_c_ticket_category`
--
ALTER TABLE `llx_c_ticket_category`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `llx_c_ticket_resolution`
--
ALTER TABLE `llx_c_ticket_resolution`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `llx_c_ticket_severity`
--
ALTER TABLE `llx_c_ticket_severity`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `llx_c_ticket_type`
--
ALTER TABLE `llx_c_ticket_type`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `llx_c_transport_mode`
--
ALTER TABLE `llx_c_transport_mode`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pour la table `llx_c_tva`
--
ALTER TABLE `llx_c_tva`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=803;

--
-- AUTO_INCREMENT pour la table `llx_c_type_container`
--
ALTER TABLE `llx_c_type_container`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `llx_c_type_fees`
--
ALTER TABLE `llx_c_type_fees`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT pour la table `llx_c_type_resource`
--
ALTER TABLE `llx_c_type_resource`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `llx_c_units`
--
ALTER TABLE `llx_c_units`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT pour la table `llx_c_ziptown`
--
ALTER TABLE `llx_c_ziptown`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_default_values`
--
ALTER TABLE `llx_default_values`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_delivery`
--
ALTER TABLE `llx_delivery`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_deliverydet`
--
ALTER TABLE `llx_deliverydet`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_deliverydet_extrafields`
--
ALTER TABLE `llx_deliverydet_extrafields`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_delivery_extrafields`
--
ALTER TABLE `llx_delivery_extrafields`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_deplacement`
--
ALTER TABLE `llx_deplacement`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_document_model`
--
ALTER TABLE `llx_document_model`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `llx_don`
--
ALTER TABLE `llx_don`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_don_extrafields`
--
ALTER TABLE `llx_don_extrafields`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_ecm_directories`
--
ALTER TABLE `llx_ecm_directories`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_ecm_directories_extrafields`
--
ALTER TABLE `llx_ecm_directories_extrafields`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_ecm_files`
--
ALTER TABLE `llx_ecm_files`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_ecm_files_extrafields`
--
ALTER TABLE `llx_ecm_files_extrafields`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_element_contact`
--
ALTER TABLE `llx_element_contact`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_element_element`
--
ALTER TABLE `llx_element_element`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_element_resources`
--
ALTER TABLE `llx_element_resources`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_emailcollector_emailcollector`
--
ALTER TABLE `llx_emailcollector_emailcollector`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_emailcollector_emailcollectoraction`
--
ALTER TABLE `llx_emailcollector_emailcollectoraction`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_emailcollector_emailcollectorfilter`
--
ALTER TABLE `llx_emailcollector_emailcollectorfilter`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_entrepot`
--
ALTER TABLE `llx_entrepot`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `llx_entrepot_extrafields`
--
ALTER TABLE `llx_entrepot_extrafields`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_establishment`
--
ALTER TABLE `llx_establishment`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_eventorganization_conferenceorboothattendee`
--
ALTER TABLE `llx_eventorganization_conferenceorboothattendee`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_eventorganization_conferenceorboothattendee_extrafields`
--
ALTER TABLE `llx_eventorganization_conferenceorboothattendee_extrafields`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_events`
--
ALTER TABLE `llx_events`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_event_element`
--
ALTER TABLE `llx_event_element`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_expedition`
--
ALTER TABLE `llx_expedition`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_expeditiondet`
--
ALTER TABLE `llx_expeditiondet`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_expeditiondet_batch`
--
ALTER TABLE `llx_expeditiondet_batch`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_expeditiondet_extrafields`
--
ALTER TABLE `llx_expeditiondet_extrafields`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_expedition_extrafields`
--
ALTER TABLE `llx_expedition_extrafields`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_expedition_package`
--
ALTER TABLE `llx_expedition_package`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_expensereport`
--
ALTER TABLE `llx_expensereport`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_expensereport_det`
--
ALTER TABLE `llx_expensereport_det`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_expensereport_extrafields`
--
ALTER TABLE `llx_expensereport_extrafields`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_expensereport_ik`
--
ALTER TABLE `llx_expensereport_ik`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT pour la table `llx_expensereport_rules`
--
ALTER TABLE `llx_expensereport_rules`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_export_compta`
--
ALTER TABLE `llx_export_compta`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_export_model`
--
ALTER TABLE `llx_export_model`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_extrafields`
--
ALTER TABLE `llx_extrafields`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_facture`
--
ALTER TABLE `llx_facture`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_facturedet`
--
ALTER TABLE `llx_facturedet`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_facturedet_extrafields`
--
ALTER TABLE `llx_facturedet_extrafields`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_facturedet_rec`
--
ALTER TABLE `llx_facturedet_rec`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_facturedet_rec_extrafields`
--
ALTER TABLE `llx_facturedet_rec_extrafields`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_facture_extrafields`
--
ALTER TABLE `llx_facture_extrafields`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_facture_fourn`
--
ALTER TABLE `llx_facture_fourn`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_facture_fourn_det`
--
ALTER TABLE `llx_facture_fourn_det`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_facture_fourn_det_extrafields`
--
ALTER TABLE `llx_facture_fourn_det_extrafields`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_facture_fourn_extrafields`
--
ALTER TABLE `llx_facture_fourn_extrafields`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_facture_rec`
--
ALTER TABLE `llx_facture_rec`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_facture_rec_extrafields`
--
ALTER TABLE `llx_facture_rec_extrafields`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_fichinter`
--
ALTER TABLE `llx_fichinter`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_fichinterdet`
--
ALTER TABLE `llx_fichinterdet`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_fichinterdet_extrafields`
--
ALTER TABLE `llx_fichinterdet_extrafields`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_fichinterdet_rec`
--
ALTER TABLE `llx_fichinterdet_rec`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_fichinter_extrafields`
--
ALTER TABLE `llx_fichinter_extrafields`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_fichinter_rec`
--
ALTER TABLE `llx_fichinter_rec`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_holiday`
--
ALTER TABLE `llx_holiday`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_holiday_config`
--
ALTER TABLE `llx_holiday_config`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `llx_holiday_extrafields`
--
ALTER TABLE `llx_holiday_extrafields`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_holiday_logs`
--
ALTER TABLE `llx_holiday_logs`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_import_model`
--
ALTER TABLE `llx_import_model`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_intracommreport`
--
ALTER TABLE `llx_intracommreport`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_inventory`
--
ALTER TABLE `llx_inventory`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_inventorydet`
--
ALTER TABLE `llx_inventorydet`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_knowledgemanagement_knowledgerecord`
--
ALTER TABLE `llx_knowledgemanagement_knowledgerecord`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_knowledgemanagement_knowledgerecord_extrafields`
--
ALTER TABLE `llx_knowledgemanagement_knowledgerecord_extrafields`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_links`
--
ALTER TABLE `llx_links`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_loan`
--
ALTER TABLE `llx_loan`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_loan_schedule`
--
ALTER TABLE `llx_loan_schedule`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_localtax`
--
ALTER TABLE `llx_localtax`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_mailing`
--
ALTER TABLE `llx_mailing`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_mailing_cibles`
--
ALTER TABLE `llx_mailing_cibles`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_mailing_unsubscribe`
--
ALTER TABLE `llx_mailing_unsubscribe`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_menu`
--
ALTER TABLE `llx_menu`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `llx_mrp_mo`
--
ALTER TABLE `llx_mrp_mo`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_mrp_mo_extrafields`
--
ALTER TABLE `llx_mrp_mo_extrafields`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_mrp_production`
--
ALTER TABLE `llx_mrp_production`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_multicurrency`
--
ALTER TABLE `llx_multicurrency`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_multicurrency_rate`
--
ALTER TABLE `llx_multicurrency_rate`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_notify`
--
ALTER TABLE `llx_notify`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_notify_def`
--
ALTER TABLE `llx_notify_def`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_notify_def_object`
--
ALTER TABLE `llx_notify_def_object`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_oauth_state`
--
ALTER TABLE `llx_oauth_state`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_oauth_token`
--
ALTER TABLE `llx_oauth_token`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_object_lang`
--
ALTER TABLE `llx_object_lang`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_onlinesignature`
--
ALTER TABLE `llx_onlinesignature`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_opensurvey_comments`
--
ALTER TABLE `llx_opensurvey_comments`
  MODIFY `id_comment` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_opensurvey_formquestions`
--
ALTER TABLE `llx_opensurvey_formquestions`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_opensurvey_user_studs`
--
ALTER TABLE `llx_opensurvey_user_studs`
  MODIFY `id_users` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_overwrite_trans`
--
ALTER TABLE `llx_overwrite_trans`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_paiement`
--
ALTER TABLE `llx_paiement`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_paiementcharge`
--
ALTER TABLE `llx_paiementcharge`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_paiementfourn`
--
ALTER TABLE `llx_paiementfourn`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_paiementfourn_facturefourn`
--
ALTER TABLE `llx_paiementfourn_facturefourn`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_paiement_facture`
--
ALTER TABLE `llx_paiement_facture`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_partnership`
--
ALTER TABLE `llx_partnership`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_partnership_extrafields`
--
ALTER TABLE `llx_partnership_extrafields`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_payment_donation`
--
ALTER TABLE `llx_payment_donation`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_payment_expensereport`
--
ALTER TABLE `llx_payment_expensereport`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_payment_loan`
--
ALTER TABLE `llx_payment_loan`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_payment_salary`
--
ALTER TABLE `llx_payment_salary`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_payment_various`
--
ALTER TABLE `llx_payment_various`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_payment_vat`
--
ALTER TABLE `llx_payment_vat`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_pos_cash_fence`
--
ALTER TABLE `llx_pos_cash_fence`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_prelevement_bons`
--
ALTER TABLE `llx_prelevement_bons`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_prelevement_facture`
--
ALTER TABLE `llx_prelevement_facture`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_prelevement_facture_demande`
--
ALTER TABLE `llx_prelevement_facture_demande`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_prelevement_lignes`
--
ALTER TABLE `llx_prelevement_lignes`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_prelevement_rejet`
--
ALTER TABLE `llx_prelevement_rejet`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_printing`
--
ALTER TABLE `llx_printing`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_product`
--
ALTER TABLE `llx_product`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `llx_product_association`
--
ALTER TABLE `llx_product_association`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_product_attribute`
--
ALTER TABLE `llx_product_attribute`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_product_attribute_combination`
--
ALTER TABLE `llx_product_attribute_combination`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_product_attribute_combination2val`
--
ALTER TABLE `llx_product_attribute_combination2val`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_product_attribute_combination_price_level`
--
ALTER TABLE `llx_product_attribute_combination_price_level`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_product_attribute_value`
--
ALTER TABLE `llx_product_attribute_value`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_product_batch`
--
ALTER TABLE `llx_product_batch`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_product_customer_price`
--
ALTER TABLE `llx_product_customer_price`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_product_customer_price_log`
--
ALTER TABLE `llx_product_customer_price_log`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_product_extrafields`
--
ALTER TABLE `llx_product_extrafields`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_product_fournisseur_price`
--
ALTER TABLE `llx_product_fournisseur_price`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_product_fournisseur_price_extrafields`
--
ALTER TABLE `llx_product_fournisseur_price_extrafields`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_product_fournisseur_price_log`
--
ALTER TABLE `llx_product_fournisseur_price_log`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_product_lang`
--
ALTER TABLE `llx_product_lang`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_product_lot`
--
ALTER TABLE `llx_product_lot`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_product_lot_extrafields`
--
ALTER TABLE `llx_product_lot_extrafields`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_product_perentity`
--
ALTER TABLE `llx_product_perentity`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_product_price`
--
ALTER TABLE `llx_product_price`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `llx_product_pricerules`
--
ALTER TABLE `llx_product_pricerules`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_product_price_by_qty`
--
ALTER TABLE `llx_product_price_by_qty`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_product_stock`
--
ALTER TABLE `llx_product_stock`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_product_warehouse_properties`
--
ALTER TABLE `llx_product_warehouse_properties`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_projet`
--
ALTER TABLE `llx_projet`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_projet_extrafields`
--
ALTER TABLE `llx_projet_extrafields`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_projet_task`
--
ALTER TABLE `llx_projet_task`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_projet_task_extrafields`
--
ALTER TABLE `llx_projet_task_extrafields`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_projet_task_time`
--
ALTER TABLE `llx_projet_task_time`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_propal`
--
ALTER TABLE `llx_propal`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_propaldet`
--
ALTER TABLE `llx_propaldet`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_propaldet_extrafields`
--
ALTER TABLE `llx_propaldet_extrafields`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_propal_extrafields`
--
ALTER TABLE `llx_propal_extrafields`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_propal_merge_pdf_product`
--
ALTER TABLE `llx_propal_merge_pdf_product`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_reception`
--
ALTER TABLE `llx_reception`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_reception_extrafields`
--
ALTER TABLE `llx_reception_extrafields`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_recruitment_recruitmentcandidature`
--
ALTER TABLE `llx_recruitment_recruitmentcandidature`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_recruitment_recruitmentcandidature_extrafields`
--
ALTER TABLE `llx_recruitment_recruitmentcandidature_extrafields`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_recruitment_recruitmentjobposition`
--
ALTER TABLE `llx_recruitment_recruitmentjobposition`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_recruitment_recruitmentjobposition_extrafields`
--
ALTER TABLE `llx_recruitment_recruitmentjobposition_extrafields`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_resource`
--
ALTER TABLE `llx_resource`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_resource_extrafields`
--
ALTER TABLE `llx_resource_extrafields`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_salary`
--
ALTER TABLE `llx_salary`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_salary_extrafields`
--
ALTER TABLE `llx_salary_extrafields`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_societe`
--
ALTER TABLE `llx_societe`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_societe_account`
--
ALTER TABLE `llx_societe_account`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_societe_address`
--
ALTER TABLE `llx_societe_address`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_societe_commerciaux`
--
ALTER TABLE `llx_societe_commerciaux`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_societe_contacts`
--
ALTER TABLE `llx_societe_contacts`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_societe_extrafields`
--
ALTER TABLE `llx_societe_extrafields`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_societe_perentity`
--
ALTER TABLE `llx_societe_perentity`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_societe_prices`
--
ALTER TABLE `llx_societe_prices`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_societe_remise`
--
ALTER TABLE `llx_societe_remise`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_societe_remise_except`
--
ALTER TABLE `llx_societe_remise_except`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_societe_remise_supplier`
--
ALTER TABLE `llx_societe_remise_supplier`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_societe_rib`
--
ALTER TABLE `llx_societe_rib`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_socpeople`
--
ALTER TABLE `llx_socpeople`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_socpeople_extrafields`
--
ALTER TABLE `llx_socpeople_extrafields`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_stock_mouvement`
--
ALTER TABLE `llx_stock_mouvement`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_subscription`
--
ALTER TABLE `llx_subscription`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_supplier_proposal`
--
ALTER TABLE `llx_supplier_proposal`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_supplier_proposaldet`
--
ALTER TABLE `llx_supplier_proposaldet`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_supplier_proposaldet_extrafields`
--
ALTER TABLE `llx_supplier_proposaldet_extrafields`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_supplier_proposal_extrafields`
--
ALTER TABLE `llx_supplier_proposal_extrafields`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_takepos_floor_tables`
--
ALTER TABLE `llx_takepos_floor_tables`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_ticket`
--
ALTER TABLE `llx_ticket`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_ticket_extrafields`
--
ALTER TABLE `llx_ticket_extrafields`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_tva`
--
ALTER TABLE `llx_tva`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_user`
--
ALTER TABLE `llx_user`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `llx_usergroup`
--
ALTER TABLE `llx_usergroup`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_usergroup_extrafields`
--
ALTER TABLE `llx_usergroup_extrafields`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_usergroup_rights`
--
ALTER TABLE `llx_usergroup_rights`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_usergroup_user`
--
ALTER TABLE `llx_usergroup_user`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_user_alert`
--
ALTER TABLE `llx_user_alert`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_user_employment`
--
ALTER TABLE `llx_user_employment`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_user_extrafields`
--
ALTER TABLE `llx_user_extrafields`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_user_rib`
--
ALTER TABLE `llx_user_rib`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_user_rights`
--
ALTER TABLE `llx_user_rights`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT pour la table `llx_website`
--
ALTER TABLE `llx_website`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_website_extrafields`
--
ALTER TABLE `llx_website_extrafields`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_website_page`
--
ALTER TABLE `llx_website_page`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_workstation_workstation`
--
ALTER TABLE `llx_workstation_workstation`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_workstation_workstation_resource`
--
ALTER TABLE `llx_workstation_workstation_resource`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_workstation_workstation_usergroup`
--
ALTER TABLE `llx_workstation_workstation_usergroup`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `llx_zapier_hook`
--
ALTER TABLE `llx_zapier_hook`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `llx_accounting_account`
--
ALTER TABLE `llx_accounting_account`
  ADD CONSTRAINT `fk_accounting_account_fk_pcg_version` FOREIGN KEY (`fk_pcg_version`) REFERENCES `llx_accounting_system` (`pcg_version`);

--
-- Contraintes pour la table `llx_adherent`
--
ALTER TABLE `llx_adherent`
  ADD CONSTRAINT `adherent_fk_soc` FOREIGN KEY (`fk_soc`) REFERENCES `llx_societe` (`rowid`),
  ADD CONSTRAINT `fk_adherent_adherent_type` FOREIGN KEY (`fk_adherent_type`) REFERENCES `llx_adherent_type` (`rowid`);

--
-- Contraintes pour la table `llx_asset`
--
ALTER TABLE `llx_asset`
  ADD CONSTRAINT `fk_asset_asset_type` FOREIGN KEY (`fk_asset_type`) REFERENCES `llx_asset_type` (`rowid`);

--
-- Contraintes pour la table `llx_bank_account`
--
ALTER TABLE `llx_bank_account`
  ADD CONSTRAINT `fk_bank_account_accountancy_journal` FOREIGN KEY (`fk_accountancy_journal`) REFERENCES `llx_accounting_journal` (`rowid`);

--
-- Contraintes pour la table `llx_bom_bom`
--
ALTER TABLE `llx_bom_bom`
  ADD CONSTRAINT `llx_bom_bom_fk_user_creat` FOREIGN KEY (`fk_user_creat`) REFERENCES `llx_user` (`rowid`);

--
-- Contraintes pour la table `llx_bom_bomline`
--
ALTER TABLE `llx_bom_bomline`
  ADD CONSTRAINT `llx_bom_bomline_fk_bom` FOREIGN KEY (`fk_bom`) REFERENCES `llx_bom_bom` (`rowid`);

--
-- Contraintes pour la table `llx_boxes`
--
ALTER TABLE `llx_boxes`
  ADD CONSTRAINT `fk_boxes_box_id` FOREIGN KEY (`box_id`) REFERENCES `llx_boxes_def` (`rowid`);

--
-- Contraintes pour la table `llx_budget_lines`
--
ALTER TABLE `llx_budget_lines`
  ADD CONSTRAINT `fk_budget_lines_budget` FOREIGN KEY (`fk_budget`) REFERENCES `llx_budget` (`rowid`);

--
-- Contraintes pour la table `llx_categorie_account`
--
ALTER TABLE `llx_categorie_account`
  ADD CONSTRAINT `fk_categorie_account_categorie_rowid` FOREIGN KEY (`fk_categorie`) REFERENCES `llx_categorie` (`rowid`),
  ADD CONSTRAINT `fk_categorie_account_fk_account` FOREIGN KEY (`fk_account`) REFERENCES `llx_bank_account` (`rowid`);

--
-- Contraintes pour la table `llx_categorie_actioncomm`
--
ALTER TABLE `llx_categorie_actioncomm`
  ADD CONSTRAINT `fk_categorie_actioncomm_categorie_rowid` FOREIGN KEY (`fk_categorie`) REFERENCES `llx_categorie` (`rowid`),
  ADD CONSTRAINT `fk_categorie_actioncomm_fk_actioncomm` FOREIGN KEY (`fk_actioncomm`) REFERENCES `llx_actioncomm` (`id`);

--
-- Contraintes pour la table `llx_categorie_contact`
--
ALTER TABLE `llx_categorie_contact`
  ADD CONSTRAINT `fk_categorie_contact_categorie_rowid` FOREIGN KEY (`fk_categorie`) REFERENCES `llx_categorie` (`rowid`),
  ADD CONSTRAINT `fk_categorie_contact_fk_socpeople` FOREIGN KEY (`fk_socpeople`) REFERENCES `llx_socpeople` (`rowid`);

--
-- Contraintes pour la table `llx_categorie_fournisseur`
--
ALTER TABLE `llx_categorie_fournisseur`
  ADD CONSTRAINT `fk_categorie_fournisseur_categorie_rowid` FOREIGN KEY (`fk_categorie`) REFERENCES `llx_categorie` (`rowid`),
  ADD CONSTRAINT `fk_categorie_fournisseur_fk_soc` FOREIGN KEY (`fk_soc`) REFERENCES `llx_societe` (`rowid`);

--
-- Contraintes pour la table `llx_categorie_lang`
--
ALTER TABLE `llx_categorie_lang`
  ADD CONSTRAINT `fk_category_lang_fk_category` FOREIGN KEY (`fk_category`) REFERENCES `llx_categorie` (`rowid`);

--
-- Contraintes pour la table `llx_categorie_member`
--
ALTER TABLE `llx_categorie_member`
  ADD CONSTRAINT `fk_categorie_member_categorie_rowid` FOREIGN KEY (`fk_categorie`) REFERENCES `llx_categorie` (`rowid`),
  ADD CONSTRAINT `fk_categorie_member_member_rowid` FOREIGN KEY (`fk_member`) REFERENCES `llx_adherent` (`rowid`);

--
-- Contraintes pour la table `llx_categorie_product`
--
ALTER TABLE `llx_categorie_product`
  ADD CONSTRAINT `fk_categorie_product_categorie_rowid` FOREIGN KEY (`fk_categorie`) REFERENCES `llx_categorie` (`rowid`),
  ADD CONSTRAINT `fk_categorie_product_product_rowid` FOREIGN KEY (`fk_product`) REFERENCES `llx_product` (`rowid`);

--
-- Contraintes pour la table `llx_categorie_project`
--
ALTER TABLE `llx_categorie_project`
  ADD CONSTRAINT `fk_categorie_project_categorie_rowid` FOREIGN KEY (`fk_categorie`) REFERENCES `llx_categorie` (`rowid`),
  ADD CONSTRAINT `fk_categorie_project_fk_project_rowid` FOREIGN KEY (`fk_project`) REFERENCES `llx_projet` (`rowid`);

--
-- Contraintes pour la table `llx_categorie_societe`
--
ALTER TABLE `llx_categorie_societe`
  ADD CONSTRAINT `fk_categorie_societe_categorie_rowid` FOREIGN KEY (`fk_categorie`) REFERENCES `llx_categorie` (`rowid`),
  ADD CONSTRAINT `fk_categorie_societe_fk_soc` FOREIGN KEY (`fk_soc`) REFERENCES `llx_societe` (`rowid`);

--
-- Contraintes pour la table `llx_categorie_user`
--
ALTER TABLE `llx_categorie_user`
  ADD CONSTRAINT `fk_categorie_user_categorie_rowid` FOREIGN KEY (`fk_categorie`) REFERENCES `llx_categorie` (`rowid`),
  ADD CONSTRAINT `fk_categorie_user_fk_user` FOREIGN KEY (`fk_user`) REFERENCES `llx_user` (`rowid`);

--
-- Contraintes pour la table `llx_categorie_warehouse`
--
ALTER TABLE `llx_categorie_warehouse`
  ADD CONSTRAINT `fk_categorie_warehouse_categorie_rowid` FOREIGN KEY (`fk_categorie`) REFERENCES `llx_categorie` (`rowid`),
  ADD CONSTRAINT `fk_categorie_warehouse_fk_warehouse_rowid` FOREIGN KEY (`fk_warehouse`) REFERENCES `llx_entrepot` (`rowid`);

--
-- Contraintes pour la table `llx_categorie_website_page`
--
ALTER TABLE `llx_categorie_website_page`
  ADD CONSTRAINT `fk_categorie_websitepage_categorie_rowid` FOREIGN KEY (`fk_categorie`) REFERENCES `llx_categorie` (`rowid`),
  ADD CONSTRAINT `fk_categorie_websitepage_website_page_rowid` FOREIGN KEY (`fk_website_page`) REFERENCES `llx_website_page` (`rowid`);

--
-- Contraintes pour la table `llx_commande`
--
ALTER TABLE `llx_commande`
  ADD CONSTRAINT `fk_commande_fk_projet` FOREIGN KEY (`fk_projet`) REFERENCES `llx_projet` (`rowid`),
  ADD CONSTRAINT `fk_commande_fk_soc` FOREIGN KEY (`fk_soc`) REFERENCES `llx_societe` (`rowid`),
  ADD CONSTRAINT `fk_commande_fk_user_author` FOREIGN KEY (`fk_user_author`) REFERENCES `llx_user` (`rowid`),
  ADD CONSTRAINT `fk_commande_fk_user_cloture` FOREIGN KEY (`fk_user_cloture`) REFERENCES `llx_user` (`rowid`),
  ADD CONSTRAINT `fk_commande_fk_user_valid` FOREIGN KEY (`fk_user_valid`) REFERENCES `llx_user` (`rowid`);

--
-- Contraintes pour la table `llx_commandedet`
--
ALTER TABLE `llx_commandedet`
  ADD CONSTRAINT `fk_commandedet_fk_commande` FOREIGN KEY (`fk_commande`) REFERENCES `llx_commande` (`rowid`),
  ADD CONSTRAINT `fk_commandedet_fk_commandefourndet` FOREIGN KEY (`fk_commandefourndet`) REFERENCES `llx_commande_fournisseurdet` (`rowid`),
  ADD CONSTRAINT `fk_commandedet_fk_unit` FOREIGN KEY (`fk_unit`) REFERENCES `llx_c_units` (`rowid`);

--
-- Contraintes pour la table `llx_commande_fournisseur`
--
ALTER TABLE `llx_commande_fournisseur`
  ADD CONSTRAINT `fk_commande_fournisseur_fk_soc` FOREIGN KEY (`fk_soc`) REFERENCES `llx_societe` (`rowid`);

--
-- Contraintes pour la table `llx_commande_fournisseurdet`
--
ALTER TABLE `llx_commande_fournisseurdet`
  ADD CONSTRAINT `fk_commande_fournisseurdet_fk_unit` FOREIGN KEY (`fk_unit`) REFERENCES `llx_c_units` (`rowid`);

--
-- Contraintes pour la table `llx_commande_fournisseur_dispatch`
--
ALTER TABLE `llx_commande_fournisseur_dispatch`
  ADD CONSTRAINT `fk_commande_fournisseur_dispatch_fk_reception` FOREIGN KEY (`fk_reception`) REFERENCES `llx_reception` (`rowid`);

--
-- Contraintes pour la table `llx_contrat`
--
ALTER TABLE `llx_contrat`
  ADD CONSTRAINT `fk_contrat_fk_soc` FOREIGN KEY (`fk_soc`) REFERENCES `llx_societe` (`rowid`),
  ADD CONSTRAINT `fk_contrat_user_author` FOREIGN KEY (`fk_user_author`) REFERENCES `llx_user` (`rowid`);

--
-- Contraintes pour la table `llx_contratdet`
--
ALTER TABLE `llx_contratdet`
  ADD CONSTRAINT `fk_contratdet_fk_contrat` FOREIGN KEY (`fk_contrat`) REFERENCES `llx_contrat` (`rowid`),
  ADD CONSTRAINT `fk_contratdet_fk_product` FOREIGN KEY (`fk_product`) REFERENCES `llx_product` (`rowid`),
  ADD CONSTRAINT `fk_contratdet_fk_unit` FOREIGN KEY (`fk_unit`) REFERENCES `llx_c_units` (`rowid`);

--
-- Contraintes pour la table `llx_contratdet_log`
--
ALTER TABLE `llx_contratdet_log`
  ADD CONSTRAINT `fk_contratdet_log_fk_contratdet` FOREIGN KEY (`fk_contratdet`) REFERENCES `llx_contratdet` (`rowid`);

--
-- Contraintes pour la table `llx_c_departements`
--
ALTER TABLE `llx_c_departements`
  ADD CONSTRAINT `fk_departements_fk_region` FOREIGN KEY (`fk_region`) REFERENCES `llx_c_regions` (`code_region`);

--
-- Contraintes pour la table `llx_c_ziptown`
--
ALTER TABLE `llx_c_ziptown`
  ADD CONSTRAINT `fk_c_ziptown_fk_county` FOREIGN KEY (`fk_county`) REFERENCES `llx_c_departements` (`rowid`),
  ADD CONSTRAINT `fk_c_ziptown_fk_pays` FOREIGN KEY (`fk_pays`) REFERENCES `llx_c_country` (`rowid`);

--
-- Contraintes pour la table `llx_delivery`
--
ALTER TABLE `llx_delivery`
  ADD CONSTRAINT `fk_delivery_fk_soc` FOREIGN KEY (`fk_soc`) REFERENCES `llx_societe` (`rowid`),
  ADD CONSTRAINT `fk_delivery_fk_user_author` FOREIGN KEY (`fk_user_author`) REFERENCES `llx_user` (`rowid`),
  ADD CONSTRAINT `fk_delivery_fk_user_valid` FOREIGN KEY (`fk_user_valid`) REFERENCES `llx_user` (`rowid`);

--
-- Contraintes pour la table `llx_deliverydet`
--
ALTER TABLE `llx_deliverydet`
  ADD CONSTRAINT `fk_deliverydet_fk_delivery` FOREIGN KEY (`fk_delivery`) REFERENCES `llx_delivery` (`rowid`);

--
-- Contraintes pour la table `llx_ecm_directories`
--
ALTER TABLE `llx_ecm_directories`
  ADD CONSTRAINT `fk_ecm_directories_fk_user_c` FOREIGN KEY (`fk_user_c`) REFERENCES `llx_user` (`rowid`),
  ADD CONSTRAINT `fk_ecm_directories_fk_user_m` FOREIGN KEY (`fk_user_m`) REFERENCES `llx_user` (`rowid`);

--
-- Contraintes pour la table `llx_element_contact`
--
ALTER TABLE `llx_element_contact`
  ADD CONSTRAINT `fk_element_contact_fk_c_type_contact` FOREIGN KEY (`fk_c_type_contact`) REFERENCES `llx_c_type_contact` (`rowid`);

--
-- Contraintes pour la table `llx_emailcollector_emailcollectoraction`
--
ALTER TABLE `llx_emailcollector_emailcollectoraction`
  ADD CONSTRAINT `fk_emailcollectoraction_fk_emailcollector` FOREIGN KEY (`fk_emailcollector`) REFERENCES `llx_emailcollector_emailcollector` (`rowid`);

--
-- Contraintes pour la table `llx_emailcollector_emailcollectorfilter`
--
ALTER TABLE `llx_emailcollector_emailcollectorfilter`
  ADD CONSTRAINT `fk_emailcollectorfilter_fk_emailcollector` FOREIGN KEY (`fk_emailcollector`) REFERENCES `llx_emailcollector_emailcollector` (`rowid`);

--
-- Contraintes pour la table `llx_eventorganization_conferenceorboothattendee`
--
ALTER TABLE `llx_eventorganization_conferenceorboothattendee`
  ADD CONSTRAINT `fx_eventorganization_conferenceorboothattendee_fk_actioncomm` FOREIGN KEY (`fk_actioncomm`) REFERENCES `llx_actioncomm` (`id`),
  ADD CONSTRAINT `fx_eventorganization_conferenceorboothattendee_fk_project` FOREIGN KEY (`fk_project`) REFERENCES `llx_projet` (`rowid`),
  ADD CONSTRAINT `fx_eventorganization_conferenceorboothattendee_fk_soc` FOREIGN KEY (`fk_soc`) REFERENCES `llx_societe` (`rowid`);

--
-- Contraintes pour la table `llx_expedition`
--
ALTER TABLE `llx_expedition`
  ADD CONSTRAINT `fk_expedition_fk_shipping_method` FOREIGN KEY (`fk_shipping_method`) REFERENCES `llx_c_shipment_mode` (`rowid`),
  ADD CONSTRAINT `fk_expedition_fk_soc` FOREIGN KEY (`fk_soc`) REFERENCES `llx_societe` (`rowid`),
  ADD CONSTRAINT `fk_expedition_fk_user_author` FOREIGN KEY (`fk_user_author`) REFERENCES `llx_user` (`rowid`),
  ADD CONSTRAINT `fk_expedition_fk_user_valid` FOREIGN KEY (`fk_user_valid`) REFERENCES `llx_user` (`rowid`);

--
-- Contraintes pour la table `llx_expeditiondet`
--
ALTER TABLE `llx_expeditiondet`
  ADD CONSTRAINT `fk_expeditiondet_fk_expedition` FOREIGN KEY (`fk_expedition`) REFERENCES `llx_expedition` (`rowid`);

--
-- Contraintes pour la table `llx_expeditiondet_batch`
--
ALTER TABLE `llx_expeditiondet_batch`
  ADD CONSTRAINT `fk_expeditiondet_batch_fk_expeditiondet` FOREIGN KEY (`fk_expeditiondet`) REFERENCES `llx_expeditiondet` (`rowid`);

--
-- Contraintes pour la table `llx_facture`
--
ALTER TABLE `llx_facture`
  ADD CONSTRAINT `fk_facture_fk_facture_source` FOREIGN KEY (`fk_facture_source`) REFERENCES `llx_facture` (`rowid`),
  ADD CONSTRAINT `fk_facture_fk_projet` FOREIGN KEY (`fk_projet`) REFERENCES `llx_projet` (`rowid`),
  ADD CONSTRAINT `fk_facture_fk_soc` FOREIGN KEY (`fk_soc`) REFERENCES `llx_societe` (`rowid`),
  ADD CONSTRAINT `fk_facture_fk_user_author` FOREIGN KEY (`fk_user_author`) REFERENCES `llx_user` (`rowid`),
  ADD CONSTRAINT `fk_facture_fk_user_valid` FOREIGN KEY (`fk_user_valid`) REFERENCES `llx_user` (`rowid`);

--
-- Contraintes pour la table `llx_facturedet`
--
ALTER TABLE `llx_facturedet`
  ADD CONSTRAINT `fk_facturedet_fk_facture` FOREIGN KEY (`fk_facture`) REFERENCES `llx_facture` (`rowid`),
  ADD CONSTRAINT `fk_facturedet_fk_unit` FOREIGN KEY (`fk_unit`) REFERENCES `llx_c_units` (`rowid`);

--
-- Contraintes pour la table `llx_facturedet_rec`
--
ALTER TABLE `llx_facturedet_rec`
  ADD CONSTRAINT `fk_facturedet_rec_fk_unit` FOREIGN KEY (`fk_unit`) REFERENCES `llx_c_units` (`rowid`);

--
-- Contraintes pour la table `llx_facture_fourn`
--
ALTER TABLE `llx_facture_fourn`
  ADD CONSTRAINT `fk_facture_fourn_fk_projet` FOREIGN KEY (`fk_projet`) REFERENCES `llx_projet` (`rowid`),
  ADD CONSTRAINT `fk_facture_fourn_fk_soc` FOREIGN KEY (`fk_soc`) REFERENCES `llx_societe` (`rowid`),
  ADD CONSTRAINT `fk_facture_fourn_fk_user_author` FOREIGN KEY (`fk_user_author`) REFERENCES `llx_user` (`rowid`),
  ADD CONSTRAINT `fk_facture_fourn_fk_user_valid` FOREIGN KEY (`fk_user_valid`) REFERENCES `llx_user` (`rowid`);

--
-- Contraintes pour la table `llx_facture_fourn_det`
--
ALTER TABLE `llx_facture_fourn_det`
  ADD CONSTRAINT `fk_facture_fourn_det_fk_facture` FOREIGN KEY (`fk_facture_fourn`) REFERENCES `llx_facture_fourn` (`rowid`),
  ADD CONSTRAINT `fk_facture_fourn_det_fk_unit` FOREIGN KEY (`fk_unit`) REFERENCES `llx_c_units` (`rowid`);

--
-- Contraintes pour la table `llx_facture_rec`
--
ALTER TABLE `llx_facture_rec`
  ADD CONSTRAINT `fk_facture_rec_fk_projet` FOREIGN KEY (`fk_projet`) REFERENCES `llx_projet` (`rowid`),
  ADD CONSTRAINT `fk_facture_rec_fk_soc` FOREIGN KEY (`fk_soc`) REFERENCES `llx_societe` (`rowid`),
  ADD CONSTRAINT `fk_facture_rec_fk_user_author` FOREIGN KEY (`fk_user_author`) REFERENCES `llx_user` (`rowid`);

--
-- Contraintes pour la table `llx_fichinter`
--
ALTER TABLE `llx_fichinter`
  ADD CONSTRAINT `fk_fichinter_fk_soc` FOREIGN KEY (`fk_soc`) REFERENCES `llx_societe` (`rowid`);

--
-- Contraintes pour la table `llx_fichinterdet`
--
ALTER TABLE `llx_fichinterdet`
  ADD CONSTRAINT `fk_fichinterdet_fk_fichinter` FOREIGN KEY (`fk_fichinter`) REFERENCES `llx_fichinter` (`rowid`);

--
-- Contraintes pour la table `llx_fichinter_rec`
--
ALTER TABLE `llx_fichinter_rec`
  ADD CONSTRAINT `fk_fichinter_rec_fk_projet` FOREIGN KEY (`fk_projet`) REFERENCES `llx_projet` (`rowid`),
  ADD CONSTRAINT `fk_fichinter_rec_fk_user_author` FOREIGN KEY (`fk_user_author`) REFERENCES `llx_user` (`rowid`);

--
-- Contraintes pour la table `llx_knowledgemanagement_knowledgerecord`
--
ALTER TABLE `llx_knowledgemanagement_knowledgerecord`
  ADD CONSTRAINT `llx_knowledgemanagement_knowledgerecord_fk_user_creat` FOREIGN KEY (`fk_user_creat`) REFERENCES `llx_user` (`rowid`);

--
-- Contraintes pour la table `llx_mrp_mo`
--
ALTER TABLE `llx_mrp_mo`
  ADD CONSTRAINT `fk_mrp_mo_fk_user_creat` FOREIGN KEY (`fk_user_creat`) REFERENCES `llx_user` (`rowid`);

--
-- Contraintes pour la table `llx_mrp_production`
--
ALTER TABLE `llx_mrp_production`
  ADD CONSTRAINT `fk_mrp_production_mo` FOREIGN KEY (`fk_mo`) REFERENCES `llx_mrp_mo` (`rowid`),
  ADD CONSTRAINT `fk_mrp_production_product` FOREIGN KEY (`fk_product`) REFERENCES `llx_product` (`rowid`),
  ADD CONSTRAINT `fk_mrp_production_stock_movement` FOREIGN KEY (`fk_stock_movement`) REFERENCES `llx_stock_mouvement` (`rowid`);

--
-- Contraintes pour la table `llx_paiement_facture`
--
ALTER TABLE `llx_paiement_facture`
  ADD CONSTRAINT `fk_paiement_facture_fk_facture` FOREIGN KEY (`fk_facture`) REFERENCES `llx_facture` (`rowid`),
  ADD CONSTRAINT `fk_paiement_facture_fk_paiement` FOREIGN KEY (`fk_paiement`) REFERENCES `llx_paiement` (`rowid`);

--
-- Contraintes pour la table `llx_payment_salary`
--
ALTER TABLE `llx_payment_salary`
  ADD CONSTRAINT `fk_payment_salary_user` FOREIGN KEY (`fk_user`) REFERENCES `llx_user` (`rowid`);

--
-- Contraintes pour la table `llx_prelevement_facture`
--
ALTER TABLE `llx_prelevement_facture`
  ADD CONSTRAINT `fk_prelevement_facture_fk_prelevement_lignes` FOREIGN KEY (`fk_prelevement_lignes`) REFERENCES `llx_prelevement_lignes` (`rowid`);

--
-- Contraintes pour la table `llx_prelevement_lignes`
--
ALTER TABLE `llx_prelevement_lignes`
  ADD CONSTRAINT `fk_prelevement_lignes_fk_prelevement_bons` FOREIGN KEY (`fk_prelevement_bons`) REFERENCES `llx_prelevement_bons` (`rowid`);

--
-- Contraintes pour la table `llx_product`
--
ALTER TABLE `llx_product`
  ADD CONSTRAINT `fk_product_barcode_type` FOREIGN KEY (`fk_barcode_type`) REFERENCES `llx_c_barcode_type` (`rowid`),
  ADD CONSTRAINT `fk_product_default_warehouse` FOREIGN KEY (`fk_default_warehouse`) REFERENCES `llx_entrepot` (`rowid`),
  ADD CONSTRAINT `fk_product_finished` FOREIGN KEY (`finished`) REFERENCES `llx_c_product_nature` (`code`),
  ADD CONSTRAINT `fk_product_fk_country` FOREIGN KEY (`fk_country`) REFERENCES `llx_c_country` (`rowid`),
  ADD CONSTRAINT `fk_product_fk_unit` FOREIGN KEY (`fk_unit`) REFERENCES `llx_c_units` (`rowid`);

--
-- Contraintes pour la table `llx_product_batch`
--
ALTER TABLE `llx_product_batch`
  ADD CONSTRAINT `fk_product_batch_fk_product_stock` FOREIGN KEY (`fk_product_stock`) REFERENCES `llx_product_stock` (`rowid`);

--
-- Contraintes pour la table `llx_product_customer_price`
--
ALTER TABLE `llx_product_customer_price`
  ADD CONSTRAINT `fk_product_customer_price_fk_product` FOREIGN KEY (`fk_product`) REFERENCES `llx_product` (`rowid`),
  ADD CONSTRAINT `fk_product_customer_price_fk_soc` FOREIGN KEY (`fk_soc`) REFERENCES `llx_societe` (`rowid`),
  ADD CONSTRAINT `fk_product_customer_price_fk_user` FOREIGN KEY (`fk_user`) REFERENCES `llx_user` (`rowid`);

--
-- Contraintes pour la table `llx_product_fournisseur_price`
--
ALTER TABLE `llx_product_fournisseur_price`
  ADD CONSTRAINT `fk_product_fournisseur_price_barcode_type` FOREIGN KEY (`fk_barcode_type`) REFERENCES `llx_c_barcode_type` (`rowid`),
  ADD CONSTRAINT `fk_product_fournisseur_price_fk_product` FOREIGN KEY (`fk_product`) REFERENCES `llx_product` (`rowid`),
  ADD CONSTRAINT `fk_product_fournisseur_price_fk_user` FOREIGN KEY (`fk_user`) REFERENCES `llx_user` (`rowid`);

--
-- Contraintes pour la table `llx_product_lang`
--
ALTER TABLE `llx_product_lang`
  ADD CONSTRAINT `fk_product_lang_fk_product` FOREIGN KEY (`fk_product`) REFERENCES `llx_product` (`rowid`);

--
-- Contraintes pour la table `llx_product_price`
--
ALTER TABLE `llx_product_price`
  ADD CONSTRAINT `fk_product_price_product` FOREIGN KEY (`fk_user_author`) REFERENCES `llx_user` (`rowid`),
  ADD CONSTRAINT `fk_product_price_user_author` FOREIGN KEY (`fk_product`) REFERENCES `llx_product` (`rowid`);

--
-- Contraintes pour la table `llx_product_price_by_qty`
--
ALTER TABLE `llx_product_price_by_qty`
  ADD CONSTRAINT `fk_product_price_by_qty_fk_product_price` FOREIGN KEY (`fk_product_price`) REFERENCES `llx_product_price` (`rowid`);

--
-- Contraintes pour la table `llx_projet`
--
ALTER TABLE `llx_projet`
  ADD CONSTRAINT `fk_projet_fk_soc` FOREIGN KEY (`fk_soc`) REFERENCES `llx_societe` (`rowid`);

--
-- Contraintes pour la table `llx_projet_task`
--
ALTER TABLE `llx_projet_task`
  ADD CONSTRAINT `fk_projet_task_fk_projet` FOREIGN KEY (`fk_projet`) REFERENCES `llx_projet` (`rowid`),
  ADD CONSTRAINT `fk_projet_task_fk_user_creat` FOREIGN KEY (`fk_user_creat`) REFERENCES `llx_user` (`rowid`),
  ADD CONSTRAINT `fk_projet_task_fk_user_valid` FOREIGN KEY (`fk_user_valid`) REFERENCES `llx_user` (`rowid`);

--
-- Contraintes pour la table `llx_propal`
--
ALTER TABLE `llx_propal`
  ADD CONSTRAINT `fk_propal_fk_projet` FOREIGN KEY (`fk_projet`) REFERENCES `llx_projet` (`rowid`),
  ADD CONSTRAINT `fk_propal_fk_soc` FOREIGN KEY (`fk_soc`) REFERENCES `llx_societe` (`rowid`),
  ADD CONSTRAINT `fk_propal_fk_user_author` FOREIGN KEY (`fk_user_author`) REFERENCES `llx_user` (`rowid`),
  ADD CONSTRAINT `fk_propal_fk_user_cloture` FOREIGN KEY (`fk_user_cloture`) REFERENCES `llx_user` (`rowid`),
  ADD CONSTRAINT `fk_propal_fk_user_signature` FOREIGN KEY (`fk_user_signature`) REFERENCES `llx_user` (`rowid`),
  ADD CONSTRAINT `fk_propal_fk_user_valid` FOREIGN KEY (`fk_user_valid`) REFERENCES `llx_user` (`rowid`);

--
-- Contraintes pour la table `llx_propaldet`
--
ALTER TABLE `llx_propaldet`
  ADD CONSTRAINT `fk_propaldet_fk_propal` FOREIGN KEY (`fk_propal`) REFERENCES `llx_propal` (`rowid`),
  ADD CONSTRAINT `fk_propaldet_fk_unit` FOREIGN KEY (`fk_unit`) REFERENCES `llx_c_units` (`rowid`);

--
-- Contraintes pour la table `llx_reception`
--
ALTER TABLE `llx_reception`
  ADD CONSTRAINT `fk_reception_fk_shipping_method` FOREIGN KEY (`fk_shipping_method`) REFERENCES `llx_c_shipment_mode` (`rowid`),
  ADD CONSTRAINT `fk_reception_fk_soc` FOREIGN KEY (`fk_soc`) REFERENCES `llx_societe` (`rowid`),
  ADD CONSTRAINT `fk_reception_fk_user_author` FOREIGN KEY (`fk_user_author`) REFERENCES `llx_user` (`rowid`),
  ADD CONSTRAINT `fk_reception_fk_user_valid` FOREIGN KEY (`fk_user_valid`) REFERENCES `llx_user` (`rowid`);

--
-- Contraintes pour la table `llx_recruitment_recruitmentcandidature`
--
ALTER TABLE `llx_recruitment_recruitmentcandidature`
  ADD CONSTRAINT `llx_recruitment_recruitmentcandidature_fk_user_creat` FOREIGN KEY (`fk_user_creat`) REFERENCES `llx_user` (`rowid`);

--
-- Contraintes pour la table `llx_recruitment_recruitmentjobposition`
--
ALTER TABLE `llx_recruitment_recruitmentjobposition`
  ADD CONSTRAINT `llx_recruitment_recruitmentjobposition_fk_establishment` FOREIGN KEY (`fk_establishment`) REFERENCES `llx_establishment` (`rowid`),
  ADD CONSTRAINT `llx_recruitment_recruitmentjobposition_fk_user_creat` FOREIGN KEY (`fk_user_creat`) REFERENCES `llx_user` (`rowid`),
  ADD CONSTRAINT `llx_recruitment_recruitmentjobposition_fk_user_recruiter` FOREIGN KEY (`fk_user_recruiter`) REFERENCES `llx_user` (`rowid`),
  ADD CONSTRAINT `llx_recruitment_recruitmentjobposition_fk_user_supervisor` FOREIGN KEY (`fk_user_supervisor`) REFERENCES `llx_user` (`rowid`);

--
-- Contraintes pour la table `llx_resource`
--
ALTER TABLE `llx_resource`
  ADD CONSTRAINT `fk_resource_fk_country` FOREIGN KEY (`fk_country`) REFERENCES `llx_c_country` (`rowid`);

--
-- Contraintes pour la table `llx_societe_account`
--
ALTER TABLE `llx_societe_account`
  ADD CONSTRAINT `llx_societe_account_fk_societe` FOREIGN KEY (`fk_soc`) REFERENCES `llx_societe` (`rowid`),
  ADD CONSTRAINT `llx_societe_account_fk_website` FOREIGN KEY (`fk_website`) REFERENCES `llx_website` (`rowid`);

--
-- Contraintes pour la table `llx_societe_contacts`
--
ALTER TABLE `llx_societe_contacts`
  ADD CONSTRAINT `fk_societe_contacts_fk_c_type_contact` FOREIGN KEY (`fk_c_type_contact`) REFERENCES `llx_c_type_contact` (`rowid`),
  ADD CONSTRAINT `fk_societe_contacts_fk_soc` FOREIGN KEY (`fk_soc`) REFERENCES `llx_societe` (`rowid`),
  ADD CONSTRAINT `fk_societe_contacts_fk_socpeople` FOREIGN KEY (`fk_socpeople`) REFERENCES `llx_socpeople` (`rowid`);

--
-- Contraintes pour la table `llx_societe_remise_except`
--
ALTER TABLE `llx_societe_remise_except`
  ADD CONSTRAINT `fk_soc_remise_fk_facture_line` FOREIGN KEY (`fk_facture_line`) REFERENCES `llx_facturedet` (`rowid`),
  ADD CONSTRAINT `fk_soc_remise_fk_invoice_supplier_line` FOREIGN KEY (`fk_invoice_supplier_line`) REFERENCES `llx_facture_fourn_det` (`rowid`),
  ADD CONSTRAINT `fk_soc_remise_fk_soc` FOREIGN KEY (`fk_soc`) REFERENCES `llx_societe` (`rowid`),
  ADD CONSTRAINT `fk_societe_remise_fk_facture` FOREIGN KEY (`fk_facture`) REFERENCES `llx_facture` (`rowid`),
  ADD CONSTRAINT `fk_societe_remise_fk_facture_source` FOREIGN KEY (`fk_facture_source`) REFERENCES `llx_facture` (`rowid`),
  ADD CONSTRAINT `fk_societe_remise_fk_invoice_supplier` FOREIGN KEY (`fk_invoice_supplier`) REFERENCES `llx_facture_fourn` (`rowid`),
  ADD CONSTRAINT `fk_societe_remise_fk_invoice_supplier_source` FOREIGN KEY (`fk_invoice_supplier`) REFERENCES `llx_facture_fourn` (`rowid`),
  ADD CONSTRAINT `fk_societe_remise_fk_user` FOREIGN KEY (`fk_user`) REFERENCES `llx_user` (`rowid`);

--
-- Contraintes pour la table `llx_societe_rib`
--
ALTER TABLE `llx_societe_rib`
  ADD CONSTRAINT `llx_societe_rib_fk_societe` FOREIGN KEY (`fk_soc`) REFERENCES `llx_societe` (`rowid`);

--
-- Contraintes pour la table `llx_socpeople`
--
ALTER TABLE `llx_socpeople`
  ADD CONSTRAINT `fk_socpeople_fk_soc` FOREIGN KEY (`fk_soc`) REFERENCES `llx_societe` (`rowid`),
  ADD CONSTRAINT `fk_socpeople_user_creat_user_rowid` FOREIGN KEY (`fk_user_creat`) REFERENCES `llx_user` (`rowid`);

--
-- Contraintes pour la table `llx_supplier_proposaldet`
--
ALTER TABLE `llx_supplier_proposaldet`
  ADD CONSTRAINT `fk_supplier_proposaldet_fk_supplier_proposal` FOREIGN KEY (`fk_supplier_proposal`) REFERENCES `llx_supplier_proposal` (`rowid`),
  ADD CONSTRAINT `fk_supplier_proposaldet_fk_unit` FOREIGN KEY (`fk_unit`) REFERENCES `llx_c_units` (`rowid`);

--
-- Contraintes pour la table `llx_usergroup_rights`
--
ALTER TABLE `llx_usergroup_rights`
  ADD CONSTRAINT `fk_usergroup_rights_fk_usergroup` FOREIGN KEY (`fk_usergroup`) REFERENCES `llx_usergroup` (`rowid`);

--
-- Contraintes pour la table `llx_usergroup_user`
--
ALTER TABLE `llx_usergroup_user`
  ADD CONSTRAINT `fk_usergroup_user_fk_user` FOREIGN KEY (`fk_user`) REFERENCES `llx_user` (`rowid`),
  ADD CONSTRAINT `fk_usergroup_user_fk_usergroup` FOREIGN KEY (`fk_usergroup`) REFERENCES `llx_usergroup` (`rowid`);

--
-- Contraintes pour la table `llx_user_employment`
--
ALTER TABLE `llx_user_employment`
  ADD CONSTRAINT `fk_user_employment_fk_user` FOREIGN KEY (`fk_user`) REFERENCES `llx_user` (`rowid`);

--
-- Contraintes pour la table `llx_user_rights`
--
ALTER TABLE `llx_user_rights`
  ADD CONSTRAINT `fk_user_rights_fk_user_user` FOREIGN KEY (`fk_user`) REFERENCES `llx_user` (`rowid`);

--
-- Contraintes pour la table `llx_website_page`
--
ALTER TABLE `llx_website_page`
  ADD CONSTRAINT `fk_website_page_website` FOREIGN KEY (`fk_website`) REFERENCES `llx_website` (`rowid`);

--
-- Contraintes pour la table `llx_workstation_workstation`
--
ALTER TABLE `llx_workstation_workstation`
  ADD CONSTRAINT `fk_workstation_workstation_fk_user_creat` FOREIGN KEY (`fk_user_creat`) REFERENCES `llx_user` (`rowid`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
