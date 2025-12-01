/*

- Objetivo: Mostrar o cliente que comprou o produto mais caro

*/

-- sem subquery:

SELECT t1.nome,
       t4.nome_produto,
       t4.preco AS produtoMaisCaro

FROM clientes1 AS t1

INNER JOIN pedidos1 AS t2
    ON t1.id_cliente = t2.id_cliente

INNER JOIN itens_pedido1 AS t3
    ON t2.id_pedido = t3.id_pedido

INNER JOIN produtos1 AS t4
    ON t3.id_produto = t4.id_produto

ORDER BY produtoMaisCaro DESC

LIMIT 1;

-- com subquery:

SELECT t1.nome, 
       t4.nome_produto,
       t4.preco

FROM clientes1 AS t1

INNER JOIN pedidos1 AS t2
    ON t1.id_cliente = t2.id_cliente

INNER JOIN itens_pedido1 AS t3
    ON t2.id_pedido = t3.id_pedido

INNER JOIN produtos1 AS t4
    ON t3.id_produto = t4.id_produto

WHERE t4.preco = (

    SELECT max(preco)
    FROM produtos1

);

