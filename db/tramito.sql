-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.4.22-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para tramito
CREATE DATABASE IF NOT EXISTS `tramito` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `tramito`;

-- Volcando estructura para tabla tramito.chats
CREATE TABLE IF NOT EXISTS `chats` (
  `chat_id` int(11) NOT NULL AUTO_INCREMENT,
  `from_id` int(11) NOT NULL,
  `to_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `opened` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`chat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla tramito.chats: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `chats` DISABLE KEYS */;
/*!40000 ALTER TABLE `chats` ENABLE KEYS */;

-- Volcando estructura para tabla tramito.conversations
CREATE TABLE IF NOT EXISTS `conversations` (
  `conversation_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_1` int(11) NOT NULL,
  `user_2` int(11) NOT NULL,
  PRIMARY KEY (`conversation_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla tramito.conversations: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `conversations` DISABLE KEYS */;
INSERT INTO `conversations` (`conversation_id`, `user_1`, `user_2`) VALUES
	(1, 1, 2),
	(2, 1, 6),
	(3, 7, 8),
	(4, 10, 11);
/*!40000 ALTER TABLE `conversations` ENABLE KEYS */;

-- Volcando estructura para tabla tramito.users
CREATE TABLE IF NOT EXISTS `users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(1000) NOT NULL,
  `p_p` varchar(255) DEFAULT 'user-default.png',
  `last_seen` datetime NOT NULL DEFAULT current_timestamp(),
  `email` varchar(50) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla tramito.users: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`user_id`, `name`, `username`, `password`, `p_p`, `last_seen`, `email`) VALUES
	(14, 'Elian Salmerón', '18011316', '$2y$10$uEYSv3QFV9wTAEVtp7rAb.2QpzXCds9dr5k034aACGGZPRJTLrINu', 'user-default.png', '2022-04-18 20:33:23', 'eliansalmeron@gmail.com');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

-- Volcando estructura para tabla tramito.xoochbot
CREATE TABLE IF NOT EXISTS `xoochbot` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pregunta` varchar(150) NOT NULL,
  `respuesta` varchar(150) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla tramito.xoochbot: ~12 rows (aproximadamente)
/*!40000 ALTER TABLE `xoochbot` DISABLE KEYS */;
INSERT INTO `xoochbot` (`id`, `pregunta`, `respuesta`) VALUES
	(2, '¿Cómo te llamas?', 'Mi nombre es XOOCHBot.'),
	(3, 'Hola.', '¡Hola! Un gusto saludarte.'),
	(6, 'Adiós.', 'Espero haberte ayudado, hasta pronto.'),
	(7, 'Gracias.', 'Ha sido un placer ayudarte.'),
	(8, '¿Cuál es el horario de atención del departamento de Servicios Escolares?', 'De 10:00 a 13:00 horas.'),
	(9, '¿Cuál es la plataforma para subir los documentos del servicio social?', 'https://sitec.orizaba.tecnm.mx/servicio/'),
	(11, '¿Cuál es el horario del departamento de lenguas extranjeras?', 'Horario de 8:00 a 14:00'),
	(12, '¿Cuál es el teléfono de la escuela?', '2727244096'),
	(13, '¿Cuál es la dirección de la escuela?', 'Avenida Oriente 9 No. 852, 94320 Orizaba, Veracruz'),
	(14, '¿Con quien me comunico para solicitar una constancia?', 'Para solicitar una constancia debes comunicarte con Claudia Cervantes Ávila'),
	(15, '¿Cuál es la página oficial de la escuela?', 'http://www.orizaba.tecnm.mx/'),
	(16, '¿Cómo puedo obtener los créditos complementarios?', 'Los créditos complentarios se pueden obtener a través de conferencias.');
/*!40000 ALTER TABLE `xoochbot` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
