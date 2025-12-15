DROP TABLE IF EXISTS matriculas;
DROP TABLE IF EXISTS aulas;
DROP TABLE IF EXISTS cursos;
DROP TABLE IF EXISTS instrutores;
DROP TABLE IF EXISTS alunos;

CREATE TABLE alunos (
    id_aluno INT PRIMARY KEY,
    nome VARCHAR(100),
    cidade VARCHAR(100),
    data_nascimento DATE
);

CREATE TABLE instrutores (
    id_instrutor INT PRIMARY KEY,
    nome VARCHAR(100),
    especialidade VARCHAR(100)
);

CREATE TABLE cursos (
    id_curso INT PRIMARY KEY,
    nome_curso VARCHAR(100),
    categoria VARCHAR(50),
    id_instrutor INT,
    preco DECIMAL(10,2),
    FOREIGN KEY (id_instrutor) REFERENCES instrutores(id_instrutor)
);

CREATE TABLE aulas (
    id_aula INT PRIMARY KEY,
    id_curso INT,
    duracao_min INT,
    FOREIGN KEY (id_curso) REFERENCES cursos(id_curso)
);

CREATE TABLE matriculas (
    id_matricula INT PRIMARY KEY,
    id_aluno INT,
    id_curso INT,
    data_matricula DATE,
    FOREIGN KEY (id_aluno) REFERENCES alunos(id_aluno),
    FOREIGN KEY (id_curso) REFERENCES cursos(id_curso)
);

INSERT INTO alunos VALUES
(1, 'Marina Lopes', 'Natal', '2000-05-10'),
(2, 'Rafael Souza', 'Parnamirim', '1998-03-22'),
(3, 'Beatriz Costa', 'Mossoró', '2002-11-01'),
(4, 'Lucas Ferreira', 'Caicó', '1995-07-18');

INSERT INTO instrutores VALUES
(1, 'Carlos Mendes', 'SQL'),
(2, 'Ana Paula', 'Python'),
(3, 'João Silva', 'Power BI');

INSERT INTO cursos VALUES
(1, 'SQL do Zero', 'Banco de Dados', 1, 300),
(2, 'Python para Dados', 'Programação', 2, 450),
(3, 'Power BI Essencial', 'BI', 3, 400),
(4, 'SQL Avançado', 'Banco de Dados', 1, 600);

INSERT INTO aulas VALUES
(1, 1, 40),
(2, 1, 35),
(3, 2, 50),
(4, 3, 45),
(5, 4, 60);

INSERT INTO matriculas VALUES
(1, 1, 1, '2024-01-10'),
(2, 1, 2, '2024-02-01'),
(3, 2, 1, '2024-01-12'),
(4, 3, 3, '2024-03-05'),
(5, 4, 4, '2024-02-20');
