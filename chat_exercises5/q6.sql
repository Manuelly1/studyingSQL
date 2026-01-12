/*

- Objetivo: Listar o nome do aluno e o nome do curso em que ele está matriculado

*/  

SELECT a.nome,
       GROUP_CONCAT(c.nome_curso, ', ') AS nomeCurso

FROM alunos AS a

INNER JOIN matriculas AS m
    ON a.id_aluno = m.id_aluno

INNER JOIN cursos AS c
    ON m.id_curso = c.id_curso

GROUP BY a.id_aluno, a.nome;

