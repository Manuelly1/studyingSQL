-- Acerca do script a seguir: DtCriacao é a data original armazenada na tabela clientes. Em muitos bancos, essa data vem como 
-- texto (string), por exemplo: 2025-07-01 14:32:56.345Z. Ou seja, inclui milissegundos e o fuso horário (.345Z), o que atrapalha 
-- funções de data. A função substr() (ou substring) recorta apenas os 19 primeiros caracteres dessa string. Agora temos: 
-- 2025-07-01 14:32:56
-- A função datetime() converte o texto "2025-07-01 14:32:56" em um tipo de dado datetime real. Agora o banco entende que aquilo é 
-- uma data/hora, e não apenas texto. Já a strftime() formata a data em um padrão específico. Aqui, '%W' significa “número da 
-- semana no ano” (de 00 a 53).


SELECT *, 
        DtCriacao,
        substr(DtCriacao, 1, 19) AS dtSubString,
        datetime(substr(DtCriacao, 1, 19)) AS dtCriacaoNova,
        strftime('%W', datetime(substr(DtCriacao, 1, 19))) AS diaSemana 
FROM clientes;

