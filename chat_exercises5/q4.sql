/*

- Objetivo: Mostrar todas as matrículas realizadas após 01/02/2024

Não precisava usar o substr, eu usei só para revisar o que vi no curso de Téo Me Why
    
*/  

SELECT id_matricula,
       id_aluno,
       data_matricula

FROM matriculas

WHERE substr(data_matricula, 1, 10) > '2024-02-01';
