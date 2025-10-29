-- Esta primeira query é apenas para demonstrar como o count pode ser usado, sendo count(*) e count(1) basicamente a mesma coisa

SELECT 
   count(*),
   count(1),
   count(IdCliente)
FROM clientes;

-- O uso do DISTINCT remove duplicatas da consulta:

SELECT DISTINCT flTwitch, flEmail
FROM clientes


