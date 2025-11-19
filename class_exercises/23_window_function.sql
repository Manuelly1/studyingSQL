/* 

Objetivo: mostrar de quanto em quanto tempo (recorrência) cada pessoa retorna para assistir o curso. O foco não é a frequência (quantidade de 
visitas), mas sim o intervalo em dias entre uma visita e outra

Descrição da CTE (tb_cliente_dia): selecionam-se registros distintos com o Id do cliente e o dia da transação extraído de DtCriacao;
filtram-se apenas transações do ano de 2025. Cada linha representa um dia em que o cliente acessou o curso;

Descrição da CTE (tb_lag): calcula-se, para cada cliente, o dia anterior em que ele veio assistir, usando a função LAG
para obter dtDia da visita anterior dentro da ordem cronológica;

Descrição da CTE (tb_diff_dt): calcula-se a diferença de dias entre a data atual (dtDia) e a data anterior (lagDia),
utilizando julianday para transformar as datas em números contínuos e permitir a subtração;

Descrição da CTE (avg_cliente): calcula-se, para cada cliente, a média dos intervalos de dias entre visitas (avg(dtDiff)), resultando na 
recorrência média individual;

Descrição da query final: calcula-se a média geral das recorrências dos clientes, ou seja, o intervalo médio de retorno considerando todos os clientes.

*/

WITH tb_cliente_dia AS (

    SELECT DISTINCT
        idCliente, 
        substr(DtCriacao, 1, 10) AS dtDia

    FROM transacoes

    WHERE substr(DtCriacao, 1, 4) = '2025'

    ORDER BY IdCliente, dtDia

),

tb_lag AS (

    SELECT *,
           lag(dtDia) OVER (PARTITION BY IdCliente ORDER BY dtDia) AS lagDia

    FROM tb_cliente_dia

),

tb_diff_dt AS (

    SELECT *,
        julianday(dtDia) - julianday(lagDia) AS dtDiff

    FROM tb_lag 

),

avg_cliente AS (

    SELECT IdCliente,
        avg(dtDiff) AS avgDia

    FROM tb_diff_dt

    GROUP BY IdCliente

)

SELECT avg(avgDia)

FROM avg_cliente;


