-- Escreva uma solução para informar o nome, sobrenome, cidade e estado de cada pessoa na Persontabela. 
-- Se o endereço de uma pessoa personId não estiver presente na Addresstabela, informe null.

SELECT 
    p.firstName, 
    p.lastName, 
    a.city, 
    a.state

FROM Person AS p

LEFT JOIN Address AS a
ON p.personId = a.personId;


