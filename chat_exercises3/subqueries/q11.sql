/*

- Objetivo: Listar os clientes cujo valor total gasto é maior que o maior gasto entre clientes que fizeram apenas 1 pedido

*/

SELECT t1.nome,
       sum(t2.valor_total) AS totalGasto

FROM clientes1 AS t1

INNER JOIN pedidos1 AS t2
    ON t1.id_cliente = t2.id_cliente

GROUP BY t1.id_cliente, t1.nome

HAVING sum(t2.valor_total) > (

    SELECT max(total)

    FROM (
    
        SELECT id_cliente,
               sum(valor_total) AS total,
               count(id_pedido) AS qtdePedidos

        FROM pedidos1

        GROUP BY id_cliente 

        HAVING count(id_pedido) = 1

    ) sub

);