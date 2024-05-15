-- CREATE DATABASE db_upxII;
USE db_upxII;

/* 	Create a new random series number, between 1 and 100000, 
	which is different from any other in the devices' table.
*/

-- DROP FUNCTION create_no_serie;
DELIMITER $
CREATE FUNCTION create_no_serie() RETURNS INT DETERMINISTIC
BEGIN
	DECLARE new_no_serie INT DEFAULT -1;
	SET new_no_serie = RAND() * 99999 + 1;
	
	WHILE -- Keeps creating a new random number until there's no match
		(SELECT Dispositivo_NoSerie FROM tbl_dispositivos WHERE Dispositivo_NoSerie = new_no_serie) IS NOT NULL
	DO
		SET new_no_serie = RAND() * 99999 + 1;
	END WHILE;

	RETURN new_no_serie;
END $
DELIMITER ;
