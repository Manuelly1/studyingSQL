/*

- Objetivo: Selecionar todas as vendas do produto “Café”, ordenando pelo valor_total de forma decrescente

*/

SELECT id_venda,
       produto,
       valor_total

FROM vendas1

WHERE produto = 'Café'

ORDER BY valor_total DESC;