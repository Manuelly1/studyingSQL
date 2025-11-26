-- Liste os clientes que já realizaram mais de 1 pedido, mostrando: nome do cliente e total de pedidos realizados

SELECT t1.nome,
       count(DISTINCT t2.id_pedido) AS totalPedidos

FROM clientes1 AS t1

INNER JOIN pedidos1 AS t2
    ON t1.id_cliente = t2.id_cliente

GROUP BY t1.nome

HAVING count(DISTINCT t2.id_pedido) > 1;

