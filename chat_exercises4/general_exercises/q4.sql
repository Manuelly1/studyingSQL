/*

- Objetivo: Mostrar o nome do cliente e o valor_total de todos os pedidos

*/

SELECT t1.nome,
       sum(t2.valor_total) AS total

FROM clientesE as t1

LEFT JOIN pedidosE AS t2
    ON t1.id_cliente = t2.id_cliente

GROUP BY t1.id_cliente, t1.nome;