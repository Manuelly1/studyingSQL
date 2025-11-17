-- Objetivo: Mostrar todas as transações ocorridas em 2024

SELECT IdTransacao,
       substr(DtCriacao, 1, 10) AS data

FROM transacoes

WHERE DtCriacao >= '2024-01-01'
    AND DtCriacao < '2025-01-01';