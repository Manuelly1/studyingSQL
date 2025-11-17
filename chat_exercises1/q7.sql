-- Objetivo: Mostrar o valor médio das vendas por mês -> ticket médio mensal

-- Observações:
-- Fez o INNER JOIN, pois na t1 tem a DtCriacao, enquanto na t2 tem vlProduto e QtdeProduto;
-- Se quisesse o faturamento total por mês aplicaria o SUM no lugar do AVG;

SELECT
        substr(t1.DtCriacao, 1, 7) AS anoMes, 
        AVG(vlProduto * QtdeProduto) AS valorMedio

FROM transacoes t1

INNER JOIN transacao_produto t2
    ON t1.IdTransacao = t2.IdTransacao

GROUP BY substr(t1.DtCriacao, 1, 7);



