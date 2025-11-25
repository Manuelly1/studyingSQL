-- Liste o nome dos clientes que já realizaram pelo menos um pedido

-- Demonstrei com subqueries e JOIN

SELECT t1.nome

FROM clientes1 AS t1

WHERE t1.id_cliente IN (

    SELECT id_cliente
    FROM pedidos1  

);

SELECT t1.nome

FROM clientes1 AS t1

WHERE EXISTS (

    SELECT 1
    FROM pedidos1 AS t2
    WHERE t1.id_cliente = t2.id_cliente

); 

SELECT DISTINCT t1.nome

FROM clientes1 AS t1

INNER JOIN pedidos1 AS t2
    ON t1.id_cliente = t2.id_cliente;
