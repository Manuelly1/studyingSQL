-- What's the difference between WHERE and HAVING?

-- Ambos são usados para filtrar dados, mas atuam em momentos diferentes da execução da consulta:

-- WHERE filtra as linhas antes da agregação (ou seja, atua sobre os registros individuais);
-- HAVING filtra os resultados depois da agregação (ou seja, atua sobre os grupos formados pelo GROUP BY).

-- Em resumo, o WHERE define quais linhas serão consideradas na agregação, enquanto o HAVING define quais grupos aparecerão no 
-- resultado final.