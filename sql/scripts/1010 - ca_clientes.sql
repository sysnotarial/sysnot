CREATE DATABASE  IF NOT EXISTS `sysnot` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `sysnot`;

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
DROP TABLE IF EXISTS `ca_clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ca_clientes` (
  `idcliente` int(11) NOT NULL,
  `regimenfiscal` varchar(1) DEFAULT NULL,
  `razonsocial` varchar(100) DEFAULT NULL,
  `siglas` varchar(50) DEFAULT NULL,
  `tratamiento` varchar(10) DEFAULT NULL,
  `nombres` varchar(60) DEFAULT NULL,
  `apaterno` varchar(30) DEFAULT NULL,
  `amaterno` varchar(30) DEFAULT NULL,
  `otronombre` varchar(50) DEFAULT NULL,
  `nombreactmat` text,
  `nombreotrosdocs` text,
  `sexo` varchar(1) DEFAULT NULL,
  `rfc` varchar(13) DEFAULT NULL,
  `curp` varchar(30) DEFAULT NULL,
  `nss` varchar(1) DEFAULT NULL,
  `edocivil` varchar(1) DEFAULT NULL,
  `regimenmat` varchar(2) DEFAULT NULL,
  `folioactmat` varchar(1) DEFAULT NULL,
  `actamat` varchar(20) DEFAULT NULL,
  `libroactamat` int(11) DEFAULT NULL,
  `fechaactamat` date DEFAULT NULL,
  `lugaractamat` text,
  `ciudadnac` varchar(30) DEFAULT NULL,
  `estadonac` varchar(20) DEFAULT NULL,
  `paisnac` varchar(20) DEFAULT NULL,
  `fechanac` date DEFAULT NULL,
  `esextranjero` tinyint(4) DEFAULT NULL,
  `idtipoident` smallint(6) DEFAULT NULL,
  `identemisoraident` smallint(6) DEFAULT NULL,
  `folioident` varchar(20) DEFAULT NULL,
  `contrafolioident` varchar(20) DEFAULT NULL,
  `fechaexpedident` date DEFAULT NULL,
  `lugarexpedident` varchar(50) DEFAULT NULL,
  `idprofesion` smallint(6) DEFAULT NULL,
  `idocupacion` smallint(6) DEFAULT NULL,
  `telefonos` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `tipovialdomfisico` varchar(15) DEFAULT NULL,
  `vialdomfisico` varchar(45) DEFAULT NULL,
  `numextdomfisico` int(11) DEFAULT NULL,
  `letranumextdomfisico` varchar(10) DEFAULT NULL,
  `numintdomfisico` int(11) DEFAULT NULL,
  `letranumintdomfisico` varchar(10) DEFAULT NULL,
  `cpdomfisico` varchar(5) DEFAULT NULL,
  `idtipoasentdomfisico` smallint(6) DEFAULT NULL,
  `asentdomfisico` varchar(100) DEFAULT NULL,
  `delegaciondomfisico` varchar(30) CHARACTER SET big5 COLLATE big5_bin DEFAULT NULL,
  `ciudaddomfisico` varchar(30) DEFAULT NULL,
  `idmpiodomfisico` int(11) DEFAULT NULL,
  `idestadodomfisico` int(11) DEFAULT NULL,
  `idpaisdomfisico` int(11) DEFAULT NULL,
  `tipovialdomfiscal` varchar(15) DEFAULT NULL,
  `vialdomfiscal` varchar(45) DEFAULT NULL,
  `numextdomfiscal` int(11) DEFAULT NULL,
  `letranumextdomfiscal` varchar(10) DEFAULT NULL,
  `numintdomfiscal` int(11) DEFAULT NULL,
  `letranumintdomfiscal` varchar(10) DEFAULT NULL,
  `cpdomfiscal` varchar(5) DEFAULT NULL,
  `idtipoasentdomfiscal` smallint(6) DEFAULT NULL,
  `asentdomfiscal` varchar(100) DEFAULT NULL,
  `delegaciondomfiscal` varchar(30) CHARACTER SET big5 COLLATE big5_bin DEFAULT NULL,
  `ciudaddomfiscal` varchar(30) DEFAULT NULL,
  `idmpiodomfiscal` int(11) DEFAULT NULL,
  `idestadodomfiscal` int(11) DEFAULT NULL,
  `idpaisdomfiscal` int(11) DEFAULT NULL,
  `redaclibregenerales` tinyint(4) DEFAULT NULL,
  `generales` text,
  `legalexsitpersmoral` text,
  `observaciones` text,
  PRIMARY KEY (`idcliente`),
  KEY `clientes_razonsocial` (`razonsocial`)
);
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `ca_clientes` WRITE;
/*!40000 ALTER TABLE `ca_clientes` DISABLE KEYS */;
INSERT INTO `ca_clientes` VALUES (1,'a','super razon','ss','tr','culérfano','santoyo','','ot','','','H',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2,'a','super razon','ss','tr','Epidídimo','Gonzalez','','ot','','','H',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `ca_clientes` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

