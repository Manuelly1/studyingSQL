/*

- Objetivo: Listar os cursos que não possuem nenhuma matrícula

Duas formas de resolver:

*/ 

SELECT c.nome_curso, 
       count(DISTINCT m.id_matricula) AS qtdeMatriculas

FROM cursos AS c

LEFT JOIN matriculas AS m
    ON c.id_curso = m.id_curso

GROUP BY c.id_curso, c.nome_curso

HAVING count(DISTINCT m.id_matricula) = 0;

-- mais simples:

SELECT c.nome_curso

FROM cursos AS c

LEFT JOIN matriculas AS m
    ON c.id_curso = m.id_curso

WHERE m.id_matricula IS NULL;
