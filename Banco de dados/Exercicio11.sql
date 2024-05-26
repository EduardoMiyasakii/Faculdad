CREATE DATABASE Exercicio11;
USE Exercicio11;

CREATE TABLE Departamento (
idDepartamento int primary key,
nome VARCHAR(45),
dataInicioGer date
);

CREATE TABLE Funcionario (
idFuncionario int primary key,
fkSupervisor int,
nome VARCHAR(30),
salario int,
sexo char(1),
dataNascimento date,
CONSTRAINT ValidacaoSexo Check(sexo IN("M","F")),
Constraint SupervisorFuncionario FOREIGN KEY(fkSupervisor)
REFERENCES Funcionario(idFuncionario)
);

CREATE TABLE Projeto (
idProjeto int primary key,
nome VARCHAR(45),
localProjeto Varchar(45)
);

CREATE TABLE FuncProj (
fkFuncionario int,
fkProjeto int,
horas DECIMAL(3,1),
FOREIGN KEY(fkFuncionario)
 REFERENCES Funcionario(idFuncionario),
 
 FOREIGN KEY(fkProjeto)
 REFERENCES Projeto(idProjeto),
 
 CONSTRAINT pkComposta PRIMARY KEY(fkFuncionario,fkProjeto)
 );

ALTER TABLE Departamento ADD COLUMN fkGerente int;
ALTER TABLE Departamento ADD CONSTRAINT fkGerenteDepartamento FOREIGN KEY(fkGerente)
REFERENCES Funcionario(idFuncionario);

ALTER TABLE Funcionario ADD COLUMN fkDepartamento int;
ALTER TABLE Funcionario ADD CONSTRAINT FuncionarioDepartamento FOREIGN KEY(fkDepartamento)
REFERENCES Departamento(idDepartamento);

ALTER TABLE Projeto ADD COLUMN fkDepartamento int;
ALTER TABLE Projeto ADD CONSTRAINT ProjetoDepartamento FOREIGN KEY(fkDepartamento)
REFERENCES Departamento(idDepartamento);

INSERT INTO Funcionario(idFuncionario,nome,salario,sexo,dataNascimento,fkDepartamento) VALUES
(1,'Joao silva',3500,'M','1985-01-09',105),
(2,'Fernando Wong',4500,'M','1975-12-08',105),
(3,'Alice sousa',2500,'F','1988-01-19',104),
(4,'Janice morais',4300,'F','1970-06-20',104),
(5,'Ronaldo Lima',3800,'M','1982-09-15',105),
(6,'Joice Leite',2500,'F','1992-07-31',105),
(7,'Antonio Pereira',2500,'M','1989-03-29',104),
(8,'Juliano Brito',5500,'M','1957-11-10',101);

INSERT INTO Departamento(idDepartamento,nome,dataInicioGer) VALUES
('105','Pesquisa','2008-05-22'),
('104','Administração','2015-01-01'),
('101','Matriz','2001-06-19');

UPDATE Departamento SET fkGerente = 2
WHERE idDepartamento = '105';

UPDATE Departamento SET fkGerente = 7
WHERE idDepartamento = '104';

UPDATE Departamento SET fkGerente = 8
WHERE idDepartamento = '101';

UPDATE Funcionario SET fkSupervisor = 2
WHERE idFuncionario = '1';

UPDATE Funcionario SET fkSupervisor = 8
WHERE idFuncionario in(2,4);

UPDATE Funcionario SET fkSupervisor = 7
WHERE idFuncionario = '3';

UPDATE Funcionario SET fkSupervisor = 1
WHERE idFuncionario in(5,6);

UPDATE Funcionario SET fkSupervisor = 4
WHERE idFuncionario = '7';

INSERT INTO Projeto (idProjeto,nome,localProjeto,fkDepartamento) VALUES
(1,'Produto X','Santo André',105),
(2,'Produto Y','Itu',105),
(3,'Produto Z','São Paulo',105),
(10,'Informatização','Mauá',104),
(20,'Reorganização','São paulo',101),
(30,'Benefícios','Mauá',104);

