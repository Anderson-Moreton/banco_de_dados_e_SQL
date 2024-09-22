/* Modelagem Básica */

CLIENTE

NOME
CPF
EMAIL
TELEFONE
ENDEREÇO
sexo

INSERT INTO cliente VALUES (NULL, 'Anderson', 'M', 'anderson.moreton@gmail.com', '06529564918');
INSERT INTO cliente VALUES (NULL, 'Priscila', 'F', 'pri.moreton@gmail.com', '06529564919');
INSERT INTO cliente VALUES (NULL, 'Otavio', 'M', 'otavio.moreton@gmail.com', '06529564920');
INSERT INTO cliente VALUES (NULL, 'Brunno', 'M', 'brunno.moreton@gmail.com', '06529564921');
INSERT INTO cliente VALUES (NULL, 'Gabriel', 'M', 'gabriel.moreton@gmail.com', '06529564922');
INSERT INTO cliente VALUES (NULL, 'Fabiana', 'F', 'fabi.moreton@gmail.com', '06529564923');

+-----------+----------+------+----------------------------+-------------+
| idCliente | nome     | sexo | email                      | cpf         |
+-----------+----------+------+----------------------------+-------------+
|         1 | Anderson | M    | anderson.moreton@gmail.com | 06529564918 |
|         2 | Priscila | F    | pri.moreton@gmail.com      | 06529564919 |
|         3 | Otavio   | M    | otavio.moreton@gmail.com   | 06529564920 |
|         4 | Brunno   | M    | brunno.moreton@gmail.com   | 06529564921 |
|         5 | Gabriel  | M    | gabriel.moreton@gmail.com  | 06529564922 |
|         6 | Fabiana  | F    | fabi.moreton@gmail.com     | 06529564923 |
+-----------+----------+------+----------------------------+-------------+

INSERT INTO endereco VALUES (NULL, 'Rua A', 'Centro', 'São Paulo', 'SP', 1);
INSERT INTO endereco VALUES (NULL, 'Rua B', 'Lapa', 'São Paulo', 'SP', 2);
INSERT INTO endereco VALUES (NULL, 'Rua C', 'Limão', 'São Paulo', 'SP', 3);
INSERT INTO endereco VALUES (NULL, 'Rua D', 'Bela Vista', 'São Paulo', 'SP', 4);
INSERT INTO endereco VALUES (NULL, 'Rua E', 'CIdade Domitila', 'São Paulo', 'SP', 5);
INSERT INTO endereco VALUES (NULL, 'Rua F', 'Casa Verde', 'São Paulo', 'SP', 6);

+------------+-------+-----------------+-----------+--------+------------+
| idEndereco | rua   | bairro          | cidade    | estado | id_cliente |
+------------+-------+-----------------+-----------+--------+------------+
|          1 | Rua A | Centro          | São Paulo | SP     |          1 |
|          2 | Rua B | Lapa            | São Paulo | SP     |          2 |
|          3 | Rua C | Limão           | São Paulo | SP     |          3 |
|          4 | Rua D | Bela Vista      | São Paulo | SP     |          4 |
|          5 | Rua E | CIdade Domitila | São Paulo | SP     |          5 |
|          6 | Rua F | Casa Verde      | São Paulo | SP     |          6 |
+------------+-------+-----------------+-----------+--------+------------+
INSERT INTO telefone VALUES (NULL, 'CEL', '911916416', 1);
INSERT INTO telefone VALUES (NULL, 'COM', '211916416', 1);
INSERT INTO telefone VALUES (NULL, 'CEL', '911916417', 2);
INSERT INTO telefone VALUES (NULL, 'COM', '211916418', 2);
INSERT INTO telefone VALUES (NULL, 'RES', '311916416', 2);
INSERT INTO telefone VALUES (NULL, 'CEL', '911916420', 4);
INSERT INTO telefone VALUES (NULL, 'CEL', '911916422', 5);
INSERT INTO telefone VALUES (NULL, 'CEL', '911916423', 6);
INSERT INTO telefone VALUES (NULL, 'RES', '311916424', 6);

+------------+------+-----------+------------+
| idTelefone | tipo | numero    | id_cliente |
+------------+------+-----------+------------+
|          1 | CEL  | 911916416 |          1 |
|          2 | COM  | 211916416 |          1 |
|          3 | CEL  | 911916417 |          2 |
|          4 | COM  | 211916418 |          2 |
|          5 | RES  | 311916416 |          2 |
|          6 | CEL  | 911916420 |          4 |
|          7 | CEL  | 911916422 |          5 |
|          8 | CEL  | 911916423 |          6 |
|          9 | RES  | 311916424 |          6 |
+------------+------+-----------+------------+

-- SELEÇÃO, PROJEÇÃO E JUNÇÃO

-- Projeção é tudo que você quer ver na tela.
SELECT NOW() AS data_atual;

SELECT 2 + 2 AS soma;

SELECT 2 + 3 AS soma, nome, NOW()
FROM cleinte;

-- Seleção é um subconjunto do conjunto total de registros de uma tabela.
-- A clasula de seleção é o where.

SELECT nome, sexo, email /*PROJEÇÃO*/
FROM cliente /*ORIGEM*/
WHERE sexo = 'F'; /*SELEÇÃO*/

SELECT numero
FROM telefone
WHERE tipo = 'CEL';

-- JUNÇÃO - JOIN -> 

SELECT nome, sexo, email, tipo, numero
FROM cliente
INNER JOIN telefone
ON idCliente = id_cliente;
+----------+------+----------------------------+------+-----------+
| nome     | sexo | email                      | tipo | numero    |
+----------+------+----------------------------+------+-----------+
| Anderson | M    | anderson.moreton@gmail.com | CEL  | 911916416 |
| Anderson | M    | anderson.moreton@gmail.com | COM  | 211916416 |
| Priscila | F    | pri.moreton@gmail.com      | CEL  | 911916417 |
| Priscila | F    | pri.moreton@gmail.com      | COM  | 211916418 |
| Priscila | F    | pri.moreton@gmail.com      | RES  | 311916416 |
| Brunno   | M    | brunno.moreton@gmail.com   | CEL  | 911916420 |
| Gabriel  | M    | gabriel.moreton@gmail.com  | CEL  | 911916422 |
| Fabiana  | F    | fabi.moreton@gmail.com     | CEL  | 911916423 |
| Fabiana  | F    | fabi.moreton@gmail.com     | RES  | 311916424 |
+----------+------+----------------------------+------+-----------+

SELECT cliente.nome, cliente.sexo, endereco.bairro, endereco.cidade, telefone.tipo, telefone.numero
FROM cliente
INNER JOIN endereco
ON cliente.idCliente = endereco.id_cliente
INNER JOIN telefone
ON cliente.idCliente = telefone.id_cliente;
+----------+------+-----------------+-----------+------+-----------+
| nome     | sexo | bairro          | cidade    | tipo | numero    |
+----------+------+-----------------+-----------+------+-----------+
| Anderson | M    | Centro          | São Paulo | CEL  | 911916416 |
| Anderson | M    | Centro          | São Paulo | COM  | 211916416 |
| Priscila | F    | Lapa            | São Paulo | CEL  | 911916417 |
| Priscila | F    | Lapa            | São Paulo | COM  | 211916418 |
| Priscila | F    | Lapa            | São Paulo | RES  | 311916416 |
| Brunno   | M    | Bela Vista      | São Paulo | CEL  | 911916420 |
| Gabriel  | M    | CIdade Domitila | São Paulo | CEL  | 911916422 |
| Fabiana  | F    | Casa Verde      | São Paulo | CEL  | 911916423 |
| Fabiana  | F    | Casa Verde      | São Paulo | RES  | 311916424 |
+----------+------+-----------------+-----------+------+-----------+

