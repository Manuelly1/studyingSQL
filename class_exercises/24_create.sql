/* 

Objetivo: exibir o saldo de pontos acumulado ao longo do tempo para cada usuário, considerando todas as transações registradas


*/


WITH tb_diario AS (

    SELECT 
          substr(DtCriacao, 1, 10) AS dtDia,
          count(DISTINCT IdTransacao) AS qtdeTransacao

    FROM transacoes

    GROUP BY dtDia

    ORDER BY dtDia

),

tb_acumulada AS (

    SELECT *,
           sum(qtdeTransacao) OVER (ORDER BY dtDia) AS qtdeTransacaoAcumulada

    FROM tb_diario

)

SELECT *

FROM tb_acumulada

WHERE qtdeTransacaoAcumulada > 100000

ORDER BY qtdeTransacaoAcumulada

LIMIT 1;