INSERT INTO FuncProj VALUES
(1,1,32.5),
(1,2,7.5),
(5,3,40.0),
(6,1,20.0),
(6,2,20.0),
(2,2,10.0),
(2,3,10.0),
(2,10,10.0),
(2,20,10.0),
(3,30,30.0),
(3,10,10.0),
(7,10,35.0),
(7,30,5.0),
(4,30,20.0),
(4,20,15.0),
(8,20,NULL);

SELECT * FROM Departamento;
SELECT * FROM Funcionario;
SELECT * FROM Projeto;
SELECT * FROM FuncProj;

INSERT INTO Funcionario(idFuncionario,nome,salario,sexo,fkSupervisor,dataNascimento,fkDepartamento) VALUES
(Null,'Cecília Ribeiro',2800,'F',NULL,'1980-04-05',104);
-- Não conseguiu adicionar pois o idFuncionario não é auto_increment,assim o Funcionario ficaria sem id

INSERT INTO Funcionario(idFuncionario,nome,salario,sexo,fkSupervisor,dataNascimento,fkDepartamento) VALUES
(3,'Alice sousa',2800,'F',4,'1980-04-05',104);
-- Não conseguiu adicionar, pois, já existe na tabela funcionario um id = 3 e como ids são primary key
-- Só pode existir um funcionario com id = 3;

INSERT INTO Funcionario(idFuncionario,nome,salario,sexo,fkSupervisor,dataNascimento,fkDepartamento) VALUES
(9,'Cecília Ribeiro',2800,'F',4,'1980-04-05',107);
-- Os dados inseridos não foram adicionados,
-- por conta que na tabela Departamento,não existe um departamento com um id = 107

INSERT INTO Funcionario(idFuncionario,nome,salario,sexo,fkSupervisor,dataNascimento,fkDepartamento) VALUES
(9,'Cecília Ribeiro',2800,'F',4,'1980-04-05',104);

-- Os dados foram inseridos,porque o idFuncionario está correto não existe outra pessoa com esse id
-- o id que deram na coluna fkSupervisor realmente existe
-- e o departamento também existe

--   Excluir a tupla (registro) da tabela FuncProj,
--  em que fkFunc= 3 e fkProj = 10.  Conseguiu excluir? Por que?
DELETE from FuncProj
WHERE fkFuncionario = 3 AND fkProjeto = 10;

-- O dado foi excluído pois na tabela FuncProj existe esses dados, que são primary keys,
-- mas, com a função and você pode encontrar 2 primary keys

--    Excluir a tupla da tabela Funcionario, em que idFunc=4. Conseguiu excluir? Por que?
DELETE FROM Funcionario
	WHERE idFuncionario = 4;
    
-- O dado não foi excluído pois o Funcionario com id=4
-- É supervisor de outro funcionario,ou seja influenciaria outros dados

-- Excluir a tupla da tabela Funcionário, em que idFunc=2. Conseguiu excluir? Por que?
DELETE FROM Funcionario 
	Where idFuncionario = 2;

-- O dado não foi excluído porque,Além de ser supervisor do Funcionario 1 ele também é gerente do 
-- departamento 105 ou seja influenciaria 2 tabelas

-- Alterar o salário do Funcionário com idFunc=3 para 2800. Conseguiu alterar? Por que?
UPDATE Funcionario SET Salario = 2800
	WHERE idFuncionario = 3;
    
-- sim, o dado foi alterado,por conta que existe o funcionario com id 3 e também é uma informação nova
-- que não interfere em outros dados,a não ser na média e soma desses salários;

-- Alterar o fkDepto do Funcionário com idFunc=3 para 101. Conseguiu alterar? Por que?

UPDATE Funcionario SET fkDepartamento = 101
	WHERE idFuncionario = 3;
    
