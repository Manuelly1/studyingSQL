-- Qual a quantidade de transações em julho de 2025?

-- É válido lembrar que O COUNT(*) é o necessário para responder “quantidade de transações”, uma vez que conta todas as linhas 
-- (cada uma é uma transação). 

-- O COUNT(DISTINCT idCliente) só seria usado se o exercício pedisse também quantos clientes distintos fizeram transações.

SELECT 
    count(*)
    -- count(DISTINCT idCliente) 
FROM transacoes 
WHERE DtCriacao >= '2025-07-01' AND DtCriacao < '2025-08-01'
ORDER BY DtCriacao DESC