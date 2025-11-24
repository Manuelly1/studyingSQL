-- Qual cliente gerou mais receita para a loja?

SELECT t1.nome,
       sum(t4.preco * t3.quantidade) AS totalGerado

FROM clientes1 AS t1

INNER JOIN pedidos1 AS t2
    ON t1.id_cliente = t2.id_cliente

INNER JOIN itens_pedido1 AS t3
    ON t2.id_pedido = t3.id_pedido

INNER JOIN produtos1 AS t4
    ON t3.id_produto = t4.id_produto

GROUP BY t1.id_cliente, t1.nome

ORDER BY totalGerado DESC

LIMIT 1;
