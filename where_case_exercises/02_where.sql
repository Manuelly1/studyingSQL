-- Objetivo: Exibir a lista de pedidos realizados no fim de semana.

-- Explicação:
-- strftime('%w', ...) retorna o dia da semana (0 = domingo, 6 = sábado).

SELECT IdTransacao, 
       DtCriacao,
       
       strftime('%w', datetime(substr(DtCriacao, 1, 19))) AS diaSemana

FROM transacoes
WHERE strftime('%w', datetime(substr(DtCriacao, 1, 19))) IN ('6','0');
