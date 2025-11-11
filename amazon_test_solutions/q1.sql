-- Find customers who purchased more than 3 times in the last month

-- Observação: o teste foi adaptado para as bases que eu tenho salvas no datasets. Além disso, eu deixei de forma dinâmica;

-- Explicações:
-- Aplicou COUNT(*) para contar o total de compras por cliente no período;
-- A função date('now', 'start of month', '-1 month') retorna o primeiro dia do mês anterior. Logo, como hoje é 11/11/2025, ela 
-- retorna '2025-10-01';
-- A função date('now', 'start of month') retorna o primeiro dia do mês atual. Neste momento, retorna '2025-11-01';
-- Sendo assim, o WHERE sempre filtra as transações feitas no mês anterior. 

SELECT IdCliente,
       substr(DtCriacao, 1, 10) AS data,
       COUNT(*) AS totalCompras

FROM transacoes

WHERE DtCriacao >= date('now', 'start of month', '-1 month')
      AND DtCriacao < date('now', 'start of month')

GROUP BY IdCliente
HAVING COUNT(*) > 3;

