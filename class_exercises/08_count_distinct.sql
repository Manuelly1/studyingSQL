-- Objetivo: Contar a quantidade de transações realizadas em julho de 2025.

-- Observações:
-- COUNT(*) conta todas as linhas da tabela, ou seja, todas as transações;
-- COUNT(DISTINCT idCliente) contaria quantos clientes distintos realizaram transações (não necessário aqui).

SELECT count(*)
    -- count(DISTINCT idCliente) 

FROM transacoes 
WHERE DtCriacao >= '2025-07-01' AND DtCriacao < '2025-08-01';