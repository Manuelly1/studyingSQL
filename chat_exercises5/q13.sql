/*

- Objetivo: Para cada categoria de curso, mostrar: categoria e faturamento total (preco × quantidade de matrículas)

*/ 

SELECT categoria,
       sum(faturamentoCurso) AS faturamentoTotal

FROM (

    SELECT c.id_curso,
           c.categoria,
           c.preco * COUNT(m.id_matricula) AS faturamentoCurso

    FROM cursos AS c

    LEFT JOIN matriculas AS m
        ON c.id_curso = m.id_curso

    GROUP BY c.id_curso, c.categoria, c.preco

) sub

GROUP BY categoria;
