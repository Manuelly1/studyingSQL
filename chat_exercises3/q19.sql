-- Mostre o nome do cliente e o total gasto por ele, ordenado do maior para o menor

SELECT t1.nome,
       sum(t2.valor_total) AS total

FROM clientes1 AS t1

LEFT JOIN pedidos1 AS t2
    ON t1.id_cliente = t2.id_cliente

GROUP BY t1.id_cliente, t1.nome

ORDER BY total DESC;