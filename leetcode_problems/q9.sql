-- Encontre os nomes dos clientes que:
-- 1) Foram indicados por qualquer cliente que não seja o de id = 2;
-- 2) Ou não foram indicados por nenhum cliente

-- Duas formas de resolver:
-- Filtrar diretamente na coluna referee_id: WHERE referee_id IS NULL OR referee_id != 2;
-- Usar LEFT JOIN nele mesmo para obter os dados do cliente que indicou (referee) e filtrar: WHERE r.id IS NULL OR r.id != 2.

-- Forma 1:
SELECT name
FROM Customer
WHERE referee_id IS NULL OR referee_id != 2;

-- Forma 2:
SELECT c.name
FROM Customer c

LEFT JOIN Customer r
    ON c.referee_id = r.id

WHERE r.id IS NULL OR r.id != 2;  
