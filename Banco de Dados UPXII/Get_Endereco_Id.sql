-- CREATE DATABASE db_upxII;
USE db_upxII;

/*	Function wich retrives the adress' id from its registry contents.
*/

-- DROP FUNCTION get_endereco_id;
CREATE FUNCTION get_endereco_id(
	endereco_rua_in VARCHAR(50),
    	endereco_no_in INT,
   	endereco_bairro_in VARCHAR(50),
    	endereco_cep_in INT,
    	endereco_complemento_in VARCHAR(50)
) RETURNS INT DETERMINISTIC
RETURN (
	SELECT Endereco_Id FROM tbl_enderecos
		WHERE Endereco_Rua = endereco_rua_in
		AND Endereco_No = endereco_no_in
		AND Endereco_Bairro = endereco_bairro_in
		AND Endereco_CEP = endereco_cep_in
		AND Endereco_Complemento = endereco_complemento_in
	);
