/*

- Objetivo: Dada a tabela Vendas(produto, valor, data), escreva uma consulta que retorne: produto, valor e maior valor de venda da 
tabela (em uma coluna chamada `maiorVenda`)

*/

SELECT produto,
       valor_total,
       max(valor_total) OVER (PARTITION BY produto) AS maiorVenda

FROM vendasE;

