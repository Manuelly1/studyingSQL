-- Mostre o pedido com o maior valor total, incluindo: id_pedido, nome do cliente e valor_total

SELECT t1.id_pedido,
       t2.nome,
       t1.valor_total
       
FROM pedidos1 AS t1

INNER JOIN clientes1 AS t2
    ON t1.id_cliente = t2.id_cliente

ORDER BY t1.valor_total DESC

LIMIT 1;

-- Outra forma:

WITH tb_maior_valor AS (

    SELECT max(valor_total) AS maiorValor
    FROM pedidos1

)

SELECT t1.id_pedido,
       t2.nome,
       t1.valor_total

FROM pedidos1 AS t1

INNER JOIN clientes1 AS t2
    ON t1.id_cliente = t2.id_cliente

INNER JOIN tb_maior_valor AS t3
    ON t1.valor_total = t3.maiorValor;
