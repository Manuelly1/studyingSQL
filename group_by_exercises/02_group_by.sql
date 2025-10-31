-- Objetivo: exibir os clientes que mais juntaram pontos positivos em 2025-05

-- Aqui usa o SUM, porque quer a soma de todas as transações dos clientes nesse período, enquanto o MAX pegaria a maior transação, 
-- não o total de pontos ajuntados/acumulados

-- Não usa o COUNT aqui porque ele contaria quantas transações o cliente fez, independentemente de quantos pontos cada transação 
-- teve. Se o cliente tivesse feito 3 transações, mesmo que cada uma tivesse 1 ponto ou 100 pontos, o COUNT(*) = 3.

SELECT idCliente,
    sum(QtdePontos) AS totalPontos

FROM transacoes

WHERE DtCriacao >= '2025-05-01' AND 
    DtCriacao < '2025-06-01' AND 
    QtdePontos > 0

GROUP BY IdCliente

ORDER BY sum(QtdePontos) DESC;
