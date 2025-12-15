/*

- Objetivo: Listar o curso mais caro de cada categoria (não usar ORDER BY + LIMIT)

*/ 

SELECT c1.nome_curso,
       c1.categoria,
       c1.preco
       
FROM cursos AS c1

WHERE c1.preco = (

    SELECT max(c2.preco)
    FROM cursos AS c2
    WHERE c2.categoria = c1.categoria

);
