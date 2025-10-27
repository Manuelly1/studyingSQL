-- Em 2024, quantas transações de Lovers  tivemos?
-- teve que fazer 2 LEFT JOIN, pois na de transacao_produto não tinha todas as informações do produto
-- o segundo JOIN fica a direita do primeiro JOIN

SELECT count(DISTINCT t1.IdTransacao)
    --  t1.IdCliente,
    --  t2.IdProduto,
    --  t3.DescCategoriaProduto

FROM transacoes AS t1

LEFT JOIN transacao_produto AS t2
    ON t1.IdTransacao = t2.IdTransacao

LEFT JOIN produtos AS t3
    ON t2.IdProduto = t3.IdProduto

WHERE t1.DtCriacao >= '2024-01-01' AND 
    t1.DtCriacao < '2025-01-01' AND
    t3.DescCategoriaProduto = 'lovers'
