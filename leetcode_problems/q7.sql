-- Escreva uma solução para encontrar a primeira data de login de cada jogador

-- Explicações:
-- Como é para cada jogador, o GROUP BY "espreme" os registros por player_id para obter algo único por jogador;
-- O MIN(event_date) retorna a menor data, ou seja, o primeiro dia de acesso de cada jogador.

SELECT 
    player_id,
    MIN(event_date) AS first_login

FROM Activity
GROUP BY player_id;