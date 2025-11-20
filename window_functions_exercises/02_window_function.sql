/* 

Objetivo: verificar quando atingiu mais de 100.000 transações

Descrição da Query:
    1. No CTE "tb_diario": agrupa as transações por dia (extraindo a data de DtCriacao) e conta quantas transações distintas ocorreram em cada dia;

    2. No CTE "tb_acumulada": calcula o acumulado diário de transações usando SUM(qtdeTransacao) OVER (ORDER BY dtDia), que gera um total progressivo;

    3. Na query final: filtra apenas os dias onde o total acumulado ultrapassou 100.000, ordena pelos menores acumulados acima desse valor e retorna o 
    primeiro dia em que o acumulado passou de 100.000.

Explicação da janela:
    - (ORDER BY dtDia) define que o acumulado é construído na ordem cronológica;
    - A função SUM() sobre a janela soma todos os dias anteriores + o dia atual, produzindo um total progressivo.

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

