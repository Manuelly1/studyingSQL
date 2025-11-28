/*

- Objetivo: Mostrar o nome do cliente que realizou o maior número de pedidos

*/

SELECT t1.nome,
       count(DISTINCT t2.id_pedido) AS qtdePedidos

FROM clientes1 AS t1

INNER JOIN pedidos1 AS t2
    ON t1.id_cliente = t2.id_cliente

GROUP BY t1.id_cliente, t1.nome

HAVING count(DISTINCT t2.id_pedido) = (

    SELECT max(totalPedidos)
    
    FROM (
    
        SELECT count(id_pedido) AS totalPedidos
        FROM pedidos1
        GROUP BY id_cliente
    
    ) sub

);


