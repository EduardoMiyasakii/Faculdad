CREATE DATABASE PROJETO;
USE projeto;
CREATE TABLE cadastro (
idcad int primary key auto_increment,
email varchar(100),
senha varchar(100)
);

CREATE TABLE Estoque (
idprod int primary key auto_increment,
qtdS varchar(6),
ultAtt datetime
);

CREATE TABLE dados (
idDados int primary key auto_increment,
temperatura decimal(6,2),
umidade decimal (6,2)
);



