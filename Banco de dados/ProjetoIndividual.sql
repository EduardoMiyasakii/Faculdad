CREATE DATABASE Cadastro;
USE Cadastro;

CREATE TABLE Usuario(
id int primary key auto_increment,
nome varchar(50),
email VARCHAR(50),
cpf CHAR(14),
senha VARCHAR(50),
fk_cpf INT,
FOREIGN KEY(fk_cpf)
 REFERENCES Usuario(id)
);

INSERT INTO Usuario (email,senha) VALUES
('Maikon','1234');
INSERT INTO Usuario (email,senha) VALUES
('Eduardo','1234');

INSERT INTO Usuario (email,senha) VALUES
('Maria Clara','1234');

SELECT * FROM Usuario;

CREATE TABLE Quiz (
idQuiz int primary key auto_increment,
questoes int,
questoesCorretas int,
fkUsuario int,
CONSTRAINT fkQuizUsuario FOREIGN KEY (fkUsuario)
	REFERENCES Usuario(id)
);