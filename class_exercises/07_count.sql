-- Demonstração do uso da função COUNT:

-- count(*) e count(1) retornam o mesmo resultado (total de linhas da tabela), enquanto count(IdCliente) conta apenas as linhas 
-- em que IdCliente não é NULL.

SELECT 
   count(*),
   count(1),
   count(IdCliente)
FROM clientes;

-- O uso do DISTINCT remove linhas duplicadas, exibindo apenas combinações únicas de flTwitch e flEmail
SELECT DISTINCT flTwitch, flEmail
FROM clientes;


