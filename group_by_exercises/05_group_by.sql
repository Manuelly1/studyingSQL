-- Objetivo: Exibir o valor médio de pontos positivos por dia

-- Explicações:
-- A data foi formatada para considerar apenas o dia, sem a hora;
-- Usa DISTINCT nos dias, pois não deve-se contar dias repetidos;
-- Não usa AVG diretamente, porque a tabela original não está organizada por dia. 

SELECT sum(QtdePontos) AS totalPontos, 
        
        count(DISTINCT substr(DtCriacao, 1, 10)) AS qtdeDiasUnicos,

        sum(QtdePontos) / count(DISTINCT substr(DtCriacao, 1, 10)) AS avgPontosDias

FROM transacoes
WHERE QtdePontos > 0;