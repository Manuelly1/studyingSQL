-- A coluna DtCriacao armazena a data original como texto (ex.: "2025-07-01 14:32:56.345Z"), incluindo milissegundos e fuso horário.
-- Isso pode dificultar o uso de funções de data. 

-- substr(DtCriacao, 1, 19) recorta os 19 primeiros caracteres, ficando "2025-07-01 14:32:56".

-- datetime() converte esse texto em um tipo datetime real, que o banco reconhece como data/hora.

-- strftime('%W', ...) retorna o número da semana do ano (00 a 53) da data convertida.


SELECT idCliente, DtCriacao,
        DtCriacao,

        substr(DtCriacao, 1, 19) AS dtSubString,

        datetime(substr(DtCriacao, 1, 19)) AS dtCriacaoNova,
        
        strftime('%W', datetime(substr(DtCriacao, 1, 19))) AS diaSemana

FROM clientes;

