-- Qual categoria tem mais produtos vendidos?
-- para isso, é necessário consultar as 2 tabelas envolvidas, a partir do campo em comum (IdProduto)
-- e depois tem que "espremer", ou seja, fazer a agregação
-- para que retorne a categoria de produtos mais vendidos
-- por isso aplicou o coount DISTINCT e o GROUP BY

SELECT t2.DescCategoriaProduto,
        count(DISTINCT t1.IdTransacao) AS qtdeTransacao

FROM transacao_produto AS t1

LEFT JOIN produtos AS t2
    ON t1.IdProduto = t2.IdProduto

GROUP BY t2.DescCategoriaProduto

ORDER BY qtdeTransacao DESC