-- Sim,foi alterado,isso interfere em outras tabelas,mas,não foi trocado nenhuma primary key
-- e sim a chave estrageira da tabela funcionario e como não existia outro funcionario com id 3
-- no departamento 101 funcionou

-- Alterar o fkDepto do Funcionário com idFunc=3 para 107. Conseguiu alterar? Por que?
UPDATE Funcionario SET fkDepartamento = 107
	WHERE idFuncionario = 3;

-- Não funcionou,por conta que não existe o departamento com id 107;

-- Exibir a data de nascimento e o salário do funcionário João Silva.

SELECT nome,dataNascimento,salario FROM Funcionario
	WHERE idFuncionario = 1;
    
-- Exibir uma lista apenas dos salários de todos os funcionários.

SELECT Salario FROM Funcionario;

-- Exibir uma lista apenas dos salários distintos de todos os funcionários.
SELECT DISTINCT Salario FROM Funcionario;

--   Exibir os dados dos funcionários ordenados pelo nome.

SELECT * FROM Funcionario 
ORDER BY Nome;

-- Exibir os dados dos funcionários ordenados pelo salário, de forma decrescente.
SELECT * FROM Funcionario
ORDER BY Salario DESC;

-- Exibir os dados dos funcionários que tenham salário entre 2000 e 4000.

SELECT * FROM FUNCIONARIO
	WHERE Salario
    Between 2000 and 4000;
    
--  Exibir os nomes e os salários dos funcionários cujos nomes começam com a letra ‘J’.

SELECT Nome,Salario FROM Funcionario
	WHERE Nome LIKE 'J%';

--  Exibir os nomes e os salários dos funcionários cujos nomes terminam com a letra ‘A’.

SELECT Nome,Salario FROM Funcionario
	WHERE Nome LIKE '%A';
    
-- Exibir os nomes dos funcionários que tem a letra ‘n’ como terceira letra do nome
SELECT nome FROM Funcionario
	WHERE Nome LIKE '__n%';

-- Exibir os nomes e as datas de nascimento dos funcionários cujos nomes tenham a letra ‘S’
--  como 5ª letra de trás para frente.

SELECT nome,dataNascimento FROM Funcionario
	WHERE Nome LIKE '%s____';
    
-- Exibir os dados dos funcionários que trabalham no departamento Pesquisa.
SELECT f.nome,
f.salario,
f.sexo,
f.dataNascimento,
f.fkDepartamento
FROM Departamento
INNER JOIN Funcionario as f
ON idDepartamento = fkDepartamento
	WHERE Departamento.nome = 'Pesquisa';
    
-- Exibir os dados dos funcionários que trabalham no departamento Pesquisa 
-- e que tenham salário acima de 3500.

SELECT f.nome,
f.salario,
f.sexo,
f.dataNascimento,
f.fkDepartamento
FROM Departamento
INNER JOIN Funcionario as f
ON idDepartamento = fkDepartamento
	WHERE Departamento.nome = 'Pesquisa' AND f.salario > 3500;
    
--     Exibir os dados dos funcionários que trabalham no departamento Pesquisa
--  e que tenham o nome com inicial ‘J’.

SELECT f.nome,
f.salario,
f.sexo,
f.dataNascimento,
f.fkDepartamento
FROM Departamento
INNER JOIN Funcionario as f
ON idDepartamento = fkDepartamento
	WHERE Departamento.nome = 'Pesquisa' AND f.nome LIKE 'J%';
    
-- Exibir o idFunc e o nome de cada funcionário, 
-- juntamente com o idFunc e o nome do seu supervisor.
-- Faça com que o título da coluna seja “idFuncionario” para funcionário
-- e “idSupervisor” para o id do supervisor.

Select f.idFuncionario as "Id do funcionário",
f.nome as 'Nome do funcionário',
s.nome as 'Nome do supervisor',
s.fkSupervisor 'Id do Supervisor'
FROM Funcionario as f
INNER JOIN Funcionario as s
ON f.fkSupervisor = s.idFuncionario;

