-- Usando MySQL: Deseja-se encontrar os e-mails que aparecem mais de uma vez, então:

-- O GROUP BY agrupa todas as linhas com o mesmo e-mail;
-- O COUNT conta quantas vezes cada e-mail aparece;
-- O HAVING filtra apenas aqueles que aparecem mais de uma vez;
-- O AS foi usado porque a plataforma solicita que a saída apareça como "Email" (com E maiúsculo), e não "email".

SELECT email AS Email
FROM Person 
GROUP BY email
HAVING COUNT(email) > 1;
