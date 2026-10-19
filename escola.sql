
CREATE DATABASE db_escola;
USE db_escola;

CREATE TABLE Aluno (
    id_aluno INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    serie INT NOT NULL,
    email VARCHAR(100) NOT NULL
);

CREATE TABLE Professores (
    id_professores INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    materia VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL
);

CREATE TABLE Curso (
    id_curso INT AUTO_INCREMENT PRIMARY KEY,
    materia VARCHAR(100) NOT NULL,
    professor VARCHAR(100) NOT NULL,
    id_professor INT NOT NULL,
    FOREIGN KEY (id_professor) REFERENCES Professores(id_professores)
);

CREATE TABLE AlunoCurso (
    id_alunoCurso INT AUTO_INCREMENT PRIMARY KEY,
    id_aluno INT NOT NULL,
    id_curso INT NOT NULL,
    semestre VARCHAR(50) NOT NULL,
    FOREIGN KEY (id_aluno) REFERENCES Aluno(id_aluno),
    FOREIGN KEY (id_curso) REFERENCES Curso(id_curso)
);


INSERT INTO Aluno (nome, serie, email) VALUES
('Marcos Oliveira', 3, 'marcos@escola.com'),
('Camila Ferreira', 2, 'camila@escola.com'),
('Rafael Martins', 1, 'rafael@escola.com');


INSERT INTO Professores (nome, materia, email) VALUES
('Prof. André Carvalho', 'Português', 'andre@escola.com'),
('Prof.ª Patrícia Mendes', 'Geografia', 'patricia@escola.com'),
('Prof. Eduardo Lima', 'Química', 'eduardo@escola.com');


INSERT INTO Curso (materia, professor, id_professor) VALUES
('Literatura Brasileira', 'Prof. André Carvalho', 1),
('Geografia Mundial', 'Prof.ª Patrícia Mendes', 2),
('Química Orgânica', 'Prof. Eduardo Lima', 3);


INSERT INTO AlunoCurso (id_aluno, id_curso, semestre) VALUES
(1, 1, '2026.1'),
(2, 2, '2026.1'),
(3, 3, '2026.1');
