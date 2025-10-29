-- Quais clientes têm uma maior quantidade de pontos?

-- A primeira query irá retornar os 10 clientes com maiores pontos

SELECT *
FROM clientes
ORDER BY QtdePontos DESC
LIMIT 10;

-- Quem são os clientes mais antigos cadastrados (ordenar por data)?

SELECT *
FROM clientes
WHERE flTwitch = 1
ORDER BY DtCriacao ASC;
