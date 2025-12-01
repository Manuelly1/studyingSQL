/*

- Objetivo: Listar os clientes que fizeram mais de 1 pedido

*/

SELECT t1.nome, 
       count(DISTINCT t2.id_pedido) AS qtdePedidos  

FROM clientesE as t1

INNER JOIN pedidosE AS t2
    ON t1.id_cliente = t2.id_cliente

GROUP BY t1.id_cliente, t1.nome

HAVING count(DISTINCT t2.id_pedido) > 1; 