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
