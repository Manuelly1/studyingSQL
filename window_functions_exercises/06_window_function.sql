/* 

Objetivo: exibir o saldo de pontos acumulado ao longo do tempo para cada usuário, considerando todas as transações registradas

Descrição da Query:
    1. No CTE "tb_cliente_dia": agrupa as transações por IdCliente e por dia e calcula: 
        totalPontos: soma diária de QtdePontos (podendo incluir pontos positivos e negativos), que representa a variação diária no saldo do cliente; e
        pontosPositivos: soma apenas os pontos positivos do dia. Transações negativas são tratadas como 0, pois não contam como ganho;

    2. Na consulta final: 
        saldoPontos: usa SUM(totalPontos) OVER (PARTITION BY IdCliente ORDER BY dtDia) para construir o saldo acumulado de pontos ao longo do tempo 
        para cada cliente. Ou seja, soma o saldo diário progressivamente;
        totalPontosPositivos: usa SUM(pontosPositivos) OVER (PARTITION BY IdCliente ORDER BY dtDia) para somar somente os pontos positivos acumulados 
        ao longo do tempo, permitindo analisar quanto o usuário ganhou, independentemente de perdas.

Explicação das funções de janela:
    - PARTITION BY IdCliente separa o cálculo para cada cliente individualmente;
    - ORDER BY dtDia garante a ordem cronológica do acumulado;
    - SUM(...) OVER cria um acumulado progressivo, linha a linha, sem perder o detalhe diário.

*/

WITH tb_cliente_dia AS (

    SELECT IdCliente,
           substr(DtCriacao, 1, 10) AS dtDia,
           sum(QtdePontos) AS totalPontos,
           sum(CASE WHEN QtdePontos > 0 THEN QtdePontos ELSE 0 END) AS pontosPositivos

    FROM transacoes

    GROUP BY IdCliente, dtDia

)

SELECT *,
       sum(totalPontos) OVER (PARTITION BY IdCliente ORDER BY dtDia) AS saldoPontos,
       sum(pontosPositivos) OVER (PARTITION BY IdCliente ORDER BY dtDia) AS totalPontosPositivos

FROM tb_cliente_dia;