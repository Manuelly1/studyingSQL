SELECT *, 
        -- QtdePontos + 10 AS QtdePontosPlus10
        DtCriacao,
        
        substr(DtCriacao, 1, 19) AS dtSubString,
        
        datetime(substr(DtCriacao, 1, 19)) AS dtCriacaoNova,
        
        strftime('%W', datetime(substr(DtCriacao, 1, 19))) AS diaSemana 

FROM clientes;

-- o AS é usado para apelidar a coluna
