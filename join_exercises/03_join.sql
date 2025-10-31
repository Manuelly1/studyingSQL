-- Objetivo: Descobrir em qual mês tivemos mais listas de presença assinadas

-- Explicações:
-- A informação da lista de presença está na tabela produtos;
-- Usa substr para extrair os 7 primeiros dígitos de DtCriacao (YYYY-MM) e obter o mês;
-- t1 contém as informações das transações (data, ID etc);
-- Filtra pelo produto chamado "Lista de presença", por isso é necessário juntar as duas tabelas adicionais 
-- (transacao_produto e produtos).

SELECT
        substr(t1.DtCriacao, 1, 7) AS anoMes,
        count(DISTINCT t1.IdTransacao) AS qtdeTransacao,
        t1.IdTransacao,
        t3.DescNomeProduto

FROM transacoes AS t1

LEFT JOIN transacao_produto AS t2
    ON t1.IdTransacao = t2.IdTransacao

LEFT JOIN produtos AS t3
    ON t2.IdProduto = t3.IdProduto

WHERE t3.DescNomeProduto = 'Lista de presença' 
GROUP BY substr(t1.DtCriacao, 1, 7)
ORDER BY qtdeTransacao DESC
LIMIT 10;

