-- Liste os produtos que nunca foram vendidos

-- Demonstrei com subqueries e JOIN

SELECT t1.nome_produto

FROM produtos1 AS t1

WHERE t1.id_produto NOT IN (

    SELECT id_produto
    FROM itens_pedido1

);


SELECT t1.nome_produto

FROM produtos1 t1

WHERE NOT EXISTS (

    SELECT 1
    FROM itens_pedido1 t2
    WHERE t2.id_produto = t1.id_produto

);


SELECT t1.nome_produto

FROM produtos1 t1

LEFT JOIN itens_pedido1 AS t2
    ON t1.id_produto = t2.id_produto

WHERE t2.id_produto IS NULL;