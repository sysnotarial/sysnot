delimiter $$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_indices_siguiente`( 
	p_nombre varchar(255), -- Nombre del indice
	OUT p_valor int
)
BEGIN
	declare l_valor int;
	update indices set valor = valor + 1 where nombre = p_nombre;
	select valor into p_valor from indices where nombre = p_nombre;
END$$

