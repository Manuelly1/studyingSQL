/*

- Objetivo: Exibir o curso mais vendido por categoria (por faturamento)

Para cada categoria, mostrar: categoria, curso mais vendido e faturamento

*/

WITH faturamento_por_curso AS (

    SELECT c.categoria,
           c.nome_curso,
           sum(c.preco) AS faturamento

    FROM cursos AS c

    INNER JOIN matriculas AS m
        ON c.id_curso = m.id_curso

    GROUP BY c.categoria, c.nome_curso

)

SELECT categoria,
       nome_curso AS cursoMaisVendido,
       faturamento

FROM (

    SELECT categoria,
           nome_curso,
           faturamento,
           DENSE_RANK() OVER (PARTITION BY categoria ORDER BY faturamento DESC) AS rk
    
    FROM faturamento_por_curso

) t

WHERE rk = 1;
