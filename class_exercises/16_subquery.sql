-- Objetivo: Retornar todas as transações realizadas entre 1º de janeiro e 30 de junho de 2025.

-- Explicações:
-- A query usa uma subquery para demonstrar um uso diferente de subquery (diretamente no FROM);
-- O SELECT dentro do FROM cria uma "tabela temporária" filtrada (DtCriacao >= '2025-01-01');
-- A query principal aplica um novo filtro sobre essa tabela temporária (DtCriacao < '2025-07-01').

-- Observação: neste caso, não havia necessidade de subquery, poderia ser feito diretamente:
-- SELECT * FROM transacoes
-- WHERE DtCriacao >= '2025-01-01' AND DtCriacao < '2025-07-01';

SELECT *

FROM (

    SELECT *
    FROM transacoes AS t1
    WHERE DtCriacao >= '2025-01-01'

)

WHERE DtCriacao < '2025-07-01';

