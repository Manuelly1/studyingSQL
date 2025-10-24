-- ao usar o having conseguimos filtrar os clientes com pontos acima de 4k
-- o where filtra no momento que vamos "puxar" os dados
-- o having já é depois do agrupamento/agregação
-- o having seria o WHERE do GROUP BY

SELECT IdCliente,
        sum(QtdePontos)

FROM transacoes

WHERE DtCriacao >= '2025-07-01' AND 
        DtCriacao < '2025-08-01'

GROUP BY IdCliente

HAVING sum(QtdePontos) >= 4000

ORDER BY sum(QtdePontos) DESC

