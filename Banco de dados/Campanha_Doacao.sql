CREATE DATABASE	campanha;
USE campanha;

CREATE TABLE Organizador (
idOrganizador int primary key auto_increment,
nome varchar(45),
endereco varchar(45),
email varchar(45) unique,
fkRepresentante int,
CONSTRAINT fkOrganizadorRepresente FOREIGN KEY(fkRepresentante)
		REFERENCES Organizador(idOrganizador)
)auto_increment = 30;

-- ALTER TABLE organizador
-- ADD COLUMN fkOrientador int,
-- ADD CONSTRAINT fkOrientadorOrganizador
-- FOREIGN KEY (fkOrientador)
-- REFERENCES Organizador(idOrganizador)

CREATE TABLE CampanhaD (
idCampanha int primary key auto_increment,
categoria varchar(45),
instituicao varchar(45),
dataFinal date,
fkOrganizador int,
CONSTRAINT fkCampanhaDOrganizador FOREIGN KEY(fkOrganizador)
	REFERENCES Organizador(idOrganizador)
)auto_increment = 500;

-- ALTER TABLE CAMPANHAD ADD COLUMN fkOrganizador int,
-- ADD CONSTRAINT fkOrganizadorCampanha FOREIGN KEY (FKOrganizador)
-- REFERENCES Organizador(idOrganizador);
 
describe organizador;

INSERT INTO Organizador VALUES
(default,"Eduardo","Rua natal","Eduardo@sptech.com",34);

INSERT INTO Organizador VALUES
(default,"Fernando","Rua natal","Fernando@gmail.com",36),
(default,"Nicolas","Rua Euclides da cunha","Nicolas@outlook.com",36),
(default,"Pedro","Rua velha casa","Pedro@gmail.com",34),
(default,"Cleber","Rua natal","Cleber@outlook.com",34);

-- update Organizador set fkRepresentante =
-- 	where idOrganizador IN (31,32) ;

-- update organizador-
-- set fkorganizador = 33
-- where idOrganizador = 34;


SELECT * FROM Organizador;

INSERT INTO CampanhaD VALUES
(default,"Brinquedo","Ri Happy","2024-04-07",34),
(default,"Roupas","Lacoste","2050-12-30",36),
(default,"Alimentícia","Assaí","1988-07-23",45),
(default,"Sangue","Santa marcelina","2006-06-10",34);

-- UPDATE campanhaD
-- SET fkOrganizador = 30
-- WHERE idCampanha = 500;

SELECT * FROM CampanhaD;

SELECT * FROM Organizador;

--  Exibir os dados dos organizadores e os 
-- dados de suas respectivas campanhas

SELECT * FROM Organizador INNER JOIN CampanhaD
	ON fkOrganizador = idOrganizador;
    
--  Exibir os dados de um determinado organizador
-- (informar o nome do organizador na consulta)
-- e os dados de suas respectivas campanhas.

SELECT * FROM Organizador INNER JOIN CampanhaD
ON fkOrganizador = idOrganizador
where organizador.nome = "Eduardo";

--  Exibir os dados dos organizadores novatos
-- e os dados dos respectivos organizadores orientadores.

SELECT Organizador.nome,
Experiente.nome as "Nome do Experiente" From Organizador
INNER JOIN Organizador AS Experiente
On Organizador.fkRepresentante = Experiente.idOrganizador;

--  Exibir os dados dos organizadores novatos
-- e os dados dos respectivos organizadores orientadores,
-- porém somente de um determinado organizador orientador
-- (informar o nome do organizador orientador na consulta).

SELECT Organizador.nome,
organizador.endereco,
organizador.email,
Experiente.nome AS "Nome do Experiente",
Experiente.endereco AS "Endereço do Experiente",
Experiente.email AS "Email do experiente"
FROM Organizador INNER JOIN Organizador as Experiente
on Experiente.idOrganizador = Organizador.fkRepresentante
		Where Experiente.idOrganizador = 36;
        
-- Exibir os dados dos organizadores novatos,
-- os dados das respectivas campanhas organizadas 
-- e os dados dos respectivos organizadores orientadores.

SELECT novato.nome,
novato.endereco,
novato.email,
CampanhaD.categoria,
CampanhaD.instituicao,
CampanhaD.dataFinal,
Experiente.nome as "Nome do Experiente",
Experiente.endereco AS "Endereco do Experiente",
Experiente.email AS "Email do Experiente"
	FROM Organizador as novato INNER JOIN CampanhaD
    on novato.idOrganizador = campanhaD.fkOrganizador
    INNER JOIN Organizador AS Experiente
    -- errado ON Experiente.fkRepresentante = novato.idOrganizador;
    ON novato.fkRepresentante = experiente.idOrganizador;

--  Exibir os dados de um organizador novato
-- (informar o seu nome na consulta),
-- os dados das respectivas campanhas 
-- em que trabalha e os dados do seu organizador orientador

SELECT Organizador.nome AS "Nome do Novato",
Organizador.endereco AS "Endereco do Novato",
Organizador.email AS "Email do Novato",
CampanhaD.categoria,
CampanhaD.instituicao,
CampanhaD.dataFinal,
Experiente.nome AS "Nome do Experiente",
Experiente.endereco AS "Endereco do Experiente",
Experiente.email AS "Email do Experiente"
FROM Organizador INNER JOIN Organizador AS Experiente INNER JOIN CampanhaD
ON Organizador.idOrganizador = Experiente.fkRepresentante = CampanhaD.fkOrganizador
	WHERE Organizador.nome = "Fernando";
    
    









