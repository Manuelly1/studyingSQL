/*

- Objetivo: Listar o nome do cliente e o total gasto por ele em todos os pedidos, ordenando do maior para o menor

*/

SELECT t1.nome,
       sum(t2.valor_total) AS totalGasto

FROM clientes1 AS t1

INNER JOIN pedidos1 AS t2
    ON t1.id_cliente = t2.id_cliente

GROUP BY t1.id_cliente, t1.nome

ORDER BY totalGasto DESC;
