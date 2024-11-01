DROP DATABASE IF EXISTS biblioteca;
CREATE DATABASE IF NOT EXISTS biblioteca;
USE biblioteca;

-- Criação da tabela livros
DROP TABLE IF EXISTS livros;
CREATE TABLE livros (
    livros_id INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(255),
    autor VARCHAR(255),
    editora VARCHAR(255),
    ano_publicacao INT,
    isbn VARCHAR(17)
);

-- Inserção dos livros (da maneira antiga)
INSERT INTO livros (titulo, autor, editora, ano_publicacao, isbn) VALUES 
('A Culpa é das Estrelas', 'John Green', 'Intrínseca', 2012, '978-85-8057-346-6'),
('Harry Potter e a Pedra Filosofal', 'J.K. Rowling', 'Rocco', 1997, '9788532511010'),
('O Senhor dos Anéis: A Sociedade do Anel', 'J.R.R. Tolkien', 'Martins Fontes', 1954, '9788533603149'),
('The Catcher in the Rye', 'J.D. Salinger', 'Little, Brown and Company', '1951', '9780316769488'),
('1984', 'George Orwell', 'Companhia Editora Nacional', 1949, '978-85-221-0616-9'),
('Percy Jackson e o Ladrão de Raios', 'Rick Riordan', 'Intrínseca', 2005, '9788598078355');

-- Criação da tabela autores
DROP TABLE IF EXISTS autores;
CREATE TABLE autores (
    autor_id INT PRIMARY KEY AUTO_INCREMENT,
    nome_autor VARCHAR(255) NOT NULL
);

-- Criação da tabela editoras
DROP TABLE IF EXISTS editoras;
CREATE TABLE editoras (
    editora_id INT PRIMARY KEY AUTO_INCREMENT,
    nome_editora VARCHAR(255) NOT NULL
);

-- Deletando colunas, e adicionando as novas, e adicionando as chaves estrangeiras
ALTER TABLE livros DROP COLUMN autor;
ALTER TABLE livros ADD autor_id INT, ADD FOREIGN KEY (autor_id) REFERENCES autores(autor_id) ON DELETE CASCADE;

ALTER TABLE livros DROP COLUMN editora;
ALTER TABLE livros ADD editora_id INT, ADD FOREIGN KEY (editora_id) REFERENCES editoras(editora_id) ON DELETE CASCADE;

-- Inserção de valores na tabela autores
INSERT INTO autores (nome_autor) VALUES 
('John Green'),
('J.K. Rowling'),
('J.R.R. Tolkien'),
('J.D. Salinger'),
('George Orwell'),
('Rick Riordan');

-- Inserção de valores na tabela editoras
INSERT INTO editoras (nome_editora) VALUES 
('Intrínseca'),
('Rocco'),
('Martins Fontes'),
('Little, Brown and Company'),
('Companhia Editora Nacional');

-- Colocando os respectivos autores para seu livro
UPDATE livros SET autor_id = (SELECT autor_id FROM autores WHERE nome_autor = 'John Green') WHERE titulo = 'A Culpa é das Estrelas';
UPDATE livros SET autor_id = (SELECT autor_id FROM autores WHERE nome_autor = 'J.K. Rowling') WHERE titulo = 'Harry Potter e a Pedra Filosofal';
UPDATE livros SET autor_id = (SELECT autor_id FROM autores WHERE nome_autor = 'J.R.R. Tolkien') WHERE titulo = 'O Senhor dos Anéis: A Sociedade do Anel';
UPDATE livros SET autor_id = (SELECT autor_id FROM autores WHERE nome_autor = 'J.D. Salinger') WHERE titulo = 'The Catcher in the Rye';
UPDATE livros SET autor_id = (SELECT autor_id FROM autores WHERE nome_autor = 'George Orwell') WHERE titulo = '1984';
UPDATE livros SET autor_id = (SELECT autor_id FROM autores WHERE nome_autor = 'Rick Riordan') WHERE titulo = 'Percy Jackson e o Ladrão de Raios';

-- Colocando as respectivas editoras pelo id do autor do livro
UPDATE livros SET editora_id = (SELECT editora_id FROM editoras WHERE nome_editora = 'Intrínseca') WHERE autor_id = 1;
UPDATE livros SET editora_id = (SELECT editora_id FROM editoras WHERE nome_editora = 'Intrínseca') WHERE autor_id = 6;
UPDATE livros SET editora_id = (SELECT editora_id FROM editoras WHERE nome_editora = 'Rocco') WHERE autor_id = 2;
UPDATE livros SET editora_id = (SELECT editora_id FROM editoras WHERE nome_editora = 'Martins Fontes') WHERE autor_id = 3;
UPDATE livros SET editora_id = (SELECT editora_id FROM editoras WHERE nome_editora = 'Little, Brown and Company') WHERE autor_id = 4;
UPDATE livros SET editora_id = (SELECT editora_id FROM editoras WHERE nome_editora = 'Companhia Editora Nacional') WHERE autor_id = 5;

-- Adicionando os novos autores
INSERT INTO autores (nome_autor) VALUES 
('João Guimarães Rosa'),
('Machado de Assis'),
('Graciliano Ramos'),
('Machado de Assis'),
('Aluísio Azevedo'),
('Mário de Andrade');

-- Adicionando as novas editoras
INSERT INTO editoras (nome_editora) VALUES 
('Nova Fronteira'),
('Companhia das Letras'),
('Companhia Editora Nacional'),
('Martin Claret'),
('Penguin Companhia');

-- Adicionando novos livros
INSERT INTO 
Livros (titulo, ano_publicacao, isbn, autor_id, editora_id) 
VALUES 
('Grande Sertão: Veredas', 1956, '978-85-209-2325-1', 7, 6),
('Memórias Póstumas de Brás Cubas', 1881, '9788535910663', 8, 7),
('Vidas Secas', 1938, '9788572326972', 9, 8),
('O Alienista', 1882, '9788572327429', 10, 9),
('O Cortiço', 1890, '9788579027048', 11, 10),
('Dom Casmurro', 1899, '9788583862093', 8, 10),
('Macunaíma', 1928, '9788503012302', 12, 8);