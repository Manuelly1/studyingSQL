-- para saber a quantidade de transações em julho de 2025

SELECT 
    count(*),
    -- para garantir que retornará o número de clientes das transações desse período
    count(DISTINCT idCliente) 
FROM transacoes 
WHERE DtCriacao >= '2025-07-01' AND DtCriacao < '2025-08-01'
ORDER BY DtCriacao DESC