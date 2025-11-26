-- Liste as categorias ordenadas pelo faturamento total (do maior para o menor)

SELECT t1.categoria,
       sum(t1.preco * t2.quantidade) AS faturamentoTotal

FROM produtos1 AS t1

INNER JOIN itens_pedido1 AS t2
    ON t1.id_produto = t2.id_produto

GROUP BY t1.categoria

ORDER BY faturamentoTotal DESC;

