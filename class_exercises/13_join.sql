-- A query retorna as 10 primeiras transações de produtos, mostrando todas as informações da transação e o nome do produto 
-- associado (ou NULL se não houver correspondência).

-- Deseja-se trazer para a tabela (transacao_produto) o nome do produto.

-- Para isso, faz-se um "match" entre o IdProduto da tabela transacao_produto (t1) e o IdProduto da tabela produtos (t2), 
-- relacionando as duas tabelas.

-- Não é necessário escrever o nome completo da tabela todas as vezes: pode-se atribuir um apelido (alias) usando o comando AS.

-- Exemplo de como verificar se há valores sem correspondência (NULL) após o JOIN:
-- WHERE t2.IdProduto IS NULL

-- Para trazer todas as colunas da tabela transacao_produto e apenas o nome do produto da tabela produtos:
-- SELECT t1.*, t2.DescDescricaoProduto

-- LEFT JOIN → retorna todas as linhas da tabela à esquerda (t1), mesmo que não haja correspondência na tabela à direita (t2). Se 
-- não houver produto correspondente, DescDescricaoProduto virá como NULL.

SELECT t1.*, 
        t2.DescDescricaoProduto
FROM transacao_produto AS t1
LEFT JOIN produtos AS t2 ON t1.IdProduto = t2.IdProduto
LIMIT 10
