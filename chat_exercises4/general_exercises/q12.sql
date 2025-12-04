/*

- Objetivo: Mostrar os produtos que nunca foram vendidos, usando subquery com NOT IN

*/

SELECT nome_produto

FROM produtosE 

WHERE id_produto NOT IN (

    SELECT id_produto
    FROM itens_pedidoE

);
