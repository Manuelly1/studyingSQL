-- Objetivo: Mostrar o total de produtos vendidos (quantidade e valor total) por produto (exibindo o nome, não o ID)

-- Explicações:
-- Neste caso usa o INNER JOIN, pois ele irá retornar apenas os produtos vendidos, enquanto o LEFT JOIN traria também 
-- os produtos que ainda não tiveram venda;
-- SUM(QtdeProduto) soma todas as quantidades vendidas daquele produto;
-- SUM(QtdeProduto * vlProduto) soma o valor total vendido daquele produto;
-- GROUP BY IdProduto garante que você tenha uma linha por produto.

SELECT 
        t2.DescNomeProduto,
        SUM(t1.QtdeProduto) AS totalQuantidade,
        SUM(t1.QtdeProduto * t1.vlProduto) AS totalValor
        
FROM transacao_produto AS t1

INNER JOIN produtos AS t2
    ON t1.IdProduto = t2.IdProduto

GROUP BY t1.IdProduto;




