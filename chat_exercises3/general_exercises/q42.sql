/*

- Objetivo: Exibir o pedido com o maior valor total

*/

SELECT id_pedido,
       valor_total

FROM pedidos1

ORDER BY valor_total DESC

LIMIT 1;