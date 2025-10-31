-- Objetivo: Exibir a quantidade de produtos que são RPG

-- Algumas formas de fazer isso:

-- Forma 1: Contar todas as linhas da tabela produtos onde a categoria é 'rpg'
SELECT count(*)
FROM produtos
WHERE DescCategoriaProduto = 'rpg';

-- Forma 2: Contar os produtos agrupados por categoria (retorna a contagem de cada categoria)
-- É a mais aplicada, porque já exibe tudo
SELECT count(DescCategoriaProduto)
FROM produtos
GROUP BY DescCategoriaProduto;