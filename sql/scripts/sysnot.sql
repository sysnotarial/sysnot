-- phpMyAdmin SQL Dump
-- version 3.4.11.1deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jul 10, 2013 at 10:15 PM
-- Server version: 5.5.29
-- PHP Version: 5.4.6-1ubuntu1.2

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `sysnot`
--

DELIMITER $$
--
-- Procedures
--
DROP PROCEDURE IF EXISTS `clientes_guardar`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `clientes_guardar`(
  IN
  p_idcliente integer,
  p_regimenfiscal varchar(1),
  p_razonsocial varchar(100),
  p_siglas varchar(50),
  p_trtamiento varchar(10),
  p_nombres varchar(60),
  p_apaterno varchar(30),
  p_amaterno varchar(30),
  p_otronombre varchar(50),
  p_nombreactmat text,
  p_nombreotrosdocs text,
  p_sexo varchar(1),
  p_rfc varchar(13),
  p_curp varchar(30),
  p_nss varchar(1),
  p_edocivil varchar(1),
  p_regimenmat varchar(2),
  p_folioactmat varchar(1),
  p_actamat varchar(20),
  p_libroactamat integer,
  p_fechaactamat date,
  p_lugaractamat text,
  p_ciudadnac varchar(30),
  p_estadonac varchar(20),
  p_paisnac varchar(20),
  p_fechanac date  
)
BEGIN
	
	IF(p_idcliente = 0) THEN  
		INSERT INTO clientes(
		regimenfiscal,
		razonsocial,
		siglas,
		trtamiento,
		nombres,
		apaterno,
		amaterno,
		otronombre,
		nombreactmat,
		nombreotrosdocs,
		sexo,
		rfc,
		curp,
		nss,
		edocivil,
		regimenmat,
		folioactmat,
		actamat,
		libroactamat,
		fechaactamat,
		lugaractamat,
		ciudadnac,
		estadonac,
		paisnac,
		fechanac
		)
		VALUES(    
		p_regimenfiscal,
		p_razonsocial,
		p_siglas,
		p_trtamiento,
		p_nombres,
		p_apaterno,
		p_amaterno,
		p_otronombre,
		p_nombreactmat,
		p_nombreotrosdocs,
		p_sexo,
		p_rfc,
		p_curp,
		p_nss,
		p_edocivil,
		p_regimenmat,
		p_folioactmat,
		p_actamat,
		p_libroactamat,
		p_fechaactamat,
		p_lugaractamat,
		p_ciudadnac,
		p_estadonac,
		p_paisnac,
		p_fechanac
		);
	ELSE
		UPDATE clientes
		SET regimenfiscal = p_regimenfiscal,
		razonsocial = p_razonsocial,
		siglas = p_siglas,
		trtamiento = p_trtamiento,
		nombres = p_nombres,
		apaterno = p_apaterno,
		amaterno = p_amaterno,
		otronombre = p_otronombre,
		nombreactmat = p_nombreactmat,
		nombreotrosdocs = p_nombreotrosdocs,
		sexo = p_sexo,
		rfc = p_rfc,
		curp = p_curp,
		nss = p_nss,
		edocivil = p_edocivil,
		regimenmat = p_regimenmat,
		folioactmat = p_folioactmat,
		actamat = p_actamat,
		libroactamat = p_libroactamat,
		fechaactamat = p_fechaactamat,
		lugaractamat = p_lugaractamat,
		ciudadnac = p_ciudadnac,
		estadonac = p_estadonac,
		paisnac = p_paisnac,
		fechanac = p_fechanac
		WHERE idcliente = p_idcliente;
	END IF;
    
  
  

END$$

DROP PROCEDURE IF EXISTS `clientes_listar`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `clientes_listar`( 
IN p_nombre VARCHAR(25),
p_page INT,
p_limit INT,
p_sidx VARCHAR(25), 
p_sord VARCHAR(25),
OUT size INT,
OUT totalpages INT
)
BEGIN 
	DECLARE p_start INT DEFAULT 0 ;
	IF(p_page=1) 
		THEN set p_start=0;
		ELSE set p_start=p_page*p_limit;
	END IF;
	select count(*) INTO size from clientes;

	select ceil(count(*)/p_limit) INTO totalpages from clientes;

	select * from clientes 
	where nombres like CONCAT('%',p_nombre,'%')
	LIMIT p_start,p_limit;

END$$

