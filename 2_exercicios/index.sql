CREATE DATABASE OFICINA_JOSE;

USE OFICINA_JOSE;

CREATE TABLE CLIENTE(
    IDCLIENTE INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    NOME VARCHAR(30) NOT NULL,
    EMAIL VARCHAR(30) NOT NULL,
    CPF CHAR(11) NOT NULL,
    SEXO ENUM('M', 'F'),
    ID_CARRO INT UNIQUE
);

CREATE TABLE TELEFONE(
    IDTELEFONE INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    TIPO ENUM('CEL', 'RES', 'COM') NOT NULL,
    NUMERO VARCHAR(9) NOT NULL,
    ID_CLIENTE INT 
);

CREATE TABLE CARRO(
    IDCARRO INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    PLACA CHAR(10) NOT NULL UNIQUE,
    MODELO VARCHAR(20) NOT NULL,
    ID_MARCA INT
);

CREATE TABLE MARCA (
    IDMARCA INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    MARCA VARCHAR(20) UNIQUE
);

CREATE TABLE COR(
    IDCOR INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    COR VARCHAR(20)
);


CREATE TABLE CARRO_COR (
    ID_CARRO INT,
    ID_COR INT,
    PRIMARY KEY (ID_CARRO, ID_COR)
);

ALTER TABLE TELEFONE
ADD CONSTRAINT FK_TELEFONE_CLIENTE
FOREIGN KEY (ID_CLIENTE)
REFERENCES CLIENTE(IDCLIENTE);

ALTER TABLE CLIENTE
ADD CONSTRAINT FK_CLIENTE_CARRO
FOREIGN KEY (ID_CARRO)
REFERENCES CARRO(IDCARRO);

ALTER TABLE CARRO
ADD CONSTRAINT FK_CARRO_MARCA
FOREIGN KEY (ID_MARCA)
REFERENCES MARCA(IDMARCA);

ALTER TABLE CARRO_COR
ADD CONSTRAINT FK_COR
FOREIGN KEY (ID_COR)
REFERENCES COR(IDCOR);

ALTER TABLE CARRO_COR
ADD CONSTRAINT FK_CARRO
FOREIGN KEY (ID_CARRO)
REFERENCES CARRO(IDCARRO);