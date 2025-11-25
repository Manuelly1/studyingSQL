-- Exiba quantos produtos existem em cada categoria

SELECT categoria,
       count(id_produto) AS qtdeProdutos

FROM produtos1

GROUP BY categoria;
