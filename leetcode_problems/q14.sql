/*

- Objetivo: Escrever uma solução para encontrar o tempo médio que cada máquina leva para concluir um processo

O tempo para concluir um processo é o tempo de `end` (timestamp) menos o tempo de `start` (timestamp). O tempo médio é calculado dividindo-se o 
tempo total de conclusão de cada processo na máquina pelo número de processos executados. A tabela resultante deve conter o `machine_id` juntamente
com o tempo médio (`processing_time`), arredondado para 3 casas decimais.

*/

SELECT a.machine_id,
       ROUND(AVG(b.timestamp - a.timestamp), 3) AS processing_time

FROM Activity a

JOIN Activity b
    ON a.machine_id = b.machine_id
    AND a.process_id = b.process_id

WHERE a.activity_type = 'start'
    AND b.activity_type = 'end'

GROUP BY a.machine_id;
