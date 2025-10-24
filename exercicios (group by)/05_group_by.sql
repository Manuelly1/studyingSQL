-- qual o valor médio de pontos positivos por dia?
-- fizemos isso na data para deixá-la apenas no formato data mesmo, sem ser com a hora (0 10 representa a posição)
-- tem que usar o DISTINCT nos dias, pois não queremos dias repetidos
-- não usamos a operação AVG, pois a tabela original não está formatada por dia


SELECT sum(QtdePontos) AS totalPontos, 
        
        count(DISTINCT substr(DtCriacao, 1, 10)) AS qtdeDiasUnicos,

        sum(QtdePontos) / count(DISTINCT substr(DtCriacao, 1, 10)) AS avgPontosDias

FROM transacoes

WHERE QtdePontos > 0