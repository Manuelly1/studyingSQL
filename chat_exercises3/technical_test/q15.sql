/*

- Objetivo: Ranking de Produtos, a partir de: produtos e itens_pedido, retorne: nome do produto, vendas totais e ranking de vendas (maior para 
menor), sem pular números
    
*/

SELECT t1.nome_produto,
       sum(t2.quantidade * t1.preco) AS vendasTotais,
       dense_rank() OVER (

            ORDER BY sum(t2.quantidade * t1.preco) DESC

       ) AS rankingVendas

FROM produtosE AS t1

INNER JOIN itens_pedidoE AS t2
    ON t1.id_produto = t2.id_produto

GROUP BY t1.id_produto, t1.nome_produto;