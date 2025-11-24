-- Mostre o valor médio dos pedidos por cliente

SELECT t1.nome, 
       avg(t2.valor_total) AS valorMedio

FROM clientes1 AS t1

LEFT JOIN pedidos1 AS t2
    ON t1.id_cliente = t2.id_cliente

GROUP BY t1.id_cliente;
