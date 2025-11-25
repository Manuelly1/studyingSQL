-- Liste apenas os clientes que fizeram somente 1 pedido

SELECT t1.nome,
       count(t2.id_pedido) AS totalPedidos

FROM clientes1 AS t1

INNER JOIN pedidos1 AS t2
    ON t1.id_cliente = t2.id_cliente

GROUP BY t1.id_cliente

HAVING count(t2.id_pedido) = 1;