-- DML - DATA MANIPULATION LANGUAGE

INSERT INTO cliente VALUES (NULL, 'Paula', 'M', NULL, 065299645);
INSERT INTO endereco VALUES (NULL, 'Rua do C', 'Zoológico', 'São Paulo', 'SP', 7);

-- FILTROS
SELECT * FROM cliente
WHERE sexo = "M";

-- UPDATE
SELECT * FROM cliente
WHERE idCliente = 7;

UPDATE cliente
SET sexo = 'F'
WHERE idCliente = 7;

UPDATE cliente
SET cpf = '06529964928'
WHERE idCLiente = 7;

-- DELETE

INSERT INTO cliente VALUES (NULL, 'XXX', 'M', NULL, 06529964545);

SELECT * FROM cliente
WHERE idCliente = 8;

DELETE FROM cliente WHERE idCliente = 8;

-- DDL - DATA DEFINITION LANGUAGE

CREATE TABLE produto (
    idProduto INT PRIMARY KEY AUTO_INCREMENT,
    nome_produto VARCHAR(30) NOT NULL,
    preco INT,
    frete FLOAT(10,2) NOT NULL
);

-- ALTER TABLE
-- ALTERANDO O NOME DE UMA COLUNA _ CHANGE
ALTER TABLE produto
CHANGE preco valor_unitario INT NOT NULL;
+----------------+-------------+------+-----+---------+----------------+
| Field          | Type        | Null | Key | Default | Extra          |
+----------------+-------------+------+-----+---------+----------------+
| idProduto      | int(11)     | NO   | PRI | NULL    | auto_increment |
| nome_produto   | varchar(30) | NO   |     | NULL    |                |
| valor_unitario | int(11)     | NO   |     | NULL    |                |
| frete          | float(10,2) | NO   |     | NULL    |                |
+----------------+-------------+------+-----+---------+----------------+

-- MODIFY O TIPO
ALTER TABLE produto
MODIFY valor_unitario VARCHAR(50) NOT NULL;
+----------------+-------------+------+-----+---------+----------------+
| Field          | Type        | Null | Key | Default | Extra          |
+----------------+-------------+------+-----+---------+----------------+
| idProduto      | int(11)     | NO   | PRI | NULL    | auto_increment |
| nome_produto   | varchar(30) | NO   |     | NULL    |                |
| valor_unitario | varchar(50) | NO   |     | NULL    |                |
| frete          | float(10,2) | NO   |     | NULL    |                |
+----------------+-------------+------+-----+---------+----------------+

-- ADICIONANDO COLUNAS
ALTER TABLE produto
ADD peso FLOAT(10,2) NOT NULL;
+----------------+-------------+------+-----+---------+----------------+
| Field          | Type        | Null | Key | Default | Extra          |
+----------------+-------------+------+-----+---------+----------------+
| idProduto      | int(11)     | NO   | PRI | NULL    | auto_increment |
| nome_produto   | varchar(30) | NO   |     | NULL    |                |
| valor_unitario | varchar(50) | NO   |     | NULL    |                |
| frete          | float(10,2) | NO   |     | NULL    |                |
| peso           | float(10,2) | NO   |     | NULL    |                |
+----------------+-------------+------+-----+---------+----------------+

-- APAGANDO UMA COLUNA
ALTER TABLE produto
DROP COLUMN peso;
+----------------+-------------+------+-----+---------+----------------+
| Field          | Type        | Null | Key | Default | Extra          |
+----------------+-------------+------+-----+---------+----------------+
| idProduto      | int(11)     | NO   | PRI | NULL    | auto_increment |
| nome_produto   | varchar(30) | NO   |     | NULL    |                |
| valor_unitario | varchar(50) | NO   |     | NULL    |                |
| frete          | float(10,2) | NO   |     | NULL    |                |
+----------------+-------------+------+-----+---------+----------------+

-- ADICIONANDO UMA COLUNA NUMA ORDEM ESPECIFICA
ALTER TABLE produto
ADD COLUMN peso FLOAT(10,2) NOT NULL
AFTER nome_produto;
+----------------+-------------+------+-----+---------+----------------+
| Field          | Type        | Null | Key | Default | Extra          |
+----------------+-------------+------+-----+---------+----------------+
| idProduto      | int(11)     | NO   | PRI | NULL    | auto_increment |
| nome_produto   | varchar(30) | NO   |     | NULL    |                |
| peso           | float(10,2) | NO   |     | NULL    |                |
| valor_unitario | varchar(50) | NO   |     | NULL    |                |
| frete          | float(10,2) | NO   |     | NULL    |                |
+----------------+-------------+------+-----+---------+----------------+

-- ADICIONANDO UMA COLUNA NA PRIMEIRA LINHA
ALTER TABLE produto
ADD COLUMN primeiro INT NOT NULL
FIRST;
+----------------+-------------+------+-----+---------+----------------+
| Field          | Type        | Null | Key | Default | Extra          |
+----------------+-------------+------+-----+---------+----------------+
| primeiro       | int(11)     | NO   |     | NULL    |                |
| idProduto      | int(11)     | NO   | PRI | NULL    | auto_increment |
| nome_produto   | varchar(30) | NO   |     | NULL    |                |
| peso           | float(10,2) | NO   |     | NULL    |                |
| valor_unitario | varchar(50) | NO   |     | NULL    |                |
| frete          | float(10,2) | NO   |     | NULL    |                |
+----------------+-------------+------+-----+---------+----------------+

-- EXERCÍCIOS DML

INSERT INTO cliente VALUES(NULL,'Flavio','M','flavio@ig.com','4657765');
INSERT INTO cliente VALUES(NULL,'Andre','M','andre@globo.com','7687567');
INSERT INTO cliente VALUES(NULL,'Giovanna','F',NULL,'0876655');
INSERT INTO cliente VALUES(NULL,'Karla','M','karla@gmail.com','545676778');
INSERT INTO cliente VALUES(NULL,'Daniele','M','daniele@gmail.com','43536789');
INSERT INTO cliente VALUES(NULL,'Lorena','M',NULL,'774557887');
INSERT INTO cliente VALUES(NULL,'Eduardo','M',NULL,'54376457');
INSERT INTO cliente VALUES(NULL,'Antonio','F','antonio@ig.com','12436767');
INSERT INTO cliente VALUES(NULL,'Antonio','M','antonio@uol.com','3423565');
INSERT INTO cliente VALUES(NULL,'Elaine','M','elaine@globo.com','32567763');
INSERT INTO cliente VALUES(NULL,'Carmem','M','carmem@ig.com','787832213');
INSERT INTO cliente VALUES(NULL,'Adriana','F','adriana@gmail.com','88556942');
INSERT INTO cliente VALUES(NULL,'Joica','F','joice@gmail.com','55412256');

