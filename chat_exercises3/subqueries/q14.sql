/*

- Objetivo: Listar os pedidos cujo valor total é maior que a média dos pedidos

*/

SELECT id_pedido, 
       valor_total

FROM pedidos1

WHERE valor_total > (

    SELECT avg(valor_total)

    FROM pedidos1

);
