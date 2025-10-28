-- Escreva uma solução para encontrar o customer_number do cliente que fez o maior número de pedidos.

-- Deseja-se fazer:
-- Contar quantos pedidos cada cliente fez → GROUP BY customer_number
-- Pegar o cliente com maior número de pedidos → ORDER BY COUNT(*) DESC LIMIT 1

-- Aplicou-se isso:
-- GROUP BY customer_number → agrupou os pedidos por cliente
-- COUNT(*) → contou quantos pedidos cada cliente fez
-- ORDER BY COUNT(*) DESC LIMIT 1 → colocou o cliente com mais pedidos no topo

SELECT customer_number

FROM Orders

GROUP BY customer_number

ORDER BY COUNT(*) DESC

LIMIT 1;

