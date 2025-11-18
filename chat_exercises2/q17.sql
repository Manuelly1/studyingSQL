-- Objetivo: Listar, mês a mês, o total de vendas do ano corrente

-- A tabela de transações (t1) contém a data de criação de cada compra, por isso, fazemos JOIN com transacao_produto (t2) para calcular 
-- o valor vendido;
-- STRFTIME('%Y') é usado para filtrar apenas o ano atual automaticamente;
-- STRFTIME('%m') extrai o mês e permite agrupar as vendas por mês;
-- O valor total mensal é a soma de (QtdeProduto * vlProduto).

SELECT 
    STRFTIME('%m', t1.DtCriacao) AS mes,
    SUM(t2.QtdeProduto * t2.vlProduto) AS totalVendido

FROM transacoes AS t1

INNER JOIN transacao_produto AS t2
    ON t1.IdTransacao = t2.IdTransacao

WHERE STRFTIME('%Y', t1.DtCriacao) = STRFTIME('%Y', 'now')

GROUP BY STRFTIME('%m', t1.DtCriacao)

ORDER BY mes;