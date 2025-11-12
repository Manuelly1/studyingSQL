-- What is the difference between RANK(), DENSE_RANK(), and ROW_NUMBER()?

-- RANK(): atribui uma classificação a cada linha com base na ordenação definida, mas pula a numeração em caso de empate.
-- Assim, ele dá o mesmo número para empates, mas pula a próxima posição após empate;

-- DENSE_RANK(): atribui classificação considerando empates e não pula a numeração. Dessa forma, se dois valores empatarem em 
-- 1º lugar, o próximo será 2º;

-- ROW_NUMBER(): atribui um número único e sequencial para cada linha. Não considera empates, cada linha recebe um número distinto.
-- Ou seja, ignora empates e dá uma posição única para cada linha.

-- Exemplo ilustrativo:
-- IdCliente | Pontos
-- ----------|--------
-- 1         | 100
-- 2         | 90
-- 3         | 90
-- 4         | 80

-- Resultado ao aplicar cada função (ORDER BY Pontos DESC):

-- RANK()       → 1, 2, 2, 4
-- DENSE_RANK() → 1, 2, 2, 3
-- ROW_NUMBER() → 1, 2, 3, 4