-- Exibir para cada projeto localizado em São Paulo,
--  o idProj do projeto,
-- o número do departamento que o controla,
-- o nome e a data de nascimento do gerente do departamento.

SELECT projeto.idProjeto,
Departamento.idDepartamento,
Funcionario.nome,
funcionario.dataNascimento
FROM Projeto
INNER JOIN Departamento
ON Projeto.fkDepartamento = Departamento.idDepartamento
INNER JOIN Funcionario 
ON Funcionario.fkDepartamento = Departamento.idDepartamento
WHERE Projeto.localProjeto = 'São Paulo';

--   Exibir o idFunc e o nome do funcionário,
-- o projeto e o nome do projeto em que trabalha,
-- e a quantidade de horas que trabalha nesse projeto.

SELECT Funcionario.idFuncionario,
Funcionario.nome as "Nome do funcionario",
Projeto.idProjeto,
Projeto.nome as "Nome do projeto",
FuncProj.horas as 'Horas trabalhadas'
FROM Funcionario
INNER JOIN FuncProj
ON Funcionario.idFuncionario = FuncProj.fkFuncionario
INNER JOIN Projeto 
ON Projeto.idProjeto = FuncProj.fkProjeto;

-- Exibir os nomes dos funcionários que nasceram antes de 1980.

SELECT nome
FROM Funcionario
WHERE dataNascimento < '1980-12-31';

-- Exibir a quantidade de salários diferentes que existem na empresa.
SELECT COUNT(DISTINCT salario) as "Salários distintos",
FuncProj.fkProjeto
FROM Funcionario
INNER JOIN FuncProj
ON Funcionario.idFuncionario = FuncProj.fkFuncionario
group by fkProjeto;

--    Exibir a quantidade de locais diferentes de projeto.

SELECT DISTINCT LocalProjeto FROM Projeto;

-- Exibir o salário médio da empresa e a soma dos salários.

SELECT fkProjeto as "Empresa",
ROUND(AVG(salario),2)as "Média de salário",
SUM(Salario) as "Soma dos salários"
FROM Funcionario
INNER JOIN FuncProj
ON Funcionario.idFuncionario = FuncProj.fkFuncionario
group by fkProjeto;

-- Exibir o menor e o maior salário da empresa.
SELECT fkProjeto as "Empresa",
MAX(salario) as "Maior salário",
MIN(Salario) as 'Menor salário'
FROM Funcionario
INNER JOIN FuncProj as fj
on Funcionario.idFuncionario = fj.fkFuncionario
GROUP BY fkProjeto;

-- Exibir o idDepto, o salário médio 
-- e a soma do salário de cada departamento (agrupado por departamento)

SELECT d.idDepartamento,
ROUND(AVG(Salario),2) as "Média de salário",
SUM(Salario) as "Soma dos salários"
FROM Funcionario
INNER JOIN Departamento as d
ON d.idDepartamento = Funcionario.fkDepartamento
group by fkDepartamento;

--  Exibir o idDepto, o menor e o maior salário de cada departamento (agrupado por departamento).
SELECT d.idDepartamento,
MIN(Salario) as "Menor salário",
MAX(Salario) as "Maior salário"
FROM Funcionario
INNER JOIN Departamento as d
ON d.idDepartamento = Funcionario.fkDepartamento
GROUP BY fkDepartamento;

INSERT INTO Funcionario(idFuncionario,nome,salario,sexo,fkSupervisor,dataNascimento,fkDepartamento) VALUES
(10,'José da Silva',1800,'M',3,'2000-10-12',NULL),
(11,'Benedito Almeida',1200,'M',5,'2001-09-01',NULL);

INSERT INTO Departamento (idDepartamento,nome,fkGerente,dataInicioGer) VALUES
(110,'RH',3,'2018-11-10');


