delimiter $$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_menu_listar`(
IN p_usuario INT
)
BEGIN
    SELECT 1 page, 2 total;

    SELECT
    menu.idmenu,
    menu.titulo, 
    menu.idpadre, 
    menu.nivel,
    menu.rutaicono,
    menu.url,
    menu.orden,
    menu.idaccion,
    fn_usuario_obtienePermisoPorAccion(p_usuario,menu.idaccion) habilitado
    FROM    (
            SELECT  fn_conectado_por_padre_igual_previo_id(idmenu) AS id, @level AS nivel
            FROM    (
                    SELECT  @start_with := 0,
                            @id := @start_with,
                            @level := 0
                    ) variables, se_menu
            WHERE   @id IS NOT NULL
            ) menuJerarquia, se_menu menu
    WHERE menu.idmenu = menuJerarquia.id;
END$$

