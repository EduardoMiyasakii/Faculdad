CREATE DATABASE aula4;
USE aula4;



CREATE TABLE funcionario (
id int primary key auto_increment,
nome varchar(40) not null,
salario decimal(6,2) default 1.99,
dtatual datetime default current_timestamp
) auto_increment = 100;

-- not null = campo não pode ser nulo
-- default = padrão,se nulo inserir padrão
-- unique = um campo que não pode se repetir
-- concat() = 
-- alias = apelidar a coluna
-- current_timestamp = vai o dia que voce inseriu

-- números decimais 
-- float - 7 dígitos
-- double - 15 dígitos
-- decimal() - 32 dígitos
-- decimal(4,2) 12,34

ALTER TABLE funcionario ADD COLUMN cpf char(11) unique ;

DESCRIBE funcionario;

INSERT INTO funcionario VALUES
(default,"Jesse",100.00,default, "01234567899");

INSERT INTO funcionario (nome) Values
("Walter");

-- fomrmatando uma data 
SELECT date_format(dtAtual, "%d/%m/%y  %h:%m:%s:%ms")
from funcionario;

SELECT concat(nome, "" ,salario)
 FROM funcionario;
 
 SELECT concat("O salário do ",nome, " é R$ " ,salario)
from funcionario;

SELECT (SALARIO)FROM FUNCIONARIO;
SELECT SALARIO AS SALÁRIO FROM FUNCIONARIO;

Select nome AS "Nome do funcionário",
concat("R$",salario)AS Salário
 FROM FUNCIONARIO;
 
INSERT INTO funcionario (nome) VALUES
("douglas");

select * from funcionario;

truncate table funcionario;

describe funcionario;

INSERT INTO funcionario(nome) VALUES
('Danilo');

ALTER TABLE funcionario auto_increment = 100;

INSERT INTO funcionario (nome) Values 
("Diley");

delete from funcionario 
where id = 1;

select * from funcionario;
select * from funcionario
 where nome = 'Xuxa';
 

 
 