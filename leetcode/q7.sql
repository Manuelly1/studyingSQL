-- Escreva uma solução para encontrar a primeira data de login de cada jogador.

-- Como era para cada jogador, eu usei o GROUP BY para "espremer" por id para achar algo único de cada jogador.
-- O (MIN(event_date)) foi usado para resgatar a menor data, ou seja, o primeiro dia de acesso. 

SELECT 
    player_id,
    MIN(event_date) AS first_login

FROM Activity

GROUP BY player_id;