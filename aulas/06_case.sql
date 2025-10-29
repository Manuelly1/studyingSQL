-- Intervalos
-- de 0 a 500 -> Pônei
-- de 501 a 1000 -> Pônei Premium
-- de 1001 a 5000 -> Mago Aprendiz
-- de 5001 a 10000 -> Mago Mestre
-- +10001 -> Mago Supremo

SELECT idCliente, QtdePontos,
    CASE 
        WHEN QtdePontos <= 500 THEN 'Pônei'
        WHEN QtdePontos <= 1000 THEN 'Pônei Premium'
        WHEN QtdePontos <= 5000 THEN 'Mago Aprendiz'
        WHEN QtdePontos <= 10000 THEN 'Mago Mestre'
        ELSE 'Mago Supremo'
    END AS NomeGrupo,

-- este próximo case vai mostrar se a pessoa é pônei ou não 
    CASE
        WHEN QtdePontos <= 1000 THEN 1
        ELSE 0
    END AS flPonei,

-- este próximo case vai mostrar se a pessoa é mago 
    CASE
        WHEN QtdePontos > 1000 THEN 1
        ELSE 0
    END AS flMago
FROM clientes

-- se você quiser filtrar todos os magos, por exemplo, basta fazer:
WHERE flMago = 1


