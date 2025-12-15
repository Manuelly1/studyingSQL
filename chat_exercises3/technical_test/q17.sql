/*

- Objetivo: Listar o nome do cliente, o total gasto e a quantidade de pedidos, apenas para clientes cujo total gasto seja maior que a média de 
gasto de todos os clientes
    
*/ 

SELECT t1.nome,
       sum(t2.valor_total) AS totalGasto,
       count(t2.id_pedido) AS quantidadePedidos

FROM clientes1 AS t1

INNER JOIN pedidos1 AS t2
    ON t1.id_cliente = t2.id_cliente

GROUP BY t1.id_cliente, t1.nome

HAVING sum(t2.valor_total) > (

    SELECT avg(totalGastoCliente)
    FROM (

        SELECT t3.id_cliente,
               sum(t4.valor_total) AS totalGastoCliente

        FROM clientes1 AS t3

        INNER JOIN pedidos1 AS t4
            ON t3.id_cliente = t4.id_cliente

        GROUP BY t3.id_cliente

    ) sub
);


