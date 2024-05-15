-- CREATE DATABASE db_upxII;
USE db_upxII;

-- Creating "raw" VIEWs just for testing purposes
CREATE OR REPLACE VIEW vw_clientes_raw AS SELECT * FROM tbl_clientes;
CREATE OR REPLACE VIEW vw_enderecos_raw AS SELECT * FROM tbl_enderecos;
CREATE OR REPLACE VIEW vw_dispositivos_raw AS SELECT * FROM tbl_dispositivos;
CREATE OR REPLACE VIEW vw_cliente_endereco_raw AS SELECT * FROM tbl_cliente_endereco;
CREATE OR REPLACE VIEW vw_endereco_dispositivo_raw AS SELECT * FROM tbl_endereco_dispositivo;

-- Creating the log deletion VIEWs
CREATE OR REPLACE VIEW vw_delete_logs_cli AS SELECT * FROM tbl_delete_logs_cli;
CREATE OR REPLACE VIEW vw_delete_logs_end AS SELECT * FROM tbl_delete_logs_end;
CREATE OR REPLACE VIEW vw_delete_logs_dis AS SELECT * FROM tbl_delete_logs_dis;

-- Creating more complex VIEWs
CREATE OR REPLACE VIEW vw_relacionamentos_raw AS 
	SELECT 
		tbl_cliente_endereco.Cliente_Id AS 'Id Cliente',
        	tbl_cliente_endereco.Endereco_Id AS 'Id Endereço',
        	tbl_endereco_dispositivo.Dispositivo_Id AS 'Id Dispositivo'
	FROM tbl_cliente_endereco
    	LEFT JOIN tbl_endereco_dispositivo
		ON tbl_cliente_endereco.Endereco_Id = tbl_endereco_dispositivo.Endereco_Id
	ORDER BY Cliente_Id
;

CREATE OR REPLACE VIEW vw_relacionamentos AS
	SELECT 
		tbl_clientes.Cliente_Nome AS 'Cliente',
        	CONCAT(tbl_enderecos.Endereco_Rua, ', nº', tbl_enderecos.Endereco_No) AS 'Endereço',
        	tbl_dispositivos.Dispositivo_NoSerie AS 'Dispositivo'
	FROM tbl_clientes
    	RIGHT JOIN tbl_cliente_endereco
		ON tbl_clientes.Cliente_Id = tbl_cliente_endereco.Cliente_Id
	JOIN tbl_enderecos
		ON tbl_cliente_endereco.Endereco_Id = tbl_enderecos.Endereco_Id
	RIGHT JOIN tbl_endereco_dispositivo
		ON tbl_enderecos.Endereco_Id = tbl_endereco_dispositivo.Endereco_Id
	JOIN tbl_dispositivos
		ON tbl_endereco_dispositivo.Dispositivo_Id = tbl_dispositivos.Dispositivo_Id
	ORDER BY Cliente_Nome
;

CREATE OR REPLACE VIEW vw_cliente_dispositivo_raw AS
	SELECT 
		tbl_cliente_endereco.Cliente_Id AS 'Id Cliente',
        	tbl_endereco_dispositivo.Dispositivo_Id AS 'Id Dispositivo'
	FROM tbl_cliente_endereco
	JOIN tbl_endereco_dispositivo
		ON tbl_cliente_endereco.Endereco_Id = tbl_endereco_dispositivo.Endereco_Id
	ORDER BY Cliente_Id
;

CREATE OR REPLACE VIEW vw_cliente_dispositivo AS
	SELECT 
		tbl_clientes.Cliente_Nome AS 'Cliente',
        	tbl_dispositivos.Dispositivo_NoSerie AS 'Número de Série'
	FROM tbl_dispositivos
    	JOIN tbl_endereco_dispositivo
		ON tbl_dispositivos.Dispositivo_Id = tbl_endereco_dispositivo.Dispositivo_Id
	JOIN tbl_cliente_endereco
		ON tbl_endereco_dispositivo.Endereco_Id = tbl_cliente_endereco.Endereco_Id
	JOIN tbl_clientes
		ON tbl_cliente_endereco.Cliente_Id = tbl_clientes.Cliente_Id
	ORDER BY Cliente_Nome
;

CREATE OR REPLACE VIEW vw_clientes AS
	SELECT
		Cliente_Nome AS 'Cliente',
		Cliente_CPF AS 'CPF',
		Cliente_Telefone AS 'Telefone'
	FROM tbl_clientes
    	ORDER BY Cliente_Nome
;

CREATE OR REPLACE VIEW vw_enderecos AS
	SELECT 
		tbl_clientes.Cliente_Nome AS 'Cliente',
        	tbl_enderecos.Endereco_Rua AS 'Rua',
        	tbl_enderecos.Endereco_No AS 'Número',
        	tbl_enderecos.Endereco_Complemento AS 'Complemento'
	FROM tbl_clientes
    	JOIN tbl_cliente_endereco
		ON tbl_clientes.Cliente_Id = tbl_cliente_endereco.Cliente_Id
	JOIN tbl_enderecos
		ON tbl_cliente_endereco.Endereco_Id = tbl_enderecos.Endereco_Id
	ORDER BY Cliente_Nome
;

CREATE OR REPLACE VIEW vw_dispositivos AS 
	SELECT
		tbl_clientes.Cliente_Nome AS 'Cliente',
        	CONCAT(tbl_enderecos.Endereco_Rua, ', nº', tbl_enderecos.Endereco_No) AS 'Endereço',
		tbl_dispositivos.Dispositivo_NoSerie AS 'Número de Série',
        	tbl_dispositivos.Dispositivo_FluxoTotalDeAgua AS 'Consumo Total'
	FROM tbl_dispositivos
	LEFT JOIN tbl_endereco_dispositivo
		ON tbl_dispositivos.Dispositivo_Id = tbl_endereco_dispositivo.Dispositivo_Id
	JOIN tbl_enderecos
		ON tbl_endereco_dispositivo.Endereco_Id = tbl_enderecos.Endereco_Id
	LEFT JOIN tbl_cliente_endereco
		ON tbl_enderecos.Endereco_Id = tbl_cliente_endereco.Endereco_Id
	JOIN tbl_clientes
		ON tbl_cliente_endereco.Cliente_Id = tbl_clientes.Cliente_Id
	ORDER BY Cliente_Nome
;        
