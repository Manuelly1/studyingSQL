-- Objetivo: Listar o ID dos clientes e os produtos comprados no mesmo dia

-- Explicações:
-- GROUP_CONCAT(t3.DescCategoriaProduto) → agrupa e concatena todos os produtos comprados no mesmo dia pelo cliente;
-- GROUP BY t1.IdCliente, substr(t1.DtCriacao, 1, 10) → agrupa por cliente e data da transação;
-- ORDER BY t1.IdCliente, Data → ordena o resultado por cliente e data.

SELECT 
        t1.IdCliente, 
        substr(t1.DtCriacao, 1, 10) AS Data,
        GROUP_CONCAT(t3.DescCategoriaProduto) AS ProdutosCompradosnoMesmoDia

FROM transacoes t1

INNER JOIN transacao_produto t2
    ON t1.IdTransacao = t2.IdTransacao

INNER JOIN produtos t3
    ON t2.IdProduto = t3.IdProduto

GROUP BY t1.IdCliente, substr(t1.DtCriacao, 1, 10)
ORDER BY t1.IdCliente, Data;