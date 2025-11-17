-- Objetivo: Mostrar o total gasto por cada cliente 

SELECT t2.IdCliente,
       SUM(t1.QtdeProduto * t1.vlProduto) AS totalGasto

FROM transacao_produto AS t1

INNER JOIN transacoes AS t2
    ON t1.IdTransacao = t2.IdTransacao

GROUP BY t2.IdCliente;