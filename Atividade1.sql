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
