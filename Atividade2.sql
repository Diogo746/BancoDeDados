-- Criação da tabela

CREATE SCHEMA supermercado;

USE supermercado;

CREATE TABLE vendas(
id INT AUTO_INCREMENT PRIMARY KEY,
produto VARCHAR(100),
categoria VARCHAR(100),
quantidade INT,
preco_unidade DEC(10, 2),
data_venda DATE
);

-- Inserir os produtos

INSERT INTO vendas (produto, categoria, quantidade, preco_unidade, data_venda)
VALUES
('Arroz','Alimentos',5,10.00,'2024-09-01'),
('Feijão','Alimentos',3,7.50,'2024-09-02'),
('Sabão','Limpeza',2,12.00,'2024-09-02'),
('Café','Alimentos',6,8.00,'2024-09-03'),
('Detergente','Limpeza',4,5.00,'2024-09-03'),
('Leite','Alimentos',10,4.50,'2024-09-04'),
('Sabonete','Higiene',6,3.00,'2024-09-04'),
('Pão','Alimentos',15,1.50,'2024-09-05'),
('Shampoo','Higiene',1,15.00,'2024-09-05'),
('Creme dental','Higiene',3,8.00,'2024-09-06');

-- Vendas realizadas na categoria alimentos

SELECT COUNT(*) AS total_vendas_alimentos
FROM vendas
WHERE categoria = 'Alimentos';

SELECT SUM(quantidade) AS total_vendas_alimentos
FROM vendas
WHERE categoria = 'Alimentos';

SELECT SUM(quantidade * preco_unidade) AS total_vendas_alimentos
FROM vendas
WHERE categoria = 'Alimentos';


-- Vendas realizadas no total

SELECT COUNT(*) AS vendas_total
FROM vendas;

SELECT SUM(quantidade) AS total_vendas
FROM vendas;

SELECT SUM(quantidade * preco_unidade) AS total_vendas
FROM vendas;

-- Preço médio por unidade dos produtos vendidos

SELECT AVG(preco_unidade) AS preco_medio
FROM vendas;

-- Quantidade média de produtos vendidos

SELECT AVG(quantidade) AS produtos_media
FROM vendas;

SELECT AVG(quantidade) AS produtos_media
FROM vendas
GROUP BY categoria;


-- 
