/*

- Objetivo: Exibir o curso mais caro de cada categoria

Para cada categoria, mostrar: categoria, nome do curso mais caro e preço
    
*/

SELECT c.categoria,
       c.nome_curso,
       c.preco

FROM cursos AS c

WHERE c.preco = (

    SELECT max(c2.preco)
    FROM cursos AS c2
    WHERE c2.categoria = c.categoria

);
