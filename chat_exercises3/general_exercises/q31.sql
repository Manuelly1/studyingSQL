-- Qual foi o faturamento total em cada pedido?

SELECT t1.id_pedido,
       sum(t2.preco * t1.quantidade) AS faturamento

FROM itens_pedido1 AS t1

LEFT JOIN produtos1 AS t2
    ON t1.id_produto = t2.id_produto

GROUP BY t1.id_pedido;

