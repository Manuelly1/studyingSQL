-- Escreva uma solução para encontrar todos os clientes que nunca pedem nada.

SELECT c.name AS Customers

FROM Customers AS c

LEFT JOIN Orders AS o
ON c.id = o.customerId

WHERE o.customerId IS NULL;