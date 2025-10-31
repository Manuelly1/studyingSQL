-- Objetivo: exibir a quantidade de produtos que são de rpg

-- Algumas formas de fazer isso:

SELECT count(*)
FROM produtos
WHERE DescCategoriaProduto = 'rpg';

SELECT count(DescCategoriaProduto)
FROM produtos
GROUP BY DescCategoriaProduto;