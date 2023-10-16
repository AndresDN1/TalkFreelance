-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         11.2.1-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             12.5.0.6677
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para workchatter
CREATE DATABASE IF NOT EXISTS `workchatter` /*!40100 DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci */;
USE `workchatter`;

-- Volcando estructura para tabla workchatter.blocked
CREATE TABLE IF NOT EXISTS `blocked` (
  `userEmail` varchar(321) NOT NULL,
  `blockedEmail` varchar(321) NOT NULL,
  PRIMARY KEY (`userEmail`,`blockedEmail`) USING BTREE,
  CONSTRAINT `FK_blocked_user` FOREIGN KEY (`userEmail`) REFERENCES `user` (`email`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla workchatter.chats
CREATE TABLE IF NOT EXISTS `chats` (
  `userEmail` varchar(321) NOT NULL,
  `chatId` varchar(32) NOT NULL,
  `membersEmail` mediumtext NOT NULL,
  `seen` int(2) NOT NULL,
  PRIMARY KEY (`userEmail`,`chatId`),
  CONSTRAINT `FK_chats_user` FOREIGN KEY (`userEmail`) REFERENCES `user` (`email`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla workchatter.emails
CREATE TABLE IF NOT EXISTS `emails` (
  `userEmail` varchar(321) NOT NULL,
  `secondaryEmail` varchar(321) NOT NULL,
  PRIMARY KEY (`userEmail`,`secondaryEmail`),
  CONSTRAINT `FK_emails_user` FOREIGN KEY (`userEmail`) REFERENCES `user` (`email`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla workchatter.messages
CREATE TABLE IF NOT EXISTS `messages` (
  `user` varchar(321) NOT NULL,
  `chat` varchar(32) NOT NULL,
  `messageId` varchar(32) NOT NULL,
  `multimedia` varchar(2048) NOT NULL,
  `senderEmail` varchar(321) NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`user`,`chat`,`messageId`),
  CONSTRAINT `FK_messages_chats` FOREIGN KEY (`user`, `chat`) REFERENCES `chats` (`userEmail`, `chatId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla workchatter.payment
CREATE TABLE IF NOT EXISTS `payment` (
  `userEmail` varchar(321) NOT NULL,
  `paymentMethod` varchar(50) NOT NULL,
  PRIMARY KEY (`userEmail`,`paymentMethod`),
  CONSTRAINT `FK_payment_user` FOREIGN KEY (`userEmail`) REFERENCES `user` (`email`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla workchatter.phone
CREATE TABLE IF NOT EXISTS `phone` (
  `userEmail` varchar(321) NOT NULL,
  `phoneNumber` varchar(15) NOT NULL,
  `countryCode` varchar(4) NOT NULL,
  PRIMARY KEY (`userEmail`,`phoneNumber`,`countryCode`),
  CONSTRAINT `FK_phone_user` FOREIGN KEY (`userEmail`) REFERENCES `user` (`email`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla workchatter.review
CREATE TABLE IF NOT EXISTS `review` (
  `userEmail` varchar(321) NOT NULL,
  `reviewerEmail` varchar(321) NOT NULL,
  `score` tinyint(5) NOT NULL,
  `reviewText` varchar(4000) NOT NULL,
  PRIMARY KEY (`userEmail`,`reviewerEmail`),
  CONSTRAINT `FK_review_user` FOREIGN KEY (`userEmail`) REFERENCES `user` (`email`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla workchatter.schedule
CREATE TABLE IF NOT EXISTS `schedule` (
  `userEmail` varchar(321) NOT NULL,
  `day` date NOT NULL,
  `entryTime` time DEFAULT NULL,
  `exitTime` time DEFAULT NULL,
  PRIMARY KEY (`userEmail`,`day`),
  CONSTRAINT `FK_schedule_user` FOREIGN KEY (`userEmail`) REFERENCES `user` (`email`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla workchatter.user
CREATE TABLE IF NOT EXISTS `user` (
  `email` varchar(321) NOT NULL,
  `username` varchar(70) NOT NULL,
  `password` varchar(128) NOT NULL,
  `securityQuestion` varchar(128) NOT NULL,
  `securityAnswer` varchar(128) NOT NULL,
  `nationality` varchar(64) NOT NULL,
  `birthDate` date NOT NULL,
  `timezone` varchar(8) NOT NULL,
  `profilePicture` varchar(20) DEFAULT NULL,
  `biography` varchar(1024) DEFAULT NULL,
  `resume` varchar(20) DEFAULT NULL,
  `review` tinyint(5) DEFAULT NULL,
  PRIMARY KEY (`email`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- La exportación de datos fue deseleccionada.

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
