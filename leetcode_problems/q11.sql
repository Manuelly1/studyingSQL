-- Escreva uma solução para encontrar o nome, a população e a área dos grandes países .

SELECT name, population, area

FROM World

WHERE area >= 3000000 OR population >= 25000000;