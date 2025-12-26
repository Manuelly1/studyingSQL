/*

- Objetivo: Exibir cursos com crescimento de matrículas mês a mês

Para cada curso e mês, mostrar: nome do curso, mês, total de matrículas e variação em relação ao mês anterior

*/

SELECT nome_curso,
       mes,
       totalMatriculas,
       totalMatriculas 
        - LAG(totalMatriculas) OVER (

            PARTITION BY id_curso
            ORDER BY mes

        ) AS variacaoMesAnterior

FROM (

    SELECT c.id_curso,
           c.nome_curso,
           strftime('%m', m.data_matricula) AS mes,
           count(m.id_matricula) AS totalMatriculas

    FROM cursos AS c

    INNER JOIN matriculas AS m
        ON c.id_curso = m.id_curso

    GROUP BY c.id_curso, c.nome_curso, strftime('%m', m.data_matricula)

) t

ORDER BY nome_curso, mes;

