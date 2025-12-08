/*

- Objetivo: Na tabela Vendas, crie uma coluna com: soma acumulada das vendas com base na data 

*/

SELECT id_venda,
       data_venda,
       sum(valor_total) OVER (ORDER BY data_venda, id_venda) AS somaAcumulada

FROM vendasE;
