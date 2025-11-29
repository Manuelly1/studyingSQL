/*

- Objetivo: Retornar os clientes cujo gasto total em pedidos é superior à média de gastos dos clientes da mesma cidade

*/

WITH tb_clientes_gastos_totais AS (

    SELECT t1.nome,
           t1.cidade,
           sum(t2.valor_total) AS total

    FROM clientes1 AS t1

    INNER JOIN pedidos1 AS t2
        ON t1.id_cliente = t2.id_cliente

    GROUP BY t1.id_cliente, t1.nome, t1.cidade

)

SELECT t3.*

FROM tb_clientes_gastos_totais AS t3

WHERE t3.total > (

    SELECT avg(t4.total)

    FROM tb_clientes_gastos_totais AS t4
    
    WHERE t3.cidade = t4.cidade

);


