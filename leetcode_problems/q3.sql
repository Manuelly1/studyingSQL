-- Escreva uma solução para informar o nome, sobrenome, cidade e estado de cada pessoa na Persontabela

-- LEFT JOIN é usado para garantir que todas as pessoas da tabela Person apareçam,  mesmo que não tenham endereço registrado na 
-- tabela Address. Quando não houver correspondência, os campos da tabela Address (city, state) aparecerão como NULL.

SELECT 
    p.firstName, 
    p.lastName, 
    a.city, 
    a.state

FROM Person AS p

LEFT JOIN Address AS a
    ON p.personId = a.personId;


