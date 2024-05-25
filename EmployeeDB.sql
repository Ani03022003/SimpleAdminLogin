-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.1.45-community - MySQL Community Server (GPL)
-- Server OS:                    Win64
-- HeidiSQL Version:             11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for employeedb
CREATE DATABASE IF NOT EXISTS `employeedb` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `employeedb`;

-- Dumping structure for table employeedb.admin
CREATE TABLE IF NOT EXISTS `admin` (
  `Name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table employeedb.admin: ~2 rows (approximately)
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` (`Name`, `password`) VALUES
	('Logesh', 'Logesh@23'),
	('Anish', 'Anish@123');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;

-- Dumping structure for table employeedb.employees
CREATE TABLE IF NOT EXISTS `employees` (
  `employee_id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_name` varchar(255) NOT NULL,
  `employee_email` varchar(255) NOT NULL,
  `employee_phone_number` varchar(15) DEFAULT NULL,
  `employee_department` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`employee_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- Dumping data for table employeedb.employees: ~2 rows (approximately)
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` (`employee_id`, `employee_name`, `employee_email`, `employee_phone_number`, `employee_department`) VALUES
	(3, 'Priya', 'preethikm2003@gmail.com', '7385006468', 'HR'),
	(4, 'Anish', 'a2anish03@gmail.com', '9884184243', 'Engineering');
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;

-- Dumping structure for table employeedb.skills
CREATE TABLE IF NOT EXISTS `skills` (
  `employee_id` int(11) NOT NULL AUTO_INCREMENT,
  `skills1` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`employee_id`),
  CONSTRAINT `skills_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`employee_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- Dumping data for table employeedb.skills: ~2 rows (approximately)
/*!40000 ALTER TABLE `skills` DISABLE KEYS */;
INSERT INTO `skills` (`employee_id`, `skills1`) VALUES
	(3, 'JavaScript, Python, Java'),
	(4, 'JavaScript, Python, Java, C++');
/*!40000 ALTER TABLE `skills` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
