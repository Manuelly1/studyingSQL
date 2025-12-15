/*

- Objetivo: Listar os alunos cujo total gasto em cursos é maior que a média de gasto de todos os alunos

*/ 

WITH gastos_por_aluno AS (

    SELECT a.id_aluno,
           a.nome,
           sum(c.preco) AS totalGasto

    FROM alunos AS a

    INNER JOIN matriculas AS m 
        ON a.id_aluno = m.id_aluno

    INNER JOIN cursos AS c 
        ON m.id_curso = c.id_curso

    GROUP BY a.id_aluno, a.nome
)

SELECT *

FROM gastos_por_aluno

WHERE totalGasto > (

    SELECT avg(totalGasto)
    FROM gastos_por_aluno

);


SELECT a.nome,
       sum(c.preco) AS totalGasto

FROM alunos AS a

INNER JOIN matriculas AS m
    ON a.id_aluno = m.id_aluno

INNER JOIN cursos AS c
    ON m.id_curso = c.id_curso

GROUP BY a.id_aluno, a.nome

HAVING sum(c.preco) > (

    SELECT avg(totalporAluno)
    FROM (
    
        SELECT sum(c2.preco) AS totalporAluno

        FROM alunos AS a2

        INNER JOIN matriculas AS m2
            ON a2.id_aluno = m2.id_aluno
        
        INNER JOIN cursos AS c2
            ON m2.id_curso = c2.id_curso

        GROUP BY a2.id_aluno

    ) sub
);
