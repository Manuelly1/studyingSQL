-- Objetivo: exibir a quantidade de clientes com e-mails cadastrados

-- Diferentes formas de resolver:

SELECT sum(flEmail)
FROM clientes;

SELECT count(*)
FROM clientes
WHERE flEmail = 1;

