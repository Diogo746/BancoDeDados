// Importando a biblioteca mysql2
const mysql = require('mysql2');

// Criando uma conexão com o banco de dados
const connection = mysql.createConnection({
    host: 'localhost', // Endereço do servidor MySQL
    user: 'root', // Usuário do MySQL
    password: 'root', // Senha do MySQL
    database: 'biblioteca' // Nome do banco de dados (ajuste conforme necessário)
});

// Função para efetuar a consulta SELECT * FROM Aluno
const fetchAlunos = () => {
    const query = 'SELECT * FROM emprestimo';

    connection.query(query, (error, results) => {
        if (error) {
            console.error('Erro ao executar a consulta:', error);
            return;
        }
        console.log('Resultado da consulta:', results);
    });
};

// Conectando e realizando a consulta
connection.connect(error => {
    if (error) {
        console.error('Erro ao conectar ao banco de dados:', error);
        return;
    }
    console.log('Conexão bem-sucedida!');
    fetchAlunos();

    // Fechar a conexão após a consulta
    connection.end();
}); 
