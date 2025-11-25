-- Quantos clientes já fizeram pelo menos 1 pedido? 

SELECT 
      count(DISTINCT id_cliente) AS clientescomPedido

FROM pedidos1;
