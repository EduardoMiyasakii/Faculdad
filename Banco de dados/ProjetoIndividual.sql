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