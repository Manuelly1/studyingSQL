-- Objetivo: Classificar os clientes em grupos de acordo com a quantidade de pontos e criar flags indicando se o cliente é 
-- "Pônei" ou "Mago".

-- Intervalos de pontos para classificação:
-- 0 a 500       -> Pônei
-- 501 a 1000    -> Pônei Premium
-- 1001 a 5000   -> Mago Aprendiz
-- 5001 a 10000  -> Mago Mestre
-- 10001 ou mais -> Mago Supremo

SELECT idCliente, QtdePontos,

    -- Nome do grupo de acordo com a quantidade de pontos
    CASE 
        WHEN QtdePontos <= 500 THEN 'Pônei'
        WHEN QtdePontos <= 1000 THEN 'Pônei Premium'
        WHEN QtdePontos <= 5000 THEN 'Mago Aprendiz'
        WHEN QtdePontos <= 10000 THEN 'Mago Mestre'
        ELSE 'Mago Supremo'
    END AS NomeGrupo,

    -- Flag indicando se o cliente é Pônei (1 = sim, 0 = não)
    CASE
        WHEN QtdePontos <= 1000 THEN 1
        ELSE 0
    END AS flPonei,

    -- Flag indicando se o cliente é Mago (1 = sim, 0 = não)
    CASE
        WHEN QtdePontos > 1000 THEN 1
        ELSE 0
    END AS flMago

FROM clientes

-- Exemplo de filtro: selecionar apenas clientes que são magos
-- WHERE flMago = 1


