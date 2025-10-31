-- Objetivo: exibir a lista de transações com produto "Resgatar Ponei"

SELECT *
FROM transacao_produto
WHERE IdProduto = 15;

-- Outra forma de fazer a consulta acima e bem menos trabalhosa (pois na anterior teve que primeiro consultar a tabela produtos para
-- ver qual o ID era o do produto "Resgatar Ponei". 

-- Ao aplicar o INNER JOIN, ele trará apenas os registros que têm correspondência em ambas as tabelas.

SELECT t1.*, t2.DescNomeProduto
FROM transacao_produto AS t1
INNER JOIN produtos AS t2
    ON t1.IdProduto = t2.IdProduto
WHERE t2.DescNomeProduto = 'Resgatar Ponei';

-- Tem como fazer usando o LEFT também, mas quando não tiver correspondência, os campos de produtos virão como NULL.

SELECT t1.*, t2.DescNomeProduto
FROM transacao_produto AS t1
LEFT JOIN produtos AS t2
    ON t1.IdProduto = t2.IdProduto
WHERE t2.DescNomeProduto = 'Resgatar Ponei';

-- Outra forma, mas dessa vez usando uma subquery.

SELECT *
FROM transacao_produto AS t1
WHERE t1.IdProduto IN (
    SELECT IdProduto
    FROM produtos
    WHERE DescDescricaoProduto = 'Resgatar Pônei'
)