-- Objetivo: Listar os 5 produtos mais vendidos em quantidade

SELECT 
    IdProduto,
    SUM(QtdeProduto) AS totalVendido

FROM transacao_produto

GROUP BY IdProduto

ORDER BY count(IdProduto) DESC

LIMIT 5;