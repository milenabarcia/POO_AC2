-- CREATE DATABASE db_upxII;
USE db_upxII;

/*	Data premade for testing. 
	It may probably suffice any testing needs.
*/

TRUNCATE TABLE tbl_clientes;
TRUNCATE TABLE tbl_dispositivos;
TRUNCATE TABLE tbl_enderecos;
TRUNCATE TABLE tbl_cliente_endereco;
TRUNCATE TABLE tbl_endereco_dispositivo;

/*	Base insertions for when there's no insert procedure
INSERT INTO tbl_clientes VALUES 
(NULL, 'Daniela Ohatina', '123.456.789-01', '(15) 91234-5678'),
(NULL, 'Gabriela Rosada', '234.567.890-12', '(15) 98765-4321'),
(NULL, 'Thomas Água', '345.678.901-23', '(23) 5462-8731');

INSERT INTO tbl_enderecos VALUES 
(NULL, 'Rua Dos Professores', 52, 'Facens', 12345678, 'Prédio L'),
(NULL, 'Rua Dos Alunos', 19, 'Facens', 56781234, 'Cantina'),
(NULL, 'Rua Dos Militares', 20, 'Facens', 17291729, 'Academia'),
(NULL, 'Rua Dos Programadores', 37, 'Roblox', 42684268, 'NA'),
(NULL, 'Rua Dos Mestres', 184, 'Sabe Muito', 69696969, 'Casa Do Conhecimento');

INSERT INTO tbl_dispositivos VALUES
(NULL, create_no_serie(), 0),
(NULL, create_no_serie(), 0),
(NULL, create_no_serie(), 0),
(NULL, create_no_serie(), 0),
(NULL, create_no_serie(), 0);

INSERT INTO tbl_cliente_endereco VALUES (1, 1), (1, 5), (2, 2), (3, 3), (3, 4);
INSERT INTO tbl_endereco_dispositivo VALUES (1, 1), (2, 2), (3, 3), (4, 4), (5, 5);
INSERT INTO tbl_cliente_dispositivo VALUES (1, 1), (1, 5), (2, 2), (3, 3), (3, 4);
*/

CALL insert_cliente('Daniela Ohatina', '123.456.789-01', '(15) 91234-5678');
CALL insert_cliente('Gabriela Rosada', '234.567.890-12', '(15) 98765-4321');
CALL insert_cliente('Thomas Água', '345.678.901-23', '(23) 5462-8731');

CALL insert_endereco(
	get_cliente_id('Daniela Ohatina', '123.456.789-01', '(15) 91234-5678'),
	'Rua Dos Professores', 52, 'Facens', 12345678, 'Prédio L'
);
CALL insert_endereco(
	get_cliente_id('Gabriela Rosada', '234.567.890-12', '(15) 98765-4321'),
	'Rua Dos Alunos', 19, 'Facens', 56781234, 'Cantina'
);
CALL insert_endereco(
	get_cliente_id('Thomas Água', '345.678.901-23', '(23) 5462-8731'),
	'Rua Dos Militares', 20, 'Facens', 17291729, 'Academia'
);
CALL insert_endereco(
	get_cliente_id('Thomas Água', '345.678.901-23', '(23) 5462-8731'),
	'Rua Dos Programadores', 37, 'Roblox', 42684268, 'NA'
);
CALL insert_endereco(
	get_cliente_id('Daniela Ohatina', '123.456.789-01', '(15) 91234-5678'),
	'Rua Dos Mestres', 184, 'Sabe Muito', 69696969, 'Casa Do Conhecimento'
);

CALL insert_dispositivo(
    	get_endereco_id('Rua Dos Professores', 52, 'Facens', 12345678, 'Prédio L'),
    	NULL
);
CALL insert_dispositivo(
   	get_endereco_id('Rua Dos Mestres', 184, 'Sabe Muito', 69696969, 'Casa Do Conhecimento'),
    	NULL
);
CALL insert_dispositivo(
    	get_endereco_id('Rua Dos Militares', 20, 'Facens', 17291729, 'Academia'),
    	NULL
);
CALL insert_dispositivo(
    	get_endereco_id('Rua Dos Alunos', 19, 'Facens', 56781234, 'Cantina'),
    	NULL
);
CALL insert_dispositivo(
    	get_endereco_id('Rua Dos Programadores', 37, 'Roblox', 42684268, 'NA'),
    	NULL
);

SELECT * FROM vw_relacionamentos;

CALL delete_cliente(1);
CALL delete_endereco(3);
CALL delete_dispositivo(5);

SELECT * FROM vw_relacionamentos;
SELECT * FROM vw_clientes;
SELECT * FROM vw_enderecos;
SELECT * FROM vw_dispositivos;
SELECT * FROM vw_delete_logs_cli;
SELECT * FROM vw_delete_logs_end;
SELECT * FROM vw_delete_logs_dis;
