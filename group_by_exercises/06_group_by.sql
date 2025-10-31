-- Objetivo: Exibir o dia da semana que teve mais pedidos em 2025

-- Explicações:
-- strftime('%w', ...) extrai o dia da semana do campo DtCriacao (0=domingo, 1=segunda, ..., 6=sábado);
-- substr(DtCriacao, 1, 10) pega apenas a parte da data (YYYY-MM-DD);
-- GROUP BY agrupa as transações por dia da semana.

-- É retornado 5 como resultado, o que indica o dia como sendo sexta-feira (a contagem dos dias começa em 0).

SELECT strftime('%w', substr(DtCriacao, 1, 10)) AS diaSemana,

        count(DISTINCT IdTransacao) AS qtdeTransacao

FROM transacoes
WHERE substr(DtCriacao, 1, 4) = '2025'
GROUP BY diaSemana
ORDER BY qtdeTransacao DESC
LIMIT 1;

