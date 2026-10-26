-- ---------- Criação do banco ----------
 
-- Remove o banco se já existir (permite rodar o script várias vezes)
DROP DATABASE IF EXISTS biblioteca_escolar;
 
CREATE DATABASE biblioteca_escolar;
USE biblioteca_escolar;
 
-- ---------- Criação das tabelas ----------
 
-- Leitores que frequentam a biblioteca
CREATE TABLE leitor (
    id_leitor INT AUTO_INCREMENT PRIMARY KEY,
    nome_leitor VARCHAR(100) NOT NULL,
    cidade VARCHAR(100) NOT NULL
);
 
-- Autores das obras
CREATE TABLE autor (
    id_autor INT AUTO_INCREMENT PRIMARY KEY,
    nome_autor VARCHAR(100) NOT NULL,
    cpf CHAR(11) NOT NULL,
    email VARCHAR(100)
);
 
-- Livros do acervo (cada livro pertence a um autor)
CREATE TABLE livro (
    id_livro INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(100) NOT NULL,
    genero VARCHAR(50),
    id_autor INT NOT NULL,
    FOREIGN KEY (id_autor) REFERENCES autor(id_autor)
);
 
-- Empréstimos (liga o leitor ao livro retirado)
CREATE TABLE emprestimo (
    id_emprestimo INT AUTO_INCREMENT PRIMARY KEY,
    id_leitor INT NOT NULL,
    id_livro INT NOT NULL,
    data_retirada DATE NOT NULL,
    data_entrega DATE,
    FOREIGN KEY (id_leitor) REFERENCES leitor(id_leitor),
    FOREIGN KEY (id_livro) REFERENCES livro(id_livro)
);
 
-- ---------- Alteração da estrutura ----------
 
-- Inclui o campo telefone na tabela leitor
ALTER TABLE leitor ADD telefone VARCHAR(20);
 
-- ---------- Inserção de dados ----------
 
-- 5 leitores
INSERT INTO leitor (nome_leitor, cidade, telefone) VALUES
('Fernanda Alves', 'Belo Horizonte', '31987651234'),
('Rafael Gomes', 'Ribeirão Preto', '16991234567'),
('Tatiane Moura', 'Porto Alegre', '51984327788'),
('Henrique Duarte', 'Salvador', '71996543210'),
('Isabela Nunes', 'Lisboa', '21987009911');
 
-- 5 autores
INSERT INTO autor (nome_autor, cpf, email) VALUES
('Rodrigo Campos', '67890123456', 'rodrigo@email.com'),
('Patrícia Lemos', '78901234567', 'patricia@email.com'),
('Thiago Barros', '89012345678', 'thiago@email.com'),
('Larissa Pinto', '90123456789', 'larissa@email.com'),
('Eduardo Cardoso', '01234567890', 'eduardo@email.com');
 
-- 5 livros (cada um ligado a um autor)
INSERT INTO livro (titulo, genero, id_autor) VALUES
('Orgulho e Preconceito', 'Romance', 1),
('O Senhor dos Anéis', 'Fantasia', 2),
('As Crônicas de Nárnia', 'Aventura', 3),
('O Silêncio dos Inocentes', 'Suspense', 4),
('Duna', 'Ficção científica', 5);
 
-- 5 empréstimos (nenhum para a Isabela, que será excluída depois)
INSERT INTO emprestimo (id_leitor, id_livro, data_retirada, data_entrega) VALUES
(1, 1, '2026-10-02', '2026-10-16'),
(2, 2, '2026-10-04', '2026-10-18'),
(3, 3, '2026-10-06', '2026-10-20'),
(4, 4, '2026-10-08', '2026-10-22'),
(2, 5, '2026-10-12', '2026-10-26');
 
-- ---------- Atualização ----------
 
-- Rafael Gomes (id 2) mudou de cidade
UPDATE leitor
SET cidade = 'Uberlândia'
WHERE id_leitor = 2;
 
-- ---------- Exclusão ----------
 
-- Remove a leitora Isabela Nunes (id 5), que mora em Lisboa
DELETE FROM leitor
WHERE id_leitor = 5;
 
-- ---------- Conferência ----------
SELECT * FROM leitor;
SELECT * FROM autor;
SELECT * FROM livro;
SELECT * FROM emprestimo;
 