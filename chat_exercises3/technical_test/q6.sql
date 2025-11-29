/*

- Objetivo: Mostrar o total de vendas por produto

*/

SELECT produto,
       sum(valor_total) AS totalVendas

FROM vendas1

GROUP BY produto;