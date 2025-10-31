-- Objetivo: Selecionar os produtos que contém 'churn' no nome

-- Observações sobre os filtros:
-- WHERE DescNomeProduto IN ('Churn_10pp', 'Churn_2pp', 'Churn_5pp') → filtra produtos específicos;
-- WHERE DescNomeProduto LIKE 'Churn%' → filtra produtos cujo nome começa com "Churn";
-- Forma recomendada: WHERE DescCategoriaProduto = 'churn_model' → filtra toda a categoria de churn de forma mais limpa e eficiente.

SELECT *
FROM produtos
-- WHERE DescNomeProduto IN ('Churn_10pp', 'Churn_2pp', 'Churn_5pp');
-- WHERE DescNomeProduto LIKE 'Churn%';

WHERE DescCategoriaProduto = 'churn_model';
