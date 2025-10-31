-- Escreva uma solução para excluir todos os e-mails duplicados, mantendo apenas um e-mail exclusivo 
-- com o menor id.

-- O MySQL não permite usar a mesma tabela (Person) na cláusula FROM de uma subconsulta que está 
-- tentando modificá-la (como um DELETE ou UPDATE), por isso foi preciso usar uma subconsulta temporária (ou uma tabela derivada), 
-- para que o MySQL não veja que está tentando deletar da mesma tabela usada no FROM.

-- Como o enunciado pede, aqui não queremos apenas listar, precisamos excluir os e-mails duplicados, 
-- mantendo apenas aquele com o menor id. A forma correta de fazer isso em SQL é usando um DELETE com 
-- subconsulta, comparando o id de cada linha com o menor id daquele e-mail. Na subconsulta, agrupa 
-- todas as linhas com o mesmo e-mail e pega apenas o menor id de cada grupo (ou seja, o registro que 
-- queremos manter). O DELETE exclui todas as linhas cujo id não é o menor daquele e-mail (ou seja, os duplicados).

DELETE FROM Person

WHERE id NOT IN (
    SELECT id FROM (
        SELECT MIN(id) AS id
        FROM Person
        GROUP BY email
    ) AS temp
);

