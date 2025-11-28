-- Produto que gerou maior faturamento

-- faturamento = quantidade x preço

SELECT t1.nome_produto,
       sum(t1.preco * t2.quantidade) AS faturamento

FROM produtos1 AS t1

INNER JOIN itens_pedido1 AS t2
    ON t1.id_produto = t2.id_produto

GROUP BY t1.id_produto, t1.nome_produto

ORDER BY faturamento DESC

LIMIT 1;