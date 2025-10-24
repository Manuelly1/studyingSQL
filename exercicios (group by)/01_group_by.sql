-- quantos clientes têm e-mail cadastrado?
-- diferentes formas de resolver:

SELECT sum(flEmail)
FROM clientes;

SELECT count(*)
FROM clientes
WHERE flEmail = 1;

