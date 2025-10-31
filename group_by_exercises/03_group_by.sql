-- Objetivo: Exibir o cliente que mais realizou transações no ano de 2024

-- COUNT(*) é equivalente a COUNT(DISTINCT IdTransacao) neste caso.

-- Observação: também poderia usar o WHERE assim: WHERE strftime('%Y', substr(DtCriacao, 1, 19)) = '2024', ou assim:
-- WHERE substr(DtCriacao, 1, 4) = '2024'

SELECT idCliente,
    count(*)

FROM transacoes

WHERE DtCriacao >= '2024-01-01' AND 
    DtCriacao < '2025-01-01' 

GROUP BY IdCliente
ORDER BY count(*) DESC
LIMIT 1;
