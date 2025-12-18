/*

- Objetivo: Na tabela pedidos, retornar: id_pedido, data_pedido, valor_total e média móvel dos últimos 3 pedidos, ordenados pela data
    
*/

SELECT id_pedido,
       data_pedido,
       valor_total,
       avg(valor_total) OVER (

           ORDER BY data_pedido
           ROWS BETWEEN 2 PRECEDING AND CURRENT ROW

       ) AS mediaMovel

FROM pedidos1;
