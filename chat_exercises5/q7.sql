/*

- Objetivo: Mostrar o total de alunos matriculados por curso

*/ 

SELECT count(DISTINCT m.id_aluno) AS qtdeAlunos,
       c.nome_curso

FROM matriculas AS m

INNER JOIN cursos AS c
    ON m.id_curso = c.id_curso

GROUP BY c.nome_curso;