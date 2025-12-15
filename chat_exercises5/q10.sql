/*

- Objetivo: Listar os alunos que estão matriculados em mais de um curso

*/ 

SELECT a.nome, 
       count(DISTINCT m.id_matricula) AS qtdeMatriculas

FROM alunos AS a

INNER JOIN matriculas AS m
    ON a.id_aluno = m.id_aluno

GROUP BY a.id_aluno, a.nome

HAVING count(DISTINCT m.id_matricula) > 1;