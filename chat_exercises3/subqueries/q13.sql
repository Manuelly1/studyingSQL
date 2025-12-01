/*

- Objetivo: Exibir os produtos cujo faturamento é maior que o faturamento médio de todos os produtos

*/

SELECT t1.nome_produto,
       sum(t1.preco * t2.quantidade) AS faturamento

FROM produtos1 AS t1

INNER JOIN itens_pedido1 AS t2
    ON t1.id_produto = t2.id_produto

GROUP BY t1.id_produto, t1.nome_produto

HAVING sum(t1.preco * t2.quantidade) > (
    
    SELECT avg(faturamentoProd)

    FROM (

        SELECT sum(t3.preco * t4.quantidade) AS faturamentoProd

        FROM produtos1 AS t3

        INNER JOIN itens_pedido1 AS t4
            ON t3.id_produto = t4.id_produto

        GROUP BY t3.id_produto

    ) AS t

);
