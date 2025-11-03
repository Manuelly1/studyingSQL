-- Objetivo: Listar os 3 produtos mais vendidos (por quantidade)

-- Explicações:
-- count(IdProduto) AS totalProduto → conta quantas vezes cada produto aparece;
-- GROUP BY IdProduto → agrupa por produto;
-- ORDER BY totalProduto DESC → ordena do mais vendido para o menos vendido.

SELECT IdProduto, 
        count(IdProduto) AS totalProduto

FROM transacao_produto

GROUP BY IdProduto
ORDER BY totalProduto DESC
LIMIT 3;