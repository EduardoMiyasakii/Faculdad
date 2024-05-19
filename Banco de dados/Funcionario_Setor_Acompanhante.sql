CREATE DATABASE FuncionarioSetorAcompanhante;
USE FuncionarioSetorAcompanhante;

CREATE TABLE Setor (
idSetor int primary key auto_increment,
nome varchar(45),
numeroAndar int
); 

CREATE TABLE Funcionario (
idFuncionario int primary key auto_increment,
nome varchar(45),
TelefoneCelular varchar (20),
salario int,
fkSetor int,
CONSTRAINT fkFuncionarioSalario check (salario > 0),
CONSTRAINT fkFuncionarioSetor FOREIGN KEY (fkSetor)
	REFERENCES Setor(idSetor)
);

CREATE TABLE Acompanhante (
idAcompanhante int primary key auto_increment,
nome varchar(45),
tipoRelacao varchar(45),
dataNascimento date,
fkFuncionario int,
CONSTRAINT fkAcompanhanteFuncionario FOREIGN KEY(fkFuncionario)
	REFERENCES Funcionario(idFuncionario)
);

INSERT INTO Setor VALUES
(default,"Alimentício",1),
(default,"Automobilístico",2),
(default,"mineração",0);


INSERT INTO Funcionario VALUES
(default,"Eduardo","94115-9059",7500,2),
(default,"Gustavo","97682-6423",8000,1),
(default,"Murillo","97349-1878",8500,1),
(default,"Kevelly","99463-7199",9000,2),
(default,"Mônica","94067-6737",8000,3),
(default,"Julia","94118-5028",8750,3);

INSERT INTO Acompanhante VALUES
(default,"Fernando","Irmão","2011-08-01",1),
(default,"Angêlica","Prima","2003-03-17",3),
(default,"Daniel","irmão","2015-03-21",4);

-- Exibir os dados de cada tabela separadamente

SELECT * FROM Setor;

SELECT * FROM Funcionario;

SELECT * FROM Acompanhante;

-- - Exibir os dados dos setores e dos seus respectivos funcionário

SELECT setor.nome as "Nome do setor", 
setor.numeroAndar as " N° do andar",
Funcionario.nome as "Nome do funcionario",
Funcionario.TelefoneCelular as "Número do telefone",
Funcionario.Salario 
FROM Setor INNER JOIN Funcionario
ON setor.idSetor = Funcionario.fkSetor;

--  Exibir os dados de um determinado setor (informar o nome do setor na consulta)
--  e dos seus respectivos funcionários.

SELECT setor.nome as "Nome do setor", 
setor.numeroAndar as " N° do andar",
Funcionario.nome as "Nome do funcionario",
Funcionario.TelefoneCelular as "Número do telefone",
Funcionario.Salario 
from Setor INNER JOIN Funcionario
on Setor.idSetor = Funcionario.fkSetor
	where Setor.nome = "Automobilístico" ;
    
-- Exibir os dados dos funcionários e de seus acompanhantes.

SELECT Funcionario.nome as "Nome do funcionario",
Funcionario.TelefoneCelular as "Número do telefone",
Funcionario.Salario,
Acompanhante.nome as "Nome do acompanhante",
Acompanhante.tipoRelacao as "Relacão com funcionario",
Acompanhante.dataNascimento 
FROM Funcionario INNER JOIN Acompanhante
on Funcionario.idFuncionario = Acompanhante.fkFuncionario;

-- - Exibir os dados de apenas um funcionário (informar o nome do funcionário) e 
-- os dados de seus acompanhantes.

SELECT Funcionario.nome as "Nome do funcionario",
Funcionario.TelefoneCelular as "Número do telefone",
Funcionario.Salario,
Acompanhante.nome as "Nome do acompanhante",
Acompanhante.tipoRelacao as "Relacão com funcionario",
Acompanhante.dataNascimento 
FROM Funcionario INNER JOIN Acompanhante
ON Funcionario.idFuncionario = Acompanhante.fkFuncionario
	where Funcionario.nome = "Eduardo";
    
--  Exibir os dados dos funcionários, dos setores em que trabalham e dos seus acompanhantes

SELECT setor.nome as "Nome do setor", 
setor.numeroAndar as " N° do andar",
Funcionario.nome as "Nome do funcionario",
Funcionario.TelefoneCelular as "Número do telefone",
Funcionario.Salario,
Acompanhante.nome as "Nome do acompanhante",
Acompanhante.tipoRelacao as "Relacão com funcionario",
Acompanhante.dataNascimento 
FROM Setor INNER JOIN Funcionario 
ON Setor.idSetor = Funcionario.idFuncionario
INNER JOIN Acompanhante
ON Funcionario.idFuncionario = Acompanhante.fkFuncionario;

