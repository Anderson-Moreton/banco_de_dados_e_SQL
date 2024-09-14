/* Modelagem Básica */

CLIENTE

NOME
CPF
EMAIL
TELEFONE
ENDEREÇO
SEXO

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

CREATE TABLE JOGADORES(
	IDJOGADOR INT,
	NOME VARCHAR(30),
	ESTADO CHAR(2)
);

INSERT INTO JOGADORES VALUES(1,'GUERRERO','RS');
INSERT INTO JOGADORES VALUES(2,'GABIGOL','RJ');
INSERT INTO JOGADORES VALUES(3,'GANSO','RJ');
INSERT INTO JOGADORES VALUES(4,'NENÊ', 'RJ');
INSERT INTO JOGADORES VALUES(5,'LOVE','SP');

CREATE VIEW V_JOGADORES AS
SELECT NOME, ESTADO
FROM JOGADORES;

SELECT * FROM V_JOGADORES;

DELETE FROM V_JOGADORES
WHERE NOME = 'GUERRERO';

INSERT INTO V_JOGADORES VALUES('GUERRERO','RS');

SELECT * FROM JOGADORES;

mysql> SELECT * FROM JOGADORES;
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
WHERE SEXO = 'F';

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
		C.SEXO, 
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

-- DCL - DATA CONTROL LANGUAGE
-- TCL - TRANSACTION CONTROL LANGUAGE