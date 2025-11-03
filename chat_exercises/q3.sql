-- Objetivo: Listar todos os clientes cujo ID tem a letra "a"

SELECT idCliente
FROM clientes
WHERE idCliente LIKE '%a%';