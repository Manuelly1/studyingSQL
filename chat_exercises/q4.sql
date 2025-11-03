-- Objetivo: Mostrar somente os clientes que a DtCriacao é de 2024

SELECT substr(DtCriacao, 1, 4) AS ano, IdCliente
FROM clientes
WHERE substr(DtCriacao, 1, 4) = '2024';
