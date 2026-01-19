/*

- Objetivo: Exibir os produtos cujo faturamento é maior que o faturamento médio de todos os produtos

*/

SELECT p.nome_produto,
       sum(p.preco * i.quantidade) AS faturamento

FROM produtos1 AS p

INNER JOIN itens_pedido1 AS i
    ON p.id_produto = i.id_produto

GROUP BY p.id_produto, p.nome_produto

HAVING sum(p.preco * i.quantidade) > (

    SELECT avg(total)
    FROM (
    
        SELECT sum(p1.preco * i1.quantidade) AS total
        FROM produtos1 AS p1

        INNER JOIN itens_pedido1 AS i1
            ON p1.id_produto = i1.id_produto

        GROUP BY p1.id_produto
    
    ) sub

);

-- com cte:

WITH faturamento_produto AS (

    SELECT p.id_produto,
           p.nome_produto,
           sum(p.preco * i.quantidade) AS faturamento

    FROM produtos1 AS p

    INNER JOIN itens_pedido1 AS i
        ON p.id_produto = i.id_produto

    GROUP BY p.id_produto, p.nome_produto
)

SELECT nome_produto, faturamento

FROM faturamento_produto

WHERE faturamento > (

    SELECT avg(faturamento)
    FROM faturamento_produto
    
);
