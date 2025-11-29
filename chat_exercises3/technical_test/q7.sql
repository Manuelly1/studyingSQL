/*

- Objetivo: Retornar os clientes que fizeram pedidos com valor acima da média dos pedidos

*/

SELECT t1.nome,
       t2.valor_total

FROM clientes1 AS t1

INNER JOIN pedidos1 AS t2
    ON t1.id_cliente = t2.id_cliente

WHERE t2.valor_total > (

    SELECT avg(valor_total)
    FROM pedidos1

);