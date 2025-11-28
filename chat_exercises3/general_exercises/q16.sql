-- Mostre o nome do produto e a quantidade vendida em cada pedido

-- Observação: toda coluna que aparece no SELECT e NÃO está dentro de uma função de agregação (SUM, COUNT, AVG...) precisa estar no GROUP BY.

SELECT t1.nome_produto,
       t2.id_pedido,
       sum(t2.quantidade) AS qtVendida

FROM produtos1 AS t1

INNER JOIN itens_pedido1 AS t2
    ON t1.id_produto = t2.id_produto

GROUP BY t1.nome_produto, t2.id_pedido;
