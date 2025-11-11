-- Write a query to find the second highest salary
-- Escreva uma consulta para encontrar o segundo maior salário

-- Como nesta base não há o campo de salário, a consulta foi adaptada para retornar o segundo cliente com a maior 
-- quantidade de pontos;

-- Explicações:
-- A subconsulta (SELECT MAX(QtdePontos) FROM clientes) obtém o maior valor de pontos da tabela;
-- O WHERE filtra apenas os clientes cuja pontuação é menor que esse valor máximo, ou seja, exclui o cliente com a maior pontuação;
-- O ORDER BY QtdePontos DESC ordena os resultados do maior para o menor e o LIMIT 1 faz com que apenas o primeiro registro dessa 
-- lista, que corresponde ao cliente com a segunda maior quantidade de pontos, seja exibido.

SELECT IdCliente, 
       QtdePontos

FROM clientes

WHERE QtdePontos < (SELECT MAX(QtdePontos) FROM clientes)

ORDER BY QtdePontos DESC
LIMIT 1;
