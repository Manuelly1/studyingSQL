/*

- Objetivo: Exibir todos os pedidos feitos em fevereiro de 2024

Outra forma: WHERE strftime('%Y-%m', data_pedido) = '2024-02'

*/

SELECT id_pedido,
       substr(data_pedido, 1, 10) AS data

FROM pedidosE

WHERE substr(data_pedido, 1, 7) = '2024-02';