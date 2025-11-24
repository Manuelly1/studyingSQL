-- Qual o valor total vendido pela loja considerando todos os pedidos?

SELECT 
      sum(valor_total) AS totalVendido

FROM pedidos1;