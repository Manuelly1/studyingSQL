-- Exiba os produtos cujo preço é maior que a média de preços de todos os produtos

-- Demonstrei com subquery e CTE 

SELECT nome_produto, 
       preco

FROM produtos1

WHERE preco > (

    SELECT avg(preco)

    FROM produtos1

);


WITH tb_media AS (

    SELECT avg(preco) AS media
    FROM produtos1

)

SELECT nome_produto,
       preco
    
FROM produtos1, tb_media

WHERE preco > tb_media.media;



