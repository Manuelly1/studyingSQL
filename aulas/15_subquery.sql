-- Objetivo: dos clientes que participaram no "primeiro dia" (2025-08-25),
-- quantos desses mesmos clientes voltaram no "quinto dia" (2025-08-29)?

-- Subquery: encontra os clientes que tiveram transação no "primeiro dia"

-- AND: filtra as transações do "quinto dia" para os clientes encontrados acima

SELECT count(DISTINCT IdCliente)
FROM transacoes AS t1
WHERE t1.IdCliente IN (

    SELECT DISTINCT IdCliente
    FROM transacoes
    WHERE substr(DtCriacao, 1, 10) = '2025-08-25'

)

AND substr(t1.DtCriacao, 1, 10) = '2025-08-29';

SELECT COUNT(DISTINCT t1.IdCliente) AS qtd_clientes_retornaram
FROM transacoes t1
JOIN (

    SELECT DISTINCT IdCliente
    FROM transacoes
    WHERE substr(DtCriacao, 1, 10) = '2025-08-25'

) first_day ON t1.IdCliente = first_day.IdCliente

WHERE substr(t1.DtCriacao, 1, 10) = '2025-08-29';
