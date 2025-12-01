/*

- Objetivo: Encontrar o produto mais vendido por quantidade (não usar ORDER BY + LIMIT)

*/

SELECT t1.nome_produto,
       sum(t2.quantidade) AS qtdeItens

FROM produtosE AS t1

INNER JOIN itens_pedidoE AS t2
    ON t1.id_produto = t2.id_produto

GROUP BY t1.id_produto, t1.nome_produto

HAVING sum(t2.quantidade) = (

    SELECT max(totalPorProduto)

    FROM (

        SELECT sum(t2.quantidade) AS totalPorProduto

        FROM produtosE AS t1

        INNER JOIN itens_pedidoE AS t2
            ON t1.id_produto = t2.id_produto

        GROUP BY t1.id_produto
        
    ) AS sub

);

