-- Escreva uma solução para encontrar todas as classes que têm pelo menos cinco alunos.

-- Neste caso, é preciso contar quantos alunos estão em cada turma e depois filtrar as turmas que têm 
-- pelo menos 5 alunos.

-- GROUP BY turma → agrupa os registros por turma.
-- COUNT(aluno) → conta quantos alunos há em cada turma.

SELECT class

FROM Courses

GROUP BY class

HAVING COUNT(student) >= 5;