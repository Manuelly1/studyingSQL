-- Cliente que mais fez pedidos (por quantidade)

SELECT t1.nome,
       count(DISTINCT t2.id_pedido) AS qtdePedidos

FROM clientes1 AS t1

INNER JOIN pedidos1 AS t2
    ON t1.id_cliente = t2.id_cliente

GROUP BY t1.nome, t1.id_cliente

ORDER BY qtdePedidos DESC

LIMIT 1;
