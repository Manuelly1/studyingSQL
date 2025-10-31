-- Escreva uma solução para encontrar os funcionários que ganham mais que seus gerentes

-- JOIN é usado porque é preciso comparar dados dentro da mesma tabela (auto-JOIN):
-- e representa os funcionários
-- m representa os gerentes

-- A condição e.managerId = m.id conecta cada funcionário ao seu gerente correspondente.

-- Observação: quando usa apenas JOIN, ele é na verdade um INNER JOIN por padrão. Ou seja, retorna apenas os funcionários que têm 
-- gerente (somente onde há correspondência).

SELECT e.name AS Employee
FROM Employee AS e

JOIN Employee AS m
    ON e.managerId = m.id

WHERE e.salary > m.salary;
