delimiter $$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_sesiones_insertar`( 
p_clave varchar(30)
)
BEGIN 
	declare l_error longtext;
	begin

		declare l_idusuarioSESION int;
		declare l_idrolSESION int;
		declare l_susuarioSESION char(1);
		declare l_fcreacion datetime;
		declare l_idusuarioSESIONS longtext;
		declare l_idsesion longtext;
       declare l_idcentroSESION int;
       declare randomNumber varchar(6);
        
       set l_idcentroSESION = 0;
		set l_fcreacion = sysdate();
		
		SELECT idusuario, idrol, susuario INTO l_idusuarioSESION, l_idrolSESION, l_susuarioSESION 
            FROM se_usuarios where usuario = p_clave;

		if l_idusuarioSESION is null then
			set l_error = 'La clave [' + p_clave +'] no está registrada en SYSNOT.';
			call sp_error('U', l_error);
		end if;
		if l_idrolSESION is null then
			set l_error='Usted no tiene un rol asignado.';
			-- call sp_error ('U', l_error);
		end if;

        SET l_idsesion   = MID(l_fcreacion+'',3,10);
        SET randomNumber = RPAD(FLOOR(rand()*1000000),6,'0');
        SET l_idsesion  = CONCAT(l_idsesion,randomNumber);
    
		insert into sesiones values(l_idsesion, l_idusuarioSESION, l_idrolSESION, l_fcreacion, l_susuarioSESION);

		call sp_sesiones_datos(l_idsesion);
	end;
END$$

