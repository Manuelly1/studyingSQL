-- A query retorna apenas os clientes que acumularam 4000 pontos ou mais em julho de 2025, em ordem decrescente de pontos.

-- O HAVING faz a filtragem dos grupos com base nessa condição, ou seja, ele é o WHERE do GROUP BY.

SELECT IdCliente,
        sum(QtdePontos)
FROM transacoes
WHERE DtCriacao >= '2025-07-01' AND DtCriacao < '2025-08-01'
GROUP BY IdCliente
HAVING sum(QtdePontos) >= 4000
ORDER BY sum(QtdePontos) DESC

