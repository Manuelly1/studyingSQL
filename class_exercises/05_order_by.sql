-- Objetivo: exibir os 10 clientes com maior quantidade de pontos (por isso usou o ORDER BY DESC)

SELECT *
FROM clientes
ORDER BY QtdePontos DESC
LIMIT 10;

-- Objetivo: exibir os clientes mais antigos cadastrados (com flTwitch = 1), ordenando por data de criação

SELECT *
FROM clientes
WHERE flTwitch = 1
ORDER BY DtCriacao ASC;
