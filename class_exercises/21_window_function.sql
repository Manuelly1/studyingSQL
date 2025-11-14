-- Objetivo: Obter a quantidade de transações por dia de curso e calcular a evolução diária através de uma soma acumulada,
-- permitindo visualizar o crescimento do número total de transações ao longo do curso

-- Explicações:
-- A CTE tb_sumario_dias agrupa as transações por dia;
-- count(DISTINCT IdTransacao) conta quantas transações únicas ocorreram em cada dia.

-- Na query final:
-- sum(qtdeTransacao) OVER (ORDER BY dtDia) calcula a soma acumulada, permitindo visualizar o crescimento do total de transações ao longo dos dias.
-- A explicação da função OVER está no summary_and_examples.md.

WITH tb_sumario_dias AS (

    SELECT substr(DtCriacao, 1, 10) AS dtDia,
           count(DISTINCT IdTransacao) AS qtdeTransacao

    FROM transacoes

    WHERE DtCriacao >= '2025-08-25'
        AND DtCriacao < '2025-08-30'

    GROUP BY dtDia

)

SELECT *,
       sum(qtdeTransacao) OVER (ORDER BY dtDia) AS qtdeTransacaoAcumulada

FROM tb_sumario_dias;