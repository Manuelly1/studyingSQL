-- Essa query retorna todas as transações realizadas entre 1º de janeiro e 30 de junho de 2025.

-- Mas, em vez de usar um único WHERE, ela faz isso em duas etapas: uma dentro e outra fora da subquery.

-- O SELECT dentro do primeiro FROM é tratado como uma tabela temporária/filtrada. Depois que a subquery foi executada, a query 
-- principal aplica um novo filtro sobre o resultado da primeira: seleciona somente as linhas cuja data seja anterior a '2025-07-01'

-- No exemplo abaixo não havia a necessidade de fazer isso, o prof fez apenas para mostrar um uso diferente de subquery.

SELECT *

FROM (

    SELECT *
    FROM transacoes AS t1
    WHERE DtCriacao >= '2025-01-01'

)

WHERE DtCriacao < '2025-07-01';

-- É a mesma coisa de escrever assim:

-- SELECT *
-- FROM transacoes
-- WHERE DtCriacao >= '2025-01-01'
-- AND DtCriacao < '2025-07-01';
