-- Escreva uma solução para excluir todos os e-mails duplicados, mantendo apenas um e-mail exclusivo com o menor id

-- Explicações:
-- No MySQL, não é permitido usar a mesma tabela na cláusula FROM de uma subconsulta dentro de um DELETE, por isso é criada 
-- uma subconsulta temporária (tabela derivada);
-- A subconsulta agrupa todas as linhas pelo mesmo e-mail e seleciona apenas o menor id de cada grupo;
-- O DELETE remove todas as linhas cujo id não é o menor daquele e-mail, ou seja, remove os duplicados.

DELETE FROM Person

WHERE id NOT IN (
    SELECT id FROM (
        SELECT MIN(id) AS id
        FROM Person
        GROUP BY email
    ) AS temp
);

