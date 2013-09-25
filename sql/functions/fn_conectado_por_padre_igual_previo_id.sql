delimiter $$

CREATE DEFINER=`root`@`localhost` FUNCTION `fn_conectado_por_padre_igual_previo_id`(value INT) RETURNS int(11)
    READS SQL DATA
BEGIN
-- Simula la función CONNECT BY parent = PRIOR id
        DECLARE _id INT;
        DECLARE _parent INT;
        DECLARE _next INT;
        DECLARE CONTINUE HANDLER FOR NOT FOUND SET @id = NULL;

        SET _parent = @id;
        SET _id = -1;

        IF @id IS NULL THEN
                RETURN NULL;
        END IF;

        LOOP
                SELECT  MIN(idmenu)
                INTO    @id
                FROM    se_menu
                WHERE   idpadre = _parent
                        AND idmenu > _id;
                IF @id IS NOT NULL OR _parent = @start_with THEN
                        SET @level = @level + 1;
                        RETURN @id;
                END IF;
                SET @level := @level - 1;
                SELECT  idmenu, idpadre
                INTO    _id, _parent
                FROM    se_menu
                WHERE   idmenu = _parent;
        END LOOP;       
END$$

