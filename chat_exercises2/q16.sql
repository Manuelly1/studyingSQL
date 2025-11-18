-- Objetivo: Listar os produtos mais lucrativos (maior soma de valor vendido)

SELECT 
    t1.DescNomeProduto,
    SUM(t2.QtdeProduto * t2.vlProduto) AS totalVendido

FROM produtos AS t1

INNER JOIN transacao_produto AS t2
    ON t1.IdProduto = t2.IdProduto

GROUP BY t1.IdProduto

ORDER BY totalVendido DESC;

