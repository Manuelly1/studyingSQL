-- Objetivo: Exibir o total de pontos acumulados por cliente, ordenando do maior para o menor

SELECT 
        idCliente, 
        SUM(qtdePontos) AS totalPontos

FROM clientes
GROUP BY IdCliente
ORDER BY totalPontos DESC;