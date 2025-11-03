-- Objetivo: Retornar a quantidade de transações do produto "Lovers" em 2024

-- Explicações:
-- Foram necessários 2 LEFT JOINs, pois na tabela transacao_produto não estavam todas as informações do produto e nem a data de criação;
-- O segundo JOIN é à direita do primeiro, conectando produtos à transacao_produto;
-- Para filtrar por categoria, poderia usar GROUP BY ou adicionar um AND no WHERE, por exemplo: t3.DescCategoriaProduto = 'lovers';
-- A vantagem do GROUP BY é que ele mostra todas as categorias, não apenas a lovers;

-- Observação: O HAVING foi usado aqui apenas para exemplificar sua aplicação (filtra grupos após o GROUP BY);

SELECT t3.DescCategoriaProduto,
        count(DISTINCT t1.IdTransacao)
        
FROM transacoes AS t1

LEFT JOIN transacao_produto AS t2
    ON t1.IdTransacao = t2.IdTransacao

LEFT JOIN produtos AS t3
    ON t2.IdProduto = t3.IdProduto

WHERE t1.DtCriacao >= '2024-01-01' 
    AND t1.DtCriacao < '2025-01-01' 

GROUP BY t3.DescCategoriaProduto 
HAVING count(DISTINCT t1.IdTransacao) < 1000
ORDER BY count(DISTINCT t1.IdTransacao) DESC;

