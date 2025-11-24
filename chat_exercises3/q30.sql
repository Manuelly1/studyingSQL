-- Qual o valor total comprado por cada cliente?

SELECT 
      t1.nome,
      sum(t2.valor_total) AS valorTotal

FROM clientes1 AS t1

LEFT JOIN pedidos1 AS t2
    ON t1.id_cliente = t2.id_cliente

GROUP BY t1.id_cliente, t1.nome

ORDER BY valorTotal DESC;