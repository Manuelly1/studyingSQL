/*

- Objetivo: Exibir o pedido com o maior valor total

- O JOIN é necessário porque a CTE tb_maior_valor retorna APENAS o maior valor total dos pedidos, mas não informa qual pedido gerou esse valor;

- Funções agregadas como max() retornam apenas o valor calculado, e não o registro completo. Por isso, precisamos conectar esse valor de volta à 
tabela pedidos1 para identificar qual id_pedido possui exatamente esse valor_total;

- O JOIN compara:
    - pedidos1.valor_total  → valor real de cada pedido;
    - tb_maior_valor.maiorValor → maior valor encontrado

Assim, conseguimos recuperar o pedido correspondente ao maior valor total.

*/

WITH tb_pedidos_valores AS (

    SELECT id_pedido, 
           valor_total

    FROM pedidos1
),

tb_maior_valor AS (

    SELECT max(valor_total) AS maiorValor
    FROM tb_pedidos_valores 

)

SELECT t1.id_pedido,
       t1.valor_total AS maiorValor

FROM tb_pedidos_valores AS t1

INNER JOIN tb_maior_valor t2
    ON t1.valor_total = t2.maiorValor;
