-- Para cada cliente, mostre: quantidade de pedidos realizados e valor total gasto

SELECT t1.nome,
       count(DISTINCT t2.id_pedido) AS qtdePedidos,
       sum(t2.valor_total) AS valorGasto

FROM clientes1 AS t1

LEFT JOIN pedidos1 AS t2
    ON t1.id_cliente = t2.id_cliente

GROUP BY t1.id_cliente, t1.nome;
