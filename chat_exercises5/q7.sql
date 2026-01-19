/*

- Objetivo: Mostrar o total de alunos matriculados por curso

*/ 

SELECT c.nome_curso,
       count(DISTINCT m.id_aluno) AS qtdeAlunos

FROM matriculas AS m

INNER JOIN cursos AS c
    ON m.id_curso = c.id_curso

GROUP BY c.id_curso, c.nome_curso;