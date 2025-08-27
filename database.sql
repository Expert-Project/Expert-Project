-- --------------------------------------------------------
-- Banco de Dados: expertproject (compatível MariaDB 11.x)
-- --------------------------------------------------------

CREATE DATABASE IF NOT EXISTS `expertproject` 
  DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

USE `expertproject`;

-- accounts
DROP TABLE IF EXISTS `accounts`;
CREATE TABLE `accounts` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `Whitelist` TINYINT(1) NOT NULL DEFAULT 0,
  `Characters` INT NOT NULL DEFAULT 1,
  `Gemstone` BIGINT NOT NULL DEFAULT 0,
  `Premium` BIGINT NOT NULL DEFAULT 0,
  `Discord` VARCHAR(50) NOT NULL DEFAULT '0',
  `License` VARCHAR(50) NOT NULL DEFAULT '0',
  `Login` BIGINT NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `Discord` (`Discord`),
  KEY `License` (`License`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- banneds
DROP TABLE IF EXISTS `banneds`;
CREATE TABLE `banneds` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `License` VARCHAR(50) NOT NULL,
  `Token` VARCHAR(255) NOT NULL,
  `Time` BIGINT NOT NULL DEFAULT 0,
  `Reason` LONGTEXT DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- characters
DROP TABLE IF EXISTS `characters`;
CREATE TABLE `characters` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `License` VARCHAR(50) DEFAULT NULL,
  `Phone` VARCHAR(10) DEFAULT NULL,
  `Name` VARCHAR(50) DEFAULT 'Hensa',
  `Lastname` VARCHAR(50) DEFAULT 'Bewitched',
  `Sex` VARCHAR(1) DEFAULT NULL,
  `Skin` VARCHAR(50) NOT NULL DEFAULT 'mp_m_freemode_01',
  `Killed` INT NOT NULL DEFAULT 0,
  `Death` INT NOT NULL DEFAULT 0,
  `Playing` INT NOT NULL DEFAULT 0,
  `Password` BIGINT NOT NULL DEFAULT 0,
  `Bank` BIGINT NOT NULL DEFAULT 5000,
  `Blood` TINYINT(1) NOT NULL DEFAULT 1,
  `Prison` INT NOT NULL DEFAULT 0,
  `Wanted` TINYINT(1) NOT NULL DEFAULT 0,
  `Avatar` VARCHAR(254) NOT NULL DEFAULT 'https://hensa.site/Hensa.png',
  `Likes` BIGINT NOT NULL DEFAULT 0,
  `Unlikes` BIGINT NOT NULL DEFAULT 0,
  `Badge` INT NOT NULL DEFAULT 0,
  `Created` BIGINT NOT NULL DEFAULT 0,
  `Login` BIGINT NOT NULL DEFAULT 0,
  `Deleted` TINYINT(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `license` (`License`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- chests
DROP TABLE IF EXISTS `chests`;
CREATE TABLE `chests` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(50) NOT NULL,
  `Weight` INT NOT NULL DEFAULT 500,
  `Slots` BIGINT NOT NULL DEFAULT 50,
  `Permission` VARCHAR(50) NOT NULL DEFAULT 'Admin',
  `Premium` BIGINT NOT NULL DEFAULT 0,
  `Bank` BIGINT NOT NULL DEFAULT 0,
  `Logs` TINYINT(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- entitydata
DROP TABLE IF EXISTS `entitydata`;
CREATE TABLE `entitydata` (
  `Name` VARCHAR(100) NOT NULL,
  `Information` LONGTEXT DEFAULT NULL,
  PRIMARY KEY (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `entitydata` (`Name`, `Information`) VALUES
('Permissions:Admin', '{"1":1}');

-- fines
DROP TABLE IF EXISTS `fines`;
CREATE TABLE `fines` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `Passport` INT NOT NULL DEFAULT 0,
  `Name` VARCHAR(50) NOT NULL,
  `Date` VARCHAR(50) NOT NULL,
  `Hour` VARCHAR(50) NOT NULL,
  `Price` BIGINT NOT NULL,
  `Message` LONGTEXT DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Passport` (`Passport`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- investments
DROP TABLE IF EXISTS `investments`;
CREATE TABLE `investments` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `Passport` INT NOT NULL DEFAULT 0,
  `Liquid` BIGINT NOT NULL DEFAULT 0,
  `Monthly` BIGINT NOT NULL DEFAULT 0,
  `Deposit` BIGINT NOT NULL DEFAULT 0,
  `Last` BIGINT NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `Passport` (`Passport`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- invoices
DROP TABLE IF EXISTS `invoices`;
CREATE TABLE `invoices` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `Passport` INT NOT NULL DEFAULT 0,
  `Received` INT NOT NULL DEFAULT 0,
  `Type` VARCHAR(50) NOT NULL,
  `Reason` LONGTEXT NOT NULL,
  `Holder` VARCHAR(50) NOT NULL,
  `Price` BIGINT NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `Passport` (`Passport`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- permissions
DROP TABLE IF EXISTS `permissions`;
CREATE TABLE `permissions` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `Permission` VARCHAR(50) NOT NULL DEFAULT '',
  `Members` BIGINT NOT NULL DEFAULT 0,
  `Bank` BIGINT NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- playerdata
DROP TABLE IF EXISTS `playerdata`;
CREATE TABLE `playerdata` (
  `Passport` INT NOT NULL,
  `Name` VARCHAR(100) NOT NULL,
  `Information` LONGTEXT DEFAULT NULL,
  PRIMARY KEY (`Passport`,`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- police_courses
DROP TABLE IF EXISTS `police_courses`;
CREATE TABLE `police_courses` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `Passport` BIGINT DEFAULT 0,
  `Police` BIGINT DEFAULT 0,
  `Type` VARCHAR(255) DEFAULT 'Segurança',
  `Date` VARCHAR(255) DEFAULT '00/00/0000',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- police_messages
DROP TABLE IF EXISTS `police_messages`;
CREATE TABLE `police_messages` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(100) DEFAULT 'Individuo Indigente',
  `Message` LONGTEXT DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- police_prisons
DROP TABLE IF EXISTS `police_prisons`;
CREATE TABLE `police_prisons` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `Passport` BIGINT DEFAULT 1,
  `Police` BIGINT NOT NULL DEFAULT 0,
  `Crimes` LONGTEXT DEFAULT NULL,
  `Notes` LONGTEXT DEFAULT NULL,
  `Fines` BIGINT DEFAULT 0,
  `Services` BIGINT DEFAULT 0,
  `Date` VARCHAR(255) NOT NULL DEFAULT '00/00/0000 ás 00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- police_wanted
DROP TABLE IF EXISTS `police_wanted`;
CREATE TABLE `police_wanted` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `Passport` BIGINT DEFAULT 1,
  `Police` BIGINT NOT NULL DEFAULT 0,
  `Crime` LONGTEXT DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- propertys
DROP TABLE IF EXISTS `propertys`;
CREATE TABLE `propertys` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(20) NOT NULL DEFAULT 'Homes0001',
  `Interior` VARCHAR(20) NOT NULL DEFAULT 'Middle',
  `Item` INT NOT NULL DEFAULT 3,
  `Tax` BIGINT NOT NULL DEFAULT 0,
  `Passport` BIGINT NOT NULL DEFAULT 0,
  `Serial` VARCHAR(10) NOT NULL,
  `Vault` INT NOT NULL DEFAULT 1,
  `Fridge` INT NOT NULL DEFAULT 1,
  `Garage` LONGTEXT DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- races
DROP TABLE IF EXISTS `races`;
CREATE TABLE `races` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `Race` INT NOT NULL DEFAULT 0,
  `Passport` INT NOT NULL DEFAULT 0,
  `Name` VARCHAR(100) NOT NULL DEFAULT 'Hensa.site',
  `Vehicle` VARCHAR(50) NOT NULL DEFAULT 'Neon',
  `Points` BIGINT NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- taxs
DROP TABLE IF EXISTS `taxs`;
CREATE TABLE `taxs` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `Passport` INT NOT NULL DEFAULT 0,
  `Name` VARCHAR(50) NOT NULL,
  `Date` VARCHAR(50) NOT NULL,
  `Hour` VARCHAR(50) NOT NULL,
  `Price` BIGINT NOT NULL,
  `Message` LONGTEXT DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- transactions
DROP TABLE IF EXISTS `transactions`;
CREATE TABLE `transactions` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `Passport` INT NOT NULL DEFAULT 0,
  `Type` VARCHAR(50) NOT NULL,
  `Date` VARCHAR(50) NOT NULL,
  `Price` BIGINT NOT NULL,
  `Balance` BIGINT NOT NULL,
  `Timeset` BIGINT NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- vehicles
DROP TABLE IF EXISTS `vehicles`;
CREATE TABLE `vehicles` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `Passport` INT NOT NULL DEFAULT 0,
  `Vehicle` VARCHAR(100) DEFAULT NULL,
  `Tax` BIGINT NOT NULL DEFAULT 0,
  `Plate` VARCHAR(10) DEFAULT NULL,
  `Weight` INT NOT NULL DEFAULT 0,
  `Rental` BIGINT NOT NULL DEFAULT 0,
  `Arrest` BIGINT NOT NULL DEFAULT 0,
  `Block` TINYINT(1) NOT NULL DEFAULT 0,
  `Dismantle` BIGINT NOT NULL DEFAULT 0,
  `Engine` INT NOT NULL DEFAULT 1000,
  `Body` INT NOT NULL DEFAULT 1000,
  `Health` INT NOT NULL DEFAULT 1000,
  `Fuel` INT NOT NULL DEFAULT 100,
  `Nitro` INT NOT NULL DEFAULT 0,
  `Work` VARCHAR(5) NOT NULL DEFAULT 'false',
  `Mode` VARCHAR(9) NOT NULL DEFAULT 'normal',
  `Doors` LONGTEXT NOT NULL,
  `Windows` LONGTEXT NOT NULL,
  `Tyres` LONGTEXT NOT NULL,
  `Brakes` LONGTEXT NOT NULL,
  `Seatbelt` TINYINT(1) NOT NULL DEFAULT 0,
  `Drift` TINYINT(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- warehouse
DROP TABLE IF EXISTS `warehouse`;
CREATE TABLE `warehouse` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(50) NOT NULL,
  `Weight` BIGINT NOT NULL DEFAULT 50,
  `Password` VARCHAR(50) NOT NULL,
  `Passport` INT NOT NULL DEFAULT 0,
  `Tax` BIGINT NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;