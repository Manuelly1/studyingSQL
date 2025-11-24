-- Para cada categoria, mostre: quantidade de produtos vendidos e total financeiro arrecadado

SELECT t1.categoria,
       sum(t2.quantidade) AS qtdeProdutosVendidos,
       sum(t1.preco * t2.quantidade) AS totalArrecadado

FROM produtos1 AS t1

LEFT JOIN itens_pedido1 AS t2
    ON t1.id_produto = t2.id_produto

GROUP BY t1.categoria;