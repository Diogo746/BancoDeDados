-- Criação do esquema
CREATE SCHEMA loja;

USE loja;

-- Criação das tabelas
CREATE TABLE produtos (
    id_produto INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    categoria VARCHAR(100),
    preco DECIMAL(10, 2),
    estoque INT
);

CREATE TABLE cliente (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    email VARCHAR(100),
    telefone VARCHAR(50)
);

CREATE TABLE vendas (
    id_vendas INT AUTO_INCREMENT PRIMARY KEY,
    id_produto INT,
    id_cliente INT,
    quantidade INT,
    data_venda DATE,
    FOREIGN KEY (id_produto) REFERENCES produtos(id_produto),
    FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente)
);

-- Inserção dos dados
INSERT INTO produtos (nome, categoria, preco, estoque) VALUES
('Chocolate', 'Alimento', 4.99, 25),
('Sabonete', 'Higiene', 1.89, 40),
('Biscoito', 'Alimento', 2.55, 20),
('Desodorante', 'Higiene', 15.99, 10),
('Celular', 'Eletrônicos', 1099.00, 5);

INSERT INTO cliente (nome, email, telefone) VALUES
('Antônio da Silva', 'antoniodasilva@mail.com', '99991111'),
('Mariana Almeida', 'marianaalmeida@mail.com', '99992222'),
('Diego Pereira', 'diegopereira@mail.com', '99993333'),
('Juliana Andrade', 'julianaandrade@mail.com', '99994444'),
('Cristiane Ferreira', 'cristianeferreira@mail.com', '99995555');


-- Registro de 10 vendas

INSERT INTO vendas (id_produto, id_cliente, quantidade, data_venda)
    VALUES 
    (1, 1, 1, '2024-09-12'),
    (2, 3, 2, '2024-09-12'),
    (1, 3, 6, '2024-09-12'),
    (5, 4, 1, '2024-09-13'),
    (3, 4, 2, '2024-09-13'),
    (2, 4, 2, '2024-09-13'),
    (2, 5, 4, '2024-09-15'),
    (5, 2, 1, '2024-09-17'),
    (1, 1, 1, '2024-09-17'),
    (2, 1, 3, '2024-09-17'),
    (4, 1, 1, '2024-09-17'),
    (3, 3, 5, '2024-09-18');


-- Atualização de dados: preço

UPDATE produtos
SET preco = 2.99
WHERE id_produto = 1;

-- Atualização de dados: telefone

UPDATE cliente
SET telefone = '99998888'
WHERE id_cliente = 3;

-- Remoção de dados: produto

DELETE FROM produtos
WHERE id_produto = 1;


-- Remoção de dados: cliente

DELETE FROM cliente
WHERE id_cliente = 4;  XXXX

-- Consulta categoria do produto

SELECT * FROM produtos
WHERE id_produtos = 5;  XXXXXX

-- Consulta vendas realizadas em data especifica

SELECT * FROM vendas WHERE data_venda = '2024-09-13';

-- Consulta total de quantidade de vendas por produto

SELECT id_produto, SUM(quantidade) AS total_vendas
FROM vendas
GROUP BY id_produto;

-- Calculo da receita total por cliente

SELECT c.id_cliente, c.nome, SUM(v.quantidade * p.preco) AS receita_total
FROM vendas v
JOIN produtos p ON v.id_produto = p.id_produto
JOIN cliente c ON v.id_cliente = c.id_cliente
GROUP BY c.id_cliente, c.nome;

-- Ordenados por nome ascendente

SELECT * FROM produtos
ORDER BY nome ASC;

-- Ordenados por nome descendente

SELECT * FROM produtos
ORDER BY nome DESC;

-- Estoque atual de cada produto após as vendas

SELECT p.id_produto, p.nome, p.estoque - COALESCE(SUM(v.quantidade), 0) AS estoque_atual
FROM produtos p
LEFT JOIN vendas v ON p.id_produto = v.id_produto
GROUP BY p.id_produto, p.nome, p.estoque;

-- Identificar os produtos mais vendidos

SELECT p.id_produto, p.nome, SUM(v.quantidade) AS total_vendido
FROM produtos p
JOIN vendas v ON p.id_produto = v.id_produto
GROUP BY p.id_produto, p.nome
ORDER BY total_vendido DESC;

-- Listar clientes que mais compraram

SELECT c.id_cliente, c.nome, SUM(v.quantidade) AS total_comprado
FROM cliente c
JOIN vendas v ON c.id_cliente = v.id_cLiente
GROUP BY c.id_cliente, c.nome
ORDER BY total_comprado DESC;
