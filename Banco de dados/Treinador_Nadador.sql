CREATE DATABASE NadadorTreinador;
USE NadadorTreinador;

CREATE TABLE Treinador (
idTreinador int primary key auto_increment,
nome VARCHAR(45),
TelefoneCelular VARCHAR(15),
email varchar(45),
fkExperiente int,
CONSTRAINT fkExperienteTreinador FOREIGN KEY (fkExperiente)
	REFERENCES Treinador(idTreinador)
)auto_increment = 10;

CREATE TABLE Nadador (
idNadador int primary key auto_increment,
nome varchar(45),
estadoOrigem varchar(45),
dataNascimento date,
fkTreinador int,
CONSTRAINT fkNadadorTreinador FOREIGN KEY (fkTreinador)
	REFERENCES Treinador(idTreinador)
)auto_increment = 100;

INSERT INTO Treinador(Nome,TelefoneCelular,email,fkExperiente) VALUES
("Antônio Oliveira","99321-2193","antonio@gmail.com",NULL),
("Guardiola","93212-3212","GuardiolaTikataka@outlook.com",NULL),
("Tite","93230-3212","Adenor@gmail.com",10),
("Arteta","97321-2121","ArtetaGuardiola@gmai.com",11),
("Kloop","93221-2101","KloopLiverpool@outlook.com",NULL);

INSERT INTO Nadador(Nome,EstadoOrigem,dataNascimento,fkTreinador) VALUES
("Michael Phelps","Estados unidos","1987-12-21",11),
("Aleksander popov","Rússia","1980-09-30",12),
("Mark spitz","Estados unidos","1977-01-06",13),
("Ryan lotche","Estados unidos","1984-08-03",14),
("Jenny Thompson","Estados Unidos","1988-12-21",10);

UPDATE Nadador SET fkTreinador = 11
	where idNadador = 111;
    
update Treinador set fkExperiente = 11
	where idTreinador = 10;
    
-- Exibir os dados de cada tabela Separadamente
    SELECT * FROM Treinador;
    
    SELECT * FROM Nadador;
    
    -- Exibir os dados dos treinadores e os dados de seus respectivos nadadores
SELECT Treinador.nome as "Nome do Treinador",
Treinador.TelefoneCelular,
Treinador.email as "Email do treinador",
Nadador.nome as "Nome do nadador",
Nadador.estadoOrigem,
Nadador.dataNascimento as "Data de nascimento do nadador"
from Treinador INNER JOIN Nadador 
on Treinador.idTreinador = Nadador.fkTreinador;

--  Exibir os dados de um determinado treinador (informar o nome do treinador na consulta) 
-- e os dados de seus respectivos nadadores.

SELECT Treinador.nome as "Nome do Treinador",
Treinador.TelefoneCelular,
Treinador.email as "Email do treinador",
Nadador.nome as "Nome do nadador",
Nadador.estadoOrigem,
Nadador.dataNascimento as "Data de nascimento do nadador"
from Treinador INNER JOIN Nadador 
on Treinador.idTreinador = Nadador.fkTreinador
where Treinador.nome = "Kloop";

--  Exibir os dados dos treinadores e os dados dos respectivos treinadores orientadores.

SELECT Treinador.nome as "Nome do Experiente",
Treinador.TelefoneCelular as "Telefone do Experiente",
Treinador.email as "Email do Experiente",
Experiente.nome as "Nome do Treinador",
Experiente.TelefoneCelular as "Telefone do Treinador",
Experiente.email as "Email do Treinador"
FROM Treinador INNER JOIN Treinador as Experiente
ON Experiente.fkExperiente = Treinador.idTreinador;

-- exibir os dados dos treinadores e os dados dos respectivos treinadores
-- orientadores, porém somente de um determinado treinador orientador (informar o 
-- nome do treinador na consulta).

SELECT Treinador.nome as "Nome do Experiente",
Treinador.TelefoneCelular as "Telefone do Experiente",
Treinador.email as "Email do Experiente",
Experiente.nome as "Nome do Treinador",
Experiente.TelefoneCelular as "Telefone do Treinador",
Experiente.email as "Email do Treinador"
FROM Treinador INNER JOIN Treinador as Experiente
ON Experiente.fkExperiente = Treinador.idTreinador
where Treinador.idTreinador = 11;

-- l) Exibir os dados dos treinadores, os dados dos respectivos nadadores e os dados 
-- dos respectivos treinadores orientadores

SELECT Nadador.nome as "Nome do nadador",
Nadador.estadoOrigem,
Nadador.dataNascimento as "Data de nascimento do nadador",
Treinador.nome as "Nome do Experiente",
Treinador.TelefoneCelular as "Telefone do Experiente",
Treinador.email as "Email do Experiente",
Experiente.nome as "Nome do Treinador",
Experiente.TelefoneCelular as "Telefone do Treinador",
Experiente.email as "Email do Treinador"
FROM Treinador INNER JOIN Nadador
ON Treinador.idTreinador = Nadador.fkTreinador
INNER JOIN Treinador as Experiente
ON Experiente.fkExperiente = Treinador.idTreinador;

--  Exibir os dados de um treinador (informar o seu nome na consulta), os dados dos 
-- respectivos nadadores e os dados do seu treinador orientador.

SELECT Nadador.nome as "Nome do nadador",
Nadador.estadoOrigem,
Nadador.dataNascimento as "Data de nascimento do nadador",
Treinador.nome as "Nome do Experiente",
Treinador.TelefoneCelular as "Telefone do Experiente",
Treinador.email as "Email do Experiente",
Experiente.nome as "Nome do Treinador",
Experiente.TelefoneCelular as "Telefone do Treinador",
Experiente.email as "Email do Treinador"
FROM Treinador INNER JOIN Nadador
ON Treinador.idTreinador = Nadador.fkTreinador
INNER JOIN Treinador as Experiente
ON Experiente.fkExperiente = Treinador.idTreinador
Where Treinador.nome = "Guardiola";


