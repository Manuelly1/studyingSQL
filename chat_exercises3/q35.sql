-- Qual categoria teve maior faturamento?

SELECT t1.categoria,
       sum(t1.preco * t2.quantidade) AS totalArrecadado

FROM produtos1 AS t1

LEFT JOIN itens_pedido1 AS t2
    ON t1.id_produto = t2.id_produto

GROUP BY t1.categoria

ORDER BY totalArrecadado DESC

LIMIT 1;