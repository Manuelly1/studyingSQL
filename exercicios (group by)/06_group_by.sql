-- qual dia da semana tem mais pedidos em 2025?
-- temos que encontrar o dia da semana da DtCriacao
-- por isso usamos o strftime, para pegar o dia da semana daquela data
-- o '%w' representa week = semana

SELECT 
        strftime('%w', substr(DtCriacao, 1, 10)) AS diaSemana,
        count(DISTINCT IdTransacao) AS qtdeTransacao     

FROM transacoes

WHERE substr(DtCriacao, 1, 4) = '2025'

GROUP BY diaSemana

-- funciona tbm se colocar GROUP BY 1