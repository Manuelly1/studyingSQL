-- Exiba: nome do cliente, total de pedidos, quantidade total de itens comprados e valor total gasto

SELECT t1.nome,
       count(DISTINCT t2.id_pedido) AS totalPedidos,
       sum(t3.quantidade) AS qtTotalItens,
       sum(t3.quantidade * t4.preco) AS valorGasto

FROM clientes1 AS t1

LEFT JOIN pedidos1 AS t2
    ON t1.id_cliente = t2.id_cliente

LEFT JOIN itens_pedido1 AS t3
    ON t2.id_pedido = t3.id_pedido

LEFT JOIN produtos1 AS t4
    ON t3.id_produto = t4.id_produto

GROUP BY t1.nome

ORDER BY valorGasto DESC;