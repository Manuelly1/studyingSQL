/*

- Objetivo: Mostrar o produto mais caro comprado por cada cliente

*/

SELECT t1.nome,
       t4.nome_produto,
       t4.preco

FROM clientesE AS t1

INNER JOIN pedidosE AS t2
    ON t1.id_cliente = t2.id_cliente

INNER JOIN itens_pedidoE AS t3
    ON t2.id_pedido = t3.id_pedido

INNER JOIN produtosE AS t4
    ON t3.id_produto = t4.id_produto

WHERE t4.preco = (

    SELECT max(t7.preco)

    FROM pedidosE AS t5

    JOIN itens_pedidoE AS t6 
        ON t5.id_pedido = t6.id_pedido

    INNER JOIN produtosE AS t7
        ON t6.id_produto = t7.id_produto

    WHERE t5.id_cliente = t1.id_cliente

);