-- Para descobrir quantas vendas do produto "Presente" (id 11) foram realizadas

-- Na tabela transacao_produto, esta consulta conta todas as linhas em que o IdProduto é igual a 11, ou seja, o número de vezes 
-- que esse produto aparece nas transações. O resultado será um único valor numérico. Assim teremos a quantidade de vendas 
-- realizadas desse produto "Presente".

SELECT count(*)
FROM transacao_produto
WHERE IdProduto = 11;

-- A segunda consulta é uma forma mais completa: ela agrupa os registros por IdProduto e conta quantas transações existem para cada 
-- produto. O resultado será uma tabela, com o IdProduto e a respectiva quantidade de ocorrências. Isso para cada IdProduto.

-- É válido lembrar que o GROUP BY “espreme” a tabela, ou seja, ele agrupa as linhas conforme os valores de uma ou mais colunas. 
-- Mas ele sozinho apenas agrupa, não faz cálculos, por isso precisa de alguma função de agregação, como o count(). Expliquei mais
-- sobre isso no markdown.

SELECT IdProduto, count(*)
FROM transacao_produto
GROUP BY IdProduto;

-- Para descobrir o usuário que mais juntou pontos no mês de julho de 2025 (coloquei a explicação no markdown)

SELECT IdCliente,
        sum(QtdePontos)
FROM transacoes
WHERE DtCriacao >= '2025-07-01' AND DtCriacao < '2025-08-01'
GROUP BY IdCliente
ORDER BY sum(QtdePontos) DESC
LIMIT 10
