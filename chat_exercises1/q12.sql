-- Objetivo: Mostrar o ID do cliente e o número total de produtos diferentes que ele comprou

-- Explicações:
-- COUNT(DISTINCT t2.IdProduto) → conta quantos produtos diferentes ele comprou;
-- GROUP BY t1.IdCliente → agrupa os registros por cliente;
-- Não usei a tabela clientes como base, pois não tem relação direta com a de produtos, então fui logo para a de transacoes.

SELECT t1.IdCliente, 
        COUNT(DISTINCT t2.IdProduto) AS totalProdutos

FROM transacoes t1

INNER JOIN transacao_produto t2
    ON t1.IdTransacao = t2.IdTransacao

GROUP BY t1.IdCliente;
