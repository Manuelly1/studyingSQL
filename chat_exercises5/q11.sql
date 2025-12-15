/*

- Objetivo: Listar o nome do curso, a quantidade de alunos e o ranking dos cursos por número de matrículas (sem pular posições)

DENSE_RANK

*/ 

SELECT nome_curso,
       qtdeAlunos,
       DENSE_RANK() OVER (ORDER BY qtdeAlunos DESC) AS ranking

FROM (

    SELECT c.nome_curso,
           count(DISTINCT m.id_aluno) AS qtdeAlunos

    FROM cursos AS c

    INNER JOIN matriculas AS m
        ON c.id_curso = m.id_curso

    GROUP BY c.id_curso, c.nome_curso
    
) sub;

