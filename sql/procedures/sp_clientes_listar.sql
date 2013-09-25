delimiter $$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_clientes_listar`( 
p_nombre VARCHAR(25),
p_page INT,
p_limit INT,
p_sidx VARCHAR(25), 
p_sord VARCHAR(25)
)
BEGIN 
	DECLARE p_start INT DEFAULT 0 ;
	/*IF(p_page=1) 
		THEN set p_start=0;
		ELSE set p_start=p_page*p_limit;
	END IF;
	*/
    set p_start=(p_page-1)*p_limit;
    
    SELECT count(*) records,  p_page page, ceil(count(*)/p_limit) total from ca_clientes;

	select * from ca_clientes 
	where p_nombre IS NULL OR nombres like CONCAT('%',p_nombre,'%')
	LIMIT p_start,p_limit;

END$$

