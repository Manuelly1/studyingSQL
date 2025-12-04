/*

- Objetivo: Encontrar o top 1 cliente que mais gastou no total (sem ORDER BY + LIMIT)

*/

SELECT t1.nome,
       sum(t2.valor_total) AS totalGastos

FROM clientesE AS t1

INNER JOIN pedidosE AS t2
    ON t1.id_cliente = t2.id_cliente

GROUP BY t1.id_cliente, t1.nome

HAVING sum(t2.valor_total) = (

    SELECT max(totalCliente)
    FROM (

        SELECT sum(valor_total) AS totalCliente
        FROM pedidosE
        GROUP BY id_cliente

    ) AS sub 

);
