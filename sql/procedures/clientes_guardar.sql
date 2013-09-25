delimiter $$

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