INSERT INTO endereco VALUES(NULL,'Rua Guedes','Cascadura','Belo Horizonte','MG',9);
INSERT INTO endereco VALUES(NULL,'Rua Maia Lacerda','Estacio','Rio de Jaineiro','RJ',10);
INSERT INTO endereco VALUES(NULL,'Rua Viscondessa','Centro','Rio de Jaineiro','RJ',11);
INSERT INTO endereco VALUES(NULL,'Rua Nelson Mandela','Copacabana','Rio de Jaineiro','RJ',12);
INSERT INTO endereco VALUES(NULL,'Rua Araujo Lima','Centro','Vitoria','ES',13);
INSERT INTO endereco VALUES(NULL,'Rua Castro Alves','Leblon','Rio de Jaineiro','RJ',14);
INSERT INTO endereco VALUES(NULL,'Av Capitao Antunes','Centro','Curitiba','PR',15);
INSERT INTO endereco VALUES(NULL,'Av Carlos Barroso','Jardins','Sao Paulo','SP',16);
INSERT INTO endereco VALUES(NULL,'Alameda Sampaio','Bom Retiro','Curitiba','PR',17);
INSERT INTO endereco VALUES(NULL,'Rua da Lapa','Lapa','Sao Paulo','SP',18);
INSERT INTO endereco VALUES(NULL,'Rua Geronimo','Centro','Rio de Jaineiro','RJ',19);
INSERT INTO endereco VALUES(NULL,'Rua Gomes Freire','Centro','Rio de Jaineiro','RJ',20);
INSERT INTO endereco VALUES(NULL,'Rua Gomes Freire','Centro','Rio de Jaineiro','RJ',21);

INSERT INTO telefone VALUES(NULL,'RES','68976565',9);
INSERT INTO telefone VALUES(NULL,'CEL','99656675',9);
INSERT INTO telefone VALUES(NULL,'CEL','33567765',11);
INSERT INTO telefone VALUES(NULL,'CEL','88668786',11);
INSERT INTO telefone VALUES(NULL,'COM','55689654',11);
INSERT INTO telefone VALUES(NULL,'COM','88687979',12);
INSERT INTO telefone VALUES(NULL,'COM','88965676',13);
INSERT INTO telefone VALUES(NULL,'CEL','89966809',15);
INSERT INTO telefone VALUES(NULL,'COM','88679978',16);
INSERT INTO telefone VALUES(NULL,'CEL','99655768',17);
INSERT INTO telefone VALUES(NULL,'RES','89955665',18);
INSERT INTO telefone VALUES(NULL,'RES','77455786',19);
INSERT INTO telefone VALUES(NULL,'RES','89766554',19);
INSERT INTO telefone VALUES(NULL,'RES','77755785',20);
INSERT INTO telefone VALUES(NULL,'COM','44522578',20);

-- Relatório Geral de todos os clientes
DESC cliente;
DESC endereco;
DESC telefone;

SELECT  C.idCliente, C.nome, C.sexo, C.email, C.cpf, 
        E.rua, E.bairro, E.cidade, E.estado, 
        T.tipo, T.numero
FROM cliente C
INNER JOIN endereco E
ON C.idCliente = E.id_cliente
INNER JOIN telefone T
ON C.idCliente = T.id_cliente;
+-----------+----------+------+----------------------------+-------------+--------------------+-----------------+-----------------+--------+------+-----------+
| idCliente | nome     | sexo | email                      | cpf         | rua                | bairro          | cidade          | estado | tipo | numero    |
+-----------+----------+------+----------------------------+-------------+--------------------+-----------------+-----------------+--------+------+-----------+
|         1 | Anderson | M    | anderson.moreton@gmail.com | 06529564918 | Rua A              | Centro          | São Paulo       | SP     | CEL  | 911916416 |
|         1 | Anderson | M    | anderson.moreton@gmail.com | 06529564918 | Rua A              | Centro          | São Paulo       | SP     | COM  | 211916416 |
|         2 | Priscila | F    | pri.moreton@gmail.com      | 06529564919 | Rua B              | Lapa            | São Paulo       | SP     | CEL  | 911916417 |
|         2 | Priscila | F    | pri.moreton@gmail.com      | 06529564919 | Rua B              | Lapa            | São Paulo       | SP     | COM  | 211916418 |
|         2 | Priscila | F    | pri.moreton@gmail.com      | 06529564919 | Rua B              | Lapa            | São Paulo       | SP     | RES  | 311916416 |
|         4 | Brunno   | M    | brunno.moreton@gmail.com   | 06529564921 | Rua D              | Bela Vista      | São Paulo       | SP     | CEL  | 911916420 |
|         5 | Gabriel  | M    | gabriel.moreton@gmail.com  | 06529564922 | Rua E              | CIdade Domitila | São Paulo       | SP     | CEL  | 911916422 |
|         6 | Fabiana  | F    | fabi.moreton@gmail.com     | 06529564923 | Rua F              | Casa Verde      | São Paulo       | SP     | CEL  | 911916423 |
|         6 | Fabiana  | F    | fabi.moreton@gmail.com     | 06529564923 | Rua F              | Casa Verde      | São Paulo       | SP     | RES  | 311916424 |
|         9 | Flavio   | M    | flavio@ig.com              | 4657765     | Rua Guedes         | Cascadura       | Belo Horizonte  | MG     | RES  | 68976565  |
|         9 | Flavio   | M    | flavio@ig.com              | 4657765     | Rua Guedes         | Cascadura       | Belo Horizonte  | MG     | CEL  | 99656675  |
|        11 | Giovanna | F    | NULL                       | 0876655     | Rua Viscondessa    | Centro          | Rio de Jaineiro | RJ     | CEL  | 33567765  |
|        11 | Giovanna | F    | NULL                       | 0876655     | Rua Viscondessa    | Centro          | Rio de Jaineiro | RJ     | CEL  | 88668786  |
|        11 | Giovanna | F    | NULL                       | 0876655     | Rua Viscondessa    | Centro          | Rio de Jaineiro | RJ     | COM  | 55689654  |
|        12 | Karla    | M    | karla@gmail.com            | 545676778   | Rua Nelson Mandela | Copacabana      | Rio de Jaineiro | RJ     | COM  | 88687979  |
|        13 | Daniele  | M    | daniele@gmail.com          | 43536789    | Rua Araujo Lima    | Centro          | Vitoria         | ES     | COM  | 88965676  |
|        15 | Eduardo  | M    | NULL                       | 54376457    | Av Capitao Antunes | Centro          | Curitiba        | PR     | CEL  | 89966809  |
|        16 | Antonio  | F    | antonio@ig.com             | 12436767    | Av Carlos Barroso  | Jardins         | Sao Paulo       | SP     | COM  | 88679978  |
|        17 | Antonio  | M    | antonio@uol.com            | 3423565     | Alameda Sampaio    | Bom Retiro      | Curitiba        | PR     | CEL  | 99655768  |
|        18 | Elaine   | M    | elaine@globo.com           | 32567763    | Rua da Lapa        | Lapa            | Sao Paulo       | SP     | RES  | 89955665  |
|        19 | Carmem   | M    | carmem@ig.com              | 787832213   | Rua Geronimo       | Centro          | Rio de Jaineiro | RJ     | RES  | 77455786  |
|        19 | Carmem   | M    | carmem@ig.com              | 787832213   | Rua Geronimo       | Centro          | Rio de Jaineiro | RJ     | RES  | 89766554  |
|        20 | Adriana  | F    | adriana@gmail.com          | 88556942    | Rua Gomes Freire   | Centro          | Rio de Jaineiro | RJ     | RES  | 77755785  |
|        20 | Adriana  | F    | adriana@gmail.com          | 88556942    | Rua Gomes Freire   | Centro          | Rio de Jaineiro | RJ     | COM  | 44522578  |
+-----------+----------+------+----------------------------+-------------+--------------------+-----------------+-----------------+--------+------+-----------+


