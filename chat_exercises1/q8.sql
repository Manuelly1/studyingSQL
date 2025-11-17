-- Objetivo: Listar os clientes que gastaram R$ 500 ou mais no total (use HAVING)

-- Observação:
-- Antes, eu havia apenas comparado o HAVING com base no t1.vlProduto, mas depois vi que se tratava do valor total gasto por cliente.
-- Por isso, foi necessário aplicar o SUM(t1.QtdeProduto * t1.vlProduto) e fazer o filtro em cima dessa soma.

SELECT t2.IdCliente, 
        SUM(t1.QtdeProduto * t1.vlProduto) AS totalGasto

FROM transacao_produto AS t1

INNER JOIN transacoes AS t2
    ON t1.IdTransacao = t2.IdTransacao

INNER JOIN clientes AS t3
    ON t2.IdCliente = t3.IdCliente

GROUP BY t2.IdCliente
HAVING totalGasto >= 500
ORDER BY totalGasto DESC
LIMIT 10;