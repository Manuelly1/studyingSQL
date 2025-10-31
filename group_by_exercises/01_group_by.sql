-- Objetivo: Contar a quantidade de clientes que possuem e-mail cadastrado

-- Diferentes formas de resolver:

-- Forma 1: Somar a coluna flEmail (1 = cliente com e-mail, 0 = sem e-mail)
SELECT sum(flEmail)
FROM clientes;

-- Forma 2: Contar as linhas em que flEmail = 1
SELECT count(*)
FROM clientes
WHERE flEmail = 1;

