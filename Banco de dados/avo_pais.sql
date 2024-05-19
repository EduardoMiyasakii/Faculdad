CREATE DATABASE familia;

USE familia;

CREATE TABLE avos (
id_avos int primary key auto_increment,
nome varchar(45),
idade int,
dataNascimento date
);

CREATE TABLE pais (
id_pais int primary key auto_increment,
Nome varchar(45),
idade int,
data_nascimentoPais date ,
fkPais int,
constraint fkPaisAvos FOREIGN KEY(fkPais)
references avos (id_avos)
);

CREATE TABLE filho (
id_filho int primary key auto_increment,
nome varchar(40),
idade int,
data_nascimentoFilho date,
fkFilho int,
constraint fkPaisAvosFilhos FOREIGN KEY (fkFilho)
references pais(id_pais)
);

INSERT INTO avos VALUES 
(default,"Celia",72,"1952-02-29"),
(default,"Frizza",85,"1939-09-01"),
(default,"Julia",90,"1934-01-21"),
(default,"Eliso sanches",87,"1937-01-21");

INSERT INTO pais VALUES 
(default,"faria",22,"2002-01-12",default),
(default,"Ana Julia",17,"2006-04-28",default),
(default,"Mõnica",18,"2005-09-28",default),
(default,"Pedro",18,"2006-04-08",default);

select * from pais;

INSERT INTO filhos VALUES 
(default,"Cardoso",17,"2005-03-21",default),
(default,"Cardoso",17,"2005-03-21",default,);