-- Relatório de clientes homens
SELECT  C.idCliente, C.nome, C.sexo, C.email, C.cpf, 
        E.rua, E.bairro, E.cidade, E.estado, 
        T.tipo, T.numero
FROM cliente C
INNER JOIN endereco E
ON C.idCliente = E.id_cliente
INNER JOIN telefone T
ON C.idCliente = T.id_cliente
WHERE sexo = 'M';
+-----------+----------+------+----------------------------+-------------+--------------------+-----------------+-----------------+--------+------+-----------+
| idCliente | nome     | sexo | email                      | cpf         | rua                | bairro          | cidade          | estado | tipo | numero    |
+-----------+----------+------+----------------------------+-------------+--------------------+-----------------+-----------------+--------+------+-----------+
|         1 | Anderson | M    | anderson.moreton@gmail.com | 06529564918 | Rua A              | Centro          | São Paulo       | SP     | CEL  | 911916416 |
|         1 | Anderson | M    | anderson.moreton@gmail.com | 06529564918 | Rua A              | Centro          | São Paulo       | SP     | COM  | 211916416 |
|         4 | Brunno   | M    | brunno.moreton@gmail.com   | 06529564921 | Rua D              | Bela Vista      | São Paulo       | SP     | CEL  | 911916420 |
|         5 | Gabriel  | M    | gabriel.moreton@gmail.com  | 06529564922 | Rua E              | CIdade Domitila | São Paulo       | SP     | CEL  | 911916422 |
|         9 | Flavio   | M    | flavio@ig.com              | 4657765     | Rua Guedes         | Cascadura       | Belo Horizonte  | MG     | RES  | 68976565  |
|         9 | Flavio   | M    | flavio@ig.com              | 4657765     | Rua Guedes         | Cascadura       | Belo Horizonte  | MG     | CEL  | 99656675  |
|        12 | Karla    | M    | karla@gmail.com            | 545676778   | Rua Nelson Mandela | Copacabana      | Rio de Jaineiro | RJ     | COM  | 88687979  |
|        13 | Daniele  | M    | daniele@gmail.com          | 43536789    | Rua Araujo Lima    | Centro          | Vitoria         | ES     | COM  | 88965676  |
|        15 | Eduardo  | M    | NULL                       | 54376457    | Av Capitao Antunes | Centro          | Curitiba        | PR     | CEL  | 89966809  |
|        17 | Antonio  | M    | antonio@uol.com            | 3423565     | Alameda Sampaio    | Bom Retiro      | Curitiba        | PR     | CEL  | 99655768  |
|        18 | Elaine   | M    | elaine@globo.com           | 32567763    | Rua da Lapa        | Lapa            | Sao Paulo       | SP     | RES  | 89955665  |
|        19 | Carmem   | M    | carmem@ig.com              | 787832213   | Rua Geronimo       | Centro          | Rio de Jaineiro | RJ     | RES  | 77455786  |
|        19 | Carmem   | M    | carmem@ig.com              | 787832213   | Rua Geronimo       | Centro          | Rio de Jaineiro | RJ     | RES  | 89766554  |
+-----------+----------+------+----------------------------+-------------+--------------------+-----------------+-----------------+--------+------+-----------+

-- Tem erros de dados, mulheres inseridas como masculino. Precisa editar os IDs 12, 13, 18 e 19
-- Para evitar de dar o UPDATE no id errado, fazer a seleção e conferência antes de editar.
SELECT * FROM cliente
WHERE idCliente IN (12,12,18,19);
+-----------+--------+------+------------------+-----------+
| idCliente | nome   | sexo | email            | cpf       |
+-----------+--------+------+------------------+-----------+
|        12 | Karla  | M    | karla@gmail.com  | 545676778 |
|        18 | Elaine | M    | elaine@globo.com | 32567763  |
|        19 | Carmem | M    | carmem@ig.com    | 787832213 |
+-----------+--------+------+------------------+-----------+

UPDATE cliente
SET sexo = 'F'
WHERE idCliente IN (12, 13, 18, 19);
+-----------+--------+------+------------------+-----------+
| idCliente | nome   | sexo | email            | cpf       |
+-----------+--------+------+------------------+-----------+
|        12 | Karla  | F    | karla@gmail.com  | 545676778 |
|        18 | Elaine | F    | elaine@globo.com | 32567763  |
|        19 | Carmem | F    | carmem@ig.com    | 787832213 |
+-----------+--------+------+------------------+-----------+


-- Relatório de clientes mulheres
SELECT  C.idCliente, C.nome, C.sexo, C.email, C.cpf, 
        E.rua, E.bairro, E.cidade, E.estado, 
        T.tipo, T.numero
FROM cliente C
INNER JOIN endereco E
ON C.idCliente = E.id_cliente
INNER JOIN telefone T
ON C.idCliente = T.id_cliente
WHERE sexo = 'F';
+-----------+----------+------+------------------------+-------------+--------------------+------------+-----------------+--------+------+-----------+
| idCliente | nome     | sexo | email                  | cpf         | rua                | bairro     | cidade          | estado | tipo | numero    |
+-----------+----------+------+------------------------+-------------+--------------------+------------+-----------------+--------+------+-----------+
|         2 | Priscila | F    | pri.moreton@gmail.com  | 06529564919 | Rua B              | Lapa       | São Paulo       | SP     | CEL  | 911916417 |
|         2 | Priscila | F    | pri.moreton@gmail.com  | 06529564919 | Rua B              | Lapa       | São Paulo       | SP     | COM  | 211916418 |
|         2 | Priscila | F    | pri.moreton@gmail.com  | 06529564919 | Rua B              | Lapa       | São Paulo       | SP     | RES  | 311916416 |
|         6 | Fabiana  | F    | fabi.moreton@gmail.com | 06529564923 | Rua F              | Casa Verde | São Paulo       | SP     | CEL  | 911916423 |
|         6 | Fabiana  | F    | fabi.moreton@gmail.com | 06529564923 | Rua F              | Casa Verde | São Paulo       | SP     | RES  | 311916424 |
|        11 | Giovanna | F    | NULL                   | 0876655     | Rua Viscondessa    | Centro     | Rio de Jaineiro | RJ     | CEL  | 33567765  |
|        11 | Giovanna | F    | NULL                   | 0876655     | Rua Viscondessa    | Centro     | Rio de Jaineiro | RJ     | CEL  | 88668786  |
|        11 | Giovanna | F    | NULL                   | 0876655     | Rua Viscondessa    | Centro     | Rio de Jaineiro | RJ     | COM  | 55689654  |
|        12 | Karla    | F    | karla@gmail.com        | 545676778   | Rua Nelson Mandela | Copacabana | Rio de Jaineiro | RJ     | COM  | 88687979  |
|        13 | Daniele  | F    | daniele@gmail.com      | 43536789    | Rua Araujo Lima    | Centro     | Vitoria         | ES     | COM  | 88965676  |
|        16 | Antonio  | F    | antonio@ig.com         | 12436767    | Av Carlos Barroso  | Jardins    | Sao Paulo       | SP     | COM  | 88679978  |
|        18 | Elaine   | F    | elaine@globo.com       | 32567763    | Rua da Lapa        | Lapa       | Sao Paulo       | SP     | RES  | 89955665  |
|        19 | Carmem   | F    | carmem@ig.com          | 787832213   | Rua Geronimo       | Centro     | Rio de Jaineiro | RJ     | RES  | 77455786  |
|        19 | Carmem   | F    | carmem@ig.com          | 787832213   | Rua Geronimo       | Centro     | Rio de Jaineiro | RJ     | RES  | 89766554  |
|        20 | Adriana  | F    | adriana@gmail.com      | 88556942    | Rua Gomes Freire   | Centro     | Rio de Jaineiro | RJ     | RES  | 77755785  |
|        20 | Adriana  | F    | adriana@gmail.com      | 88556942    | Rua Gomes Freire   | Centro     | Rio de Jaineiro | RJ     | COM  | 44522578  |
+-----------+----------+------+------------------------+-------------+--------------------+------------+-----------------+--------+------+-----------+
-- Tem erros de dados, homem inserido como feminino. Precisa editar o ID 16.
-- Para evitar de dar o UPDATE no id errado, fazer a seleção e conferência antes de editar.
SELECT * FROM cliente
WHERE idCliente = 16;
+-----------+---------+------+----------------+----------+
| idCliente | nome    | sexo | email          | cpf      |
+-----------+---------+------+----------------+----------+
|        16 | Antonio | F    | antonio@ig.com | 12436767 |
+-----------+---------+------+----------------+----------+

