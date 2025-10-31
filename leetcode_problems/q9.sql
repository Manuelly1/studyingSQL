-- Encontre os nomes dos clientes que são:
-- indicado por qualquer cliente com id != 2.
-- não indicado por nenhum cliente.

-- Duas formas de resolver:

-- SELECT name
-- FROM Customer
-- WHERE referee_id IS NULL OR referee_id != 2;

SELECT c.name

FROM Customer c

LEFT JOIN Customer r
ON c.referee_id = r.id

WHERE r.id IS NULL OR r.id != 2;  
