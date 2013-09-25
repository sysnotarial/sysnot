delimiter $$

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

