CREATE DATABASE RevisaoOrganizadorCampanha;
USE RevisaoOrganizadorCampanha;

CREATE TABLE Organizador (
idOrganizador int primary key auto_increment,
nome varchar(45),
cep char(9),
rua varchar(45),
bairro varchar(45),
email varchar(250),
fkExperiente int,
CONSTRAINT fkExperienteOrganizador FOREIGN KEY(fkExperiente)
	REFERENCES Organizador(idOrganizador)
)auto_increment = 30;

CREATE TABLE Campanha(
idCampanha int primary key auto_increment,
categoria varchar(45),
instituicao varchar(45),
dataFinal date,
fkOrganizador int,
CONSTRAINT fkCampanhaOrganizador FOREIGN KEY(fkOrganizador)
	REFERENCES Organizador(idOrganizador)
)auto_increment = 500;

DROP TABLE organizador;
drop table campanha;
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

SELECT * FROM Organizador;
SELECT * FROM Campanha;

--  Exibir os dados dos organizadores e os dados de suas respectivas campanhas.
SELECT * FROM Organizador 
INNER JOIN Campanha 
on  fkOrganizador = idOrganizador;

--  Exibir os dados de um determinado organizador (informar o nome do 
-- organizador na consulta) e os dados de suas respectivas campanhas.
SELECT * FROM Organizador 
INNER JOIN Campanha 
on idOrganizador = fkOrganizador 
WHERE Organizador.idOrganizador = 31;

-- Exibir os dados dos organizadores novatos e os dados dos respectivos 
-- organizadores orientadores.

SELECT * FROM Organizador 
INNER JOIN Organizador as Experiente
on Organizador.idOrganizador = Experiente.fkExperiente;

-- Exibir os dados dos organizadores novatos e os dados dos respectivos 
-- organizadores orientadores, porém somente de um determinado organizador 
-- orientador (informar o nome do organizador orientador na consulta
SELECT * FROM Organizador 
INNER JOIN Organizador as Experiente
on Organizador.idOrganizador = Experiente.fkExperiente
where Organizador.nome like "eduardo";

-- Exibir os dados dos organizadores novatos, os dados das respectivas 
-- campanhas organizadas e os dados dos respectivos organizadores orientador

SELECT * FROM Organizador 
INNER JOIN Organizador as Experiente
on Organizador.idOrganizador = Experiente.fkExperiente
INNER JOIN Campanha 
ON Organizador.idOrganizador = Campanha.fkOrganizador;

--  Exibir os dados de um organizador novato (informar o seu nome na consulta), 
-- os dados das respectivas campanhas em que trabalha e os dados do seu 
-- organizador orientado

SELECT novato.nome as "Nome do novato",
Experiente.nome as "Nome do experiente",
Campanha.categoria as "Categoria da campanha"
From Organizador as novato
INNER JOIN Organizador as experiente
ON novato.idOrganizador = Experiente.fkExperiente
INNER JOIN Campanha 
ON Campanha.fkOrganizador = novato.idOrganizador
where novato.nome like "cleber";


