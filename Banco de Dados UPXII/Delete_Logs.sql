-- CREATE DATABASE db_upxII;
USE db_upxII;

/* 	Log registration tables to record any deletion of entities.
*/

-- DROP TABLE tbl_delete_logs_cli;
CREATE TABLE tbl_delete_logs_cli (
	Log_Id INT PRIMARY KEY AUTO_INCREMENT,
	Log_ClienteNome VARCHAR(100),
    	Log_When DATETIME,
    	Log_Who VARCHAR(50)
); 

-- DROP TABLE tbl_delete_logs_end;
CREATE TABLE tbl_delete_logs_end (
	Log_Id INT PRIMARY KEY AUTO_INCREMENT,
	Log_Endereco VARCHAR(100),
   	Log_When DATETIME,
    	Log_Who VARCHAR(50)
);

-- DROP TABLE tbl_delete_logs_dis;
CREATE TABLE tbl_delete_logs_dis (
	Log_Id INT PRIMARY KEY AUTO_INCREMENT,
	Log_NoSerie VARCHAR(100),
    	Log_When DATETIME,
    	Log_Who VARCHAR(50)
);

-- DROP TRIGGER tr_log_deletion_cli;
DELIMITER $
CREATE TRIGGER tr_log_deletion_cli 
	AFTER DELETE ON tbl_clientes
	FOR EACH ROW
    	BEGIN
		INSERT INTO tbl_delete_logs_cli VALUES (NULL, OLD.Cliente_Nome, SYSDATE(), USER());
	END $
DELIMITER ;

-- DROP TRIGGER tr_log_deletion_end;
DELIMITER $
CREATE TRIGGER tr_log_deletion_end 
	AFTER DELETE ON tbl_enderecos
	FOR EACH ROW
   	BEGIN
		SET @OLD_endereco = CONCAT(OLD.Endereco_Rua, ', nº', OLD.Endereco_No);
		INSERT INTO tbl_delete_logs_end VALUES (NULL, @OLD_endereco, SYSDATE(), USER());
	END $
DELIMITER ;

-- DROP TRIGGER tr_log_deletion_dis;
DELIMITER $
CREATE TRIGGER tr_log_deletion_dis 
	AFTER DELETE ON tbl_dispositivos
	FOR EACH ROW
    	BEGIN
		INSERT INTO tbl_delete_logs_dis VALUES (NULL, OLD.Dispositivo_NoSerie, SYSDATE(), USER());
	END $
DELIMITER ;
