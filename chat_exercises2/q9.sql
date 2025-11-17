-- Objetivo: Mostrar todas as transações com valor total acima de R$ 500

-- Explicações:
-- GROUP BY → para somar os itens por transação;
-- SUM(QtdeProduto * vlProduto) → valor total;
-- HAVING > 500 → filtrar após o agrupamento.

SELECT 
    IdTransacao,
    SUM(QtdeProduto * vlProduto) AS totalTransacao

FROM transacao_produto

GROUP BY IdTransacao

HAVING totalTransacao > 500;
