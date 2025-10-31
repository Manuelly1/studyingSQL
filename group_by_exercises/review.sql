-- Objetivo: exibir a quantidade de clientes com e-mails cadastrados

-- SELECT count(flEmail)
-- FROM clientes
-- WHERE flEmail = 1;

-- SELECT sum(flEmail)
-- FROM clientes;

-- Objetivo: exibir os clientes que mais juntaram pontos positivos em 2025-05

-- SELECT idCliente, sum(qtdePontos) AS totalPontos

-- FROM transacoes
-- WHERE dtCriacao >= '2025-05-01' AND 
--    dtCriacao < '2025-06-01' AND 
--    qtdePontos > 0

-- GROUP BY idCliente

-- ORDER BY totalPontos DESC;

-- Objetivo: exibir o cliente que mais fez transações no ano de 2024

-- SELECT IdCliente, count(IdCliente) AS qtdeTransacoes
-- FROM transacoes

-- WHERE DtCriacao >= '2024-01-01' AND 
--    DtCriacao < '2025-01-01'

-- GROUP BY IdCliente
-- ORDER BY qtdeTransacoes DESC
-- LIMIT 1;

-- Objetivo: exibir a quantidade de produtos que são de rpg

-- SELECT count(DescCategoriaProduto)
-- FROM produtos
-- WHERE DescCategoriaProduto = 'rpg';

-- Objetivo: exibir o valor médio de pontos positivos por dia

-- SELECT sum(QtdePontos) AS totalPontos,

--        count(DISTINCT substr(DtCriacao, 1, 10)) AS qtdeDiasUnicos,

--        sum(QtdePontos) / count(DISTINCT substr(DtCriacao, 1, 10)) AS avgPontosDias

-- FROM transacoes
-- WHERE QtdePontos > 0;

-- Objetivo: exibir o dia da semana que teve mais pedidos em 2025

-- SELECT strftime('%w', substr(DtCriacao, 1, 10)) AS diaSemana,

--        count(DISTINCT IdTransacao) AS qtdeTransacao

-- FROM transacoes
-- WHERE substr(DtCriacao, 1, 4) = '2025'
-- GROUP BY diaSemana
-- ORDER BY qtdeTransacao DESC
-- LIMIT 1;

-- Objetivo: exibir o produto mais transacionado

-- SELECT IdProduto,
--        count(IdProduto)

-- FROM transacao_produto
-- GROUP BY IdProduto
-- ORDER BY count(IdProduto) DESC
-- LIMIT 10;

-- Objetivo: exibir o produto com mais pontos transacionados

SELECT IdProduto,
        sum(vlProduto) AS totalPontos

FROM transacao_produto
GROUP BY IdProduto
ORDER BY totalPontos DESC
LIMIT 1;





