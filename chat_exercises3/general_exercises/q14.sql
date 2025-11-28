-- Mostre o nome do cliente e o valor dos seus pedidos

SELECT t1.nome,
       t2.valor_total

FROM clientes1 AS t1

INNER JOIN pedidos1 AS t2
    ON t1.id_cliente = t2.id_cliente

GROUP BY t1.nome;