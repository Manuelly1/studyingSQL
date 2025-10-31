-- Objetivo: exibir a lista de produtos cujos nomes começam com "Venda de"

SELECT *
FROM produtos
WHERE DescNomeProduto LIKE 'Venda de%';