/*

- Objetivo: Mostrar os clientes que gastaram mais que a média de gastos dos clientes

Estrutura de pensamento:
    a) Calcular o total gasto por cada cliente (uma agregação por grupo);
    b) Calcular a média desses totais (ou seja, a média dos totais por cliente);
    c) Selecionar apenas os clientes cujo total individual excede essa média.

Subquery interna (primeiro SELECT agrupado)
    - O que faz: percorre a tabela `pedidos1`, agrupa as linhas por `id_cliente` e soma `valor_total` dentro de cada grupo. Resultado lógico: uma 
   tabela temporária com uma linha por cliente e uma coluna `total_cliente` contendo quanto cada cliente gastou no total.

Subquery externa que calcula a média
    - O que faz: recebe os totais por cliente gerados no passo 3 e calcula a média desses valores. Interpretação: esse é o valor-limite (média) usado
    para filtrar clientes que gastaram acima da média.

Query principal (agregação por cliente + filtro HAVING)
    - O que faz passo-a-passo:
        a) JOIN: relaciona pedidos com clientes para permitir mostrar o nome (ou outras colunas do cliente);
        b) GROUP BY: agrupa linhas por cliente para calcular o total de cada cliente;
        c) SUM(t1.valor_total): soma os `valor_total` dentro de cada grupo (cada cliente) — esse é o `totalGasto`;
        d) HAVING: filtra os grupos (clientes) com base em uma condição que envolve uma agregação. Aqui comparamos o `SUM(...)` de cada cliente com a média geral calculada pela subquery;
        e) Resultado: apenas os clientes cujo `totalGasto` é maior que a média dos totais por cliente aparecem.

*/

SELECT t1.nome,
       sum(t2.valor_total) AS totalGasto

FROM clientes1 AS t1

INNER JOIN pedidos1 AS t2
    ON t1.id_cliente = t2.id_cliente

GROUP BY t1.nome

HAVING sum(t2.valor_total) > (

    SELECT avg(valorTotalporCliente)

    FROM (
    
        SELECT sum(valor_total) AS valorTotalporCliente
        FROM pedidos1
        GROUP BY id_cliente
    
    )
);


