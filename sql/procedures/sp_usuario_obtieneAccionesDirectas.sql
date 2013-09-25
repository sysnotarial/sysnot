delimiter $$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_usuario_obtieneAccionesDirectas`(
IN p_idUsuario INT)
BEGIN
    SELECT 0 as idrol, acciones.nombreaccion from    
            se_usuarios_derechos directos,
            si_acciones acciones
            WHERE directos.idusuario = p_idUsuario
            AND directos.idaccion = acciones.idaccion;            
END$$

