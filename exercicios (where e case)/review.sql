-- exibir a lista de transações com apenas 1 ponto

-- SELECT *
-- FROM transacoes
-- WHERE QtdePontos = 1;

-- lista de pedidos realizados no fim de semana

-- Neste caso, substr pega os primeiros 19 caracteres, depois fez-se necessário converter a string DtCriacao para o formato de 
-- data e hora com datetime(), e em seguida se obteve o dia da semana usando a função strftime. 

-- SELECT  IdTransacao, 
--     DtCriacao,
--    strftime('%w', datetime(substr(DtCriacao, 1, 19))) AS diaSemana

-- FROM transacoes
-- WHERE diaSemana IN ('6', '0');

-- lista de clientes com 0 pontos

-- SELECT *
-- FROM clientes
-- WHERE qtdePontos = 0;

-- Objetivo: exibir a lista de clientes com 100 a 200 pontos (inclusive ambos)

-- SELECT *
-- FROM clientes
-- WHERE qtdePontos >= 100 AND qtdePontos <= 200;

-- Objetivo: exibir a lista de produtos com nome que começa com "Venda de";

-- SELECT *
-- FROM produtos
-- WHERE DescNomeProduto LIKE 'Venda de%';

-- Objetivo: exibir a lista de produtos que termina com LOVER

-- SELECT *
-- FROM produtos
-- WHERE DescNomeProduto LIKE '%LOVER';

-- Objetivo: exibir a lista de produtos que são "chapéu"   

-- SELECT *
-- FROM produtos
-- WHERE DescNomeProduto LIKE '%Chapéu%';

-- Objetivo: exibir a lista de transações com o produto "Resgatar Ponei"

-- SELECT *
-- FROM transacao_produto
-- WHERE IdProduto = 15;

-- Outra forma de fazer a consulta acima. Traz apenas os registros que têm correspondência em ambas as tabelas.

-- SELECT t1.*, t2.DescNomeProduto
-- FROM transacao_produto AS t1
-- INNER JOIN produtos AS t2
--    ON t1.IdProduto = t2.IdProduto
-- WHERE t2.DescNomeProduto = 'Resgatar Ponei';

-- Tem como fazer usando o LEFT também, mas quando não tiver correspondência, os campos de produtos virão como NULL.

-- SELECT t1.*, t2.DescNomeProduto
-- FROM transacao_produto AS t1
-- LEFT JOIN produtos AS t2
--    ON t1.IdProduto = t2.IdProduto
-- WHERE t2.DescNomeProduto = 'Resgatar Ponei';

-- Objetivo: listar todas as transações adicionando uma nova coluna sinalizando "alto", "médio" e "baixo" para o valor dos 
-- pontos [<10; <500; >=500]

SELECT *,

    CASE 
        WHEN qtdePontos < 10 THEN 'Baixo'
        WHEN qtdePontos < 500 THEN 'Médio'
        ELSE 'Alto'
    END AS 'FlQtdePontos'
    
FROM transacoes