UPDATE cliente
SET sexo = 'M'
WHERE idCliente = 16;

-- Quantidade de homens e mulheres
SELECT sexo, COUNT(sexo) AS total
FROM cliente
GROUP BY sexo;
+------+-------+
| sexo | total |
+------+-------+
| M    |    10 |
| F    |    10 |
+------+-------+

-- IDs e email da mulheres que morem no centro do Rio de Janeiro e não tenham celular;
SELECT C.idCliente, C.email, C.nome, C.sexo, T.tipo, E.bairro, E.cidade
FROM cliente C
INNER JOIN endereco E
ON C.idCliente = E.id_cliente
INNER JOIN telefone T
ON C.idCliente = T.id_cliente
WHERE sexo = 'F'
AND bairro = 'Centro' AND cidade = 'Rio de Janeiro'
AND (tipo = 'RES' OR tipo = 'COM');
+-----------+-------------------+----------+------+------+--------+----------------+
| idCliente | email             | nome     | sexo | tipo | bairro | cidade         |
+-----------+-------------------+----------+------+------+--------+----------------+
|        11 | NULL              | Giovanna | F    | COM  | Centro | Rio de Janeiro |
|        19 | carmem@ig.com     | Carmem   | F    | RES  | Centro | Rio de Janeiro |
|        19 | carmem@ig.com     | Carmem   | F    | RES  | Centro | Rio de Janeiro |
|        20 | adriana@gmail.com | Adriana  | F    | RES  | Centro | Rio de Janeiro |
|        20 | adriana@gmail.com | Adriana  | F    | COM  | Centro | Rio de Janeiro |
+-----------+-------------------+----------+------+------+--------+----------------+


-- Para uma campanha de marketing, o setor solicitou um Relatório com o nome, email, e telefone celular 
-- dos clientes que moram no estado do Rio de Janeiro.
-- Você terá que passar a query para gerar um relatório para o programador.
SELECT C.nome, C.email, T.tipo, T.numero, E.estado
FROM cliente C
INNER JOIN endereco E
ON C.idCliente = E.id_cliente
INNER JOIN telefone T
ON C.idCliente = T.id_cliente
WHERE tipo = 'CEL'
AND estado = 'RJ';
+----------+-------+------+----------+--------+
| nome     | email | tipo | numero   | estado |
+----------+-------+------+----------+--------+
| Giovanna | NULL  | CEL  | 88668786 | RJ     |
+----------+-------+------+----------+--------+

-- Para uma campanha de produtos de beleza, o comercial solicitou um relatório com nome, email, e telefone celular 
-- das mulheres que moram no estado de São Paulo.
-- Você terá que passar a query para gerar o relatório para o programador.
SELECT C.nome, C.email, T.tipo, T.numero, E.estado
FROM cliente C
INNER JOIN endereco E
ON C.idCliente = E.id_cliente
INNER JOIN telefone T
ON C.idCliente = T.id_cliente
WHERE tipo = 'CEL'
AND sexo = 'F'
AND estado = 'SP';
+----------+------------------------+------+-----------+--------+
| nome     | email                  | tipo | numero    | estado |
+----------+------------------------+------+-----------+--------+
| Priscila | pri.moreton@gmail.com  | CEL  | 911916417 | SP     |
| Fabiana  | fabi.moreton@gmail.com | CEL  | 911916423 | SP     |
+----------+------------------------+------+-----------+--------+

-- Função IFNULL()
SELECT  C.nome, 
        IFNULL(C.email, '*************'), 
        T.tipo, 
        T.numero, 
        E.estado
FROM cliente C
INNER JOIN endereco E
ON C.idCliente = E.id_cliente
INNER JOIN telefone T
ON C.idCliente = T.id_cliente;
+----------+----------------------------------+------+-----------+--------+
| nome     | IFNULL(C.email, '*************') | tipo | numero    | estado |
+----------+----------------------------------+------+-----------+--------+
| Anderson | anderson.moreton@gmail.com       | CEL  | 911916416 | SP     |
| Anderson | anderson.moreton@gmail.com       | COM  | 211916416 | SP     |
| Priscila | pri.moreton@gmail.com            | CEL  | 911916417 | SP     |
| Priscila | pri.moreton@gmail.com            | COM  | 211916418 | SP     |
| Priscila | pri.moreton@gmail.com            | RES  | 311916416 | SP     |
| Brunno   | brunno.moreton@gmail.com         | CEL  | 911916420 | SP     |
| Gabriel  | gabriel.moreton@gmail.com        | CEL  | 911916422 | SP     |
| Fabiana  | fabi.moreton@gmail.com           | CEL  | 911916423 | SP     |
| Fabiana  | fabi.moreton@gmail.com           | RES  | 311916424 | SP     |
| Flavio   | flavio@ig.com                    | RES  | 68976565  | MG     |
| Flavio   | flavio@ig.com                    | CEL  | 99656675  | MG     |
| Giovanna | *************                    | RES  | 33567765  | RJ     |
| Giovanna | *************                    | CEL  | 88668786  | RJ     |
| Giovanna | *************                    | COM  | 55689654  | RJ     |
| Karla    | karla@gmail.com                  | COM  | 88687979  | RJ     |
| Daniele  | daniele@gmail.com                | COM  | 88965676  | ES     |
| Eduardo  | *************                    | CEL  | 89966809  | PR     |
| Antonio  | antonio@ig.com                   | COM  | 88679978  | SP     |
| Antonio  | antonio@uol.com                  | CEL  | 99655768  | PR     |
| Elaine   | elaine@globo.com                 | RES  | 89955665  | SP     |
| Carmem   | carmem@ig.com                    | RES  | 77455786  | RJ     |
| Carmem   | carmem@ig.com                    | RES  | 89766554  | RJ     |
| Adriana  | adriana@gmail.com                | RES  | 77755785  | RJ     |
| Adriana  | adriana@gmail.com                | COM  | 44522578  | RJ     |
+----------+----------------------------------+------+-----------+--------+

