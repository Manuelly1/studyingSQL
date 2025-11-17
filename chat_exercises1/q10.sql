-- Objetivo: Exibir todas as transações, incluindo aquelas que ainda não possuem produto registrado 

-- Explicações:
-- Usa LEFT JOIN para incluir todas as transações, mesmo as que não possuem produto registrado (neste caso, todos possuem registro, mas
-- caso algum não tivesse, o campo apareceria como NULL);
-- Para mais informações sobre os produtos, é possível adicionar outro LEFT JOIN com a tabela produtos;

SELECT t1.IdTransacao, t2.IdProduto
FROM transacoes AS t1

LEFT JOIN transacao_produto AS t2
    ON t1.IdTransacao = t2.IdTransacao;

