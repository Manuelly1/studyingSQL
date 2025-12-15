/*

- Objetivo: Listar os cursos da categoria "Banco de Dados"
    
*/  

SELECT nome_curso,
       categoria

FROM cursos

WHERE categoria = 'Banco de Dados';