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
DROP TABLE IF EXISTS `se_usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `se_usuarios` (
  `idusuario` int(11) NOT NULL,
  `iddepartamento` int(11) DEFAULT NULL,
  `idpuesto` int(11) DEFAULT NULL,
  `idrol` int(11) DEFAULT NULL,
  `nombre` varchar(70) NOT NULL,
  `iniciales` varchar(5) DEFAULT NULL,
  `usuario` varchar(20) NOT NULL,
  `password` varchar(15) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `directoriodefault` varchar(250) DEFAULT NULL,
  `susuario` char(1) NOT NULL,
  `deleted` char(1) NOT NULL,
  PRIMARY KEY (`idusuario`),
  UNIQUE KEY `UQ_usuarios_clave` (`usuario`),
  KEY `FK_usuarios_02` (`iddepartamento`),
  KEY `FK_usuarios_03` (`idpuesto`),
  KEY `FK_usuarios_04` (`idrol`),
  CONSTRAINT `FK_usuarios_02` FOREIGN KEY (`iddepartamento`) REFERENCES `departamentos` (`iddepartamento`),
  CONSTRAINT `FK_usuarios_03` FOREIGN KEY (`idpuesto`) REFERENCES `puestos` (`idpuesto`),
  CONSTRAINT `FK_usuarios_04` FOREIGN KEY (`idrol`) REFERENCES `roles` (`idrol`)
);
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `se_usuarios` WRITE;
/*!40000 ALTER TABLE `se_usuarios` DISABLE KEYS */;
INSERT INTO `se_usuarios` VALUES (1,NULL,NULL,1,'Sistema','SYS','system','sysnot13',NULL,NULL,NULL,'N','N'),(2,NULL,NULL,NULL,'Administrador','ADMIN','admin','sysnotadmin13',NULL,NULL,NULL,'S','N'),(3,NULL,NULL,NULL,'usuario','USR','user','user13',NULL,NULL,NULL,'N','N');
/*!40000 ALTER TABLE `se_usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

