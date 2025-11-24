-- Mostre o valor total gasto por cada cliente

SELECT t1.nome,
       sum(valor_total) AS valorTotal

FROM clientes1 AS t1

LEFT JOIN pedidos1 AS t2
    ON t1.id_cliente = t2.id_cliente

GROUP BY t1.id_cliente;