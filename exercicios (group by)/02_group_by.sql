-- qual cliente juntou mais pontos positivos em 2025-05?
-- aqui usa o SUM, porque quer a soma de todas as transações dos clientes nesse período
-- já o MAX pegaria a maior transação, não o que junotu

SELECT idCliente,
    sum(QtdePontos) AS totalPontos

FROM transacoes

WHERE DtCriacao >= '2025-05-01' AND 
    DtCriacao < '2025-06-01' AND 
    QtdePontos > 0

GROUP BY IdCliente

ORDER BY sum(QtdePontos) DESC

LIMIT 1

-- se quiser só exibir o idCliente, basta tirar o sum do SELECT