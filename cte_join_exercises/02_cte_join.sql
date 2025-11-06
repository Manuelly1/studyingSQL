-- Objetivo: Verificar, dentre os clientes que estavam ativos em janeiro/2025, quantos também assistiram (ou participaram de 
-- transações) no curso de SQL ocorrido entre 25 e 29 de agosto/2025

-- Explicações:
-- O professor demonstrou 2 formas de resolver esse problema;
-- A primeira é um pouco mais difícil de compreender, pois usa uma condição dentro do próprio LEFT JOIN;
-- Sendo assim, ao usar o filtro dentro do JOIN, significa que ele só trará para o JOIN as informações que correspondem a esses critérios;
-- A explicação detalhada das duas se encontra no arquivo summary_and_examples.md.


WITH tb_clientes_janeiro AS (

    SELECT DISTINCT IdCliente

    FROM transacoes

    WHERE DtCriacao >= '2025-01-01' 
        AND DtCriacao < '2025-02-01'

)

SELECT count(DISTINCT t1.IdCliente),
       count(DISTINCT t2.IdCliente)

FROM tb_clientes_janeiro AS t1

LEFT JOIN transacoes AS t2
    ON t1.IdCliente = t2.IdCliente
    AND t2.DtCriacao >= '2025-08-25'
    AND t2.DtCriacao < '2025-08-30';

-- Outra forma de fazer (e mais fácil): uma base com todos os clientes de janeiro e outra com todos os clientes do curso, as quais são cruzadas
WITH tb_clientes_janeiro AS (

    SELECT DISTINCT IdCliente

    FROM transacoes

    WHERE DtCriacao >= '2025-01-01' 
        AND DtCriacao < '2025-02-01'

),

tb_clientes_curso AS (

    SELECT DISTINCT IdCliente

    FROM transacoes

    WHERE DtCriacao >= '2025-08-25'
        AND DtCriacao < '2025-08-30';

)

SELECT count(t1.IdCliente) AS clienteJaneiro,
       count(t2.IdCliente) AS clienteCurso

FROM tb_clientes_janeiro AS t1

LEFT JOIN tb_clientes_curso AS t2
    ON t1.IdCliente = t2.IdCliente;