-- Objetivo: Exibir o dia com maior engajamento de cada aluno que iniciou o curso no dia 01. O dia que cada aluno mais engajou desde que começou

-- A explicação da query vai ser encontrada no summary_and_examples.md

WITH alunos_dia_01 AS (

    SELECT DISTINCT IdCliente
    FROM transacoes
    WHERE substr(DtCriacao, 1, 10) = '2025-08-25'

),

tb_dia_cliente AS (

    SELECT t1.IdCliente,
        substr(t2.DtCriacao, 1, 10) AS dtDia,
        count(*) AS qtdeInteracoes

    FROM alunos_dia_01 AS t1

    LEFT JOIN transacoes AS t2
        ON t1.IdCliente = t2.IdCliente
        AND t2.DtCriacao >= '2025-08-25'
        AND t2.DtCriacao < '2025-08-30'

    GROUP BY t1.IdCliente,
            substr(t2.DtCriacao, 1, 10)

    ORDER BY t1.IdCliente, dtDia

),

tb_row_number AS (

    SELECT *,
        row_number() OVER (PARTITION BY IdCliente ORDER BY qtdeInteracoes DESC, dtDia) AS rowNumber

    FROM tb_dia_cliente

)

SELECT *

FROM tb_row_number

WHERE rowNumber = 1;