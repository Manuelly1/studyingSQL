-- Objetivo: Mostrar o total de itens vendidos por cada produto

SELECT IdProduto,
       SUM(QtdeProduto) AS qtTotal

FROM transacao_produto

GROUP BY IdProduto;