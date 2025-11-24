-- Mostre: total de pedidos realizados e total em dinheiro movimentado

SELECT
      count(id_pedido) AS totalPedidos,
      sum(valor_total) AS dinheiroMovimentado
      
FROM pedidos1;
