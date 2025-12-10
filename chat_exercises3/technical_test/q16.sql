/*

- Objetivo: Com a tabela Funcionarios, retorne: nome, setor, salario e diferença entre o salário do funcionário e o maior salário do setor
    
*/ 

SELECT t1.nome,
       t1.setor,
       t1.salario,
       (
            SELECT max(t2.salario)
            FROM funcionariosE AS t2
            WHERE t2.setor = t1.setor

        ) - t1.salario AS diferenca

FROM funcionariosE AS t1;

