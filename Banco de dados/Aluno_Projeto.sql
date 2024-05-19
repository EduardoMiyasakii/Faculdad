CREATE DATABASE alunoProjeto;
USE alunoProjeto;

CREATE TABLE Projeto (
idProjeto int primary key auto_increment,
nome varchar (45),
descricao varchar(45)
);

CREATE TABLE Aluno (
raAluno char(8) primary key,
nome varchar(45),
telefone varchar(15),

fkRepresentante char(8),
fkProjeto int,
constraint fkALunoRepresentante foreign key(FkRepresentante)
	references Aluno(raAluno),
constraint fkAlunoProjeto FOREIGN KEY (fkProjeto)
	references Projeto(idProjeto)
);

SELECT * FROM ALUNO;

INSERT INTO Projeto VALUES 
(default,"AMW","Monitoramento de museus e galerias"),
(default,"Freezeway","Monitoramento de transporte de carne"),
(default,"ChoControl"," Controle de temperatura em chocolates"),
(default,"SensorGuys","Monitoramento de café");

-- colocar NULL quando for representante
-- no exemplo abaixo o Gustavo

INSERT INTO Aluno VALUES
(12345678,"Gustavo","97682-6423",12345678,1),
(21345678,"Murillo","97349-1878",12345678,2),
(32145678,"Mônica","94067-6737",12345678,3),
(43215678,"Kevelly","99463-7199",12345678,4);

SELECT * FROM Projeto;
SELECT * FROM Aluno;
	
-- Exibir os dados dos alunos e dos projetos correspondentes.
 SELECT * FROM Aluno INNER JOIN projeto ON idProjeto = fkProjeto;
 
 -- Exibir os dados dos alunos e dos seus representantes.
 select aluno.nome as Aluno,
 representante.nome as "Nome do representante"
 FROM Aluno  INNER JOIN Aluno as representante
ON aluno.fkRepresentante = representante.raAluno;
 
 --  Exibir os dados dos alunos e dos projetos 
 -- correspondentes, mas somente de um determinado projeto 
 -- (indicar o nome do projeto na consulta).
 
 select aluno.nome as Aluno,
 projeto.nome as NomeProjeto
 from aluno INNER JOIN Projeto
 on fkProjeto = idProjeto
 where projeto.nome = "Freezeway"
 ;
 


 
        

	
