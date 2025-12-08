/*

- Objetivo: Na tabela Produtos, liste: produto, vendas_totais e ranking dos produtos, do maior para o menor
            
*/

SELECT t1.nome_produto AS produto,
       sum(t2.quantidade * t1.preco) AS vendasTotais,
       DENSE_RANK() OVER (ORDER BY SUM(t2.quantidade * t1.preco) DESC) AS ranking

FROM produtosE AS t1

LEFT JOIN itens_pedidoE AS t2
    ON t1.id_produto = t2.id_produto

GROUP BY t1.nome_produto;
