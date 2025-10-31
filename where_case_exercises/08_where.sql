-- Objetivo: Exibir a lista de transações do produto "Resgatar Ponei".

-- Forma 1: usando diretamente o IdProduto (15)

SELECT *
FROM transacao_produto
WHERE IdProduto = 15;

-- Forma 2: usando INNER JOIN: junta transacao_produto com produtos + retorna apenas registros que têm correspondência em ambas as 
-- tabelas, o que torna essa query mais prática que a anterior, pois não precisa saber o IdProduto previamente.

SELECT t1.*, t2.DescNomeProduto
FROM transacao_produto AS t1
INNER JOIN produtos AS t2
    ON t1.IdProduto = t2.IdProduto
WHERE t2.DescNomeProduto = 'Resgatar Ponei';

-- Forma 3: usando LEFT JOIN: retorna todas as linhas de transacao_produto. Se não houver correspondência na tabela produtos, os 
-- campos de produtos aparecem como NULL.

SELECT t1.*, t2.DescNomeProduto
FROM transacao_produto AS t1
LEFT JOIN produtos AS t2
    ON t1.IdProduto = t2.IdProduto
WHERE t2.DescNomeProduto = 'Resgatar Ponei';

-- Forma 4: usando subquery:
-- A Subquery retorna o IdProduto do produto "Resgatar Pônei";
-- O WHERE IN filtra as transações que correspondem a esse IdProduto.

SELECT *
FROM transacao_produto AS t1
WHERE t1.IdProduto IN (

    SELECT IdProduto
    FROM produtos
    WHERE DescDescricaoProduto = 'Resgatar Pônei'
    
);