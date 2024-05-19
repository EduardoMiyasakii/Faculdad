CREATE DATABASE OrganizadorCampanha;
USE OrganizadorCampanha;

CREATE TABLE Organizador (
idOrganizador int primary key auto_increment,
nome VARCHAR(45),
cep CHAR(9),
rua VARCHAR(45),
complemento VARCHAR(45),
email VARCHAR(45),
fkExperiente int,
CONSTRAINT fkOrganizadorExperiente FOREIGN KEY(fkExperiente)
	REFERENCES Organizador(idOrganizador)
)auto_increment = 30;

CREATE TABLE Campanha (
idCampanha int primary key auto_increment,
categoria VARCHAR(45),
instituicao VARCHAR(45),
dataFinal Date,
fkOrganizador int,
CONSTRAINT fkCampanhaOrganizador FOREIGN KEY (fkOrganizador)
	REFERENCES Organizador(idOrganizador)
)auto_increment = 500;

INSERT INTO Organizador VALUES
(default,"Eduardo","08573-150","Rua natal","Casa","Eduardo@sptech.com",NULL),
(default,"Fernando","08573-150","Rua natal","Casa","Fernando@gmail.com",30),
(default,"Nicolas","07231-180","Rua Euclides da cunha","casa","Nicolas@outlook.com",30),
(default,"Pedro","09201-123","Rua velha casa","Apartamento","Pedro@gmail.com",NULL),
(default,"Cleber","09322-321","Rua Sebastopol","Condomínio","Cleber@outlook.com",34);

INSERT INTO Campanha VALUES
(default,"Brinquedo","Ri Happy","2024-04-07",31),
(default,"Roupas","Lacoste","2050-12-30",33),
(default,"Alimentícia","Assaí","1988-07-23",32),
(default,"Sangue","Santa marcelina","2006-06-10",34);

SELECT * FROM ORGANIZADOR;
SELECT * FROM Campanha;

-- Exibir os dados dos organizadores e os dados de suas respectivas campanhas

SELECT Organizador.nome as "Nome do organizador",
Campanha.categoria as "categoria da campanha"
FROM Organizador INNER JOIN Campanha
ON Organizador.idOrganizador = Campanha.fkOrganizador;

--  Exibir os dados de um determinado organizador (informar o nome do
-- organizador na consulta) e os dados de suas respectivas campanhas

SELECT Organizador.nome as "Nome do organizador",
Campanha.categoria as "categoria da campanha"
FROM Organizador INNER JOIN Campanha
ON Organizador.idOrganizador = Campanha.fkOrganizador
where Organizador.nome = "Fernando";

-- Exibir os dados dos organizadores novatos e os dados dos respectivos organizadores orientadores.
