-- CREATE DATABASE db_upxII;
USE db_upxII;

/* 	Encapsulation for clients deletion.
	It automatically deletes any relation conected to the client.
*/

-- DROP PROCEDURE delete_cliente;
DELIMITER $
CREATE PROCEDURE delete_cliente(
	cliente_id_in INT
)
BEGIN 
	DELETE FROM tbl_clientes WHERE Cliente_Id = cliente_id_in;    
    	DELETE FROM tbl_cliente_endereco WHERE Cliente_Id = cliente_id_in;
    	DELETE FROM tbl_cliente_dispositivo WHERE Cliente_Id = cliente_id_in;
END $
DELIMITER ;