DROP PROCEDURE IF EXISTS `menu_listar`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `menu_listar`(
IN p_usuario INT
)
BEGIN
    SELECT
    menu.idmenu,
    menu.titulo, 
    menu.idpadre, 
    menu.nivel,
    menu.rutaicono,
    menu.url,
    menu.orden,
    menu.idaccion,
    fn_usuario_obtienePermisoPorAccion(p_usuario,menu.idaccion) habilitado
    FROM    (
            SELECT  fn_conectado_por_padre_igual_previo_id(idmenu) AS id, @level AS nivel
            FROM    (
                    SELECT  @start_with := 0,
                            @id := @start_with,
                            @level := 0
                    ) variables, se_menu
            WHERE   @id IS NOT NULL
            ) menuJerarquia, se_menu menu
    WHERE menu.idmenu = menuJerarquia.id;
END$$

DROP PROCEDURE IF EXISTS `registrar`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `registrar`(
  IN
  p_idcliente integer,
  p_regimenfiscal varchar(1),
  p_razonsocial varchar(100),
  p_siglas varchar(50),
  p_trtamiento varchar(10),
  p_nombres varchar(60),
  p_apaterno varchar(30),
  p_amaterno varchar(30),
  p_otronombre varchar(50),
  p_nombreactmat text,
  p_nombreotrosdocs text,
  p_sexo varchar(1),
  p_rfc varchar(13),
  p_curp varchar(30),
  p_nss varchar(1),
  p_edocivil varchar(1),
  p_regimenmat varchar(2),
  p_folioactmat varchar(1),
  p_actamat varchar(20),
  p_libroactamat integer,
  p_fechaactamat date,
  p_lugaractamat text,
  p_ciudadnac varchar(30),
  p_estadonac varchar(20),
  p_paisnac varchar(20),
  p_fechanac date  
)
BEGIN
  
  
    INSERT INTO clientes(idcliente,
    regimenfiscal,
    razonsocial,
    siglas,
    trtamiento,
    nombres,
    apaterno,
    amaterno,
    otronombre,
    nombreactmat,
    nombreotrosdocs,
    sexo,
    rfc,
    curp,
    nss,
    edocivil,
    regimenmat,
    folioactmat,
    actamat,
    libroactamat,
    fechaactamat,
    lugaractamat,
    ciudadnac,
    estadonac,
    paisnac,
    fechanac
    )
    VALUES(
    p_idcliente,
    p_regimenfiscal,
    p_razonsocial,
    p_siglas,
    p_trtamiento,
    p_nombres,
    p_apaterno,
    p_amaterno,
    p_otronombre,
    p_nombreactmat,
    p_nombreotrosdocs,
    p_sexo,
    p_rfc,
    p_curp,
    p_nss,
    p_edocivil,
    p_regimenmat,
    p_folioactmat,
    p_actamat,
    p_libroactamat,
    p_fechaactamat,
    p_lugaractamat,
    p_ciudadnac,
    p_estadonac,
    p_paisnac,
    p_fechanac
    );
  
    
  
  

END$$

DROP PROCEDURE IF EXISTS `sp_usuario_obtieneAccionesDirectas`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_usuario_obtieneAccionesDirectas`(
IN p_idUsuario INT)
BEGIN
    SELECT 0 as idrol, acciones.nombreaccion from    
            se_usuarios_derechos directos,
            si_acciones acciones
            WHERE directos.idusuario = p_idUsuario
            AND directos.idaccion = acciones.idaccion;            
END$$

DROP PROCEDURE IF EXISTS `sp_usuario_obtieneRolesAcciones`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_usuario_obtieneRolesAcciones`(
IN p_idUsuario INT
)
BEGIN
    SELECT roles.idrol, acciones.nombreaccion from 
            se_usuarios_roles roles, 
            se_roles_derechos derechos,
            si_acciones acciones,
            se_usuarios_derechos directos
            WHERE roles.idusuario = p_idUsuario
            AND roles.idrol = derechos.idrol
            AND derechos.idaccion = acciones.idaccion
            ORDER BY roles.idrol;            
END$$

--
-- Functions
--
DROP FUNCTION IF EXISTS `fn_conectado_por_padre_igual_previo_id`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_conectado_por_padre_igual_previo_id`(value INT) RETURNS int(11)
    READS SQL DATA
BEGIN
-- Simula la función CONNECT BY parent = PRIOR id
        DECLARE _id INT;
        DECLARE _parent INT;
        DECLARE _next INT;
        DECLARE CONTINUE HANDLER FOR NOT FOUND SET @id = NULL;

        SET _parent = @id;
        SET _id = -1;

        IF @id IS NULL THEN
                RETURN NULL;
        END IF;

        LOOP
                SELECT  MIN(idmenu)
                INTO    @id
                FROM    se_menu
                WHERE   idpadre = _parent
                        AND idmenu > _id;
                IF @id IS NOT NULL OR _parent = @start_with THEN
                        SET @level = @level + 1;
                        RETURN @id;
                END IF;
                SET @level := @level - 1;
                SELECT  idmenu, idpadre
                INTO    _id, _parent
                FROM    se_menu
                WHERE   idmenu = _parent;
        END LOOP;       
END$$

DROP FUNCTION IF EXISTS `fn_usuario_obtienePermisoPorAccion`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_usuario_obtienePermisoPorAccion`(
p_idUsuario INT,
p_idAccion INT) RETURNS varchar(1) CHARSET utf8
    READS SQL DATA
