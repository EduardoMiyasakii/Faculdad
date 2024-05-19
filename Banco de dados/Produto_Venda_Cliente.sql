CREATE DATABASE ClienteVendaProduto;
USE ClienteVendaProduto;

CREATE TABLE Cliente (
idCliente int primary key auto_increment,
nome VARCHAR(45),
email VARCHAR(45),
Cidade VARCHAR(45),
Cep Char(9),
rua varchar(45),
complemento varchar(45),
fkIndicador int,
Constraint fkClienteIndicador foreign key(fkIndicador)
	references Cliente(idCliente)
);

CREATE TABLE Venda (
idVenda int primary key auto_increment,
totalVenda varchar(45),
dataVenda varchar(45),
fkCliente int,
Constraint FkClienteVenda FOREIGN KEY (fkCliente)
	References Cliente(idCliente)
);

alter table venda modify column TotalVenda Decimal(6,2);
ALTER TABLE Venda modify column DataVenda datetime default current_timestamp;

CREATE TABLE Produto (
idProduto int primary key auto_increment,
nome VARCHAR(45),
Descricao VARCHAR(45),
Preco varchar(45)
);

CREATE TABLE ProdutoVenda(
fkProduto int,
fkVenda int,
FOREIGN KEY(fkProduto)
References produto(idProduto),
FOREIGN KEY (fkVenda)
REFERENCES Venda(idVenda),
Primary Key(fkProduto,fkVenda),
QtndProduto int,
valorProduto int
);
ALTER TABLE ProdutoVenda rename COLUMN valorProduto to DescProduto;
ALTER TABLE ProdutoVenda MODIFY COLUMN descProduto decimal(5,2) default 1.00;


insert into cliente (idCliente,nome,email,Cidade,Cep,rua,complemento,fkIndicador)values 
(default, 'Fernando', 'Fernando@email.com','Itaquaquecetuba', '12345678', 'Rua A', 'Apto 111', null),
(default, 'Kleber', 'Kleber@email.com','Poa', '87654321', 'Rua B', 'Casa 2', 1),
(default, 'Pedro', 'pedro@email.com','Mogi das cruzes', '98765432', 'Rua C', 'Bloco D', 1);

insert into venda values
(default,'160.00',default,1),
(default,'350.00',default,1),
(default,'60.00',default,2),
(default,'200.00',default,3);


insert into produto values
(default, "Garrafa D'gua", 'Beber água', 20.00),
(default, 'Fones de ouvido', 'Conexão via Bluetooth', 300.00),
(default, 'Meias', 'Com desenhos do Patrulha canina', 50.00);

-- fkVenda, fkProduto, qtdProduto,ValorProduto
insert into ProdutoVenda values
(2,3,1,50.00), 
(1,1,3,20.00),
(1,2,4,20.00), 
(3,2,3,300.00);

-- exibir os dados dos clientes e os dados de suas respectivas vendas

SELECT * from Cliente INNER JOIN
Venda on idCliente = fkCliente; 

--  Exibir os dados de um determinado cliente (informar o nome do cliente na consulta) 
-- e os dados de suas respectivas vendas

SELECT * from Cliente INNER JOIN
Venda on idCliente = fkCliente
where Cliente.nome = "Fernando";

 -- Exibir os dados dos clientes e de suas respectivas indicações de clientes
 
 SELECT * FROM Cliente as Indicador
 INNER JOIN Cliente  
 on Indicador.fkIndicador = Cliente.idCliente;
 
 --  Exibir os dados dos clientes indicados e os dados dos respectivos clientes 
