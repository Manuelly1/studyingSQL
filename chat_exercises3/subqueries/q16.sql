/*

- Objetivo: Encontrar o produto mais vendido usando subquery (não usar ORDER BY + LIMIT)

*/

SELECT t1.nome_produto,
       sum(t2.quantidade) qtdeItens

FROM produtos1 AS t1

INNER JOIN itens_pedido1 AS t2
    ON t1.id_produto = t2.id_produto

GROUP BY t1.id_produto, t1.nome_produto

HAVING sum(t2.quantidade) = (

    SELECT max(totalporProduto)

    FROM (

        SELECT sum(quantidade) AS totalporProduto

        FROM itens_pedido1

        GROUP BY id_produto

    ) AS t

);