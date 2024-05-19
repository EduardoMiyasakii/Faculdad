CREATE DATABASE RevisaochaveEstrangeiraSprint2;
USE RevisaochaveEstrangeiraSprint2;

-- ENTIDADE FORTE = PK simples

CREATE TABLE Funcionario (
idFuncionario int primary key auto_increment,
nome VARCHAR(45),
cep CHAR(9),
NumeroEndereco VARCHAR(45),
complemento VARCHAR(45),
telefoneCelular varchar(20),
telefoneFixo VARCHAR(20),
fkSupervisor int,
CONSTRAINT fkSupervisorFuncionario FOREIGN KEY(fkSupervisor)
	REFERENCES Funcionario(idFuncionario)
);

-- INSERIR UM SUPERVISOR
INSERT INTO Funcionario VALUES
(default,'Canhoto','01414-905','595','11° andar','11987654321','11 54321122',null);

SELECT * FROM Funcionario;

INSERT INTO Funcionario (nome,fkSupervisor) VALUES
('Destro',1),
('Ambidestro',1);

SELECT * FROM Funcionario INNER JOIN Funcionario as Supervisor
ON Supervisor.idFuncionario = Funcionario.fkSupervisor;

SELECT Funcionario.nome as "Nome funcionario",
Supervisor.nome as "nome do supervisor"
FROM Funcionario INNER JOIN 
Funcionario as Supervisor
ON  Funcionario.fkSupervisor = Supervisor.idFuncionario;

-- Entidade fraca = pk Composta
CREATE TABLE Dependente (
idDependente int,
fkFuncionario int,
CONSTRAINT pkComposta PRIMARY KEY (idDependente,fkFuncionario),
nome VARCHAR(45),
parentesco VARCHAR(45),
dataNascimento date,
CONSTRAINT fkFuncionarioDependente FOREIGN KEY (fkFuncionario)
	REFERENCES Funcionario(idFuncionario)
);

INSERT INTO Dependente VALUES
(1,2,'Destrinho','filho','2004-01-01'),
(2,2,'Destra','Esposa','1984-01-01'),
(3,2,'Destrinha','Filha','2006-01-01'),
(1,3,'Ambidestrinha','filha','2005-01-01');

SELECT * FROM dependente;

SELECT Funcionario.nome as "Nome do funcionario",
Dependente.nome as "Nome do dependente"
FROM Funcionario INNER JOIN Dependente
on fkFuncionario = idFuncionario;

SELECT Funcionario.nome as "Nome do funcionario",
Supervisor.nome as "Nome do supervisor",
Dependente.nome as "Nome do dependente"
FROM funcionario INNER JOIN Funcionario as Supervisor
	ON Funcionario.fkSupervisor = supervisor.idFuncionario
    INNER JOIN Dependente
    ON Funcionario.idFuncionario = dependente.fkFuncionario;
    
    -- Exibir todos os funcionários inclusive os sem dependencias
SELECT Funcionario.nome as "Nome do funcionario",
Dependente.nome as "Nome do dependente"
FROM Funcionario LEFT JOIN Dependente
on fkFuncionario = idFuncionario;

-- Se o funcionário estivesse na direita seria right join

-- Se quiser mostrar os que não tem inner join

SELECT Funcionario.nome as "Nome do funcionario",
Dependente.nome as "Nome do dependente"
FROM Funcionario left JOIN Dependente
on fkFuncionario = idFuncionario
	WHERE fkFuncionario is null;
    
-- VAI CAIR NA PROVA

SELECT * FROM Funcionario;

SELECT nome,ifnull(numeroEndereco,"Sem endereço") as Número,
ifnull(Complemento,"Sem complemento") as Complemento
FROM Funcionario;

SELECT CONCAT(nome, " Mora no número " , ifnull(numeroEndereco," Sem endereço "))as Frases
from funcionario;

SELECT concat(' O Nome do fulano é ' , nome) as nome 
from funcionario;
