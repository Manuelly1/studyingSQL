/*

- Objetivo: Na tabela Funcionarios, gere: nome, salário e salário máximo por setor

*/

SELECT nome,
       salario,
       setor,
       max(salario) OVER (PARTITION BY setor) AS salarioMaximoPorSetor

FROM funcionariosE;