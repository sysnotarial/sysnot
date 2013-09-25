delimiter $$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_sesiones_datos`( 
	p_idsesion mediumtext
)
BEGIN
		declare l_idusuarioSESION int;
		declare l_idrolSESION int;
		declare l_susuarioSESION char(1);

		call sp_sesiones_validar(p_idsesion, l_idusuarioSESION, l_idrolSESION, l_susuarioSESION);
	
		select
			p_idsesion AS idsesion,
			nombre
		from se_usuarios
		where idusuario = l_idusuarioSESION;

		SELECT distinct nombreaccion servicio FROM(
            SELECT roles.idrol, acciones.nombreaccion from 
                se_usuarios_roles roles, 
                se_roles_derechos derechos,
                si_acciones acciones,
                se_usuarios_derechos directos
            WHERE roles.idusuario = l_idusuarioSESION
            AND roles.idrol = derechos.idrol
            AND derechos.idaccion = acciones.idaccion
            UNION
            SELECT 0 as idrol, acciones.nombreaccion from    
                se_usuarios_derechos directos,
                si_acciones acciones
            WHERE directos.idusuario = l_idusuarioSESION
            AND directos.idaccion = acciones.idaccion) roles;
END$$

