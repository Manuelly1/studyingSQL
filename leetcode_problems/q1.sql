-- Usando MySQL: Deseja-se encontrar os e-mails que aparecem mais de uma vez, então:
-- o GROUP BY agrupa todas as linhas que têm o mesmo e-mail, o COUNT conta quantas vezes 
-- cada e-mail aparece, já o HAVING filtra apenas aqueles que aparecem mais de uma vez

SELECT email AS Email

FROM Person 

GROUP BY email

HAVING COUNT(email) > 1;
