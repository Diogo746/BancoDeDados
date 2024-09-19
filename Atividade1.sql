CREATE SCHEMA loja;

USE loja;

CREATE TABLE produtos(
    id_produto INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    categoria VARCHAR(100),
    preco DECIMAL(10,2),
    estoque INT,
);

CREATE TABLE cliente(
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    email VARCHAR(100),
    telefone VARCHAR(50),
);

CREATE TABLE vendas(
    id_vendas INT AUTO_INCREMENT PRIMARY KEY,
    id_produto INT FOREIGN KEY REFERENCES (id_produto),
    id_cliente INT FOREIGN KEY REFERENCES (id_cliente),
    quantidade INT,
    data_venda (DATE),
);

INSERT INTO produtos (nome, categoria, preco, estoque)
VALUES ('Chocolate', 'Alimento', '4.99', '25'),
('Sabonete', 'Higiene','1.89', '40'),
('Biscoito', 'Alimento', '2.55', '20'),
('Desodorante', 'Higiene', '15.99', '10'),
('Celular', 'Eletrônicos', '1099.00', '5');

INSERT INTO cliente (nome, email, telefone)
VALUES ('Antônio da Silva', 'antoniodasilva@mail.com', '99991111'),
('Mariana ALmeida', 'marianaalmeida@mail.com', '99992222'),
('Diego Pereira','diegopereira@mail.com', '99993333'),
('Juliana Andrade', 'julianaandrade@mail.com', '99994444'),
('Cristiane Ferreira', 'cristiane ferreira@mail.com', '99995555');


