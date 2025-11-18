-- Objetivo: Mostrar o cliente que mais gastou no total

-- A tabela "transacoes" traz o cliente associado a cada transação;
-- A tabela "transacao_produto" traz os itens vendidos em cada transação;
-- O INNER JOIN liga cada transação aos seus respectivos itens;
-- Em seguida, é calculado quanto cada cliente gasto, somando (quantidade * valor do produto) para todos os itens de todas as transações dele;
-- O GROUP BY agrupa os resultados por cliente, enquanto o ORDER BY ordena do cliente que gastou mais para o que gastou menos.

SELECT 
    t1.IdCliente,
    SUM(t2.QtdeProduto * t2.vlProduto) AS totalGasto

FROM transacoes AS t1

INNER JOIN transacao_produto AS t2
    ON t1.IdTransacao = t2.IdTransacao

GROUP BY t1.IdCliente

ORDER BY totalGasto DESC
LIMIT 1;

