delimiter $$

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

