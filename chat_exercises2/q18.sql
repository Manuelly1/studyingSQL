-- Objetivo: Encontrar o cliente que comprou mais itens no total (não valor, mas quantidade)

-- SUM(t2.QtdeProduto) soma todas as unidades compradas por cliente;
-- GROUP BY t1.IdCliente agrupa por cliente;
-- ORDER BY totalItens DESC ordena do maior para o menor.

SELECT 
    t1.IdCliente,
    SUM(t2.QtdeProduto) AS totalItens

FROM transacoes AS t1

INNER JOIN transacao_produto AS t2
    ON t1.IdTransacao = t2.IdTransacao

GROUP BY t1.IdCliente

ORDER BY totalItens DESC

LIMIT 1;