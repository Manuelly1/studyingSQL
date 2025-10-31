-- Objetivo: Listar todas as transações do produto "Resgatar Pônei".

-- Explicações:
-- O produto "Resgatar Pônei" tem IdProduto = 15 (descoberto consultando a tabela produtos);
-- Subquery: permite usar o resultado de outra consulta como condição no WHERE sem que tenha que fazer uma consulta separada antes;
-- Aqui, a subquery retorna o IdProduto do produto com DescDescricaoProduto = 'Resgatar Pônei';
-- A cláusula IN verifica se t1.IdProduto está dentro do resultado da subquery;

-- Observação: subqueries podem consumir mais processamento que um JOIN direto, então tem que examinar bem se vale a pena usá-las nesse contexto.

SELECT *
FROM transacao_produto AS t1
WHERE t1.IdProduto IN (

    SELECT IdProduto
    FROM produtos
    WHERE DescDescricaoProduto = 'Resgatar Pônei'

);