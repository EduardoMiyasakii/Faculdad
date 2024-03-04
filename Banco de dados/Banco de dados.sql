-- criar a base de dados

create database sisa;

-- usar a base 
use sisa;
-- criar a tabela
create table aluno (
ra char(8) primary key,
nome varchar(100),
bairro varchar(45)
);

-- descrever o campo da tabela 
describe aluno;

-- inserção de dados
insert into aluno values 
('03241011','Bruno','Boa vista');
insert into aluno values
('03241028','Betina','jardins'),
('03241057','Fabio','Bela vista');
insert into aluno values 
('03241063','Eduardo','Vila virgínia');

-- exibir os dados da tabela
select ra, nome, bairro from aluno; 
select * from aluno;
insert into aluno values
('03241069','Kaua','Vila industrial');
select * from aluno;

-- exibir apenas o nome do aluno bruno
 select nome , bairro from aluno
 where nome = 'betina';
 describe aluno;
 
 -- exibir apenas os aluno onde comeca com a letra b
 select * from aluno
  where nome like 'B%'; 
 select * from aluno
 where nome like 'E%';
  select * from aluno
 where nome = 'eduardo';
 select * from aluno
 where nome = 'bruno';
 
 -- exibir apenas os alunos onde o nome termina com a letra o 
 select * from aluno 
 where nome like '%o';
 
 -- exibir apenas os alunos onde o bairro
 -- contem vis
 select * from aluno
  where bairro like 'vis%';
  
  -- ordenar em ordem crescente
  select * from aluno ; 
  select * from aluno order by nome;
  
  -- ordenar em ordem decrescente 
  select * from aluno order by nome desc;
  
  -- exibir apenas o bairro que a segunda letra é o 
  select * from aluno 
  where bairro like '_o%';
  
  -- exibir apenas o bairro onde a penultima letra é n 
  select * from aluno 
   where bairro like '%N_';
   -- exibir o aluno que começa com a letra b 
   -- e o bairro contem j
   
   select * from aluno 
    where nome like 'b%' and bairro like '%j%';
   
   
 