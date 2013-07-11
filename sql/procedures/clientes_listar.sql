delimiter $$
CREATE PROCEDURE `clientes_listar`( 
IN p_nombre VARCHAR(25),
p_page INT,
p_limit INT,
p_sidx VARCHAR(25), 
p_sord VARCHAR(25),
OUT size INT,
OUT totalpages INT
)
BEGIN 
	DECLARE p_start INT DEFAULT 0 ;
	IF(p_page=1) 
		THEN set p_start=0;
		ELSE set p_start=p_page*p_limit;
	END IF;
	select count(*) INTO size from clientes;

	select ceil(count(*)/p_limit) INTO totalpages from clientes;

	select * from clientes 
	where nombres like CONCAT('%',p_nombre,'%')
	LIMIT p_start,p_limit;

END$$