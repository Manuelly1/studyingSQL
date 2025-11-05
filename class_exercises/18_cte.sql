-- Objetivo: Comparar os clientes que realizaram transações no primeiro e no último dia de um período (25 e 29 de agosto de 2025)

-- Explicações:
-- 1. tb_cliente_primeiro_dia – identifica todos os clientes que compraram no primeiro dia (25/08/2025);
-- 2. tb_cliente_ultimo_dia – identifica os que compraram no último dia (29/08/2025);
-- 3. tb_join – cruza as duas listas para ver quais clientes aparecem nos dois dias (ou seja, retornaram a comprar) e quais não.

-- Observação:
-- Ao multiplicar por 1.0, converte-se o número em float, forçando o SQLite a fazer divisão real;
-- Também é possível usar CAST, por exemplo: CAST(count(ultCliente) AS FLOAT) / count(primCliente).


WITH tb_cliente_primeiro_dia AS (

    SELECT DISTINCT IdCliente
    FROM transacoes
    WHERE substr(DtCriacao, 1, 10) = '2025-08-25'

),

tb_cliente_ultimo_dia AS (

    SELECT DISTINCT IdCliente
    FROM transacoes
    WHERE substr(DtCriacao, 1, 10) = '2025-08-29'

),

tb_join AS (

    SELECT t1.IdCliente AS primCliente,
            t2.IdCliente AS ultCliente

    FROM tb_cliente_primeiro_dia AS t1

    LEFT JOIN tb_cliente_ultimo_dia AS t2
        ON t1.IdCliente = t2.IdCliente

)

SELECT count(primCliente) AS qtdePrimeiro,
        count(ultCliente) AS qtdeUltimo,
        1. * count(ultCliente) / count(primCliente) AS ResultadoFinal

FROM tb_join;
