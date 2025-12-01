/*

- Objetivo: Mostrar o valor médio dos pedidos e listar apenas os pedidos acima dessa média (usando subquery)

*/

SELECT id_pedido,
       valor_total AS valorTotal

FROM pedidosE

WHERE valor_total > (

    SELECT avg(valor_total)
    FROM pedidosE

);