-- Objetivo: Exibir o produto com mais pontos transacionados

-- Forma 1: Somar os valores de cada produto e ordenar pelo total de pontos
SELECT IdProduto,
       sum(vlProduto) AS totalPontos
FROM transacao_produto
GROUP BY IdProduto
ORDER BY totalPontos DESC
LIMIT 1;

-- Observação: também poderia calcular diretamente a soma multiplicando valor pela quantidade:
-- sum(vlProduto * QtdeProduto)
