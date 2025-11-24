-- Quantos pedidos foram realizados no total?

SELECT 
       count(DISTINCT id_pedido) AS totalPedidos

FROM pedidos1;