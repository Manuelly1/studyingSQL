-- qual o produto mais transacionado?
-- 2 formas de fazer:
-- o mais indicado é usar a soma mesmo

SELECT IdProduto,
        count(*)

FROM transacao_produto

GROUP BY IdProduto

ORDER BY count(*) DESC

LIMIT 1;

SELECT IdProduto,
        sum(QtdeProduto) AS qtdeProdutoSum

FROM transacao_produto

GROUP BY IdProduto

ORDER BY count(*) DESC

LIMIT 1;
