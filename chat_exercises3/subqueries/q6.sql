-- Liste os produtos que foram vendidos em quantidade maior que a média geral de vendas por produto

SELECT t1.nome_produto,
       sum(t2.quantidade) AS totalVendido

FROM produtos1 AS t1

INNER JOIN itens_pedido1 AS t2
    ON t1.id_produto = t2.id_produto

GROUP BY t1.id_produto, t1.nome_produto

HAVING sum(t2.quantidade) > (

    SELECT avg(totalPorProduto)

        FROM (

            SELECT sum(quantidade) AS totalPorProduto
            FROM itens_pedido1
            GROUP BY id_produto

        ) sub

);

