delimiter $$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sps_usuarios_guardar`( 
	p_idusuario int,			-- Identificador
	P_iddepartamento int,		-- Identificador del departamento
	p_idpuesto int,				-- Identificador del puesto
	p_idrol int,				-- Identificador del rol
	p_clave int,				-- Clave del usuario	
	p_password int,				-- Password del usuario		
	p_apaterno varchar(256),	-- Apellido paterno del usuario
	p_amaterno varchar(256),	-- Apellido materno del usuario
	p_nombre varchar(256),		-- Nombre del usuario
	p_susuario char(1)			-- Super usuario [S,N]
)
BEGIN
	if p_apaterno is null then call sp_error('U', 'El apellido paterno no puede ser nulo.'); end if;
	START TRANSACTION;
		if p_idusuario is null then
			call sp_indices_siguiente('usuarios.idusuario',p_idusuario);
			select p_idusuario;
			insert into usuarios values(p_idusuario,p_iddepartamento,p_idpuesto,p_idrol,p_clave,p_password,p_apaterno,p_amaterno,p_nombre,p_susuario,'N');
		end if;
	COMMIT;
END$$

