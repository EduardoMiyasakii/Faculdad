
CREATE DATABASE PessoaGasto;
USE PessoaGasto;

CREATE TABLE Pessoa (
idPessoa int primary key auto_increment,
nome varchar(45),
dataNascimento date,
profissao Varchar(45)
);

CREATE TABLE Gasto (
idGasto int primary key auto_increment,
dataGasto date,
valor int,
descricao varchar(45),
fkPessoa int,
CONSTRAINT fkGastoPessoa FOREIGN KEY (fkPessoa)
	REFERENCES Pessoa(idPessoa)
);

INSERT INTO Pessoa VALUES

(default,"Eduardo","2006-06-10","Programador"),
(default,"Gustavo","2005-03-21","Programador"),
(default,"Murillo","2005-07-25","Gerente de TI"),
(default,"Kevelly","2005-05-30","Scrum master");

INSERT INTO Pessoa VALUES
(default,"Mônica","2005-09-01","Project Owner");

INSERT INTO Gasto VALUES
(default,"2025-04-13",1100,"Aluguel do apartamento",1),
(default,"2024-04-12",15,"Energético",2),
(default,"2024-10-12",3000,"Computador",3),
(default,"2024-04-03",0,"Manutenção do computador",4),
(default,"2024-10-12",22,"Milk-moo",5);

-- Exibir os dados de cada tabela individualmente
SELECT * FROM pessoa;

SELECT * FROM Gasto;

-- Exiba somente os dados de cada tabela, mas filtrando por algum dado da tabela 

SELECT * FROM pessoa
	where profissao = "Programador";
    
SELECT * FROM Gasto 	
where descricao like "Aluguel%";

-- Exiba os dados das pessoas e dos seus gastos correspondentes

SELECT * FROM pessoa INNER JOIN Gasto 
ON Pessoa.idPessoa = Gasto.fkPessoa;

-- Exiba os dados de uma determinada pessoa e dos seus gastos correspondentes

SELECT * FROM Pessoa INNER JOIN Gasto
ON Pessoa.idPessoa = Gasto.fkPessoa
	Where idPessoa = 1;
    
-- Atualize valores já inseridos na tabela.

UPDATE Gasto SET Valor = 10000
	where idGasto = 1;
    
    SELECT * FROM Gasto;
    
-- Exclua um ou mais registros de alguma tabela

Delete from Gasto
	where idGasto = 1;
    
    SELECT * FROM Gasto;