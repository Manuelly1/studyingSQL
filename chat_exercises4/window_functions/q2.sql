/*

- Objetivo: Na tabela Pedidos, retorne: cliente, total e total médio da tabela inteira → usando AVG() OVER()

*/

SELECT id_cliente AS cliente,
       valor_total AS total,
       avg(valor_total) OVER () AS totalMedio

FROM pedidosE;
