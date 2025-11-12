-- Find duplicate records in a table

-- Explicações:
-- O GROUP BY IdCliente agrupa os registros pelo identificador do cliente;
-- O COUNT(*) conta quantas vezes cada IdCliente aparece na tabela;
-- O HAVING COUNT(*) > 1 filtra apenas os grupos em que o IdCliente aparece mais de uma vez, ou seja, os registros duplicados.

-- Observação: nesta base não há IDs duplicados, portanto, a consulta não retornará resultados.

SELECT IdCliente, 
       COUNT(*)

FROM clientes

GROUP BY IdCliente
HAVING COUNT(*) > 1;