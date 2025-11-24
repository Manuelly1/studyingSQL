-- Quantos produtos diferentes cada cliente já comprou? Coloque o nome dos produtos

-- O GROUP_CONCAT foi usado para complementar o count mostrando os nomes reais dos produtos. Ele junta vários valores de uma coluna em uma única 
-- linha, separados por vírgula.

SELECT t3.id_cliente,
       count(DISTINCT t2.id_produto) AS qtdeProdutosDiferentes,
       GROUP_CONCAT(DISTINCT t1.nome_produto) AS produtosComprados

FROM produtos1 AS t1

INNER JOIN itens_pedido1 AS t2
    ON t1.id_produto = t2.id_produto

INNER JOIN pedidos1 AS t3
    ON t2.id_pedido = t3.id_pedido
    
GROUP BY t3.id_cliente;
