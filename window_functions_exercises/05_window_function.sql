/* 

Objetivo: exibir, para cada usuário, qual é o dia da semana em que ele realizou a maior quantidade de transações

Descrição da Query:
    1. No CTE "tb_cliente_semana": extrai o dia da semana (%w retorna: 0 = domingo, 1 = segunda...), agrupa as transações por IdCliente e dia da 
    semana e conta quantas transações distintas cada cliente realizou em cada dia da semana;

    2. No CTE "tb_rn": aplica ROW_NUMBER() com PARTITION BY IdCliente para numerar os dias da semana de cada cliente, em ordem decrescente de 
    atividade. Assim, o dia mais ativo de cada cliente recebe rn = 1;

    3. Na query final: seleciona apenas as linhas com rn = 1, retornando para cada cliente o seu dia da semana mais movimentado.

Explicação da função de janela:
    - PARTITION BY IdCliente cria uma "janela" separada para cada cliente;
    - ORDER BY qtdeTransacao DESC ordena os dias da semana do mais ativo para o menos ativo;
    - ROW_NUMBER() atribui um número sequencial dentro de cada janela, permitindo identificar o topo (mais ativo).

*/

WITH tb_cliente_semana AS (

    SELECT IdCliente, 
           strftime('%w', substr(DtCriacao, 1, 10)) AS dtDiaSemana,
           count(DISTINCT IdTransacao) AS qtdeTransacao 

    FROM transacoes

    GROUP BY IdCliente, dtDiaSemana

),

tb_rn AS (

    SELECT *,
           ROW_NUMBER() OVER (PARTITION BY IdCliente ORDER BY qtdeTransacao DESC) AS rn

    FROM tb_cliente_semana  

)

SELECT *

FROM tb_rn

WHERE rn = 1;
