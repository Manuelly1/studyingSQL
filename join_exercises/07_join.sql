-- Clientes mais antigos têm mais frequência de transação?

-- como fazemos para descobrir há quanto tempo o cliente está com a gente?
-- precisa-se subtrair a data atual pela de criação
-- esse julianday foi usado para substrair e pegar o valor da quant de 
-- dias que a pessoa está cadastrada
-- tem que ver a quantidade de pontos que a pessoa tem e a idade dela na base (idadeBase)


SELECT t1.IdCliente,
        julianday('now') - julianday(substr(t1.DtCriacao, 1, 19)) AS idadeBase,
        count(t2.IdTransacao) AS qtdeTransacoes

FROM clientes AS t1

LEFT JOIN transacoes AS t2
    ON t1.IdCliente = t2.IdCliente

GROUP BY t1.IdCliente, idadeBase