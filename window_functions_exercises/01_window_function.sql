/* 

Objetivo: gerar uma visão diária da quantidade de transações e, além disso, calcular o total acumulado dessas transações ao longo do tempo

Descrição da Query:

    1. No CTE "tb_diario", agrupa as transações por dia (extraindo a data de DtCriacao) e conta quantas transações ocorreram em cada dia;
    2. No SELECT final, calcula a quantidade acumulada de transações usando uma função de janela (window function).

O que a janela faz:

    - (ORDER BY dtDia) define que a janela será o "intervalo" que começa no primeiro dia e vai aumentando até o dia atual;
    - Assim, o resultado é um acumulado progressivo das transações ao longo do tempo.

*/

WITH tb_diario AS (

    SELECT 
          substr(DtCriacao, 1, 10) AS dtDia,
          count(DISTINCT IdTransacao) AS qtdeTransacao

    FROM transacoes

    GROUP BY dtDia

    ORDER BY dtDia

)

SELECT *,
       sum(qtdeTransacao) OVER (ORDER BY dtDia) AS qtdeTransacaoAcumulada

FROM tb_diario;