-- indicadores, porém somente de um determinado cliente indicador (informar o nome 
-- do cliente que indicou na consulta

SELECT * FROM Cliente as Indicador
 INNER JOIN Cliente  
 on Indicador.fkIndicador = Cliente.idCliente
 where Indicador.nome = "Kleber";
 
 --  Exibir os dados dos clientes, os dados dos respectivos clientes que indicaram, os 
-- dados das respectivas vendas e dos produtos

SELECT * FROM Cliente 
INNER JOIN Cliente as Indicado
on Cliente.fkIndicador = Indicado.idCliente
INNER JOIN Venda
ON Cliente.idCliente = Venda.fkCliente
INNER JOIN ProdutoVenda
ON ProdutoVenda.fkVenda = Venda.idVenda;

-- Exibir apenas a data da venda, o nome do produto e a quantidade do produto 
-- numa determinada venda.

SELECT Venda.dataVenda,
Produto.nome,
ProdutoVenda.QtndProduto
FROM Venda
INNER JOIN ProdutoVenda
on Venda.idVenda = ProdutoVenda.fkVenda
INNER JOIN Produto 
ON produto.idProduto = ProdutoVenda.fkProduto;

-- Exibir apenas o nome do produto, o valor do produto e a soma da quantidade de 
-- produtos vendidos agrupados pelo nome do produto

SELECT Produto.nome,
Produto.preco,
CONCAT("A quantidade de produtos vendidos foi ", ProdutoVenda.QtndProduto , " e o produto vendido foi ",Produto.nome) as "Produto vendido"	
FROM Produto 
INNER JOIN ProdutoVenda
ON Produto.idProduto = ProdutoVenda.fkProduto;

-- Inserir dados de um novo cliente. Exibir os dados dos clientes, das respectivas 
-- vendas, e os clientes que não realizaram nenhuma venda.

insert into Cliente (nome,email,Cidade,Cep,rua,complemento,fkIndicador)values 
("Juninho","JuninhoGameplays@gmail.com","Guarulhos","08573123","Rua maria dos altos","Casa 340",2);

SELECT * FROM Cliente 
LEFT JOIN Venda
on Cliente.idCliente = Venda.fkCliente;

--  Exibir o valor mínimo e o valor máximo dos preços dos produtos
SELECT MIN(Preco),
MAX(Preco)
from Produto;

-- Exibir a soma e a média dos preços dos produtos
SELECT avg(Preco) as "Média dos preços",
SUM(Preco) as "Soma dos preços"
 from Produto;
 
-- Exibir a quantidade de preços acima da média entre todos os produtos

-- Exibir a soma dos preços distintos dos produtos

-- Exibir a soma dos preços dos produtos agrupado por uma determinada venda
SELECT sum(Produto.Preco) as "Preco Total"
FROM Produto
INNER JOIN ProdutoVenda 
ON Produto.idProduto = ProdutoVenda.fkProduto
INNER JOIN Venda 
ON Venda.idVenda = ProdutoVenda.fkVenda
where idVenda = "1";

-- Funções matemáticas
-- Count: quantifica o total de linha com valores
SELECT count(*) from ProdutoVenda;
SELECT count(totalVenda) from Venda;

-- O produto mais caro
SELECT MAX(preco) FROM Produto;

-- O Produto mais barato
SELECT min(preco) from Produto;

SELECT nome,preco FROM Produto
	WHERE preco = (select min(preco) from produto);
    
--
SELECT * FROM Produto;
INSERT INTO Produto VALUES
(default,"Creme","Creme de cabelo",2.99);

INSERT INTO Produto VALUES
(default,"Chocolate","chocolte",20.00);

-- TIRA OS valores Duplicados

SELECT distinct preco FROM Produto;

-- Soma

SELECT Sum(Preco) FROM Produto;
SELECT CONCAT('R$',SUM(preco)) AS Soma
FROM Produto;

-- Média
SELECT avg(Preco) FROM Produto;
SELECT round(avg(Preco),2) from Produto;

INSERT INTO Produto VALUES
(default,"Desodorante","Limpeza das axilas",1.25);

-- GROUP BY

SELECT fkVenda,
sum(Preco) as "Total da venda"
 FROM PRODUTO
 JOIN ProdutoVenda 
 on idProduto = fkProduto
 GROUP BY fkVenda;


