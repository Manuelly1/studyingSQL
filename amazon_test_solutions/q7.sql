-- How do you optimize a slow SQL query?

-- Evitando o uso de SELECT * e optando por retornar apenas as colunas necessárias, já que trazer todos os campos consome 
-- mais memória e processamento;

-- Criando e utilizando índices adequados: índices em colunas frequentemente usadas em filtros (WHERE), junções (JOIN) e 
-- ordenações (ORDER BY) ajudam o banco a localizar registros mais rapidamente;

-- Reduzindo o uso de subqueries complexas: sempre que possível, substituindo subconsultas por JOINs ou CTEs, o que facilita a 
-- leitura e pode melhorar o desempenho;

-- Usando filtros apropriados: aplicando condições no WHERE para evitar o processamento de linhas desnecessárias;

-- Evitando funções em colunas indexadas nos filtros, pois isso impede o uso do índice e torna a busca mais lenta 
-- (por exemplo, usar WHERE YEAR(data) = 2024 é menos eficiente do que filtrar por um intervalo de datas);

-- Dividindo consultas grandes em partes menores: com o uso de CTEs ou tabelas temporárias, é possível processar etapas 
-- intermediárias de forma mais eficiente.

