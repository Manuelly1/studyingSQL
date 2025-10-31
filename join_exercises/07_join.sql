-- Objetivo: Verificar se clientes mais antigos têm maior frequência de transações

-- Para descobrir há quanto tempo o cliente está cadastrado, basta subtrair a data atual pela data de criação;
-- A função julianday é utilizada para calcular a diferença, em dias, entre duas datas, retornando o tempo de cadastro;
-- Observação: para verificar se há relação entre tempo de cadastro e frequência, é preciso realizar uma análise.

SELECT t1.IdCliente,
       julianday('now') - julianday(substr(t1.DtCriacao, 1, 19)) AS idadeBase,
       count(t2.IdTransacao) AS qtdeTransacoes

FROM clientes AS t1

LEFT JOIN transacoes AS t2
    ON t1.IdCliente = t2.IdCliente

GROUP BY t1.IdCliente, idadeBase
ORDER BY idadeBase DESC;
