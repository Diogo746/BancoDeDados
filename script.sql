CREATE SCHEMA empresa;

USE empresa;

CREATE TABLE departamentos(
id  INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(100),
bloco VARCHAR(50),
data_criacao DATE  
);

CREATE TABLE empregados(
id INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(100),
data_admissao DATE,
salario DECIMAL(10,2),
id_departamento INT,
FOREIGN KEY (id_departamento) REFERENCES departamentos(id)
);

INSERT INTO departamentos (nome, bloco, data_criacao)
VALUES ('Tecnologia da Informação', 'Bloco D', '1995-05-05'),
('Recursos Humanos', 'Bloco C', '2013-04-07'),
('Financeiro', 'Bloco B', '2010-07-01'),
('Marketing', 'Bloco A', '2001-08-05');

INSERT INTO empregados (nome, data_admissao, salario, id_departamento)
VALUES
('André Batista','2015-08-21', 7360.00,4),
('Júlio da Silva','2014-06-02', 5150.00,4),
('Mariana Barbosa','2018-09-23', 3450.00, 3),
('Júlia Andrade','2018-08-08', 8210.00, 3),
('Carlos Júnior','2017-02-12', 5080.00, 2),
('Marina Mendes','2020-04-18', 3210.00, 2),
('Marcos Cavalcanti','2019-05-12', 8080.00, 1),
('Juliana Barbosa','2023-01-28', 9100.00, 1);

-- Usando where para retornar todos os empregados da tabela

SELECT * FROM empregados
WHERE data_admissao > 2013-03-01;

SELECT * FROM  empregados
WHERE data_admissao > '2022-01-01';

SELECT * FROM empregados ORDER BY nome;

SELECT * FROM empregados ORDER BY salario DESC;

SELECT * FROM empregados ORDER BY salario ASC;

SELECT * FROM empregados ORDER BY id_departamento, nome;

SELECT * FROM empregados ORDER BY id DESC;

SELECT * FROM empregados ORDER BY data_admissao DESC;

 SELECT departamentos.nome FROM empregados, departamentos ORDER BY id_departamento DESC;



SELECT id_departamento, COUNT(*) AS total
FROM empregados
GROUP BY id_departamento;

 -- Média salarial dos empregados
 SELECT id_departamento, AVG (salario) AS salario_medio
 FROM empregados
 GROUP BY id_departamento;

-- Salário máximo dos empregados
 SELECT id_departamento, MAX(salario) AS maior_salario
FROM empregados
GROUP BY id_departamento;
SELECT * FROM empregados;

-- Salário mínimo dos empregados
SELECT id_departamento, MIN(salario) AS menor_salario
FROM empregados
GROUP BY id_departamento;
SELECT * FROM empregados;

-- Número total de empregados

SELECT COUNT(*) AS total_empregados
FROM empregados;

-- Média salarial geral
SELECT id_departamento, AVG(salario) AS salario_medio
FROM empregados;

SELECT AVG(salario) AS media_salarial
FROM empregados;

-- Listar cada departamento com o total de salários pagos

SELECT d.nome, SUM(e.salario) AS salarios_total
FROM departamentos d
JOIN empregados e ON e.id_departamento = d.id
GROUP BY d.nome;


