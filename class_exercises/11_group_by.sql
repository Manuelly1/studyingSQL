-- Objetivo da primeira query: Descobrir quantas vendas do produto "Presente" (id 11) foram realizadas

-- Cada linha da tabela transacao_produto representa um produto em uma transação, então COUNT(*) retorna o total de vendas desse 
-- produto.

SELECT count(*)
FROM transacao_produto
WHERE IdProduto = 11;

-- Objetivo da segunda query: Contar quantas vezes cada produto foi vendido.

-- É válido lembrar que o GROUP BY “espreme” a tabela, ou seja, agrupa as linhas/registros conforme os valores de uma ou mais 
-- colunas. Mas ele sozinho apenas agrupa, não faz cálculos, por isso precisa de alguma função de agregação, como o count(). 
-- Expliquei sobre isso no summary_and_examples.md.

SELECT IdProduto, count(*)
FROM transacao_produto
GROUP BY IdProduto;

-- Objetivo da terceira query: Descobrir os clientes que mais acumularam pontos em julho de 2025.

-- SUM(QtdePontos) soma os pontos de cada cliente, GROUP BY agrupa por IdCliente;
-- ORDER BY DESC mostra os maiores valores, LIMIT 10 retorna os 10 clientes com mais pontos.

SELECT IdCliente,
        sum(QtdePontos)
FROM transacoes
WHERE DtCriacao >= '2025-07-01' AND DtCriacao < '2025-08-01'
GROUP BY IdCliente
ORDER BY sum(QtdePontos) DESC
LIMIT 10;
