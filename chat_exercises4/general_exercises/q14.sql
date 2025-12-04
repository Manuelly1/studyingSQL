/*

- Objetivo: Listar os pedidos cujo valor_total é maior que todos os pedidos do cliente Ana Paula

*/

SELECT t1.id_pedido,
       t1.valor_total

FROM pedidosE AS t1

WHERE t1.valor_total > (

    SELECT max(t2.valor_total)

    FROM pedidosE AS t2

    INNER JOIN clientesE AS t3
        ON t2.id_cliente = t3.id_cliente

    WHERE t3.nome = 'Ana Paula'
    
);
