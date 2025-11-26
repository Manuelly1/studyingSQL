/*

- Objetivo: Mostrar os clientes que gastaram mais que a média de gastos dos clientes

*/

WITH tb_gasto_por_cliente AS (

    SELECT 
          id_cliente,
          sum(valor_total) AS totalGasto

    FROM pedidos1

    GROUP BY id_cliente
),

tb_media_geral AS (

    SELECT 
          AVG(totalGasto) AS mediaGastos

    FROM tb_gasto_por_cliente
)

SELECT 
      t1.id_cliente,
      t1.totalGasto

FROM tb_gasto_por_cliente AS t1

INNER JOIN tb_media_geral AS t2
    ON t1.totalGasto > t2.mediaGastos;
