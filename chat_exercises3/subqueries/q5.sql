-- Exiba o nome do cliente que fez o pedido de maior ID

-- Com 2 subqueries e com JOIN + uma subquery:

SELECT nome

FROM clientes1

WHERE id_cliente = (

    SELECT id_cliente
    FROM pedidos1

    WHERE id_pedido = (

        SELECT MAX(id_pedido)
        FROM pedidos1

    )
);

SELECT t1.nome

FROM clientes1 AS t1

INNER JOIN pedidos1 AS t2
    ON t1.id_cliente = t2.id_cliente

WHERE t2.id_pedido = (

    SELECT max(id_pedido)
    FROM pedidos1

);

