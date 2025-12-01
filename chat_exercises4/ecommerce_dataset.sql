DROP TABLE IF EXISTS itens_pedidoE;
DROP TABLE IF EXISTS pedidosE;
DROP TABLE IF EXISTS produtosE;
DROP TABLE IF EXISTS clientesE;

CREATE TABLE clientesE (
    id_cliente INT PRIMARY KEY,
    nome VARCHAR(100),
    email VARCHAR(150),
    cidade VARCHAR(100)
);

CREATE TABLE produtosE (
    id_produto INT PRIMARY KEY,
    nome_produto VARCHAR(100),
    categoria VARCHAR(100),
    preco DECIMAL(10,2)
);

CREATE TABLE pedidosE (
    id_pedido INT PRIMARY KEY,
    id_cliente INT,
    data_pedido DATE,
    valor_total DECIMAL(10,2),
    FOREIGN KEY (id_cliente) REFERENCES clientesE(id_cliente)
);

CREATE TABLE itens_pedidoE (
    id_pedido INT,
    id_produto INT,
    quantidade INT,
    FOREIGN KEY (id_pedido) REFERENCES pedidosE(id_pedido),
    FOREIGN KEY (id_produto) REFERENCES produtosE(id_produto)
);

/* ===========================
   TABELA: clientes
   =========================== */
INSERT INTO clientesE (id_cliente, nome, email, cidade) VALUES
(1, 'Lara Farias', 'lara@gmail.com', 'Natal'),
(2, 'João Medeiros', 'joaom@gmail.com', 'Currais Novos'),
(3, 'Ana Paula', 'ana.paula@gmail.com', 'Caicó'),
(4, 'Pedro Albuquerque', 'pedro.alb@gmail.com', 'Mossoró');


INSERT INTO produtosE (id_produto, nome_produto, categoria, preco) VALUES
(1, 'Notebook A', 'Eletrônicos', 3500),
(2, 'Mouse Gamer', 'Acessórios', 150),
(3, 'SSD 1TB', 'Eletrônicos', 600),
(4, 'Mochila Tech', 'Acessórios', 200),
(5, 'Cadeira Pro', 'Escritório', 900);


INSERT INTO pedidosE (id_pedido, id_cliente, data_pedido, valor_total) VALUES
(101, 1, '2024-01-10', 3650),
(102, 3, '2024-01-15', 150),
(103, 1, '2024-02-05', 950),
(104, 2, '2024-02-11', 4100),
(105, 4, '2024-02-18', 200);


INSERT INTO itens_pedidoE (id_pedido, id_produto, quantidade) VALUES
(101, 1, 1),
(101, 2, 1),
(102, 2, 1),
(103, 4, 2),
(104, 1, 1),
(104, 3, 1),
(105, 4, 1);
