-- Objetivo: Listar os produtos nunca vendidos 

-- Explicações:
-- A tabela base é produtos, pois assim é garantido que todos os produtos sejam considerados, mesmo os que nunca foram vendidos;
-- LEFT JOIN → tenta encontrar correspondências na tabela de vendas. Se não houver correspondência, os campos de t2 ficarão NULL;
-- WHERE t2.IdProduto IS NULL → seleciona somente os produtos sem venda registrada, ou seja, que não têm correspondência na tabela de vendas.

SELECT t1.*
FROM produtos t1

LEFT JOIN transacao_produto t2
    ON t1.IdProduto = t2.IdProduto

WHERE t2.IdProduto IS NULL;
