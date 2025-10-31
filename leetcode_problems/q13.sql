-- Escreva uma solução para encontrar os nomes de todos os vendedores que não tiveram nenhum pedido relacionado à empresa com o 
-- nome "RED"

-- Explicações:
-- Para cada vendedor, o subquery procura qualquer pedido para a empresa RED;
-- Se encontrar algum, o vendedor não é incluído no resultado;
-- Se não encontrar nenhum, o vendedor entra na lista;
-- Para cada vendedor s, verifica se não existe nenhum pedido (Orders) ligado a empresa 'RED';
-- JOIN Company c → para achar o com_id da empresa 'RED';
-- NOT EXISTS → garante que só irá pegar os vendedores sem pedidos para a RED.

SELECT s.name
FROM SalesPerson s
WHERE NOT EXISTS (

    SELECT 1
    FROM Orders o

    JOIN Company c 
      ON o.com_id = c.com_id

    WHERE o.sales_id = s.sales_id
      AND c.name = 'RED'

);
