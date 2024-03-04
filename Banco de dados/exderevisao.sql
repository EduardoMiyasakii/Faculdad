Create database revisao;

use revisao;

Create table produto (
 idProduto int primary key auto_increment,
 nome varchar(40),
 categoria varchar(40),
 validade date,
 codigoBarras char(13),
 qtd int
);

describe produto;

insert into produto values
(default,'Garrafa de água','alimentício','2024-08-27','1234567890123',40);

insert into produto values
(Null, 'Carregador USB-C' ,'Eletrônicos',Null,'1234567890124',20);

insert into produto values
(default,'Camisa Polo','vestuário',Null,'1234567890125',10),
(default,'Detergente','limpeza','2030-02-27','1234567890126',20);

insert into produto (nome,categoria,validade,codigoBarras,qtd) values
('Miojo','alimentício','2026-02-27','1234567890127',10);

insert into produto (nome,categoria,validade,codigoBarras) values
('maçã','alimentício','2024-06-27','1234567890128');

-- primeira letra com c
select * from produto 
	where nome like 'C%';

-- ultimas letras lo
select * from produto 
	where nome like '%lo';

-- qualquer lugar
select * from produto
	where nome like '%ar%';

-- começa com m e termine com a
select * from produto
	where nome like 'm%a';
  
-- achar o i na segunda letra do nome
 select * from produto 	
	where nome like '_i%';
    
-- l na penúltima letra
 select * from produto
	where nome like '%L_';
    
-- adicionar a coluna empresa
 alter table produto
	add column Empresa varchar(40);

-- modificar a tabela
alter table produto
modify column empresa varchar(50);

-- renomear coluna
alter table produto
 rename column empresa to Marca;
 
update produto set Marca = 'Minalba'
	where idProduto = 1;
    
update produto set Marca = 'Fazenda', qtd = 5
	where idProduto =2;

update produto set qtd = 30
	where idProduto in(3, 4);
    
-- update produto set qtd = 30
	-- where idProduto Between 1 and 3;
    
-- deletar a coluna marca
alter table produto drop column marca;

alter table produto add constraint chkCategoria
   check (categoria in ('Alimentício','eletrônicos','vestuário','limpeza'));
   
alter table produto drop constraint chkCategoria;

alter table produto add constraint chkCategoria
   check (categoria in ('Alimentício','eletrônicos','vestuário','limpeza','material escolar'));
   
insert into produto (nome,categoria) values
('estojo','material escolar');

delete from produto 	
	where idProduto = 8;

truncate table produto;

drop database revisao;

   