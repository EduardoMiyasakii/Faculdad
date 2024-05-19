CREATE DATABASE pet;
USE Pet;

CREATE TABLE dono(
idDono int primary key auto_increment,
Nome varchar(45),
Idade int
);

CREATE TABLE Pets (
idPet int primary key auto_increment,
Nome varchar(45),
Idade int,
fkMae int,
fkDono int,
CONSTRAINT fkMaePet FOREIGN KEY (fkMae)
	REFERENCES Pets(idPet),
CONSTRAINT fkDonoPet FOREIGN KEY (fkDono)
	REFERENCES Dono(idDono)
);

INSERT INTO Dono VALUES
(default,"Eduardo",18),
(default,"Fernando",13),
(default,"Rafael",25);

INSERT INTO Pets VALUES
(default,"Dora",7,1,1),
(default,"Wiggle",5,1,2),
(default,"Nonato",9,1,3);

SELECT dono.nome AS "Nome do dono",
dono.idade AS "Idade do dono",
pets.nome AS "Nome do pet",
pets.idade AS "Idade do pet",
mae.nome AS "Nome da mãe"
FROM Pets INNER JOIN dono INNER JOIN pets AS mae
on dono.idDono = mae.fkMae = pets.fkDono;

