-- Liste o nome do cliente, data do pedido e valor_total

SELECT t1.nome,
       t2.data_pedido,
       t2.valor_total

FROM clientes1 AS t1

INNER JOIN pedidos1 AS t2
    ON t1.id_cliente = t2.id_cliente;
