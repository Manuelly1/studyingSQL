/*

- Objetivo: Listar os clientes cujo maior valor de pedido é maior do que o maior pedido do cliente Pedro Albuquerque

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

WHERE t4.preco > (

    SELECT max(t8.preco)

    FROM pedidosE AS t5

    INNER JOIN clientesE AS t6
        ON t5.id_cliente = t6.id_cliente

    INNER JOIN itens_pedidoE AS t7
        ON t5.id_pedido = t7.id_pedido

    INNER JOIN produtosE AS t8
        ON t7.id_produto = t8.id_produto

    WHERE t6.nome = 'Pedro Albuquerque'
    
);