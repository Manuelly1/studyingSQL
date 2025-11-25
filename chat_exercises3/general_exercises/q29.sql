-- Quanto foi arrecadado por categoria de produto?

SELECT t1.categoria,
       sum(t1.preco * t2.quantidade) AS valorArrecadado

FROM produtos1 AS t1

LEFT JOIN itens_pedido1 AS t2
    ON t1.id_produto = t2.id_produto

GROUP BY t1.categoria;