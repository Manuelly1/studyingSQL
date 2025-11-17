-- Objetivo: Mostrar quais produtos nunca foram vendidos

-- Para identificar produtos nunca vendidos, começamos pela tabela produtos e fazemos um LEFT JOIN com transacao_produto;
-- No LEFT JOIN, todos os produtos aparecem, mesmo se não tiverem vendas;
-- Os produtos sem venda ficam com t2.IdProduto = NULL (IS NULL), pois não há correspondência na tabela transacao_produto.

SELECT t1.IdProduto

FROM produtos AS t1

LEFT JOIN transacao_produto AS t2
    ON t1.IdProduto = t2.IdProduto

WHERE t2.IdProduto IS NULL;
