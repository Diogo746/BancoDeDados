CREATE DATABASE Biblioteca;
USE Biblioteca;

CREATE TABLE Aluno(
    id int auto_increment primary key,
    nome varchar(100)
);

CREATE TABLE Autor(
    id int auto_increment primary key,
    nome_autor varchar(100)
);

CREATE TABLE Editora(
    id int auto_increment primary key, 
    nome varchar(100),
    cidade varchar(100)
);

CREATE TABLE Livro(
    id  int auto_increment primary key,
    titulo varchar(100),
    ano_pubi year,
    categoria varchar(100),
    isbn int,
    id_editora int,
    foreign key (id_editora) references editora (id)
);

CREATE TABLE LivroAutor(
    id_livro  int,
    id_autor int,
    foreign key(id_livro) references livro (id),
    foreign key(id_autor) references autor (id)
);

CREATE TABLE Emprestimo(
    id int auto_increment primary key,
    data_emprestismo date,
    data_evolucao date,
    id_livro int,
    id_aluno int,
    foreign key (id_livro) references livro (id),
    foreign key (id_aluno) references aluno (id)
);


INSERT Editora (id, nome, cidade) VALUES 
(1, 'Novatec', 'Recife'),
(2, 'Tecnova', 'São Paulo'),
(3, 'Albatec', 'Rio de Janeiro'),
(4, 'Intrinseca', 'Petrolina');

INSERT Livro (id, titulo, ano_pubi, categoria, isbn, id_editora) VALUES 
(1, 'Java Avançado', 2024, 'Programação', 1548954, 2),
(2, 'Java Avançado', 2024, 'Programação', 1548954, 1),
(3, 'Java Avançado', 2024, 'Programação', 1548954, 4),
(4, 'Java Avançado', 2024, 'Programação', 1548954, 3);

INSERT Aluno (id, nome) VALUES
(1, 'Carlos Eduardo'),
(2, 'Fernanda Souza'),
(3, 'Lucas Lima'),
(4, 'Julia Rocha');

INSERT Autor (id, nome_autor) VALUES 
(1, 'João Sá'), (2, 'Caio Machado'),
(3, 'Carlos Silva'), (4, 'Maria Fernanda');

INSERT Emprestimo (id, data_emprestismo, data_evolucao, id_livro, id_aluno) VALUES
(1, '2024-08-08', '2024-08-10', 1, 2),
(2, '2024-08-08', '2024-08-10', 3, 1),
(3, '2024-08-08', '2024-08-10', 2, 3);
 
INSERT LivroAutor (id_livro, id_autor) VALUES 
(1,2),
(2,1),
(3,2);
