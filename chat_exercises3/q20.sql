-- Liste as categorias e o total arrecadado por categoria

-- valor arrecadado por produto = quantidade × preço
-- valor por categoria = soma desses valores

SELECT t1.categoria,
       sum(t2.quantidade * t1.preco) AS totalArrecadado

FROM produtos1 AS t1

LEFT JOIN itens_pedido1 AS t2
    ON t1.id_produto = t2.id_produto
    
GROUP BY t1.categoria;