-- VIEW
CREATE VIEW relatorio AS
SELECT  C.idCliente, 
        C.nome, 
        C.email, 
        T.tipo, 
        T.numero, 
        E.bairro, 
        E.cidade, 
        E.estado
FROM cliente C
INNER JOIN endereco E
ON C.idCliente = E.id_cliente
INNER JOIN telefone T
ON C.idCLiente = T.id_cliente;
+-----------+----------+----------------------------+------+-----------+-----------------+----------------+--------+
| idCliente | nome     | email                      | tipo | numero    | bairro          | cidade         | estado |
+-----------+----------+----------------------------+------+-----------+-----------------+----------------+--------+
|         1 | Anderson | anderson.moreton@gmail.com | CEL  | 911916416 | Centro          | São Paulo      | SP     |
|         1 | Anderson | anderson.moreton@gmail.com | COM  | 211916416 | Centro          | São Paulo      | SP     |
|         2 | Priscila | pri.moreton@gmail.com      | CEL  | 911916417 | Lapa            | São Paulo      | SP     |
|         2 | Priscila | pri.moreton@gmail.com      | COM  | 211916418 | Lapa            | São Paulo      | SP     |
|         2 | Priscila | pri.moreton@gmail.com      | RES  | 311916416 | Lapa            | São Paulo      | SP     |
|         4 | Brunno   | brunno.moreton@gmail.com   | CEL  | 911916420 | Bela Vista      | São Paulo      | SP     |
|         5 | Gabriel  | gabriel.moreton@gmail.com  | CEL  | 911916422 | CIdade Domitila | São Paulo      | SP     |
|         6 | Fabiana  | fabi.moreton@gmail.com     | CEL  | 911916423 | Casa Verde      | São Paulo      | SP     |
|         6 | Fabiana  | fabi.moreton@gmail.com     | RES  | 311916424 | Casa Verde      | São Paulo      | SP     |
|         9 | Flavio   | flavio@ig.com              | RES  | 68976565  | Cascadura       | Belo Horizonte | MG     |
|         9 | Flavio   | flavio@ig.com              | CEL  | 99656675  | Cascadura       | Belo Horizonte | MG     |
|        11 | Giovanna | NULL                       | RES  | 33567765  | Centro          | Rio de Janeiro | RJ     |
|        11 | Giovanna | NULL                       | CEL  | 88668786  | Centro          | Rio de Janeiro | RJ     |
|        11 | Giovanna | NULL                       | COM  | 55689654  | Centro          | Rio de Janeiro | RJ     |
|        12 | Karla    | karla@gmail.com            | COM  | 88687979  | Copacabana      | Rio de Janeiro | RJ     |
|        13 | Daniele  | daniele@gmail.com          | COM  | 88965676  | Centro          | Vitoria        | ES     |
|        15 | Eduardo  | NULL                       | CEL  | 89966809  | Centro          | Curitiba       | PR     |
|        16 | Antonio  | antonio@ig.com             | COM  | 88679978  | Jardins         | Sao Paulo      | SP     |
|        17 | Antonio  | antonio@uol.com            | CEL  | 99655768  | Bom Retiro      | Curitiba       | PR     |
|        18 | Elaine   | elaine@globo.com           | RES  | 89955665  | Lapa            | Sao Paulo      | SP     |
|        19 | Carmem   | carmem@ig.com              | RES  | 77455786  | Centro          | Rio de Janeiro | RJ     |
|        19 | Carmem   | carmem@ig.com              | RES  | 89766554  | Centro          | Rio de Janeiro | RJ     |
|        20 | Adriana  | adriana@gmail.com          | RES  | 77755785  | Centro          | Rio de Janeiro | RJ     |
|        20 | Adriana  | adriana@gmail.com          | COM  | 44522578  | Centro          | Rio de Janeiro | RJ     |
+-----------+----------+----------------------------+------+-----------+-----------------+----------------+--------+

-- Saber views criadas
SHOW TABLES;

-- Apagando uma View
DROP VIEW relatorio;

/* UPDATE, INSERT E DELETE - DML */

INSERT INTO V_RELATORIO VALUES(
'ANDREIA','F','ANDREIA@UOL.COM.BR','CEL','873547864','CENTRO','VITORIA','ES'
);

ERROR 1394 (HY000): Can not insert into join view 'comercio.v_relatorio' without fields list
ERROR 1395 (HY000): Can not delete from join view 'comercio.v_relatorio'

DELETE FROM V_RELATORIO WHERE NOME = 'JORGE';

/* É PERMITIDO FAZER UPDATES EM VIEWS COM JOIN */

UPDATE V_RELATORIO SET NOME = 'JOSE' WHERE NOME = 'JORGE';

CREATE TABLE jogadores(
	IDJOGADOR INT,
	NOME VARCHAR(30),
	ESTADO CHAR(2)
);

INSERT INTO jogadores VALUES(1,'GUERRERO','RS');
INSERT INTO jogadores VALUES(2,'GABIGOL','RJ');
INSERT INTO jogadores VALUES(3,'GANSO','RJ');
INSERT INTO jogadores VALUES(4,'NENÊ', 'RJ');
INSERT INTO jogadores VALUES(5,'LOVE','SP');

CREATE VIEW V_JOGADORES AS
SELECT NOME, ESTADO
FROM jogadores;

SELECT * FROM V_JOGADORES;

DELETE FROM V_JOGADORES
WHERE NOME = 'GUERRERO';

INSERT INTO V_JOGADORES VALUES('GUERRERO','RS');

SELECT * FROM jogadores;

SELECT * FROM jogadores;
+-----------+----------+--------+
| IDJOGADOR | NOME     | ESTADO |
+-----------+----------+--------+
|         2 | GABIGOL  | RJ     |
|         3 | GANSO    | RJ     |
|         4 | NENÊ     | RJ     |
|         5 | LOVE     | SP     |
|      NULL | GUERRERO | RS     |
+-----------+----------+--------+

SELECT * FROM V_RELATORIO
WHERE sexo = 'F';

/* ORDER BY */

CREATE TABLE ALUNOS(
	NUMERO INT,
	NOME VARCHAR(30)
);

INSERT INTO ALUNOS VALUES(1,'JOAO');
INSERT INTO ALUNOS VALUES(1,'MARIA');
INSERT INTO ALUNOS VALUES(2,'ZOE');
INSERT INTO ALUNOS VALUES(2,'ANDRE');
INSERT INTO ALUNOS VALUES(3,'CLARA');
INSERT INTO ALUNOS VALUES(1,'CLARA');
INSERT INTO ALUNOS VALUES(4,'MAFRA');
INSERT INTO ALUNOS VALUES(5,'JANAINA');
INSERT INTO ALUNOS VALUES(1,'JANAINA');
INSERT INTO ALUNOS VALUES(3,'MARCELO');
INSERT INTO ALUNOS VALUES(4,'GIOVANI');
INSERT INTO ALUNOS VALUES(5,'ANTONIO');
INSERT INTO ALUNOS VALUES(6,'ANA');
INSERT INTO ALUNOS VALUES(6,'VIVIANE'); 

