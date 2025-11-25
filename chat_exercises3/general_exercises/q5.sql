-- Mostre todos os pedidos realizados após 01/01/2023

SELECT id_pedido,
       substr(data_pedido, 1, 10) AS data

FROM pedidos1

WHERE substr(data_pedido, 1, 10) > '2023-01-01';