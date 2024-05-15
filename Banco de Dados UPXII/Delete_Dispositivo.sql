-- CREATE DATABASE db_upxII;
USE db_upxII;

/* 	Encapsulation for devices deletion.
	It automatically deletes any relation conected to the device.
*/

-- DROP PROCEDURE delete_dispositivo;
DELIMITER $
CREATE PROCEDURE delete_dispositivo(
	dispositivo_id_in INT
)
BEGIN 
	DELETE FROM tbl_dispositivos WHERE Dispositivo_Id = dispositivo_id_in;
   	DELETE FROM tbl_endereco_dispositivo WHERE Dispositivo_Id = dispositivo_id_in;
END $
DELIMITER ;
