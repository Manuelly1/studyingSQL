-- Mostre a quantidade de pedidos realizados por cada cliente

SELECT t1.nome,
       count(t2.id_pedido) AS qtdePedidos

FROM clientes1 t1

LEFT JOIN pedidos1 t2
    ON t1.id_cliente = t2.id_cliente

GROUP BY t1.id_cliente;
