/*

- Objetivo: Listar o nome e a cidade de todos os clientes que são de Natal ou Caicó

Poderia ter feito assim: WHERE cidade IN ('Natal', 'Caicó')

*/

SELECT nome,
       cidade

FROM clientesE

WHERE cidade = 'Natal' OR cidade = 'Caicó';