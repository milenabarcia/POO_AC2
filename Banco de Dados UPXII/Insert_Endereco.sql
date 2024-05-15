-- CREATE DATABASE db_upxII;
USE db_upxII;

/* 	Encapsulation for adresses insertion.
	It automatically inserts client-adress relations
    	into its specific table.
*/

-- DROP PROCEDURE insert_endereco;
DELIMITER $
CREATE PROCEDURE insert_endereco(
	cliente_id_in INT,
	endereco_rua_in VARCHAR(50),
    	endereco_no_in INT,
    	endereco_bairro_in VARCHAR(50),
    	endereco_cep_in INT,
    	endereco_complemento_in VARCHAR(50)
)
BEGIN
	-- Sets a default value for adresses complements
	IF endereco_complemento_in IS NULL
		THEN SET endereco_complemento_in = 'NA';
	END IF;

	INSERT INTO tbl_enderecos VALUES 
    	(NULL, endereco_rua_in, endereco_no_in, endereco_bairro_in, endereco_cep_in, endereco_complemento_in);
    
    	SET @NEW_endereco_id = get_endereco_id (
		endereco_rua_in, endereco_no_in, endereco_bairro_in, endereco_cep_in, endereco_complemento_in
	);
    
    	INSERT INTO tbl_cliente_endereco VALUES 
    	(cliente_id_in, @NEW_endereco_id);
END $
DELIMITER ;