SELECT * FROM ALUNOS
ORDER BY NUMERO;

SELECT * FROM ALUNOS
ORDER BY 1;

SELECT * FROM ALUNOS
ORDER BY 2;

/* ORDENANDO POR MAIS DE UMA COLUNA */

SELECT * FROM ALUNOS
ORDER BY 1;

SELECT * FROM ALUNOS
ORDER BY NUMERO, NOME;

SELECT * FROM ALUNOS
ORDER BY 1, 2;

/* MESCLANDO ORDER BY COM PROJECAO */

SELECT NOME FROM ALUNOS
ORDER BY 1, 2;

SELECT NOME FROM ALUNOS
ORDER BY NUMERO, NOME;


/* ORDER BY DESC / ASC */

SELECT * FROM ALUNOS
ORDER BY 1, 2;

SELECT * FROM ALUNOS
ORDER BY 1 ASC;

SELECT * FROM ALUNOS
ORDER BY 1 DESC;

SELECT * FROM ALUNOS
ORDER BY 1, 2 DESC;

SELECT * FROM ALUNOS
ORDER BY 1 DESC, 2 DESC;

/* ORDENANDO COM JOINS */


SELECT  C.NOME, 
		C.sexo, 
		IFNULL(C.EMAIL,'CLIENTE SEM EMAIL') AS "E-MAIL", 
		T.TIPO, 
		T.NUMERO, 
		E.BAIRRO, 
		E.CIDADE, 
		E.ESTADO
FROM CLIENTE C 
INNER JOIN TELEFONE T 
ON C.IDCLIENTE = T.ID_CLIENTE 
INNER JOIN ENDERECO E 
ON C.IDCLIENTE = E.ID_CLIENTE
ORDER BY 1;

SHOW TABLES;

SELECT * FROM V_RELATORIO
ORDER BY 1;

/* Delimitador */

SELECT  C.NOME, 
		C.sexo, 
		IFNULL(C.EMAIL,'CLIENTE SEM EMAIL') AS "E-MAIL", 
		T.TIPO, 
		T.NUMERO, 
		E.BAIRRO, 
		E.CIDADE, 
		E.ESTADO
FROM CLIENTE C 
INNER JOIN TELEFONE T 
ON C.IDCLIENTE = T.ID_CLIENTE 
INNER JOIN ENDERECO E 
ON C.IDCLIENTE = E.ID_CLIENTE
ORDER BY 1

STATUS

DELIMITER $

SELECT * FROM V_RELATORIO;

DELIMITER  @

DELIMITER@

DELIMITER @ @

DELIMITER ;

/* STORED PROCEDURES */

SELECT 'MAFRA';

DELIMITER $

CREATE PROCEDURE NOME()
BEGIN

	QUALQUER PROGRAMACAO;

END
$


DELIMITER $

CREATE PROCEDURE NOME_EMPRESA()
BEGIN
	
	SELECT 'UNIVERSIDADE DOS DADOS' AS EMPRESA;

END
$

/* CHAMANDO UMA PROCEDURE */


CALL NOME_EMPRESA()$

DELIMITER ;

CALL NOME_EMPRESA();

/* PROCEDURES COM PARAMETROS */

SELECT 10 + 10 AS CONTA;

DELIMITER $

CREATE PROCEDURE CONTA()
BEGIN
	
	SELECT 10 + 10 AS CONTA;

END
$

CALL CONTA();

DROP PROCEDURE CONTA;

DELIMITER $

CREATE PROCEDURE CONTA(NUMERO1 INT, NUMERO2 INT)
BEGIN
	
	SELECT NUMERO1 + NUMERO2 AS CONTA;

END
$

CALL CONTA(100,50)$
CALL CONTA(345634,4354)$
CALL CONTA(55654,56760)$
CALL CONTA(45646,6766)$

-- RECAP
CREATE DATABASE projeto;

CREATE TABLE cursos(
	idCurso INT PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(30) NOT NULL,
	horas INT(3) NOT NULL,
	valor FLOAT(10,2) NOT NULL
);

INSERT INTO cursos VALUES (NULL, 'Java', 30, 500.00);
INSERT INTO cursos VALUES (NULL, 'Fundamentos de bancos de dados', 40, 700.00);

DELIMETER $;

CREATE PROCEDURE cad_curso(p_nome VARCHAR(30),
							p_horas INT(3),
							p_preco FLOAT(10,2))
BEGIN
	INSERT INTO cursos VALUES (null, p_nome, p_horas, p_preco);
END
$

DELIMITER ;

CALL cad_curso('BI SQL Server',35,3000.00);
CALL cad_curso('Power BI', 20,1000.00);
CALL cad_curso('Tableu',30,1200.00);
+---------+--------------------------------+-------+---------+
| idCurso | nome                           | horas | valor   |
+---------+--------------------------------+-------+---------+
|       1 | Java                           |    30 |  500.00 |
|       2 | Fundamentos de bancos de dados |    40 |  700.00 |
|       3 | BI SQL Server                  |    35 | 3000.00 |
|       4 | Power BI                       |    20 | 1000.00 |
|       5 | Tableu                         |    30 | 1200.00 |
+---------+--------------------------------+-------+---------+

CALL cad_curso('Web developer FULLSTACK',200,4000.00);
CALL cad_curso('Analista de dados MYSQL',50,2500.00);

DELIMITER $

CREATE PROCEDURE ver_curso()
BEGIN
	SELECT idCurso, nome, horas, valor FROM cursos;
END
$

CALL ver_curso();
+---------+--------------------------------+-------+---------+
| idCurso | nome                           | horas | valor   |
+---------+--------------------------------+-------+---------+
|       1 | Java                           |    30 |  500.00 |
|       2 | Fundamentos de bancos de dados |    40 |  700.00 |
|       3 | BI SQL Server                  |    35 | 3000.00 |
|       4 | Power BI                       |    20 | 1000.00 |
|       5 | Tableu                         |    30 | 1200.00 |
|       6 | Web developer FULLSTACK        |   200 | 4000.00 |
|       7 | Analista de dados MYSQL        |    50 | 2500.00 |
+---------+--------------------------------+-------+---------+

A29 FUNCOES DE AGREGACAO NUMERICAS */

CREATE TABLE vendedores(
	idVendedor INT PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(30),
	sexo CHAR(1),
	janeiro FLOAT(10,2),
	fevereiro FLOAT(10,2),
	marco FLOAT(10,2)
);

INSERT INTO vendedores VALUES(NULL,'Calos','M',76234.78,88346.87,5756.90);
INSERT INTO vendedores VALUES(NULL,'Maria','F',5865.78,6768.87,4467.90);
INSERT INTO vendedores VALUES(NULL,'Antonio','M',78769.78,6685.87,6664.90);
INSERT INTO vendedores VALUES(NULL,'CLara','F',5779.78,446886.87,8965.90);
INSERT INTO vendedores VALUES(NULL,'Anderson','M',676545.78,77544.87,578665.90);
INSERT INTO vendedores VALUES(NULL,'Ivone','F',57789.78,44774.87,68665.90);
INSERT INTO vendedores VALUES(NULL,'Joao','M',4785.78,66478.87,6887.90);
INSERT INTO vendedores VALUES(NULL,'Celia','F',89667.78,57654.87,5755.90);

