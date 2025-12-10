/*

- Objetivo: Considere a tabela Pedidos. Escreva uma query que retorne: id_pedido, valor_total e média móvel das últimas 3 vendas, 
ordenadas pela data

ROWS BETWEEN 2 PRECEDING AND CURRENT ROW → pega a janela das 3 últimas linhas: linha atual, 1 anterior e 2 anteriores

*/

SELECT id_pedido,
       valor_total,
       avg(valor_total) OVER (

            ORDER BY data_pedido 
            ROWS BETWEEN 2 PRECEDING AND CURRENT ROW

        ) AS mediaMovel3Vendas

FROM pedidosE;