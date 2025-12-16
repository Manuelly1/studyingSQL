/*

- Objetivo: Para cada instrutor, mostrar: nome do instrutor e faturamento total dos cursos que ele ministra
    
*/ 

SELECT i.nome,
       sum(c.preco) AS faturamento

FROM instrutores AS i

INNER JOIN cursos AS c
    ON i.id_instrutor = c.id_instrutor

INNER JOIN matriculas AS m
    ON c.id_curso = m.id_curso

GROUP BY i.id_instrutor, i.nome;
