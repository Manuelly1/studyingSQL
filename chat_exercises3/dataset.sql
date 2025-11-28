-- Banco de Dados para treino

-- Apagar tabelas se já existirem
DROP TABLE IF EXISTS itens_pedido1;
DROP TABLE IF EXISTS pedidos1;
DROP TABLE IF EXISTS produtos1;
DROP TABLE IF EXISTS clientes1;

CREATE TABLE clientes1 (
    id_cliente INTEGER PRIMARY KEY,
    nome VARCHAR(100),
    cidade VARCHAR(100),
    idade INTEGER
);
'
CREATE TABLE produtos1 (
    id_produto INTEGER PRIMARY KEY,
    nome_produto VARCHAR(100),
    categoria VARCHAR(100),
    preco DECIMAL(10,2)
);

CREATE TABLE pedidos1 (
    id_pedido INTEGER PRIMARY KEY,
    id_cliente INTEGER,
    data_pedido DATE,
    valor_total DECIMAL(10,2),
    FOREIGN KEY (id_cliente) REFERENCES clientes1(id_cliente)
);

CREATE TABLE itens_pedido1 (
    id_pedido INTEGER,
    id_produto INTEGER,
    quantidade INTEGER,
    FOREIGN KEY (id_pedido) REFERENCES pedidos1(id_pedido),
    FOREIGN KEY (id_produto) REFERENCES produtos1(id_produto)
);

-- Inserção dos dados

-- CLIENTES
INSERT INTO clientes1 VALUES
(1, 'Ana Silva', 'Natal', 25),
(2, 'Bruno Costa', 'Parnamirim', 34),
(3, 'Carlos Mendes', 'Natal', 41),
(4, 'Daniela Rocha', 'Mossoró', 29),
(5, 'Eduardo Lima', 'Caicó', 52);

-- PRODUTOS
INSERT INTO produtos1 VALUES
(1, 'Notebook', 'Eletrônicos', 3500.00),
(2, 'Mouse', 'Eletrônicos', 80.00),
(3, 'Cadeira Gamer', 'Móveis', 900.00),
(4, 'Livro SQL', 'Livros', 60.00),
(5, 'Teclado', 'Eletrônicos', 150.00);

-- PEDIDOS
INSERT INTO pedidos1 VALUES
(1, 1, '2023-01-10', 3580.00),
(2, 2, '2023-02-15', 980.00),
(3, 1, '2023-03-05', 60.00),
(4, 3, '2023-04-01', 1050.00);

-- ITENS DO PEDIDO
INSERT INTO itens_pedido1 VALUES
(1, 1, 1),  -- Notebook
(1, 2, 1),  -- Mouse
(2, 3, 1),  -- Cadeira Gamer
(3, 4, 1),  -- Livro SQL
(4, 3, 1),  -- Cadeira Gamer
(4, 5, 1);  -- Teclado

