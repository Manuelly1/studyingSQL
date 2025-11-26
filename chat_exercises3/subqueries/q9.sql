/*

- Objetivo: Listar os produtos que aparecem em mais pedidos do que o produto de id = 3

*/


SELECT t1.nome_produto,
       count(DISTINCT t2.id_pedido) AS qtdePedidos

FROM produtos1 AS t1

INNER JOIN itens_pedido1 AS t2
    ON t1.id_produto = t2.id_produto

GROUP BY t1.nome_produto

HAVING count(DISTINCT t2.id_pedido) > (

    SELECT count(DISTINCT t2.id_pedido)
    FROM itens_pedido1 AS t2
    WHERE t2.id_produto = 3 

);



