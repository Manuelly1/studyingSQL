-- Mostre os clientes que NÃO possuem pedidos registrados

-- Demonstrei com subqueries e JOIN

SELECT t1.nome

FROM clientes1 AS t1

WHERE NOT EXISTS (

    SELECT 1
    FROM pedidos1 AS t2
    WHERE t2.id_cliente = t1.id_cliente

);


SELECT nome

FROM clientes1

WHERE id_cliente NOT IN (

    SELECT id_cliente
    FROM pedidos1

);


SELECT t1.nome,
       t2.id_pedido

FROM clientes1 AS t1

LEFT JOIN pedidos1 AS t2
    ON t1.id_cliente = t2.id_cliente

WHERE t2.id_pedido IS NULL;


