/*

- Objetivo: Mostrar o nome dos produtos da categoria Acessórios ordenados pelo preço crescente

*/

SELECT nome_produto, 
       categoria,
       preco

FROM produtosE

WHERE categoria = 'Acessórios'

ORDER BY preco ASC;