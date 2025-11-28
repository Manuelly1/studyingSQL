-- Para cada produto, mostre: quantidade total vendida e valor total arrecadado

SELECT t1.nome_produto,
       sum(t2.quantidade) AS qtdeVendida,
       sum(t1.preco * t2.quantidade) AS totalArrecadado

FROM produtos1 AS t1

LEFT JOIN itens_pedido1 AS t2
    ON t1.id_produto = t2.id_produto

GROUP BY t1.nome_produto, t1.id_produto;