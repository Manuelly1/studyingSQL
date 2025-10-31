-- selecione produtos que contém 'churn' no nome

SELECT *
FROM produtos
-- WHERE DescNomeProduto IN ('Churn_10pp', 'Churn_2pp', 'Churn_5pp');
-- WHERE DescNomeProduto LIKE 'Churn%';

-- a melhor forma de escrever essa query:

WHERE DescCategoriaProduto = 'churn_model';
