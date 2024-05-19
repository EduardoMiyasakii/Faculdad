CREATE DATABASE FuncionarioEmpresa;
USE FuncionarioEmpresa;

CREATE TABLE Empresa (
idEmpresa int primary key auto_increment,
nome varchar(45),
cnpj varchar(45),
descricao varchar(45)
);

describe Empresa;

CREATE TABLE Funcionario (
idFuncionario int primary key auto_increment,
Nome varchar(45),
idade varchar(45),
funcao varchar(45),
fkSupervisor int,
fkEmpresa int,
CONSTRAINT fkSupervisorFuncionario FOREIGN KEY(fkSupervisor)
	REFERENCES Funcionario(idFuncionario),
CONSTRAINT fkFuncionarioEmpresa FOREIGN KEY(fkEmpresa)	
	REFERENCES Empresa(idEmpresa)
    );

INSERT INTO Empresa VALUES
(default,"C6Bank","1234","Banco"),
(default,"Safra","5678","Banco"),
(default,"Accenture","9012","Consultoria");

SELECT * FROM Empresa;


INSERT INTO Funcionario VALUES
(default,"Eduardo",17,"progamador",1,2),
(default,"Gustavo",18,"Progamador",1,1),
(default,"Fernando",13,"ajudante",1,3),
(default,"Cleiton",25,"Chefe",4,3);

SELECT funcionario.nome as "Nome do supervisor",
supervisor.nome as "Nome do funcionario"
from Funcionario inner join funcionario as supervisor
on funcionario.idFuncionario = supervisor.fkSupervisor;

select funcionario.nome as "nome do Funcionario",
empresa.nome as "nome da empresa"
FROM Funcionario INNER JOIN Empresa 
ON idFuncionario = fkEmpresa;
