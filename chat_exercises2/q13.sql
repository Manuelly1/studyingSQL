-- Objetivo: Mostrar os clientes que compraram mais de 3 vezes

-- LEFT JOIN → garante que todos os clientes apareçam (mesmo quem nunca comprou);
-- COUNT(t2.IdTransacao) → conta quantas compras o cliente fez;
-- GROUP BY → agrupa por cliente;
-- HAVING COUNT > 3 → filtro aplicado depois da agregação.

SELECT 
    t1.IdCliente,
    COUNT(t2.IdTransacao) AS totalTransacoes

FROM clientes AS t1

LEFT JOIN transacoes AS t2
    ON t1.IdCliente = t2.IdCliente

GROUP BY t1.IdCliente

HAVING COUNT(t2.IdTransacao) > 3;