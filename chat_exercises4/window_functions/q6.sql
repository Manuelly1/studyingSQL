/*

- Objetivo: Na tabela Vendas, traga o: valor e maior valor encontrado até aquela data (máximo acumulado)

- Ela calcula: o maior valor_total encontrado até aquela linha, seguindo a ordem cronológica e acumulando o máximo ao longo do tempo
        
*/

SELECT id_venda,
       valor_total,
       max(valor_total) OVER (ORDER BY data_venda, id_venda) AS maiorValor

FROM vendasE;