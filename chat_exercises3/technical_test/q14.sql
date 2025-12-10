/*

- Objetivo: Considere as tabelas: clientes e pedidos. Liste: nome do cliente, total gasto (soma dos pedidos) e 
quantidade de pedidos. Apenas para clientes que gastaram acima de 1000

*/

SELECT t1.nome,
       sum(t2.valor_total) AS totalGasto,
       count(t2.id_pedido) AS qtdePedidos

FROM clientesE AS t1

INNER JOIN pedidosE AS t2
    ON t1.id_cliente = t2.id_cliente

GROUP BY t1.id_cliente, t1.nome

HAVING sum(t2.valor_total) > 1000;