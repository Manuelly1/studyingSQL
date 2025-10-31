-- Objetivo: Exibir os clientes que mais juntaram pontos positivos em 2025-05

-- Explicações:
-- Aqui usa o SUM, porque deseja saber a soma de todas as transações dos clientes nesse período (pontos acumulados);
-- Além disso, não usa o COUNT aqui porque ele contaria apenas quantas transações o cliente fez, independentemente de quantos pontos
-- cada transação teve. Por exemplo, se o cliente fez 3 transações, mesmo que cada uma tivesse 1 ponto ou 100 pontos, COUNT(*) = 3.

SELECT idCliente,
    sum(QtdePontos) AS totalPontos

FROM transacoes

WHERE DtCriacao >= '2025-05-01' 
    AND DtCriacao < '2025-06-01' 
    AND QtdePontos > 0

GROUP BY IdCliente
ORDER BY sum(QtdePontos) DESC
LIMIT 10;
