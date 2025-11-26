/*

- Objetivo: Exibir o pedido com o maior valor total

- Demonstrei com subquery e de uma forma mais simples

*/

SELECT id_pedido,
       valor_total AS maiorValor

FROM pedidos1

WHERE valor_total = (

    SELECT max(valor_total)
    FROM pedidos1

);


SELECT id_pedido,
       valor_total AS maiorValor

FROM pedidos1

ORDER BY maiorValor DESC

LIMIT 1;