-- Objetivo: Listar o nome (substituí por ID, pois não tem o nome) dos clientes que já fizeram pelo menos 1 transação

SELECT DISTINCT t1.IdCliente

FROM transacoes AS t1

INNER JOIN clientes AS t2
    ON t1.IdCliente = t2.IdCliente;
