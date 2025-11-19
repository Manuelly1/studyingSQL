/* 

Objetivo: ver o acumulado de transações por cliente ao longo dos dias (acumulado crescente)

Descrição da CTE (tb_cliente_dia): cria-se uma tabela temporária contendo o Id do cliente, o dia (extraído de DtCriacao) e a quantidade de 
transações distintas por cliente em cada dia. Em seguida, filtram-se apenas as transações ocorridas nos dias de curso e os dados são agrupados por 
cliente e por dia;

Descrição da CTE (tb_lag): com base nos dados da CTE anterior, calculam-se métricas adicionais utilizando janelas analíticas:

    - SUM(qtdeTransacao) OVER (...) → calcula o acumulado de transações por cliente ao longo dos dias;
    - LAG(qtdeTransacao) OVER (...) → retorna a quantidade de transações do dia anterior para o mesmo cliente, permitindo comparações entre dias.

Descrição da query final: selecionam-se todos os campos da CTE tb_lag e calcula-se a razão entre o número de transações do dia e o número de 
transações do dia anterior (qtdeTransacao / lagTransacao), possibilitando avaliar variações de um dia para o outro. 

*/


WITH tb_cliente_dia AS (

    SELECT IdCliente,
           substr(DtCriacao, 1, 10) AS dtDia,
           count(DISTINCT IdTransacao) AS qtdeTransacao

    FROM transacoes

    WHERE DtCriacao >= '2025-08-25'
        AND DtCriacao < '2025-08-30'

    GROUP BY IdCliente, dtDia

),

tb_lag AS (

    SELECT *,
        SUM(qtdeTransacao) OVER (PARTITION BY IdCliente ORDER BY dtDia) AS acumulado,
        lag(qtdeTransacao) OVER (PARTITION BY IdCliente ORDER BY dtDia) AS lagTransacao

    FROM tb_cliente_dia

)

SELECT *,
       1.* qtdeTransacao / lagTransacao

FROM tb_lag;
