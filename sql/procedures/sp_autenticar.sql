delimiter $$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_autenticar`( 
	p_usuario varchar(32),		-- Clave del usuario
	p_password varchar(32)		-- Password
)
BEGIN
	
    IF (SELECT COUNT(*) FROM se_usuarios WHERE usuario = p_usuario and password = p_password)>0 THEN
       call sp_sesiones_insertar(p_usuario);
    ELSE
       call sp_error('U','Combinación de clave y usuario incorrecta');
    END IF;	
END$$

