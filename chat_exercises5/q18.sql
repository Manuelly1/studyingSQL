/*

- Objetivo: Listar: nome do curso e quantidade de matrículas. Somente cursos cuja quantidade de matrículas seja maior que a média de 
matrículas por curso

*/ 

SELECT c.nome_curso,
       count(DISTINCT m.id_matricula) AS qtdeMatriculas

FROM cursos AS c

INNER JOIN matriculas AS m  
    ON c.id_curso = m.id_curso

GROUP BY c.id_curso, c.nome_curso

HAVING count(DISTINCT m.id_matricula) > (

    SELECT avg(qtdeMatriculasTotal)
    FROM (
    
        SELECT count(DISTINCT m2.id_matricula) AS qtdeMatriculasTotal

        FROM cursos AS c2

        INNER JOIN matriculas AS m2  
            ON c2.id_curso = m2.id_curso

        GROUP BY c2.id_curso, c2.nome_curso

    ) sub

);

-- com cte:

WITH matriculas_por_curso AS (

    SELECT c.id_curso,
           c.nome_curso,
           count(m.id_matricula) AS qtdeMatriculas

    FROM cursos AS c

    INNER JOIN matriculas AS m 
        ON c.id_curso = m.id_curso

    GROUP BY c.id_curso, c.nome_curso
)

SELECT nome_curso, 
       qtdeMatriculas

FROM matriculas_por_curso

WHERE qtdeMatriculas > (

    SELECT avg(qtdeMatriculas)
    FROM matriculas_por_curso

);
