-- Objetivo: Comparar os clientes que compraram no primeiro dia com os que compraram no último dia, identificando quais 
-- clientes do primeiro dia também aparecem (ou não) no último dia

-- Explicações:
-- O comando WITH é utilizado para criar uma CTE, ou seja, uma "tabela temporária nomeada" que pode ser referenciada dentro da 
-- mesma consulta SQL;
-- No exemplo abaixo, foram criadas duas CTEs:
--
-- I. tb_cliente_primeiro_dia → armazena os IDs dos clientes que realizaram transações no dia 2025-08-25 (primeiro dia);
-- II. tb_cliente_ultimo_dia → armazena os IDs dos clientes que realizaram transações no dia 2025-08-29 (último dia).
--
-- Em seguida, a consulta principal faz um LEFT JOIN entre as duas CTEs, relacionando os clientes do primeiro dia (t1) com os do 
-- último dia (t2), com base no campo IdCliente. Dessa forma, é possível identificar quais clientes compraram no primeiro dia e 
-- verificar se também realizaram transações no último dia.

WITH tb_cliente_primeiro_dia AS (

    SELECT DISTINCT IdCliente
    FROM transacoes
    WHERE substr(DtCriacao, 1, 10) = '2025-08-25'

),

tb_cliente_ultimo_dia AS (

    SELECT DISTINCT IdCliente
    FROM transacoes
    WHERE substr(DtCriacao, 1, 10) = '2025-08-29'

)

SELECT *
FROM tb_cliente_primeiro_dia AS t1

LEFT JOIN tb_cliente_ultimo_dia AS t2
    ON t1.IdCliente = t2.IdCliente;

