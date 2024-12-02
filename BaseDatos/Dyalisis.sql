-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.4.32-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             12.8.0.6908
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para dialysimetrics
CREATE DATABASE IF NOT EXISTS `dialysimetrics` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `dialysimetrics`;

-- Volcando estructura para tabla dialysimetrics.diastolic_levels
CREATE TABLE IF NOT EXISTS `diastolic_levels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `value` int(11) DEFAULT NULL,
  `description` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla dialysimetrics.diastolic_levels: ~5 rows (aproximadamente)
INSERT IGNORE INTO `diastolic_levels` (`id`, `value`, `description`) VALUES
	(1, 40, 'Muy baja'),
	(2, 60, 'Baja'),
	(3, 80, 'Normal'),
	(4, 100, 'Alta'),
	(5, 120, 'Muy alta');

-- Volcando estructura para tabla dialysimetrics.systolic_levels
CREATE TABLE IF NOT EXISTS `systolic_levels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `value` int(11) DEFAULT NULL,
  `description` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla dialysimetrics.systolic_levels: ~5 rows (aproximadamente)
INSERT IGNORE INTO `systolic_levels` (`id`, `value`, `description`) VALUES
	(1, 90, 'Muy baja'),
	(2, 110, 'Baja'),
	(3, 130, 'Normal'),
	(4, 150, 'Alta'),
	(5, 200, 'Muy Alta');

-- Volcando estructura para tabla dialysimetrics.treatments
CREATE TABLE IF NOT EXISTS `treatments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pressure_systolic` int(11) DEFAULT NULL,
  `pressure_diastolic` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `hour` time DEFAULT NULL,
  `description` varchar(50) DEFAULT NULL,
  `systolic_level_id` int(11) DEFAULT NULL,
  `diastolic_level_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `systolic_level_id` (`systolic_level_id`),
  KEY `diastolic_level_id` (`diastolic_level_id`),
  CONSTRAINT `treatments_ibfk_1` FOREIGN KEY (`systolic_level_id`) REFERENCES `systolic_levels` (`id`),
  CONSTRAINT `treatments_ibfk_2` FOREIGN KEY (`diastolic_level_id`) REFERENCES `diastolic_levels` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla dialysimetrics.treatments: ~1 rows (aproximadamente)
INSERT IGNORE INTO `treatments` (`id`, `pressure_systolic`, `pressure_diastolic`, `date`, `hour`, `description`, `systolic_level_id`, `diastolic_level_id`) VALUES
	(1, 135, 85, '2024-09-15', '14:30:00', 'Inicio', 3, 3);

-- Volcando estructura para tabla dialysimetrics.weights
CREATE TABLE IF NOT EXISTS `weights` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `initial_weight` decimal(5,2) DEFAULT NULL,
  `final_weight` decimal(5,2) DEFAULT NULL,
  `total_liquids` decimal(5,2) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `hour` time DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla dialysimetrics.weights: ~1 rows (aproximadamente)
INSERT IGNORE INTO `weights` (`id`, `initial_weight`, `final_weight`, `total_liquids`, `date`, `hour`) VALUES
	(1, 57.00, 55.00, 2.00, NULL, NULL);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
