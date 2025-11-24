-- Quantos pedidos cada cliente fez? Lista os nomes.

-- Se quisesse só exibir a quantidade, só precisava fazer o count na tabela pedidos1.

SELECT t1.nome,
       count(t2.id_pedido) AS qtdePedidos

FROM clientes1 AS t1

LEFT JOIN pedidos1 AS t2
    ON t1.id_cliente = t2.id_cliente

GROUP BY t1.nome;
