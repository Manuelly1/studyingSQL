-- Objetivo: Exibir a lista de produtos cujos nomes começam com "Venda de"

-- LIKE é usado para comparações de padrão de texto.

SELECT *
FROM produtos
WHERE DescNomeProduto LIKE 'Venda de%';