/* MAX - TRAZ O VALOR MAXIMO DE UMA COLUNA */

SELECT MAX(fevereiro) AS MAIOR_FEV
FROM vendedores;
+-----------+
| MAIOR_FEV |
+-----------+
| 446886.88 |
+-----------+

/* MIN - TRAZ O VALOR MINIMO DE UMA COLUNA */

SELECT MIN(fevereiro) AS MENOR_FEV
FROM vendedores;
+-----------+
| MENOR_FEV |
+-----------+
|   6685.87 |
+-----------+

/* AVG - TRAZ O VALOR MEDIO DE UMA COLUNA */

SELECT AVG(fevereiro) AS MEDIA_FEV
FROM vendedores;
+--------------+
| MEDIA_FEV    |
+--------------+
| 99392.744873 |
+--------------+

/* VARIAS FUNCOES */

SELECT MAX(janeiro) AS MAX_JAN,
       MIN(janeiro) AS MIN_JAN,
	   AVG(janeiro) AS MEDIA_JAN
	   FROM vendedores;
+-----------+---------+---------------+
| MAX_JAN   | MIN_JAN | MEDIA_JAN     |
+-----------+---------+---------------+
| 676545.75 | 4785.78 | 124429.901794 |
+-----------+---------+---------------+
	 
/*TRUNCATE */
	 
SELECT MAX(janeiro) AS MAX_JAN,
       MIN(janeiro) AS MIN_JAN,
	   TRUNCATE(AVG(janeiro),2) AS MEDIA_JAN
	   FROM vendedores;
+-----------+---------+-----------+
| MAX_JAN   | MIN_JAN | MEDIA_JAN |
+-----------+---------+-----------+
| 676545.75 | 4785.78 | 124429.90 |
+-----------+---------+-----------+

/* A30 - AGREGANDO COM SUM() */

SELECT SUM(janeiro) AS TOTAL_JAN
FROM vendedores;
+-----------+
| TOTAL_JAN |
+-----------+
| 995439.21 |
+-----------+

SELECT SUM(janeiro) AS TOTAL_JAN,
	   SUM(fevereiro) AS TOTAL_FEV,
	   SUM(marco) AS TOTAL_MAR
FROM vendedores;
+-----------+-----------+-----------+
| TOTAL_JAN | TOTAL_FEV | TOTAL_MAR |
+-----------+-----------+-----------+
| 995439.21 | 795141.96 | 685831.17 |
+-----------+-----------+-----------+

/* VENDAS POR sexo */

SELECT sexo, SUM(marco) AS TOTAL_marco
FROM vendedores
GROUP BY sexo;
+------+-------------+
| sexo | TOTAL_marco |
+------+-------------+
| F    |    87855.60 |
| M    |   597975.57 |
+------+-------------+

/* A 31 - SUBQUERIES

VENDEDOR QUE VENDEU MENOS EM MARÇO
E O SEU NOME */
SELECT nome, sexo, marco AS vendas_marco
FROM vendedores
WHERE marco = (SELECT MIN(marco) FROM vendedores);
+-------+------+-------------+
| nome  | sexo | venda_marco |
+-------+------+-------------+
| Maria | F    |     4467.90 |
+-------+------+-------------+

/*VENDEDOR QUE VENDEU MAIS EM MARÇO
E O SEU NOME */
SELECT nome, sexo, marco AS vendas_marco
FROM vendedores
WHERE marco = (SELECT MAX(marco) FROM vendedores);
+----------+------+--------------+
| nome     | sexo | vendas_marco |
+----------+------+--------------+
| Anderson | M    |    578665.88 |
+----------+------+--------------+

/*VENDEDOR QUE VENDEU MAIS DO QUE A MÉDIA DO MÊS DE FEVEREIRO
E O SEU NOME */
SELECT nome, sexo, fevereiro AS media_fevereiro
FROM vendedores
WHERE fevereiro > (SELECT AVG(fevereiro) FROM vendedores);
+-------+------+-----------------+
| nome  | sexo | media_fevereiro |
+-------+------+-----------------+
| CLara | F    |       446886.88 |
+-------+------+-----------------+

/* A32 - OPERACOES EM LINHA */

SELECT * FROM VENDEDORES;

SELECT nome,
	   janeiro,
	   fevereiro,
	   marco,
	   (janeiro+fevereiro+marco) AS "TOTAL",
	   TRUNCATE((janeiro+fevereiro+marco)/3,2) AS "MEDIA"
	   FROM vendedores;
	   
/* APLICANDO UM % */

SELECT nome,
	   janeiro,
	   fevereiro,
	   marco,
	   (janeiro+fevereiro+marco) AS "TOTAL",
	   (janeiro+fevereiro+marco) * .25 AS "DESCONTO",
	   TRUNCATE((janeiro+fevereiro+marco)/3,2) AS "MEDIA"
	   FROM vendedores;

/* A33 - ALTERANDO TABELAS */

CREATE TABLE tabela(
	coluna1 VARCHAR(30),
	coluna2 VARCHAR(30),
	coluna3 VARCHAR(30)
);

CREATE TABLE tabela(
	coluna1 INT PRIMARY KEY AUTO_INCREMENT
);

--ADICIONANDO UMA PK
ALTER TABLE tabela 
ADD PRIMARY KEY (coluna1);

--ADICIONANDO COLUNA SEM POSICAO. ULTIMA POSICAO
ALTER TABLE tabela 
ADD coluna varchar(30);

ALTER TABLE tabela 
ADD coluna100 INT;

--ADICIONANDO UMA COLUNA COM POSICAO
ALTER TABLE tabela 
ADD COLUMN coluna4 VARCHAR(30) NOT NULL UNIQUE
AFTER coluna3;

--MODIFICANDO O TIPO DE UM CAMPO
ALTER TABLE tabela
 MODIFY coluna2 DATE NOT NULL;

--RENOMEANDO O NOME DA tabela
ALTER TABLE tabela 
RENAME pessoa;

CREATE TABLE TIME(
	idTime INT PRIMARY KEY AUTO_INCREMENT,
	TIME VARCHAR(30),
	id_pessoa VARCHAR(30)
);

--Foreign key
ALTER TABLE TIME 
ADD FOREIGN KEY(id_pessoa)
REFERENCES pessoa(coluna1);

/* VERIFICAR AS CHAVES */
SHOW CREATE TABLE TIME;

/* A34 - ORGANIZACAO DE CHAVES - CONSTRAINT (REGRA) */

CREATE TABLE jogador(
	idJogador INT PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(30)
);

CREATE TABLE times(
	idTime INT PRIMARY KEY AUTO_INCREMENT,
	nomeTime VARCHAR(30),
	id_jogador INT, MySQL.""
	FOREIGN KEY(id_jogador)
	REFERENCES jogador(idJogador)
);

INSERT INTO jogador VALUES(NULL,'Dudu');
INSERT INTO TIMES VALUES(NULL,'Palmeiras',1);

SHOW CREATE TABLE jogador;
SHOW CREATE TABLE TIMES;


-- DCL - DATA CONTROL LANGUAGE
-- TCL - TRANSACTION CONTROL LANGUAGE