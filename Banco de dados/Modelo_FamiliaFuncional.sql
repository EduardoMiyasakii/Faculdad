CREATE DATABASE familia;

USE familia;

CREATE TABLE pessoa (
idPessoa int primary key auto_increment,
nome varchar(45),
dtNasc date,
fkMae int, -- minha mãe tbm é uma pessoa (idPessoa)
fkPai int, -- meu pai tbm é uma pessoa
constraint fkFilhoMae foreign key (fkMae)
	references pessoa(idPessoa),
constraint fkFilhoPai foreign key (fkPai)
	references pessoa(idPessoa));

INSERT INTO pessoa (nome, dtNasc) VALUES
	('Vivian', '1983-10-13'),
    ('Elisabete', '1957-05-05'),
    ('Jadir', '1954-10-10');
    
SELECT * FROM pessoa;

UPDATE pessoa SET fkMae = 2, fkPai = 3
	WHERE idPessoa = 1;
    
-- meu nome, nome da minha mãe e o nome do meu pai
SELECT filho.nome as NomeFilho,
	mae.nome as NomeMae,
    pai.nome as NomePai
    FROM pessoa as filho
		JOIN pessoa as mae
		ON filho.fkMae = mae.idPessoa
        JOIN pessoa as pai
        ON filho.fkPai = pai.IdPessoa;


INSERT INTO pessoa (nome) VALUES
	('Orlando'),
    ('Elizabeth'),
    ('Neli'),
    ('João Carlos');
    
SELECT * FROM pessoa;

UPDATE pessoa SET fkMae = 5, fkPai = 4
	WHERE idPessoa = 3;

UPDATE pessoa SET fkMae = 6, fkPai = 7
WHERE idPessoa = 2;

SELECT * FROM pessoa;

SELECT filho.nome as NomeFilho,
	mae.nome as NomeMae,
    pai.nome as NomePai,
    vóMaterna.nome as NomeAvóMaterna,
    vôMaterno.nome as NomeAvôMaterno,
    vóPaterna.nome as NomeAvóPaterna,
    vôPaterno.nome as NomeAvôPaterno
    FROM pessoa as filho
		JOIN pessoa as mae
        ON filho.fkMae = mae.idPessoa
        JOIN pessoa as pai
        ON filho.fkPai = pai.idPessoa
        JOIN pessoa as vóMaterna
        ON mae.fkMae = vóMaterna.idPessoa
        JOIN pessoa as vôMaterno
        ON mae.fkPai = vôMaterno.idPessoa
        JOIN pessoa as vóPaterna
        ON pai.fkMae = vóPaterna.idPessoa
        JOIN pessoa as vôPaterno
        ON pai.fkPai = vôPaterno.idPessoa;


