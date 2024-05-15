-- CREATE DATABASE db_upxII;
USE db_upxII;

/* 	Encapsulation for devices insertion.
	It automatically inserts adress-device relations
    	into its specific table.
*/

-- DROP PROCEDURE insert_dispositivo;
DELIMITER $
CREATE PROCEDURE insert_dispositivo(
    	endereco_id_in INT,
    	dispositivo_noserie_in INT
)
BEGIN
	-- Generates a random series number if none are entered
	IF dispositivo_noserie_in IS NULL 
		THEN SET dispositivo_noserie_in = create_no_serie(); 
    	END IF;
    
	INSERT INTO tbl_dispositivos VALUES 
    	(NULL, dispositivo_noserie_in, 0);
    
    	SET @NEW_dispositivo_id = get_dispositivo_id (
		dispositivo_noserie_in
	);
    
    	INSERT INTO tbl_endereco_dispositivo VALUES
    	(endereco_id_in, @NEW_dispositivo_id);
END $
DELIMITER ;
