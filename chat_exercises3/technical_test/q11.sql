/*

- Objetivo: Retornar o segundo maior salário da tabela (sem usar LIMIT/OFFSET, se possível)

*/

SELECT nome,
       max(salario) AS segundoMaior

FROM funcionarios

WHERE salario < (

    SELECT max(salario)
    FROM funcionarios

);
