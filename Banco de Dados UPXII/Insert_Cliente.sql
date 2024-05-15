-- CREATE DATABASE db_upxII;
USE db_upxII;

/* 	Encapsulation for clients insertion.
*/

-- DROP PROCEDURE insert_cliente;
DELIMITER $
CREATE PROCEDURE insert_cliente(
	cliente_nome_in VARCHAR(100),
    	cliente_cpf_in VARCHAR(15),
    	cliente_telefone_in VARCHAR(20)
)
BEGIN
	INSERT INTO tbl_clientes VALUES 
    	(NULL, cliente_nome_in, cliente_cpf_in, cliente_telefone_in);
END $
DELIMITER ;
