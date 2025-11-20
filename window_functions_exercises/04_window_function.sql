/* 

Objetivo: verificar quando atingiu mais de 3.000 clientes

A query segue a mesma estrutura da que se encontra no arquivo 02_window_function.sql

*/

WITH tb_dia_cliente AS (

    SELECT 
        substr(DtCriacao, 1, 10) AS dtDia,
        count(DISTINCT IdCliente) AS qtdeCliente

    FROM clientes

    GROUP BY dtDia

),

tb_acum AS (

    SELECT *,
           sum(qtdeCliente) OVER (ORDER BY dtDia) AS qtdeClienteAcum

    FROM tb_dia_cliente

)

SELECT *

FROM tb_acum

WHERE qtdeClienteAcum > 3000

ORDER BY qtdeClienteAcum

LIMIT 1;
