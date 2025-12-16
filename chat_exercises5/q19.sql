/*

- Objetivo: Listar o nome dos alunos que não possuem nenhuma matrícula

*/ 

SELECT a.nome

FROM alunos AS a

LEFT JOIN matriculas AS m
    ON a.id_aluno = m.id_aluno

WHERE m.id_aluno IS NULL;

-- outra forma:

SELECT a.nome
FROM alunos AS a

WHERE NOT EXISTS (

    SELECT 1
    FROM matriculas AS m
    WHERE m.id_aluno = a.id_aluno

);
