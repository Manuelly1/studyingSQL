-- Qual mês tivemos mais lista de presença assinada?

-- a informação da lista se encontra na tabela de produtos
-- usamos a substr para resgatar os 7 primeiros díg da data, para ter o mês
-- a t1 tem a informação da data
-- quer pegar a informação do produto que se chama "Lista de presença", por isso teve que usar as outras 2 tabelas


SELECT
        substr(t1.DtCriacao, 1, 7) AS anoMes,
        count(DISTINCT t1.IdTransacao) AS qtdeTransacao,
        t1.IdTransacao,
        t3.DescNomeProduto

FROM transacoes AS t1

LEFT JOIN transacao_produto AS t2
    ON t1.IdTransacao = t2.IdTransacao

LEFT JOIN produtos AS t3
    ON t2.IdProduto = t3.IdProduto

WHERE t3.DescNomeProduto = 'Lista de presença' 

GROUP BY substr(t1.DtCriacao, 1, 7)

ORDER BY qtdeTransacao DESC

LIMIT 10

