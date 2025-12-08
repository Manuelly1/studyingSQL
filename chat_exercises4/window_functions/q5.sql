/*

- Objetivo: Na tabela Pedidos, traga: valor e média móvel de 3 linhas (3 últimas vendas)

- ROWS BETWEEN 2 PRECEDING AND CURRENT ROW → pega: a linha atual e 2 linhas anteriores;
- O AVG calcula a média desse intervalo deslizante (móvel).
    
*/

SELECT id_pedido,
       valor_total,
       avg(valor_total) OVER (

            ORDER BY id_pedido
            ROWS BETWEEN 2 PRECEDING AND CURRENT ROW

       ) AS mediaMovel3

FROM pedidosE;
