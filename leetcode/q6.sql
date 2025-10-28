-- Escreva uma solução para encontrar todas as datas id com temperaturas mais altas em comparação às 
-- datas anteriores (ontem).

-- A ideia aqui é comparar a temperatura de cada dia com a do dia anterior e pra isso usamos um 
-- self join, ou seja, juntamos a tabela Weather com ela mesma.

-- DATEDIFF(w1.recordDate, w2.recordDate) = 1 → garante que w2 seja exatamente um dia antes de w1.

-- Usamos JOIN com DATEDIFF = 1 para comparar dias consecutivos.

SELECT w1.id

FROM Weather AS w1

JOIN Weather AS w2
ON DATEDIFF(w1.recordDate, w2.recordDate) = 1

WHERE w1.temperature > w2.temperature;
