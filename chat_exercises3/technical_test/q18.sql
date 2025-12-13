/*

- Objetivo: Para cada categoria de produto, mostrar: faturamento total e o produto mais vendido em faturamento dentro da categoria. 
Não usar `ORDER BY + LIMIT`

Demonstrei duas abordagens: uma utilizando subconsulta no `HAVING` e outra utilizando `WINDOW FUNCTION` com `DENSE_RANK()`
    
*/ 

SELECT t1.categoria,
       t1.nome_produto,
       sum(t2.quantidade * t1.preco) AS faturamentoTotal

FROM produtos1 AS t1

INNER JOIN itens_pedido1 AS t2
    ON t1.id_produto = t2.id_produto

GROUP BY t1.categoria, t1.nome_produto

HAVING sum(t2.quantidade * t1.preco) = (

    SELECT max(faturamentoProduto)
    FROM (

        SELECT t3.categoria,
               t3.nome_produto,
               sum(t4.quantidade * t3.preco) AS faturamentoProduto

        FROM produtos1 AS t3

        INNER JOIN itens_pedido1 AS t4
            ON t3.id_produto = t4.id_produto

        GROUP BY t3.categoria, t3.nome_produto

    ) sub

    WHERE sub.categoria = t1.categoria
);




WITH faturamento_produto AS (

    SELECT p.categoria,
           p.nome_produto,
           sum(i.quantidade * p.preco) AS faturamentoProduto,
           DENSE_RANK() OVER (

                PARTITION BY p.categoria
                ORDER BY sum(i.quantidade * p.preco) DESC

        ) AS rankingCategoria

    FROM produtos1 AS p

    INNER JOIN itens_pedido1 AS i
        ON p.id_produto = i.id_produto

    GROUP BY p.categoria, p.nome_produto

)

SELECT categoria,
       nome_produto AS produtoMaisVendido,
       faturamentoProduto

FROM faturamento_produto

WHERE rankingCategoria = 1;
