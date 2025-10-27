-- deseja-se trazer para essa tabela (transacao_produto) o nome do produto
-- vai dar "Match" com o IdProduto da tabela de transacao_produto com o IdProduto da tabela produtos
-- outra coisa, não é necessário colocar sempre o nome da tabela por extenso, você pode colocar um apelido
-- usando o AS
-- para ver se há algum NULL na tabela basta fazer, por exemplo:
-- WHERE t2.IdProduto IS NULL 
-- Como faz para trazer todas as colunas da tabela 1 e só a coluna do nome do produto da tabela 2?
-- Assim: SELECT t1.*, t2.DescDescricaoProduto

SELECT t1.*, 
        t2.DescDescricaoProduto

FROM transacao_produto AS t1

LEFT JOIN produtos AS t2
        ON t1.IdProduto = t2.IdProduto

LIMIT 10
