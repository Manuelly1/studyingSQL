-- Objetivo: Exibir a categoria que teve mais produtos vendidos

-- Explicações:
-- É necessário consultar as duas tabelas envolvidas a partir do campo em comum (IdProduto);
-- Depois, é preciso "espremer", ou seja, fazer a agregação para retornar a categoria com mais produtos vendidos;
-- Por isso aplica COUNT(DISTINCT) e GROUP BY;
-- O uso do LEFT JOIN irá garantir que todas as informações de t1 sejam mantidas e trará os dados correspondentes da tabela t2 
-- quando houver correspondência. Se não houver correspondência, os campos de t2 virão como NULL.

SELECT t2.DescCategoriaProduto,
        count(DISTINCT t1.IdTransacao) AS qtdeTransacao

FROM transacao_produto AS t1

LEFT JOIN produtos AS t2
    ON t1.IdProduto = t2.IdProduto

GROUP BY t2.DescCategoriaProduto
ORDER BY qtdeTransacao DESC;

