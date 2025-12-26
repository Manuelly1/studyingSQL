/*

- Objetivo: Exibir os alunos cujo gasto total é maior que o maior gasto dos alunos de Natal

Listar: nome do aluno e total gasto

*/

SELECT a.nome,
       sum(c.preco) AS gastoTotal

FROM alunos AS a

INNER JOIN matriculas AS m
    ON a.id_aluno = m.id_aluno

INNER JOIN cursos AS c
    ON m.id_curso = c.id_curso

GROUP BY a.id_aluno, a.nome

HAVING sum(c.preco) > (

    SELECT max(gasto)
    FROM (

        SELECT a2.id_aluno,
               sum(c2.preco) AS gasto

        FROM alunos AS a2

        INNER JOIN matriculas AS m2
            ON a2.id_aluno = m2.id_aluno

        INNER JOIN cursos AS c2
            ON m2.id_curso = c2.id_curso

        WHERE a2.cidade = 'Natal'

        GROUP BY a2.id_aluno

    ) t
);


