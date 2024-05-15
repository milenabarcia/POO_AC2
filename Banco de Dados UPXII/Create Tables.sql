-- CREATE DATABASE db_upxII;
USE db_upxII;

-- DROP TABLE tbl_clientes;
CREATE TABLE tbl_clientes (
    Cliente_Id INT PRIMARY KEY AUTO_INCREMENT,
    Cliente_Nome VARCHAR(100) NOT NULL,
    Cliente_CPF VARCHAR(15) UNIQUE NOT NULL,
    Cliente_Telefone VARCHAR(20)
);

-- DROP TABLE tbl_enderecos;
CREATE TABLE tbl_enderecos (
    Endereco_Id INT PRIMARY KEY AUTO_INCREMENT,
    Endereco_Rua VARCHAR(50),
    Endereco_No INT,
    Endereco_Bairro VARCHAR(50),
    Endereco_CEP INT,
    Endereco_Complemento VARCHAR(50)
);

-- DROP TABLE tbl_dispositivos;
CREATE TABLE tbl_dispositivos (
    Dispositivo_Id INT PRIMARY KEY AUTO_INCREMENT,
    Dispositivo_NoSerie INT UNIQUE NOT NULL,
    Dispositivo_FluxoTotalDeAgua FLOAT -- Extra (variável operacional)
);

-- Relational tables between entities

-- DROP TABLE tbl_cliente_endereco;
CREATE TABLE tbl_cliente_endereco (
    Cliente_Id INT REFERENCES tbl_clientes (Cliente_Id),
    Endereco_Id INT REFERENCES tbl_enderecos (Endereco_Id),
    PRIMARY KEY (Cliente_Id, Endereco_Id)
);

-- DROP TABLE tbl_endereco_dispositivo;
CREATE TABLE tbl_endereco_dispositivo (
    Endereco_Id INT REFERENCES tbl_enderecos (Endereco_Id),
    Dispositivo_Id INT REFERENCES tbl_dispositivos (Dispositivo_Id),
    PRIMARY KEY (Endereco_Id, Dispositivo_Id)
);
