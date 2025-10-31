-- Objetivo: Calcular o total de pontos das transações de julho de 2025.

-- Observações:
-- sum(QtdePontos) retorna a soma de todos os pontos das transações filtradas;
-- sum(CASE WHEN QtdePontos > 0 THEN QtdePontos END) retorna a soma apenas dos pontos positivos;
-- sum(CASE WHEN QtdePontos < 0 THEN QtdePontos END) retorna a soma apenas dos pontos negativos.

SELECT sum(QtdePontos),

    sum(CASE
        WHEN QtdePontos > 0 THEN QtdePontos
    END) AS qtdePontosPositivos,

    sum(CASE
        WHEN QtdePontos < 0 THEN QtdePontos
    END) AS qtdePontosNegativos

FROM transacoes
WHERE DtCriacao >= '2025-07-01' AND DtCriacao < '2025-08-01' AND qtdePontos > 0;

