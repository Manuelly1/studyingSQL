-- Objetivo: Calcular a média da carteira de pontos dos clientes.

-- Observações:

-- Há duas formas de calcular a média: 
-- 1) AVG(QtdePontos) → ignora valores NULL;
-- 2) SUM(QtdePontos)/COUNT(idCliente) → pode incluir ou excluir NULL dependendo do campo usado no COUNT.

-- As linhas comentadas (min, max, sum) não influenciam no cálculo da média, são apenas demonstrações.

SELECT avg(QtdePontos),
        sum(QtdePontos)/count(idCliente)
       -- min(QtdePontos) AS minCarteira,
       -- max(QtdePontos) AS maxCarteira,
       -- sum(flTwitch),
       -- sum(flEmail)
FROM clientes;