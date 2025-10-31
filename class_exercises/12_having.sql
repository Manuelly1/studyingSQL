-- Objetivo: Listar clientes que acumularam 4000 pontos ou mais em julho de 2025, em ordem decrescente de pontos.

-- Observação: 
-- HAVING é usado para filtrar grupos após o GROUP BY, funcionando como um WHERE para agregações;
-- GROUP BY agrupa as transações por IdCliente, permitindo somar os pontos de cada cliente.

SELECT IdCliente,
        sum(QtdePontos)
        
FROM transacoes
WHERE DtCriacao >= '2025-07-01' AND DtCriacao < '2025-08-01'
GROUP BY IdCliente
HAVING sum(QtdePontos) >= 4000
ORDER BY sum(QtdePontos) DESC;

