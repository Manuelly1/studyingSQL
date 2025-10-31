-- Objetivo: Listar todas as transações adicionando uma nova coluna sinalizando "baixo", "médio" e "alto" para o valor dos pontos
-- [<10; <500; >=500]

-- A nova coluna foi chamada de FlQtdePontos.

SELECT IdTransacao, QtdePontos,

    CASE 
        WHEN QtdePontos < 10 THEN 'Baixo'
        WHEN QtdePontos < 500 THEN 'Médio'
        ELSE 'Alto'
    END AS 'FlQtdePontos'

FROM transacoes;

