-- Qual a média da carteira de pontos dos clientes?

-- São 2 formas de fazer (usando o AVG ou sum/count), diferença importante: AVG ignora valores NULL. SUM/COUNT pode considerar 
-- NULL no COUNT(idCliente) (dependendo do campo), então os resultados podem diferir se houver nulos.

-- As linhas comentadas não influenciam no objetivo da query.

SELECT avg(QtdePontos),
        sum(QtdePontos)/count(idCliente)
       -- min(QtdePontos) AS minCarteira,
       -- max(QtdePontos) AS maxCarteira,
       -- sum(flTwitch),
       -- sum(flEmail)
FROM clientes