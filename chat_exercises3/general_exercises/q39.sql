-- Produto mais vendido em quantidade

SELECT t1.nome_produto,
       sum(t2.quantidade) AS qtdeProdutosVendidos

FROM produtos1 AS t1

INNER JOIN itens_pedido1 AS t2
    ON t1.id_produto = t2.id_produto

GROUP BY t1.id_produto, t1.nome_produto

ORDER BY qtdeProdutosVendidos DESC

LIMIT 1;