BEGIN
    DECLARE l_cantPermisos INT DEFAULT 0;
    DECLARE l_permiso VARCHAR(1) DEFAULT "N";

    SELECT sum(permiso) into l_cantPermisos FROM 
        (SELECT count(*) permiso FROM
            se_usuarios_roles roles, 
            se_roles_derechos derechos,
            si_acciones acciones,
            se_usuarios_derechos directos
            WHERE roles.idusuario = p_idUsuario
            AND roles.idrol = derechos.idrol
            AND derechos.idaccion = acciones.idaccion
            AND acciones.idaccion = p_idAccion
         UNION
            SELECT count(*) permiso FROM
            se_usuarios_derechos directos,
            si_acciones acciones
            WHERE directos.idusuario = p_idUsuario
            AND directos.idaccion = acciones.idaccion
            AND acciones.idaccion = p_idAccion
        )permisoPorAccion;
    
    IF l_cantPermisos > 0 THEN
        SET l_permiso = "S";
    END IF;

    RETURN l_permiso;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
CREATE TABLE IF NOT EXISTS `clientes` (
  `idcliente` int(11) NOT NULL AUTO_INCREMENT,
  `regimenfiscal` varchar(1) DEFAULT NULL,
  `razonsocial` varchar(100) DEFAULT NULL,
  `siglas` varchar(50) DEFAULT NULL,
  `trtamiento` varchar(10) DEFAULT NULL,
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
  PRIMARY KEY (`idcliente`),
  KEY `clientes_razonsocial` (`razonsocial`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `clientes`
--

INSERT INTO `clientes` (`idcliente`, `regimenfiscal`, `razonsocial`, `siglas`, `trtamiento`, `nombres`, `apaterno`, `amaterno`, `otronombre`, `nombreactmat`, `nombreotrosdocs`, `sexo`, `rfc`, `curp`, `nss`, `edocivil`, `regimenmat`, `folioactmat`, `actamat`, `libroactamat`, `fechaactamat`, `lugaractamat`, `ciudadnac`, `estadonac`, `paisnac`, `fechanac`) VALUES
(1, '', 'sdsdsd', '', NULL, 'CulÃ©rfano', 'Santoyo', 'Sanchez', '', NULL, '', '', '', '', '', '', '', NULL, '', 0, '2013-07-06', NULL, '', '', '', '2013-07-06'),
(2, '', 'Razon 2', '', NULL, 'Juan', 'Perez', 'Perez', '', NULL, '', '', '', '', '', '', '', NULL, '', 0, '2013-07-06', NULL, '', '', '', '2013-07-06');

-- --------------------------------------------------------

--
-- Table structure for table `se_menu`
--

DROP TABLE IF EXISTS `se_menu`;
CREATE TABLE IF NOT EXISTS `se_menu` (
  `idmenu` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(30) NOT NULL,
  `nivel` int(11) NOT NULL,
  `idpadre` int(11) DEFAULT NULL,
  `rutaicono` varchar(50) DEFAULT NULL,
  `url` varchar(50) DEFAULT NULL,
  `orden` int(11) NOT NULL,
  `idaccion` int(11) DEFAULT NULL,
  PRIMARY KEY (`idmenu`),
  KEY `idpadre_idx` (`idpadre`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=16 ;

--
-- Dumping data for table `se_menu`
--

INSERT INTO `se_menu` (`idmenu`, `titulo`, `nivel`, `idpadre`, `rutaicono`, `url`, `orden`, `idaccion`) VALUES
(1, 'Notaría', 1, 0, NULL, NULL, 1, NULL),
(2, 'Catálogos', 2, 1, NULL, NULL, 1, NULL),
(3, 'Tipos de Operaciones', 3, 2, NULL, NULL, 1, NULL),
(4, 'Tipos de Trámites', 3, 2, NULL, NULL, 3, NULL),
(5, 'Expedientes', 2, 1, NULL, NULL, 2, 3),
(6, 'Cotejos', 2, 1, NULL, NULL, 3, NULL),
(7, 'Certificaciones', 2, 1, NULL, NULL, 4, NULL),
(8, 'Seguridad', 1, 0, NULL, NULL, 2, NULL),
(9, 'Usuarios', 2, 8, NULL, NULL, 1, NULL),
(10, 'Roles', 2, 8, NULL, NULL, 2, NULL),
(11, 'Sistema', 1, 0, NULL, NULL, 3, NULL),
(12, 'Acciones', 2, 11, NULL, NULL, 1, 1),
(13, 'Opciones', 2, 11, NULL, NULL, 2, NULL),
(14, 'Otro menu Notaría', 2, 1, NULL, NULL, 5, NULL),
(15, 'Otro nivel Catálogos', 3, 2, NULL, NULL, 2, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `se_menu_acciones`
--

DROP TABLE IF EXISTS `se_menu_acciones`;
CREATE TABLE IF NOT EXISTS `se_menu_acciones` (
  `idmenu` int(11) NOT NULL,
  `idaccion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `se_roles`
--

DROP TABLE IF EXISTS `se_roles`;
CREATE TABLE IF NOT EXISTS `se_roles` (
  `idrol` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(20) NOT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idrol`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `se_roles`
--

INSERT INTO `se_roles` (`idrol`, `nombre`, `descripcion`) VALUES
(1, 'Administrador', 'Administrador de Sistema'),
(2, 'Abogado Senior ', 'Abogado Senior'),
(3, 'Abogado Junior', 'Abogado Junior');

-- --------------------------------------------------------

--
-- Table structure for table `se_roles_derechos`
--

DROP TABLE IF EXISTS `se_roles_derechos`;
CREATE TABLE IF NOT EXISTS `se_roles_derechos` (
  `idrol` int(11) NOT NULL,
  `idaccion` int(11) NOT NULL,
  KEY `index_idaccion1` (`idaccion`),
  KEY `index_idrol2` (`idrol`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `se_roles_derechos`
--

INSERT INTO `se_roles_derechos` (`idrol`, `idaccion`) VALUES
(3, 1),
(3, 2),
(2, 1),
(2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `se_usuarios`
--

DROP TABLE IF EXISTS `se_usuarios`;
CREATE TABLE IF NOT EXISTS `se_usuarios` (
  `idusuario` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(70) NOT NULL,
  `iniciales` varchar(5) DEFAULT NULL,
  `usuario` varchar(20) NOT NULL,
  `password` varchar(15) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `directoriodefault` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`idusuario`),
  UNIQUE KEY `unique_usuario` (`usuario`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `se_usuarios`
--

INSERT INTO `se_usuarios` (`idusuario`, `nombre`, `iniciales`, `usuario`, `password`, `email`, `telefono`, `directoriodefault`) VALUES
(1, 'Sistema', 'SYS', 'system', 'sysnot13', NULL, NULL, NULL),
(2, 'Administrador', 'ADMIN', 'admin', 'sysnotadmin13', NULL, NULL, NULL),
(3, 'usuario', 'USR', 'user', 'user13', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `se_usuarios_derechos`
--

DROP TABLE IF EXISTS `se_usuarios_derechos`;
CREATE TABLE IF NOT EXISTS `se_usuarios_derechos` (
  `idusuario` int(11) NOT NULL,
  `idaccion` int(11) NOT NULL,
  KEY `index_idaccion` (`idaccion`),
  KEY `index_idusuario1` (`idusuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `se_usuarios_derechos`
--

INSERT INTO `se_usuarios_derechos` (`idusuario`, `idaccion`) VALUES
(3, 3);

-- --------------------------------------------------------

--
-- Table structure for table `se_usuarios_roles`
--

DROP TABLE IF EXISTS `se_usuarios_roles`;
CREATE TABLE IF NOT EXISTS `se_usuarios_roles` (
  `idusuario` int(11) NOT NULL,
  `idrol` int(11) NOT NULL,
  KEY `index_idrol` (`idrol`),
  KEY `index_idusuario` (`idusuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `se_usuarios_roles`
--

INSERT INTO `se_usuarios_roles` (`idusuario`, `idrol`) VALUES
(3, 3),
(3, 2);

-- --------------------------------------------------------

--
-- Table structure for table `si_acciones`
--

DROP TABLE IF EXISTS `si_acciones`;
CREATE TABLE IF NOT EXISTS `si_acciones` (
  `idaccion` int(11) NOT NULL AUTO_INCREMENT,
  `nombreaccion` varchar(50) NOT NULL,
  `nombresp` varchar(50) NOT NULL,
  PRIMARY KEY (`idaccion`),
  KEY `index_idderecho` (`idaccion`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `si_acciones`
--

INSERT INTO `si_acciones` (`idaccion`, `nombreaccion`, `nombresp`) VALUES
(1, 'Guardar Clientes', 'clientes_guardar'),
(2, 'Listar Clientes', 'clientes_listar'),
(3, 'ver_expedientes', 'ver_expedientes');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
