/*

- Objetivo: Retornar o produto mais vendido por categoria

*/

WITH tb_vendas AS (

    SELECT t1.categoria,
           t1.nome_produto,
           sum(t2.quantidade) AS totalVendido

    FROM produtos1 AS t1

    JOIN itens_pedido1 AS t2
        ON t1.id_produto = t2.id_produto

    GROUP BY t1.categoria, t1.nome_produto

),

tb_ranking AS (

    SELECT categoria,
           nome_produto,
           totalVendido,
           ROW_NUMBER() OVER (PARTITION BY categoria ORDER BY totalVendido DESC) AS posicao

    FROM tb_vendas

)

SELECT categoria,
       nome_produto,
       totalVendido

FROM tb_ranking

WHERE posicao = 1;
