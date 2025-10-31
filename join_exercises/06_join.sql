-- Objetivo: Retornar a quantidade de alunos que, do início ao fim do nosso curso (2025-08-25 a 2025-08-29), 
-- assinaram a lista de presença.

-- Explicações:
-- LEFT JOINs conectam transacoes → transacao_produto → produtos para acessar o nome do produto;
-- Filtra o período completo do curso usando DtCriacao;
-- Filtra pelo produto 'Lista de presença';
-- COUNT(DISTINCT t1.IdCliente) garante que cada cliente seja contado apenas uma vez, mesmo que tenha múltiplas transações no período.

SELECT count(DISTINCT t1.IdCliente) AS qtdeAlunos

FROM transacoes AS t1

LEFT JOIN transacao_produto AS t2
    ON t1.IdTransacao = t2.IdTransacao

LEFT JOIN produtos AS t3
    ON t2.IdProduto = t3.IdProduto

WHERE t1.DtCriacao >= '2025-08-25'
    AND t1.DtCriacao < '2025-08-30' 
    AND t3.DescNomeProduto = 'Lista de presença';

