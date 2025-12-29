/*

- Objetivo: Listar os alunos cujo gasto total esteja no top 30% dos gastos

*/

WITH gasto_aluno AS (

    SELECT a.id_aluno,
           a.nome,
           sum(c.preco) AS gastoTotal
    
    FROM alunos AS a
    
    INNER JOIN matriculas AS m
        ON a.id_aluno = m.id_aluno

    INNER JOIN cursos AS c
        ON m.id_curso = c.id_curso

    GROUP BY a.id_aluno, a.nome

),

ranking AS (
    
    SELECT nome,
           gastoTotal,
           PERCENT_RANK() OVER (ORDER BY gastoTotal DESC) AS pr
    
    FROM gasto_aluno

)

SELECT nome, 
       gastoTotal

FROM ranking

WHERE pr <= 0.3;

