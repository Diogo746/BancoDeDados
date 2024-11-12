//criar tabela autor e retirar ele da tabela livro


CREATE SCHEMA Biblioteca;

USE Biblioteca;

CREATE TABLE Livro(
id INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(100),
autor VARCHAR(100),
categoria VARCHAR(100),
ano INT,
editora VARCHAR(100),
cidade VARCHAR(100),
isbn VARCHAR(100)
);

CREATE TABLE Aluno(
id INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(100)
);

CREATE TABLE Emprestimo(
id INT AUTO_INCREMENT PRIMARY KEY,
nome_usuario VARCHAR(100),
data_emprestimo DATE,
data_devolucao DATE,
id_aluno INT,
id_livro INT,
FOREIGN KEY (id_aluno) REFERENCES Aluno(id),
FOREIGN KEY (id_livro) REFERENCES Livro(id)
);

INSERT INTO Livro (nome, autor, categoria, ano, editora, cidade, isbn)
VALUES 
('Python Básico', 'João Sá', 'Programação', 2020, 'Novatec', 'São Paulo', '1.254.895.642.147.00'),
('SQL. Use a cabeça', 'Maria Silva', 'Banco de Dados', 2015, 'NovaEra', 'Recife', '1.254.784.330.149.00'),
('Redes de computador', 'Matheus Oliveira', 'Redes', 2022, 'Intrinseca', 'Rio de Janeiro', '1.254.895.632.147.00'),
('Segurança de redes', 'Silveira Ferraz', 'Segurança', 2024, 'Intrinseca', 'São Paulo', '1.254.784.330.150.00');

INSERT INTO Aluno (nome)
VALUES
('Rogério Silva'),
('Alice Maria'),
('Talita Oliveira'),
('João Ricardo');

INSERT INTO Emprestimo (id_aluno, data_emprestimo, data_devolucao)
VALUES
(1, '2024-05-08', '2024-05-10'), 
(2, '2024-08-09', '2024-08-11'),
(3, '2024-07-01', '2024-08-03'),
(4, '2024-08-07', '2024-08-10');
