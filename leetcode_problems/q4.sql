-- Escreva uma solução para encontrar todos os clientes que nunca pedem nada

-- Explicações:
-- LEFT JOIN conecta todas as linhas da tabela Customers com Orders. Clientes sem pedidos terão o campo o.customerId como NULL;
-- O WHERE filtra apenas esses clientes sem pedidos.

SELECT c.name AS Customers
FROM Customers AS c

LEFT JOIN Orders AS o
    ON c.id = o.customerId

WHERE o.customerId IS NULL;