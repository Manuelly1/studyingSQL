-- Escreva uma solução para informar o nome e o valor do bônus de cada funcionário com bônus menor que 1000.

-- O b.bonus IS NULL é necessário para incluir funcionários que não têm bônus registrado (não há correspondência na tabela Bonus).

SELECT e.name, b.bonus
FROM Employee AS e

LEFT JOIN Bonus AS b
    ON e.empId = b.empId

WHERE b.bonus < 1000 OR b.bonus IS NULL;