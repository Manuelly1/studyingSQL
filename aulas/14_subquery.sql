-- Lista de transações com o produto "Resgatar Pônei"

-- SELECT *
-- FROM produtos

-- A partir desse select acima descobrimos que o "Resgatar Pônei" é id = 15

-- Depois fizemos esta outra query:

-- SELECT *
-- FROM transacao_produto
-- WHERE IdProduto = 15

-- Tem como fazer isso com o JOIN, mas há outra maneira: já que uma query retorna outra tabela, será que não seria possível 
-- consultar essa nova tabela que foi gerada? Consultar o novo resultado? É aqui que entra as subqueries 

-- Ou seja, está colocando como condição dentro do WHERE o resultado de uma outra query. Isso é feito porque as informações do outro
-- campo estão dentro da outra tabela (no caso, produtos). Primeiro realiza-se a query que se encontra dentro dos parênteses

-- as subqueries não são muito indicadas, uma vez que consomem muito processamento

SELECT *
FROM transacao_produto AS t1
WHERE t1.IdProduto IN (
    SELECT IdProduto
    FROM produtos
    WHERE DescDescricaoProduto = 'Resgatar Pônei'
)