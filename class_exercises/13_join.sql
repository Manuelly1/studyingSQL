-- Objetivo: Exibir as 10 primeiras transações de produtos, mostrando todas as informações da transacao_produto e o nome do 
-- produto associado (ou NULL se não houver correspondência).

-- Explicações importantes:
-- Usamos LEFT JOIN para trazer todas as linhas da tabela à esquerda (transacao_produto), mesmo que não exista correspondência na 
-- tabela produtos;
-- O alias (t1 e t2) facilita a escrita, evitando repetir o nome completo da tabela;
-- DescDescricaoProduto virá como NULL quando não houver produto correspondente;

-- Exemplo de verificação de valores sem correspondência: WHERE t2.IdProduto IS NULL.

SELECT t1.*, 
        t2.DescDescricaoProduto
FROM transacao_produto AS t1
LEFT JOIN produtos AS t2 ON t1.IdProduto = t2.IdProduto
LIMIT 10
