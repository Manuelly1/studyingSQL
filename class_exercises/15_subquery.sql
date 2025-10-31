-- Objetivo: Contar quantos clientes que compraram no "primeiro dia" (2025-08-25) retornaram no "quinto dia" (2025-08-29).

-- Abordagem 1: usando subquery

-- A subquery retorna os clientes que tiveram transação no primeiro dia;
-- O WHERE IN filtra as transações do quinto dia apenas para esses clientes.

SELECT count(DISTINCT IdCliente)
FROM transacoes AS t1
WHERE t1.IdCliente IN (

    SELECT DISTINCT IdCliente
    FROM transacoes
    WHERE substr(DtCriacao, 1, 10) = '2025-08-25'

)

AND substr(t1.DtCriacao, 1, 10) = '2025-08-29';

-- Abordagem 2: usando JOIN

-- A subquery retorna os clientes do primeiro dia (first_day);
-- JOIN garante que só sejam consideradas transações de clientes que estão no first_day;
-- WHERE filtra as transações do quinto dia.

SELECT COUNT(DISTINCT t1.IdCliente) AS qtd_clientes_retornaram
FROM transacoes t1
JOIN (

    SELECT DISTINCT IdCliente
    FROM transacoes
    WHERE substr(DtCriacao, 1, 10) = '2025-08-25'

) first_day ON t1.IdCliente = first_day.IdCliente

WHERE substr(t1.DtCriacao, 1, 10) = '2025-08-29';
