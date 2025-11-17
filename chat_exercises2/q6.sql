-- Objetivo: Mostrar o total de itens vendidos por cada produto (Usando SUM(QtdeProduto) em transacao_produto)

SELECT IdProduto,
       SUM(QtdeProduto) AS qtTotal

FROM transacao_produto

GROUP BY IdProduto;