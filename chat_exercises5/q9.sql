/*

- Objetivo: Para cada instrutor, mostrar a quantidade de cursos que ele ministra

*/ 

SELECT i.nome, 
       count(DISTINCT c.id_curso) AS qtdeCursos

FROM instrutores AS i

LEFT JOIN cursos AS c
    ON i.id_instrutor = c.id_instrutor

GROUP BY i.id_instrutor, i.nome;