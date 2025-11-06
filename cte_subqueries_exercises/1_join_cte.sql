-- Objetivo: Analisar a curva de Churn (cancelamento) do curso de SQL
 
-- Existem duas formas de gerar essa curva: 

-- 1- É a primeira query mostrada abaixo, ela é a mais simples e menos precisa;
-- Nesta abordagem, cada ponto da curva representa um dia específico e o número de clientes ativos (ou presentes em transações) 
-- naquele dia. Assim, é possível observar a evolução diária e identificar a tendência de cancelamento ao longo do tempo;

-- 2- Considera apenas os alunos que começaram no primeiro dia do curso. Observa, ao longo dos dias, quantos desses alunos continuaram
-- realizando transações. Dessa forma, é possível visualizar o "cancelamento real";

-- Observação: A explicação das etapas da segunda query se encontra no summary_and_examples.md.

SELECT
        substr(DtCriacao, 1, 10) AS dtDia,
        count(DISTINCT idCliente) AS qtdeCliente

FROM transacoes

WHERE DtCriacao >= '2025-08-25'
    AND DtCriacao < '2025-08-30'

GROUP BY dtDia;


-- Segunda forma:
WITH tb_clientes_dia1 AS (

    SELECT DISTINCT IdCliente

    FROM transacoes
    WHERE DtCriacao >= '2025-08-25'
        AND DtCriacao < '2025-08-26'

)

SELECT 
        substr(t2.DtCriacao, 1, 10) AS dtDia,
        count(DISTINCT t1.IdCliente) AS qtdeCliente,
        1.* count(DISTINCT t1.IdCliente) / (select count(*) from tb_clientes_dia1) AS proporcaoClientes

FROM tb_clientes_dia1 AS t1

LEFT JOIN transacoes AS t2
    ON t1.IdCliente = t2.IdCliente

WHERE t2.DtCriacao >= '2025-08-25'
    AND t2.DtCriacao < '2025-08-30'

GROUP BY dtDia;
