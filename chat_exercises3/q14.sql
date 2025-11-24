-- Mostre o nome do cliente e o valor dos seus pedidos

SELECT t1.nome,
       t2.valor_total

FROM clientes1 AS t1

LEFT JOIN pedidos1 AS t2
    ON t1.id_cliente = t2.id_cliente;