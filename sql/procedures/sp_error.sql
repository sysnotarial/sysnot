delimiter $$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_error`( 
	p_tipo		char(1),	--	Tipo de excepción (U) usuario, (S) sistema
	p_mensaje	longtext	--	Mensaje de la excepción
)
BEGIN
	if LOCATE('EXCEPCION USUARIO:%',p_mensaje) > 0 or LOCATE('EXCEPCION SISTEMA:%', p_mensaje) > 0 then
		SIGNAL SQLSTATE
			'ERR0R'
		SET
			MESSAGE_TEXT = p_mensaje,
			MYSQL_ERRNO = 1000;
	end if;
	if p_tipo = 'U' then 
		IF p_mensaje IS NULL THEN
			set p_mensaje = 'EXCEPCION USUARIO';
		ELSE 
			set p_mensaje = CONCAT('EXCEPCION USUARIO:',p_mensaje);
		END IF;
	else 
		IF p_mensaje IS NULL THEN
			set p_mensaje = 'EXCEPCION SISTEMA';
		ELSE 
			set p_mensaje = CONCAT('EXCEPCION SISTEMA:',p_mensaje);
		END IF;
	end if;
		SIGNAL SQLSTATE
			'ERR0R'
		SET
			MESSAGE_TEXT = p_mensaje,
			MYSQL_ERRNO = 1000;	
END$$

