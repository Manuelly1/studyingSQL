/*

- Objetivo: Mostrar o nome do produto e a quantidade total vendida 

*/

SELECT t1.nome_produto,
       sum(t2.quantidade) AS qtdeTotal

FROM produtosE AS t1

INNER JOIN itens_pedidoE AS t2
    ON t1.id_produto = t2.id_produto

GROUP BY t1.id_produto, t1.nome_produto;

