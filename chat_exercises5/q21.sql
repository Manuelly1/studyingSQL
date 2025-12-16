/*

- Objetivo: Listar apenas uma vez o nome dos cursos que tiveram pelo menos uma matrícula após 01/03/2024
    
*/ 

SELECT DISTINCT c.nome_curso

FROM cursos AS c

INNER JOIN matriculas AS m
    ON c.id_curso = m.id_curso

WHERE m.data_matricula > '2024-03-01';


-- outra forma:

SELECT c.nome_curso

FROM cursos AS c

WHERE EXISTS (

    SELECT 1
    
    FROM matriculas AS m

    WHERE m.id_curso = c.id_curso
        AND m.data_matricula > '2024-03-01'

);
