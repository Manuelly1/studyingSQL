-- Objetivo: exibir a lista de produtos com nome que começa com "Venda de";

SELECT *
FROM produtos
WHERE DescNomeProduto LIKE 'Venda de%';