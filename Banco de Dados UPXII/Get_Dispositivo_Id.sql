-- CREATE DATABASE db_upxII;
USE db_upxII;

/*	Function wich retrives the device's id from its registry contents.
*/

-- DROP FUNCTION get_dispositivo_id;
CREATE FUNCTION get_dispositivo_id (
	dispositivo_noserie_in INT
) RETURNS INT DETERMINISTIC
RETURN (
	SELECT Dispositivo_Id FROM tbl_dispositivos
		WHERE Dispositivo_NoSerie = dispositivo_noserie_in
	)
;
