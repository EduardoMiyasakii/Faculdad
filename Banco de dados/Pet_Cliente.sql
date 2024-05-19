CREATE DATABASE PetCliente;
USE PetCliente;

CREATE TABLE Cliente (
idCliente int primary key auto_increment,
nome VARCHAR(45),
sobrenome VARCHAR(45),
TelefoneFixo VARCHAR(15),
TelefoneCelular VARCHAR(20),
cep CHAR(9),
rua VARCHAR(45),
complemento VARCHAR(45)
);

CREATE TABLE Pet (
idPet int primary key auto_increment,
nome VARCHAR(45),
tipo VARCHAR(45),
raça VARCHAR(45),
dataNascimento date,
fkCliente int,
CONSTRAINT fkPetCliente FOREIGN KEY(fkCliente)
	REFERENCES Cliente(idCliente)
)auto_increment = 101;

INSERT INTO Cliente VALUES
(default,"Eduardo","Miyasaki","4642-4122","94115-9059","08573-150","Rua natal","Casa"),
(default,"Gustavo","Cardoso","4902-2102","97682-6423","02312-213","Rua pinheiros","Apartamento"),
(default,"Murillo","Lanes","4647-4922","97349-1878","01234-222","Rua palmeiras","Condomínio"),
(default,"Kevelly","Mendes","4623-2103","99463-7199","07671-237","Rua nova esperança","Casa"),
(default,"Mônica","Leanmari","4632-4839","94067-6737","02367-213","Rua tiradentes","Apartamento"),
(default,"Julia","Cardoso","4393-9012","94118-5028","07532-178","Rua são pedro","Apartamento");

INSERT INTO Pet VALUES
(default,"Dora","Cachorro","vira-lata","2013-09-22",1),
(default,"Wiggle","Cachorro","yorkshire","2017-03-10",1),
(default,"Amora","Gato","Siâmes","2015-09-26",2),
(default,"Jujuba","Gato","Siamês","2017-03-21",3),
(default,"Tigrinho","Tigre","Tigre-Siberiano","2022-10-11",5),
(default,"Tutuba","Tubarão","Tubarão-branco","2024-04-13",6);

SELECT * FROM Cliente;

SELECT * FROM Pet;

-- altere o tamanho da coluna nome do cliente

ALTER TABLE Cliente MODIFY COLUMN nome VARCHAR(30);
DESCRIBE Cliente;

-- Exibir os dados de todos os pets que são de um determinado tipo
SELECT * FROM Pet
	where tipo = "gato";
    
-- - Exibir apenas os nomes e as datas de nascimento dos pets

SELECT nome,dataNascimento from pet;

--  Exibir os dados dos pets ordenados em ordem crescente pelo nome

SELECT * from pet
	order by nome;
    
-- Exibir os dados dos clientes ordenados em ordem decrescente pelo bairro.

SELECT * FROM Cliente order by rua desc;

--  Exibir os dados dos pets cujo nome comece com uma determinada letra.

SELECT * from Pet
	where nome like "T%";
    
-- Exibir os dados dos clientes que têm o mesmo sobrenome.
	SELECT * FROM cliente
		where Sobrenome = "Cardoso";
        
--  Alterar o telefone de um determinado cliente.
UPDATE Cliente SET TelefoneCelular = "99940-2761"
	where idCliente = 1;
    
--  Exibir os dados dos clientes para verificar se alterou.
SELECT * FROM Cliente;

--  Exibir os dados dos pets e dos seus respectivos donos

SELECT * from Pet INNER JOIN Cliente
on fkCliente = idCliente;

-- Exibir os dados dos pets e dos seus respectivos donos, mas somente de um 
-- determinado cliente

SELECT * FROM Pet INNER JOIN Cliente 
on fkCliente = idCliente
where Cliente.nome = "Eduardo";

-- Excluir algum pet

delete from pet
	where idPet = 106;
    
-- Exibir os dados dos pets para verificar se excluiu

SELECT * FROM pet;

-- Excluir as tabelas 

DROP TABLE Pet;
DROP TABLE Cliente;
