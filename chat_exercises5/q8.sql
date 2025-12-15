/*

- Objetivo: Listar os cursos que custam mais que a média de preço dos cursos

*/

SELECT nome_curso,
       preco

FROM cursos

WHERE preco > (

    SELECT avg(preco)
    FROM cursos

);
