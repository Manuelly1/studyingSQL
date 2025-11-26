-- Exiba os produtos que tiveram faturamento total acima da média de faturamento de todos os produtos.
-- (Faturamento = quantidade × preco_unitario)

WITH tb_faturamento_produto AS (

    SELECT t1.id_produto,
           t1.nome_produto,
           sum(t1.preco * t2.quantidade) AS faturamento

    FROM produtos1 AS t1

    JOIN itens_pedido1 AS t2
        ON t1.id_produto = t2.id_produto

    GROUP BY t1.id_produto, t1.nome_produto
    
)

SELECT nome_produto, 
       faturamento

FROM tb_faturamento_produto

WHERE faturamento > (

    SELECT avg(faturamento) 
    FROM tb_faturamento_produto

);



