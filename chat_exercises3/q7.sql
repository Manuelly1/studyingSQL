-- Mostre os pedidos ordenados pelo valor_total do maior para o menor


SELECT id_pedido,
       valor_total

FROM pedidos1

ORDER BY valor_total DESC;