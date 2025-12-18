/*

- Objetivo: Gerar: nome do aluno, total gasto e ranking (maior gasto → menor gasto)
    
*/ 

SELECT a.nome,
       sum(c.preco) AS totalGasto,
       DENSE_RANK() OVER (ORDER BY sum(c.preco) DESC) AS ranking

FROM alunos AS a

INNER JOIN matriculas AS m
    ON a.id_aluno = m.id_aluno

INNER JOIN cursos AS c
    ON m.id_curso = c.id_curso
    
GROUP BY a.id_aluno, a.nome;

