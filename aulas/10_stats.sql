-- descobrir a média da carteira de pontos dos clientes
-- são 2 formas de fazer
-- e outras operações

SELECT avg(QtdePontos),
        sum(QtdePontos)/count(idCliente),
        min(QtdePontos) AS minCarteira,
        max(QtdePontos) AS maxCarteira,
        sum(flTwitch),
        sum(flEmail)
FROM clientes