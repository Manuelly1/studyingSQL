-- Objetivo: Mostrar os produtos comprados na transação de ID 
-- 0000520a-a4e5-4977-b360-17be62fa0f2b (antes fiz uma consulta e resgatei esse ID)

SELECT 
    t2.IdProduto,
    t2.DescCategoriaProduto,
    t2.DescDescricaoProduto,
    t2.DescNomeProduto,
    t1.QtdeProduto

FROM transacao_produto AS t1

INNER JOIN produtos AS t2
    ON t1.IdProduto = t2.IdProduto

WHERE t1.IdTransacao = '0000520a-a4e5-4977-b360-17be62fa0f2b';  
