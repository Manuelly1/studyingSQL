-- para descobrir, por exemplo, os clientes que têm uma maior quantidade de pontos
-- nessa primeira query irá retornar os 10 clientes com maiores pontos
-- SELECT *
-- FROM clientes
-- ORDER BY QtdePontos DESC
-- LIMIT 10;

-- quem são os clientes mais antigos cadastrados (ordenar por data)
-- e também quem tem mais pontos para quem tem menos
SELECT *
FROM clientes
WHERE flTwitch = 1
ORDER BY DtCriacao ASC, qtdePontos DESC;
