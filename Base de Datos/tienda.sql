-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: localhost    Database: tienda
-- ------------------------------------------------------
-- Server version	8.0.33

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `articulo`
--

DROP TABLE IF EXISTS `articulo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `articulo` (
  `Articulo Codigo` char(4) NOT NULL,
  `Articulo Nombre` char(50) DEFAULT NULL,
  `Articulo Valor Individual` int DEFAULT NULL,
  `Estado Articulo` tinyint DEFAULT NULL,
  PRIMARY KEY (`Articulo Codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `articulo`
--

LOCK TABLES `articulo` WRITE;
/*!40000 ALTER TABLE `articulo` DISABLE KEYS */;
INSERT INTO `articulo` VALUES ('1','polo',5,1),('10','Polo Pikachu',100,1),('2','Polo Diseño',20,1),('3','Polo Cafe',30,1),('4','Polo Rojo',50,1),('5','Polo Azul',20,1),('6','Polo Morado',50,1),('7','Polo Naranja',30,1),('8','Polo Cafe',30,1),('9','Polo Sin Diseño',30,1);
/*!40000 ALTER TABLE `articulo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bol_detalle`
--

DROP TABLE IF EXISTS `bol_detalle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bol_detalle` (
  `Boleta Codigo` char(4) NOT NULL,
  `BolNum` char(7) NOT NULL,
  `Boleta Detalle Codigo Articulo` char(4) DEFAULT NULL,
  `Boleta Detalle Cantidad` char(20) DEFAULT NULL,
  PRIMARY KEY (`Boleta Codigo`),
  KEY `IX_Relationship8` (`BolNum`),
  KEY `IX_Relationship12` (`Boleta Detalle Codigo Articulo`),
  CONSTRAINT `Relationship12` FOREIGN KEY (`Boleta Detalle Codigo Articulo`) REFERENCES `articulo` (`Articulo Codigo`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `Relationship8` FOREIGN KEY (`BolNum`) REFERENCES `boleta` (`Boleta Numero`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bol_detalle`
--

LOCK TABLES `bol_detalle` WRITE;
/*!40000 ALTER TABLE `bol_detalle` DISABLE KEYS */;
/*!40000 ALTER TABLE `bol_detalle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `boleta`
--

DROP TABLE IF EXISTS `boleta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `boleta` (
  `Boleta Numero` char(7) NOT NULL,
  `Boleta Compañia` char(7) DEFAULT NULL,
  `Boleta Cliente Numero` char(4) DEFAULT NULL,
  `Boleta Fecha Emision Año` char(4) DEFAULT NULL,
  `Boleta Fecha Emision Mes` char(2) DEFAULT NULL,
  `Boleta Fecha Emision Dia` char(2) DEFAULT NULL,
  `Boleta Firma Estado` tinyint(1) DEFAULT NULL,
  `Boleta Detalle Total` char(5) DEFAULT NULL,
  PRIMARY KEY (`Boleta Numero`),
  KEY `IX_Relationship5` (`Boleta Cliente Numero`),
  KEY `Relationship6_idx` (`Boleta Compañia`),
  CONSTRAINT `Relationship5` FOREIGN KEY (`Boleta Cliente Numero`) REFERENCES `cliente` (`Cliente Numero`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `Relationship6` FOREIGN KEY (`Boleta Compañia`) REFERENCES `compañia` (`Compañia Numero`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `boleta`
--

LOCK TABLES `boleta` WRITE;
/*!40000 ALTER TABLE `boleta` DISABLE KEYS */;
/*!40000 ALTER TABLE `boleta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `Cliente Numero` char(4) NOT NULL,
  `Cliente Nombre` char(50) DEFAULT NULL,
  `Cliente Direccion` char(40) DEFAULT NULL,
  `Cliente Estado` tinyint DEFAULT NULL,
  PRIMARY KEY (`Cliente Numero`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES ('1','Kevin','Socabaya',1),('2','Pedro','Jose Luis',1);
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compañia`
--

DROP TABLE IF EXISTS `compañia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `compañia` (
  `Compañia Numero` char(7) NOT NULL,
  `Compañia Direccion` char(20) DEFAULT NULL,
  `Compañia Nombre` char(20) DEFAULT NULL,
  `Compañia Ruc` char(12) DEFAULT NULL,
  PRIMARY KEY (`Compañia Numero`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compañia`
--

LOCK TABLES `compañia` WRITE;
/*!40000 ALTER TABLE `compañia` DISABLE KEYS */;
INSERT INTO `compañia` VALUES ('1','independencia','Productos \"Lorito\"','10072486892');
/*!40000 ALTER TABLE `compañia` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-07-11 21:42:28
