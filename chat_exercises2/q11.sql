-- Objetivo: Para cada transação, mostrar: ID da transação, Cliente, Data e Valor total da compra

SELECT t1.IdTransacao,
       t1.IdCliente,
       substr(t1.DtCriacao, 1, 10) AS data,
       SUM(t2.QtdeProduto * t2.vlProduto) AS valorTotal

FROM transacoes AS t1

INNER JOIN transacao_produto AS t2
    ON t1.IdTransacao = t2.IdTransacao

GROUP BY t1.IdTransacao;