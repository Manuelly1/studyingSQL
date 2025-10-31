-- Objetivo: exibir o produto com mais pontos transacionados

-- 2 formas de fazer:

SELECT IdProduto,
        sum(vlProduto) AS totalPontos

FROM transacao_produto
GROUP BY IdProduto
ORDER BY totalPontos DESC
LIMIT 1;

-- Poderia também só ter feito sum(vlProduto * QtdeProduto)