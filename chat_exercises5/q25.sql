/*

- Objetivo: Exibir o faturamento acumulado por curso (ao longo do tempo)

Listar: nome do curso, data da matrícula e faturamento acumulado do curso

PARTITION BY c.id_curso → reinicia o acumulado para cada curso

ORDER BY m.data_matricula → define a ordem temporal do acumulado

ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW → garante acumulado linha a linha 

*/

SELECT c.nome_curso,
       m.data_matricula,
       sum(c.preco) OVER (

        PARTITION BY c.id_curso 
        ORDER BY m.data_matricula
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW

    ) AS faturamentoAcum

FROM cursos AS c

INNER JOIN matriculas AS m
    ON c.id_curso = m.id_curso

ORDER BY c.nome_curso, m.data_matricula;
