/*

- Objetivo: Listar a quantidade de pedidos por cidade do cliente

*/

SELECT t1.cidade,
       count(DISTINCT t2.id_pedido) AS qtdePedidos

FROM clientesE AS t1

INNER JOIN pedidosE AS t2
    ON t1.id_cliente = t2.id_cliente

GROUP BY t1.cidade;
