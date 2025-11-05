-- Objetivo:
-- Calcular, em média, quantos dias de aula (presenças) os alunos que iniciaram o curso no primeiro dia (25/08/2025) participaram

-- Contexto:
-- A tabela 'transacoes' registra as atividades dos alunos ao longo do curso;
-- Um mesmo aluno pode ter várias transações no mesmo dia, por isso utiliza-se DISTINCT para considerar apenas uma presença por dia;
-- A ideia é medir o engajamento dos alunos que começaram o curso desde o início.

-- Etapas da query:
-- 1. tb_prim_dia: identifica os alunos que tiveram alguma transação no primeiro dia de curso (25/08/2025);
-- 2. tb_dias_curso: lista todos os dias em que houve atividade (presença) para cada aluno durante o período total do curso;
-- 3. tb_cliente_dias: calcula quantos dias distintos cada cliente esteve presente, ou seja, quantos dias diferentes participou de atividades;
-- 4. SELECT final: calcula a média geral de dias de presença desses alunos.

-- Observação:
-- O LEFT JOIN é utilizado porque deseja-se manter todos os clientes da tabela tb_prim_dia, mesmo aqueles que não possuem registros de 
-- presença em tb_dias_curso. Se fosse usado INNER JOIN, esses alunos seriam excluídos do resultado, o que distorceria a média de engajamento.


WITH tb_prim_dia AS (

    SELECT DISTINCT IdCliente
    FROM transacoes
    WHERE substr(dtCriacao, 1, 10) = '2025-08-25'

),

tb_dias_curso AS (

    SELECT DISTINCT
        IdCliente, 
        substr(DtCriacao, 1, 10) AS presenteDia

    FROM transacoes
    WHERE DtCriacao >= '2025-08-25'
        AND DtCriacao < '2025-08-30' 

    ORDER BY IdCliente, presenteDia

),

tb_cliente_dias AS (

    SELECT t1.IdCliente,
        count(DISTINCT t2.presenteDia) AS qtdeDias

    FROM tb_prim_dia AS t1

    LEFT JOIN tb_dias_curso AS t2
        ON t1.IdCliente = t2.IdCliente

    GROUP BY t1.IdCliente

)

SELECT avg(qtdeDias) 
FROM tb_cliente_dias;
