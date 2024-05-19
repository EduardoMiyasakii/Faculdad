CREATE DATABASE AlunoProfessorGrupo;
USE AlunoProfessorGrupo;

CREATE TABLE Professor(
idProfessor int primary key auto_increment,
nome VARCHAR(45),
disciplina VARCHAR(45)
)auto_increment = 10000;

CREATE TABLE Grupo(
idGrupo int primary key auto_increment,
nome VARCHAR(45),
descricao VARCHAR(156)
);

CREATE TABLE Aluno(
raAluno CHAR(8),
nome VARCHAR(45),
email VARCHAR(256),
fkGrupo int,
CONSTRAINT fkAlunoGrupo FOREIGN KEY(fkGrupo)
	REFERENCES Grupo(idGrupo)
);

CREATE TABLE ProfessorGrupo (
fkProfessor int,
fkGrupo int,
CONSTRAINT fkProfessorGrupo FOREIGN KEY(fkProfessor)
	REFERENCES Professor(idProfessor),
CONSTRAINT fkGrupoProfessor FOREIGN KEY(fkGrupo)
	REFERENCES Grupo(idGrupo),
CONSTRAINT pkComposta PRIMARY KEY(fkProfessor,fkGrupo),
dataAvaliacao datetime default current_timestamp,
nota DECIMAL(3,1)
);

INSERT INTO Professor (nome,disciplina) VALUES
('Marcos','Matemática'),
('Daniely','Física'),
('Lucas','Filosofia');

INSERT INTO Grupo (nome,descricao) VALUES
('Exatas','Grupo de estudos para matemática'),
('Humanas','Grupo de estudos para redação');

INSERT INTO Aluno (raAluno,nome,email,fkGrupo) VALUES
('03241063','Eduardo','Eduardomiyasaki@gmail.com',1),
('03241062','Murilo','murilo@gmail.com',2),
('03241061','Maria clara','Maria@gmail.com',1);

INSERT INTO ProfessorGrupo (fkProfessor,fkGrupo,nota) VALUES
(10000,1,10.0),
(10001,1,10.0),
(10002,2,7.5);

SELECT * FROM Professor;
SELECT * FROM Grupo;
SELECT * FROM Aluno;
SELECT * FROM ProfessorGrupo;

-- Exibir os dados dos grupos e os dados de seus respectivos alunos

SELECT * FROM Grupo
INNER JOIN Aluno
ON idGrupo = fkGrupo;

-- Exibir os dados de um determinado grupo e os dados de seus respectivos alunos

SELECT * FROM Grupo
INNER JOIN Aluno
ON idGrupo = fkGrupo
Where Grupo.nome = "Exatas";

-- Exibir a média das nota atríbuidas ao grupo

SELECT avg(nota) as "Nota média"
FROM ProfessorGrupo;

-- Exibir a nota mínima e a nota máxima 

SELECT MIN(nota) AS "Menor nota",
MAX(nota)AS "Maior Nota"
FROM ProfessorGrupo;

-- Exibir a soma das notas dadas aos grupos
SELECT Sum(nota) as "Soma das notas"
FROM ProfessorGrupo
group by fkGrupo;

-- Exibir, os dados dos professores que avaliaram cada grupo,os dados dos grupos,
-- a data e o horario da avaliacao

SELECT Professor.nome as "Nome do Professor",
Professor.disciplina,
Grupo.nome as "Nome do grupo",
Grupo.Descricao,
PG.dataAvaliacao as "Data da avaliacão",
PG.nota
FROM Professor
INNER JOIN ProfessorGrupo as PG
ON Professor.idProfessor = PG.fkProfessor
INNER JOIN Grupo 
ON Grupo.idGrupo = PG.fkGrupo;

-- Exibir, os dados dos professores que avaliaram um determinado grupo,os dados dos grupos,
-- a data e o horario da avaliacao

SELECT Professor.nome as "Nome do Professor",
Professor.disciplina,
Grupo.nome as "Nome do grupo",
Grupo.Descricao,
PG.dataAvaliacao as "Data da avaliacão",
PG.nota
FROM Professor
INNER JOIN ProfessorGrupo as PG
ON Professor.idProfessor = PG.fkProfessor
INNER JOIN Grupo 
ON Grupo.idGrupo = PG.fkGrupo
Where Grupo.idGrupo = "1";

-- Exibir os nomes dos grupos que foram avaliados por um determinado professor
SELECT Grupo.nome as "Nome do grupo",
Professor.nome as "Nome do profesor"
FROM Professor 
INNER JOIN ProfessorGrupo as PG
ON Professor.idProfessor = PG.fkProfessor
INNER JOIN Grupo
ON Grupo.idGrupo = PG.fkGrupo
WHERE Professor.nome = "Marcos";

-- Exibir os dados dos grupos,os dados dos alunos correspondentes,os 
-- dados dos professores,a data e o horário

SELECT Grupo.nome AS "Nome do grupo",
Grupo.descricao AS "Descrição do grupo",
Aluno.Nome as "Nome do aluno",
Aluno.email,
Professor.nome as "Nome do professor",
Professor.disciplina,
ProfessorGrupo.dataAvaliacao,
ProfessorGrupo.nota
FROM Professor
INNER JOIN ProfessorGrupo
ON Professor.idProfessor = ProfessorGrupo.fkProfessor
INNER JOIN Grupo 
ON Grupo.idGrupo = ProfessorGrupo.fkGrupo
INNER JOIN Aluno
ON Grupo.idGrupo = Aluno.fkGrupo;

-- Exibir as notas distintas
SELECT DISTINCT nota FROM ProfessorGrupo;

-- Exibir a identificação do professor,a média das notas 
-- e a soma das notas atribuidas,agrupadas por professor

SELECT Professor.Nome as "Nome do professor",
ROUND(AVG(Nota),2) as "Média das notas",
SUM(nota) as "Soma das notas"
FROM Professor
INNER JOIN ProfessorGrupo
ON Professor.idProfessor = ProfessorGrupo.fkProfessor
GROUP BY fkProfessor;

-- Exibir a identificação do grupo,a média das notas 
-- e a soma das notas atribuidas,agrupadas por grupo

SELECT Grupo.nome as "Nome do grupo",
ROUND(AVG(Nota),2) as "Média das notas",
SUM(nota) as "Soma das notas"
FROM Grupo
INNER JOIN ProfessorGrupo
ON Grupo.idGrupo = ProfessorGrupo.fkGrupo
GROUP BY fkGrupo;

-- Exibir a identificação do professor,a menor nota
-- e a maior nota atribuidas,agrupadas por professor

SELECT Professor.nome as "Nome do professor",
MIN(nota) as "Menor nota",
MAX(nota) as "Maior nota"
FROM Professor
INNER JOIN ProfessorGrupo
ON Professor.idProfessor = ProfessorGrupo.fkProfessor
GROUP BY FkProfessor;

-- Exibir a identificação do grupo,a menor das notas 
-- e a maior das notas atribuidas,agrupadas por grupo

SELECT Grupo.nome as "Nome do grupo",
MIN(nota) AS "Menor nota",
MAX(nota) AS "Maior nota"
FROM Grupo
INNER JOIN ProfessorGrupo as PG
ON Grupo.idGrupo = PG.fkGrupo
GROUP BY fkGrupo;

