-- Objetivo: Listar o ID do cliente, o nome do produto e a data de cada transação

-- O INNER JOIN pega apenas os registros que realmente têm correspondência entre as tabelas transacoes, transacao_produto e produtos.

SELECT t1.IdCliente, 
        t3.DescNomeProduto,
        substr(t1.DtCriacao, 1, 11) AS Data

FROM transacoes AS t1

INNER JOIN transacao_produto AS t2
    ON t1.IdTransacao = t2.IdTransacao

INNER JOIN produtos AS t3
    ON t2.IdProduto = t3.IdProduto;