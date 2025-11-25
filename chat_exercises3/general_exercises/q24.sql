-- Quantos produtos diferentes existem em cada categoria?

SELECT categoria,
       count(DISTINCT nome_produto) AS totalProdutos

FROM produtos1

GROUP BY categoria;

