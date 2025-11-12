-- Get the average order value for each customer

-- Explicações:
-- Foi necessário utilizar o INNER JOIN, pois o IdCliente não está presente na tabela transacao_produto. Essa tabela contém apenas 
-- as informações dos produtos das transações (quantidade e valor unitário);
-- O INNER JOIN com a tabela transacoes permite relacionar cada produto ao cliente correspondente, já que nela encontramos o campo 
-- IdCliente;
-- O cálculo do valor total de cada item do pedido é feito multiplicando QtdeProduto por vlProduto;
-- Em seguida, o agrupamento é feito por IdCliente e a função AVG() é usada para obter a média dos valores totais de pedidos 
-- realizados por cada cliente (o objetivo da consulta).

SELECT t2.IdCliente,
       AVG(t1.QtdeProduto * t1.vlProduto) AS ValorMedio

FROM transacao_produto AS t1

INNER JOIN transacoes AS t2
    ON t1.IdTransacao = t2.IdTransacao

GROUP BY t2.IdCliente;