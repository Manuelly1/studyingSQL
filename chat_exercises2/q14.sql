-- Objetivo: Calcular o ticket médio (valor médio por transação)

-- A CTE calcula o valor total de cada transação, somando (QtdeProduto * vlProduto) para todos os itens pertencentes à mesma transação;
-- Na consulta principal, calcula-se a média desses valores totais, obtendo o ticket médio de compra.

WITH tab_total_por_transacao AS (
    
    SELECT 
        IdTransacao,
        SUM(QtdeProduto * vlProduto) AS valorTransacao

    FROM transacao_produto
    GROUP BY IdTransacao
    
)

SELECT 
    AVG(valorTransacao) AS ticketMedio

FROM tab_total_por_transacao;
