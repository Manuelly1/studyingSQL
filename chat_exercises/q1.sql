-- Objetivo: Listar o nome e o preço de todos os produtos que custam mais de R$ 50

-- Neste caso, convém aplicar o INNER JOIN porque precisa do nome do produto (que está em produtos) e só quer os produtos que têm 
-- transações (logo, que existam nas duas tabelas).

SELECT t1.vlProduto, t2.DescNomeProduto

FROM transacao_produto AS t1

INNER JOIN produtos AS t2
    ON t1.IdProduto = t2.IdProduto

WHERE t1.vlProduto > 50;