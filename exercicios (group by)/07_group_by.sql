-- Objetivo: exibir o produto mais transacionado

-- 2 formas de fazer:

-- I) Usando COUNT: conta a quantidade de transações em que cada produto apareceu.
--    Exemplo: se um produto apareceu em 5 transações, COUNT(*) = 5.
--    Não considera a quantidade real de produtos em cada transação, apenas quantas vezes ele foi registrado.
--    Tanto COUNT(*) quanto COUNT(IdProduto) não somam a quantidade de produtos, apenas contam quantas vezes o produto aparece.
--
-- II) Usando SUM (mais indicada): soma a quantidade de produtos (QtdeProduto) em todas as transações.
--    Exemplo: se em uma transação o produto teve QtdeProduto = 3 e em outra QtdeProduto = 2, SUM(QtdeProduto) = 5.
--    Essa forma mostra o total de unidades transacionadas, que geralmente é o que se quer ao buscar o produto "mais vendido".

-- Com COUNT:

SELECT IdProduto,
        count(*)

FROM transacao_produto
GROUP BY IdProduto
ORDER BY count(*) DESC
LIMIT 1;

-- Com SUM:

SELECT IdProduto,
        sum(QtdeProduto) AS qtdeProdutoSum

FROM transacao_produto
GROUP BY IdProduto
ORDER BY count(*) DESC
LIMIT 1;
