delimiter $$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_sesiones_validar`( 
	p_idsesion mediumtext,
	out p_idusuarioSESION int,
	out p_idrolSESION int,
	out p_susuarioSESION char(1)
)
BEGIN
		SELECT idusuario, idrol, susuario INTO p_idusuarioSESION, p_idrolSESION,  p_susuarioSESION 
        FROM sesiones WHERE idsesion = p_idsesion;
		IF p_idusuarioSESION IS NULL THEN
			CALL sp_error('U', 'No existe una sesión activa para el usuario actual.');
		END IF;
END$$

