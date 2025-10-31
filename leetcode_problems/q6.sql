-- Escreva uma solução para encontrar todas as datas id com temperaturas mais altas em comparação às datas anteriores (ontem)

-- Explicações:
-- Para comparar a temperatura de cada dia com a do dia anterior, usa um self join (a tabela Weather é ligada a ela mesma);
-- A condição DATEDIFF(w1.recordDate, w2.recordDate) = 1 garante que w2 seja exatamente um dia antes de w1;
-- O JOIN com DATEDIFF = 1 permite comparar dias consecutivos.

SELECT w1.id
FROM Weather AS w1

JOIN Weather AS w2
    ON DATEDIFF(w1.recordDate, w2.recordDate) = 1

WHERE w1.temperature > w2.temperature;
