/*

- Objetivo: Gerar um ranking dos cursos mais vendidos (por quantidade de matrículas), sem pular posições

*/ 

WITH cursos_matriculas AS (

    SELECT c.id_curso,
           c.nome_curso,
           count(m.id_matricula) AS qtdeMatriculas

    FROM cursos AS c

    LEFT JOIN matriculas AS m
        ON c.id_curso = m.id_curso

    GROUP BY c.id_curso, c.nome_curso
)

SELECT nome_curso,
       qtdeMatriculas,
       DENSE_RANK() OVER (ORDER BY qtdeMatriculas DESC) AS ranking
       
FROM cursos_matriculas;
