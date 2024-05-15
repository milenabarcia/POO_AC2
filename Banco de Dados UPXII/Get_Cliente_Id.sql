-- CREATE DATABASE db_upxII;
USE db_upxII;

/*	Function wich retrives the client's id from its registry contents.
*/

-- DROP FUNCTION get_cliente_id;
CREATE FUNCTION get_cliente_id(
	cliente_nome_in VARCHAR(100),
	cliente_cpf_in VARCHAR(15),
    	cliente_telefone_in VARCHAR(20)
) RETURNS INT DETERMINISTIC
RETURN (
	SELECT Cliente_Id FROM tbl_clientes
		WHERE Cliente_Nome = cliente_nome_in
		AND	Cliente_CPF = cliente_cpf_in
        AND Cliente_Telefone = cliente_telefone_in
);
