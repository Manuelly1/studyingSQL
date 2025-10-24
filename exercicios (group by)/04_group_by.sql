-- quantos produtos são de rpg?

-- algumas formas de fazer isso:

SELECT count(*)
FROM produtos
WHERE DescCategoriaProduto = 'rpg';

SELECT DescCategoriaProduto,
    count(*)

FROM produtos

GROUP BY DescCategoriaProduto;