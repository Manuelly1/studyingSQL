-- Quantos itens foram vendidos em cada pedido?

SELECT id_pedido,
       sum(quantidade) AS qtdeItens

FROM itens_pedido1

GROUP BY id_pedido;