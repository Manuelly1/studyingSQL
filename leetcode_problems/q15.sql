/*

- Objetivo: Mostrar quantas vezes cada aluno realizou prova de cada matéria, inclusive quando ele não realizou nenhuma

Explicações:

    - Uso do CROSS JOIN: ele realiza o produto cartesiano entre duas tabelas. Isso significa que cada linha da primeira tabela é combinada com todas 
    as linhas da segunda tabela, gerando todas as combinações possíveis entre alunos e matérias;

    - Por que não usar apenas LEFT JOIN? O LEFT JOIN depende da existência de uma relação direta entre as tabelas. Não existe relação direta entre 
    as tabelas Students e Subjects. A relação entre alunos e matérias está representada apenas na tabela Examinations;
    
    - Portanto, é necessário forçar todas as combinações possíveis entre alunos e matérias utilizando CROSS JOIN antes de aplicar o LEFT JOIN com a 
    tabela Examinations.

*/

SELECT s.student_id,
       s.student_name,
       sj.subject_name,
       COUNT(e.subject_name) AS attended_exams

FROM Students s

CROSS JOIN Subjects sj

LEFT JOIN Examinations e
    ON s.student_id = e.student_id
    AND sj.subject_name = e.subject_name

GROUP BY s.student_id, s.student_name, sj.subject_name

ORDER BY s.student_id, sj.subject_name;
