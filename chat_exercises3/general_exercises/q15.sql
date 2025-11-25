-- Liste os pedidos junto com o nome do cliente

SELECT t1.id_pedido,
       t1.data_pedido,
       t2.nome

FROM pedidos1 AS t1

INNER JOIN clientes1 AS t2
    ON t1.id_cliente = t2.id_cliente;