-- Objetivo: Listar os clientes que assinaram a lista de presença no dia 2025-08-25

-- Explicações:
-- LEFT JOINs conectam transacoes → transacao_produto → produtos para acessar o nome do produto;
-- Filtra pela data específica usando substr para pegar apenas a parte da data (YYYY-MM-DD);
-- Filtra pelo produto 'Lista de presença'.

SELECT DISTINCT t1.IdCliente
FROM transacoes AS t1

LEFT JOIN transacao_produto AS t2
    ON t1.IdTransacao = t2.IdTransacao

LEFT JOIN produtos AS t3
    ON t2.IdProduto = t3.IdProduto

WHERE substr(t1.DtCriacao, 1, 10) = '2025-08-25' 
    AND t3.DescNomeProduto = 'Lista de presença';


