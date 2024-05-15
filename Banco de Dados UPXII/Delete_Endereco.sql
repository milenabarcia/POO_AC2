-- CREATE DATABASE db_upxII;
USE db_upxII;

/* 	Encapsulation for adress deletion.
	It automatically deletes any relation conected to the adress.
*/

-- DROP PROCEDURE delete_endereco;
DELIMITER $
CREATE PROCEDURE delete_endereco(
	endereco_id_in INT
)
BEGIN 
	DELETE FROM tbl_enderecos WHERE Endereco_Id = endereco_id_in;
	DELETE FROM tbl_cliente_endereco WHERE Endereco_Id = endereco_id_in;
	DELETE FROM tbl_endereco_dispositivo WHERE Endereco_Id = endereco_id_in;
END $
DELIMITER ;
