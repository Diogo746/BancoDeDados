-- Criação tabela Categoria
CREATE TABLE Categoria(
  id_categoria INT primary key,
    nome VARCHAR(100)
);
-- Inserir dados na tabela Categoria
INSERT INTO Categoria(id_categoria, nome) 
VALUES
(1, 'Alimento'),
(2, 'Limpeza'),
(3, 'Roupas'),
(4, 'Elerônicos'),
(5, 'Higiene');

-- Criação tabela Colaborador
CREATE TABLE Colaborador(
  id INT primary key,
    nome VARCHAR(100),
    salario DECIMAL(10,2)
);
-- Inserir dados na tabela Colaborador
INSERT INTO Colaborador(id, nome, salario)
VALUES
(1, 'João Sá', 1500.56),
(2, 'Maria Silva', 1250.65),
(3, 'Tamies Oliveira', 2545.55),
(4, 'Romulo Wallace', 1548.55),
(5, 'Chico Science', 1548.33),
(6, 'Roberto Olister', 1547.12),
(7, 'Carla Menezes', 1874.49),
(8, 'Alice Maria', 1547.45);

-- Criação tabela Vendas
CREATE TABLE Vendas(
  id_venda INT,
    produto VARCHAR(100),
    quantidade INT,
    preco_unidade DECIMAL(10,2),
    id_categoria INT,
    id_colab INT,
    data_venda DATE,
    foreign key (id_categoria) references categoria (id_categoria),
    foreign key (id_colab) references colaborador (id)
);
-- Inserir dados na tabela Vendas
INSERT INTO Vendas (id_venda, produto, quantidade, preco_unidade, id_categoria, id_colab, data_venda) 
VALUES
(1, 'Arroz', 5, 10.00, 1, 2, '2024-09-01'),
(2, 'Feijão', 5, 6.00, 1, 1, '2024-05-08'),
(3, 'Café', 1, 8.00, 1, 1, '2024-09-04'),
(4, 'Açúcar', 1, 3.50, 1, 1, '2024-09-04'),
(5, 'Leite', 3, 5.00, 1, 2, '2024-09-04'),
(6, 'Detergente', 2, 2.50, 2, 3, '2024-09-05'),
(7, 'Camiseta', 1, 25.00, 3, 1, '2024-09-06'),
(8, 'TV LED', 1, 1200.00, 4, 2, '2024-09-07'),
(9, 'Escova de dentes', 2, 3.50, 5, 3, '2024-09-07'),
(10, 'Macarrão', 5, 4.00, 1, 1, '2024-09-08'),
(11, 'Sabonete', 3, 1.50, 5, 1, '2024-09-09'),
(12, 'Monitor', 1, 700.00, 4, 4, '2024-09-10');

/*
Use a função COUNT para contar o número de vendas em diferentes categorias dos
produtos.
a. Quantas vendas foram realizadas na categoria "Alimentos"?
b. Quantas vendas foram realizadas no total?
*/

SELECT COUNT(*) AS vendas_categoria
FROM vendas
WHERE id_categoria = 1;
