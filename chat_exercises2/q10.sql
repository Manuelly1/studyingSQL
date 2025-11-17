-- Objetivo: Mostrar o número de transações feitas por cada cliente

SELECT IdCliente,
       count(*) AS qtdeTransacoes

FROM transacoes

GROUP BY IdCliente;