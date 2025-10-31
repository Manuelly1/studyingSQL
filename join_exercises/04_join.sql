-- Objetivo: Listar os clientes que mais perderam pontos com produtos da categoria "Lovers"

-- Explicações:
-- Não foi necessário usar a tabela clientes, pois a tabela transacoes já contém IdCliente e QtdePontos;
-- LEFT JOINs conectam transacoes → transacao_produto → produtos para acessar a categoria do produto;
-- Filtra pela categoria 'lovers' e soma os pontos por cliente;
-- ORDER BY totalPontos ASC retorna primeiro os clientes que mais perderam pontos, que é o objetivo do problema.

SELECT t1.IdCliente, 
    sum(t1.QtdePontos) AS totalPontos

FROM transacoes AS t1

LEFT JOIN transacao_produto AS t2
    ON t1.IdTransacao = t2.IdTransacao

LEFT JOIN produtos AS t3
    ON t2.IdProduto = t3.IdProduto

WHERE t3.DescCategoriaProduto = 'lovers'
GROUP BY t1.IdCliente
ORDER BY totalPontos ASC 
LIMIT 5;