-- para descobrir quantas vendas da exclamação presente teve
-- primeiro vai na tabela produtos e descobre qual o ID da lista de presença (é o 11)
-- mas fazer isso manualmente não é bacana

-- SELECT count(*)
-- FROM transacao_produto
-- WHERE IdProduto = 11

-- a melhor forma de fazer é a que está abaixo
-- "eu quero agrupar por ID do produto"

-- SELECT IdProduto, count(*)
-- FROM transacao_produto
-- GROUP BY IdProduto

-- para descobrir o usuário que mais juntos pontos no mês de julho

SELECT IdCliente,
        sum(QtdePontos)

FROM transacoes

WHERE DtCriacao >= '2025-07-01' AND 
        DtCriacao < '2025-08-01'

GROUP BY IdCliente

ORDER BY sum(QtdePontos) DESC

LIMIT 10