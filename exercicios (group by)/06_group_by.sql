-- Objetivo: exibir o dia da semana que teve mais pedidos em 2025

-- Usamos strftime para extrair o dia da semana do campo DtCriacao
-- '%w' retorna o dia da semana como número (0=domingo, 1=segunda, ..., 6=sábado)
-- substr é usado para pegar apenas a parte da data (YYYY-MM-DD) caso DtCriacao tenha hora

-- O GROUP BY "espreme"/agrupa as transações pelo dia da semana

-- O resultado será 5, ou seja, sexta-feira, já que a contagem dos dias começa em 0

SELECT strftime('%w', substr(DtCriacao, 1, 10)) AS diaSemana,

        count(DISTINCT IdTransacao) AS qtdeTransacao

FROM transacoes
WHERE substr(DtCriacao, 1, 4) = '2025'
GROUP BY diaSemana
ORDER BY qtdeTransacao DESC
LIMIT 1;

