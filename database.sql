-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           11.8.2-MariaDB-ubu2404 - mariadb.org binary distribution
-- OS do Servidor:               debian-linux-gnu
-- HeidiSQL Versão:              12.11.0.7065
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Copiando estrutura do banco de dados para bewitched_db
CREATE DATABASE IF NOT EXISTS `bewitched_db` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */;
USE `bewitched_db`;

-- Copiando estrutura para tabela bewitched_db.accounts
DROP TABLE IF EXISTS `accounts`;
CREATE TABLE IF NOT EXISTS `accounts` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `Whitelist` tinyint(1) NOT NULL DEFAULT 0,
  `Characters` int(10) NOT NULL DEFAULT 1,
  `Gemstone` int(20) NOT NULL DEFAULT 0,
  `Premium` int(20) NOT NULL DEFAULT 0,
  `Discord` varchar(50) NOT NULL DEFAULT '0',
  `License` varchar(50) NOT NULL DEFAULT '0',
  `Login` int(20) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `id` (`id`),
  KEY `Discord` (`Discord`),
  KEY `License` (`License`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela bewitched_db.accounts: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela bewitched_db.banneds
DROP TABLE IF EXISTS `banneds`;
CREATE TABLE IF NOT EXISTS `banneds` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `License` varchar(50) NOT NULL,
  `Token` varchar(255) NOT NULL,
  `Time` int(20) NOT NULL DEFAULT 0,
  `Reason` longtext DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- Copiando dados para a tabela bewitched_db.banneds: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela bewitched_db.characters
DROP TABLE IF EXISTS `characters`;
CREATE TABLE IF NOT EXISTS `characters` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `License` varchar(50) DEFAULT NULL,
  `Phone` varchar(10) DEFAULT NULL,
  `Name` varchar(50) DEFAULT 'Hensa',
  `Lastname` varchar(50) DEFAULT 'Bewitched',
  `Sex` varchar(1) DEFAULT NULL,
  `Skin` varchar(50) NOT NULL DEFAULT 'mp_m_freemode_01',
  `Killed` int(9) NOT NULL DEFAULT 0,
  `Death` int(9) NOT NULL DEFAULT 0,
  `Playing` int(9) NOT NULL DEFAULT 0,
  `Password` int(20) NOT NULL DEFAULT 0,
  `Bank` int(20) NOT NULL DEFAULT 5000,
  `Blood` int(1) NOT NULL DEFAULT 1,
  `Prison` int(10) NOT NULL DEFAULT 0,
  `Wanted` int(1) NOT NULL DEFAULT 0,
  `Avatar` varchar(254) NOT NULL DEFAULT 'https://hensa.site/Hensa.png',
  `Likes` int(20) NOT NULL DEFAULT 0,
  `Unlikes` int(20) NOT NULL DEFAULT 0,
  `Badge` int(3) NOT NULL DEFAULT 0,
  `Created` int(20) NOT NULL DEFAULT 0,
  `Login` int(20) NOT NULL DEFAULT 0,
  `Deleted` int(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `license` (`License`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela bewitched_db.characters: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela bewitched_db.chests
DROP TABLE IF EXISTS `chests`;
CREATE TABLE IF NOT EXISTS `chests` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) NOT NULL,
  `Weight` int(10) NOT NULL DEFAULT 500,
  `Slots` int(20) NOT NULL DEFAULT 50,
  `Permission` varchar(50) NOT NULL DEFAULT 'Admin',
  `Premium` int(20) NOT NULL DEFAULT 0,
  `Bank` int(20) NOT NULL DEFAULT 0,
  `Logs` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela bewitched_db.chests: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela bewitched_db.entitydata
DROP TABLE IF EXISTS `entitydata`;
CREATE TABLE IF NOT EXISTS `entitydata` (
  `Name` varchar(100) NOT NULL,
  `Information` longtext DEFAULT NULL,
  PRIMARY KEY (`Name`),
  KEY `Information` (`Name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela bewitched_db.entitydata: ~1 rows (aproximadamente)
INSERT INTO `entitydata` (`Name`, `Information`) VALUES
	('Permissions:Admin', '{"1":1}');

-- Copiando estrutura para tabela bewitched_db.fines
DROP TABLE IF EXISTS `fines`;
CREATE TABLE IF NOT EXISTS `fines` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `Passport` int(10) NOT NULL DEFAULT 0,
  `Name` varchar(50) NOT NULL,
  `Date` varchar(50) NOT NULL,
  `Hour` varchar(50) NOT NULL,
  `Price` int(20) NOT NULL,
  `Message` longtext DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Passport` (`Passport`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela bewitched_db.fines: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela bewitched_db.investments
DROP TABLE IF EXISTS `investments`;
CREATE TABLE IF NOT EXISTS `investments` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `Passport` int(10) NOT NULL DEFAULT 0,
  `Liquid` int(20) NOT NULL DEFAULT 0,
  `Monthly` int(20) NOT NULL DEFAULT 0,
  `Deposit` int(20) NOT NULL DEFAULT 0,
  `Last` int(20) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `Passport` (`Passport`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela bewitched_db.investments: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela bewitched_db.invoices
DROP TABLE IF EXISTS `invoices`;
CREATE TABLE IF NOT EXISTS `invoices` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `Passport` int(10) NOT NULL DEFAULT 0,
  `Received` int(10) NOT NULL DEFAULT 0,
  `Type` varchar(50) NOT NULL,
  `Reason` longtext NOT NULL,
  `Holder` varchar(50) NOT NULL,
  `Price` int(20) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `Passport` (`Passport`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela bewitched_db.invoices: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela bewitched_db.permissions
DROP TABLE IF EXISTS `permissions`;
CREATE TABLE IF NOT EXISTS `permissions` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `Permission` varchar(50) NOT NULL DEFAULT '',
  `Members` int(20) NOT NULL DEFAULT 0,
  `Bank` int(20) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela bewitched_db.permissions: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela bewitched_db.playerdata
DROP TABLE IF EXISTS `playerdata`;
CREATE TABLE IF NOT EXISTS `playerdata` (
  `Passport` int(10) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Information` longtext DEFAULT NULL,
  PRIMARY KEY (`Passport`,`Name`),
  KEY `Passport` (`Passport`),
  KEY `Information` (`Name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela bewitched_db.playerdata: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela bewitched_db.police_courses
DROP TABLE IF EXISTS `police_courses`;
CREATE TABLE IF NOT EXISTS `police_courses` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `Passport` int(20) DEFAULT 0,
  `Police` int(20) DEFAULT 0,
  `Type` varchar(255) DEFAULT 'Segurança',
  `Date` varchar(255) DEFAULT '00/00/0000',
  PRIMARY KEY (`id`),
  KEY `Passport` (`Passport`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela bewitched_db.police_courses: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela bewitched_db.police_messages
DROP TABLE IF EXISTS `police_messages`;
CREATE TABLE IF NOT EXISTS `police_messages` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) DEFAULT 'Individuo Indigente',
  `Message` longtext DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela bewitched_db.police_messages: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela bewitched_db.police_prisons
DROP TABLE IF EXISTS `police_prisons`;
CREATE TABLE IF NOT EXISTS `police_prisons` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `Passport` int(20) DEFAULT 1,
  `Police` int(20) NOT NULL DEFAULT 0,
  `Crimes` longtext DEFAULT NULL,
  `Notes` longtext DEFAULT NULL,
  `Fines` int(20) DEFAULT 0,
  `Services` int(20) DEFAULT 0,
  `Date` varchar(255) NOT NULL DEFAULT '00/00/0000 ás 00:00',
  PRIMARY KEY (`id`),
  KEY `Passport` (`Passport`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela bewitched_db.police_prisons: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela bewitched_db.police_wanted
DROP TABLE IF EXISTS `police_wanted`;
CREATE TABLE IF NOT EXISTS `police_wanted` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `Passport` int(20) DEFAULT 1,
  `Police` int(20) NOT NULL DEFAULT 0,
  `Crime` longtext DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Passport` (`Passport`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela bewitched_db.police_wanted: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela bewitched_db.propertys
DROP TABLE IF EXISTS `propertys`;
CREATE TABLE IF NOT EXISTS `propertys` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `Name` varchar(20) NOT NULL DEFAULT 'Homes0001',
  `Interior` varchar(20) NOT NULL DEFAULT 'Middle',
  `Item` int(3) NOT NULL DEFAULT 3,
  `Tax` int(20) NOT NULL DEFAULT 0,
  `Passport` int(11) NOT NULL DEFAULT 0,
  `Serial` varchar(10) NOT NULL,
  `Vault` int(6) NOT NULL DEFAULT 1,
  `Fridge` int(6) NOT NULL DEFAULT 1,
  `Garage` longtext DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`),
  KEY `Passport` (`Passport`),
  KEY `Name` (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela bewitched_db.propertys: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela bewitched_db.races
DROP TABLE IF EXISTS `races`;
CREATE TABLE IF NOT EXISTS `races` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Race` int(3) NOT NULL DEFAULT 0,
  `Passport` int(5) NOT NULL DEFAULT 0,
  `Name` varchar(100) NOT NULL DEFAULT 'Hensa.site',
  `Vehicle` varchar(50) NOT NULL DEFAULT 'Neon',
  `Points` int(20) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `Passport` (`Passport`),
  KEY `Race` (`Race`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- Copiando dados para a tabela bewitched_db.races: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela bewitched_db.taxs
DROP TABLE IF EXISTS `taxs`;
CREATE TABLE IF NOT EXISTS `taxs` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `Passport` int(10) NOT NULL DEFAULT 0,
  `Name` varchar(50) NOT NULL,
  `Date` varchar(50) NOT NULL,
  `Hour` varchar(50) NOT NULL,
  `Price` int(20) NOT NULL,
  `Message` longtext DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Passport` (`Passport`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela bewitched_db.taxs: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela bewitched_db.transactions
DROP TABLE IF EXISTS `transactions`;
CREATE TABLE IF NOT EXISTS `transactions` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `Passport` int(10) NOT NULL DEFAULT 0,
  `Type` varchar(50) NOT NULL,
  `Date` varchar(50) NOT NULL,
  `Price` int(20) NOT NULL,
  `Balance` int(20) NOT NULL,
  `Timeset` int(20) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `Passport` (`Passport`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela bewitched_db.transactions: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela bewitched_db.vehicles
DROP TABLE IF EXISTS `vehicles`;
CREATE TABLE IF NOT EXISTS `vehicles` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `Passport` int(10) NOT NULL DEFAULT 0,
  `Vehicle` varchar(100) DEFAULT NULL,
  `Tax` int(20) NOT NULL DEFAULT 0,
  `Plate` varchar(10) DEFAULT NULL,
  `Weight` int(9) NOT NULL DEFAULT 0,
  `Rental` int(20) NOT NULL DEFAULT 0,
  `Arrest` int(20) NOT NULL DEFAULT 0,
  `Block` tinyint(1) NOT NULL DEFAULT 0,
  `Dismantle` int(20) NOT NULL DEFAULT 0,
  `Engine` int(4) NOT NULL DEFAULT 1000,
  `Body` int(4) NOT NULL DEFAULT 1000,
  `Health` int(4) NOT NULL DEFAULT 1000,
  `Fuel` int(3) NOT NULL DEFAULT 100,
  `Nitro` int(5) NOT NULL DEFAULT 0,
  `Work` varchar(5) NOT NULL DEFAULT 'false',
  `Mode` varchar(9) NOT NULL DEFAULT 'normal',
  `Doors` longtext NOT NULL,
  `Windows` longtext NOT NULL,
  `Tyres` longtext NOT NULL,
  `Brakes` longtext NOT NULL,
  `Seatbelt` tinyint(1) NOT NULL DEFAULT 0,
  `Drift` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `Passport` (`Passport`),
  KEY `Vehicle` (`Vehicle`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela bewitched_db.vehicles: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela bewitched_db.warehouse
DROP TABLE IF EXISTS `warehouse`;
CREATE TABLE IF NOT EXISTS `warehouse` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) NOT NULL,
  `Weight` int(20) NOT NULL DEFAULT 50,
  `Password` varchar(50) NOT NULL,
  `Passport` int(10) NOT NULL DEFAULT 0,
  `Tax` int(20) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `Passport` (`Passport`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela bewitched_db.warehouse: ~0 rows (aproximadamente)

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
