/* 

Objetivo: retornar a quantidade de usuários cadastrados (absoluto e acumulado) ao longo do tempo

A query segue a mesma estrutura da que retornou a quantidade de transações acumuladas (01_window_function.sql). Porém, neste caso:

A função de janela SUM(...) OVER (ORDER BY dtDia) cria um acumulado progressivo da quantidade de clientes cadastrados ao longo do tempo.

*/

WITH tb_dia_cliente AS (

    SELECT 
        substr(DtCriacao, 1, 10) AS dtDia,
        count(DISTINCT IdCliente) AS qtdeCliente

    FROM clientes

    GROUP BY dtDia

)

SELECT *,
       sum(qtdeCliente) OVER (ORDER BY dtDia) AS qtdeClienteAcum

FROM tb_dia_cliente;

