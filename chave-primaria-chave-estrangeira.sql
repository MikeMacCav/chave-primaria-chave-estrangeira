CREATE DATABASE ESCOLA;

USE ESCOLA;

CREATE TABLE ALUNO (
    id_aluno INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    email VARCHAR(100),
    endereco VARCHAR(255)
);

CREATE TABLE CURSO (
    id_curso INT AUTO_INCREMENT PRIMARY KEY,
    nome_curso VARCHAR(100),
    descricao TEXT
);

CREATE TABLE MATRICULA (
    id_matricula INT AUTO_INCREMENT PRIMARY KEY,
    id_aluno INT,
    id_curso INT,
    data_matricula DATE,
    FOREIGN KEY (id_aluno) REFERENCES ALUNO(id_aluno),
    FOREIGN KEY (id_curso) REFERENCES CURSO(id_curso)
);

INSERT INTO ALUNO (nome, email, endereco) VALUES
('João Silva', 'joao@gmail.com', 'Rua A, 123'),
('Maria Souza', 'maria@gmail.com', 'Rua B, 456'),
('Carlos Almeida', 'carlos@gmail.com', 'Rua C, 789');

INSERT INTO CURSO (nome_curso, descricao) VALUES
('Matemática', 'Curso de Matemática Básica'),
('Português', 'Curso de Língua Portuguesa'),
('História', 'Curso de História Geral');

INSERT INTO MATRICULA (id_aluno, id_curso, data_matricula) VALUES
(1, 1, '2024-10-01'),
(2, 2, '2024-10-02'),
(3, 3, '2024-10-03'),
(1, 2, '2024-10-04');  

SELECT A.nome AS NomeAluno, C.nome_curso AS NomeCurso, M.data_matricula
FROM ALUNO A
JOIN MATRICULA M ON A.id_aluno = M.id_aluno
JOIN CURSO C ON M.id_curso = C.id_curso;

SELECT A.nome, C.nome_curso
FROM ALUNO A
JOIN MATRICULA M ON A.id_aluno = M.id_aluno
JOIN CURSO C ON M.id_curso = C.id_curso
WHERE C.nome_curso = 'Matemática';

SELECT C.nome_curso, COUNT(M.id_aluno) AS TotalAlunos
FROM CURSO C
JOIN MATRICULA M ON C.id_curso = M.id_curso
GROUP BY C.nome_curso;