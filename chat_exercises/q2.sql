-- Objetivo: Criar uma coluna chamada categoriaPreco que classifica os produtos em:
-- “Barato” se preço < 30;
-- “Médio” se preço entre 30 e 100;
-- “Caro” se preço > 100.ABORT

SELECT vlProduto,

CASE 
    WHEN vlProduto < 30 THEN 'Barato'
    WHEN vlProduto > 30 AND vlProduto < 100 THEN 'Médio'
    ELSE 'Caro'
END AS 'categoriaPreco'

FROM transacao_produto;
