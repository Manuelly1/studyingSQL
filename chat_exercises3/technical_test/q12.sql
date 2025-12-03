/*

- Objetivo: Listar todos os produtos que nunca foram vendidos

*/

SELECT t1.nome_produto

FROM produtos1 AS t1

LEFT JOIN itens_pedido1 AS t2
    ON t1.id_produto = t2.id_produto

WHERE t2.id_produto IS NULL;


