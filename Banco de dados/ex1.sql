-- criar a base de dados
Create database Sprint1;

-- usar a base de dados
Use sprint1;

-- criar a tabela
create table atleta (
idAtleta int primary key,
nome varchar(40),
modalidade varchar(40),
qtdMedalha int 
);

-- colocar dados na tabela
insert into atleta values
 ('864803','Alex','futebol','3'),
('106640','Gustavo','Handebol','0'),
 ('656337','Heloisa','Volêi','3'),
 ('242990','Pablo','futebol','1'),
 ('013449','Pedro','basquete','2'),
 ('760172','Murilo','tênis','1'),
 ('715559','Nicolas','futebol','1');
 
 insert into atleta values 
('675821','Eduardo','basquete','2'),
('423159','fernando','handebol','4'),
('948193','vinicius','volêi','5'),
('073425','guilherme','tênis','1');

-- mostrar os dados da tabela
select * from atleta ;

-- mostrar somente o nome e quantidade de medalha
select nome, qtdMedalha from atleta ; 

-- exibir somente os dados de uma modalidade
select * from atleta 
where modalidade = 'basquete' ; 

-- exibir os dados ordenados pela modalidade
select * from atleta order by modalidade ; 

-- exibir os dados da tabela 
-- ordenados pela ordem de medalhda descrescente
select * from atleta order by qtdMedalha desc;

-- exibir os dados da tabela
-- cujo nome tenha letra g
select * from atleta
where nome like '%g%';

-- exibir os dados da tabela 
-- cujo nome comece com e
select * from atleta 
where nome like 'e%';

-- exibir os dados da tabela cujo 
-- nome termine com o
select * from atleta 
where nome like '%o';

-- exibir os dados da tabela cujo
-- nome tenha a penultima letra r 
select * from atleta
where nome like '%r_';

-- excluir a tabela
drop table atleta;

-- criação de outra tabela
Create table musica (
idmusic int primary key,
titulo varchar(40),
artista varchar(40),
genero varchar(40)
);

-- colocar dados na tabela
insert into musica values 
('0728','camisa10','turma do pagode','pagode'),
('4935','Good4u','olivia rodrigo','pop'),
('0583','tropa da lacoste','kyan','trap'),
('3192','oi balde','zé neto e cristiano','sertanejo'),
('6475','bad guy','billie eilish','pop'),
('6678','mitsubishi','orochi','trap'),
('1129','baile da china','kyan','trap'),
('9252','barulho do foguete','zé neto e cristiano','sertanejo'),
('4169','deixaemoff','turmadopagode','pagode');

-- exibir os dados da tabela
select * from musica;

-- exibir apenas os títulos e os artistas
select titulo,artista from musica;

-- exibir apenas música sertaneja
select * from musica 
where genero like 'sertanejo';

-- exibir os dados de apenas um artista
select * from musica
where artista like 'kyan';

-- exibir os dados da tabela ordenadas 
-- pelo título da música
select * from musica order by titulo;

-- exibir os dados ordenados 
-- pelo artista em ordem decrescente
select * from musica order by artista desc;

-- exibir os dados da tabela 
-- que o artista comece com o
select * from musica
 where artista like 'o%';

-- exibir os dados da tabela
-- que o artista termine com o
select * from musica
	where artista like '%o';

-- exibir os dados da tabela
-- que o gênero tem uma
-- segunda letra r
select * from musica
	where genero like '_r%';
    
    -- exibir os dados da tabela
    -- que o titulo tenha a penultima
    -- letra h
    select * from musica
    where titulo like '%t_';
    
    -- excluir a tabela
    drop table musica;
    
    -- criação de outra tabela
    Create table filme (
    idFilme int primary key,
    titulo varchar(50),
    genero varchar(40),
    diretor varchar(40)
    );
    
    -- colocar dados na tabela
    insert into filme values
    ('4107','Gente Grande','Comédia','Dennis dugan'),
    ('0210','Tropa de elite','ação','José Padilha'),
    ('9240','O jogo da imitação','guerra','Morten Tyldum'),
    ('5120','The flash','ação','Andy Muschietti'),
    ('3951','Sr e Sra Smith','ação','Doug Liman'),
	('2270','Todo mundo em pânico','comédia','Keenen Ivory Wayans'),
    ('9602','Annabelle','Terror','James wan'),
    ('8610','O telefone preto','Terror','Scott derrickson');
    
    -- exibir os dados da tabela 
    select * from filme;
    
    -- exibir na tabela apenas os
    -- os titulos e diretores dos filmes
    select titulo,diretor from filme ; 
    
    -- exibir na tabela apenas os
    -- filmes de terror
    select * from filme
		where genero like 'terror' ; 
	
    -- exibir os dados na tabela
    -- de um diretor
    select * from filme 
		where diretor like 'José Padilha' ; 
    
    -- exibir os dados na tabela
    -- ordenados pelo titulo
    select * from filme order by titulo ; 
    
    -- exibir os dados na tabela
    -- ordenados pelo diretor 
    -- em ordem descrente
    select * from filme order by diretor desc ;
    
    -- exibir os dados na tabela
    -- cujo titulo comece com t
    select * from filme
		where titulo like 't%' ;
        
   -- exibir os dados na tabela-
   -- cujo diretor termine com n
   select * from filme
	where diretor like '%n' ; 
    
    -- exibir os dados na tabela 
    -- cujo genero tenha a segunda
    -- letra u
    select * from filme
		where genero like '_u%';
        
        -- exibir os dados na tabela 
        -- cujo titulo tenha a penultima
        -- letra t
        select * from filme
			where titulo like '%t_' ; 
            
		-- eliminar a tabela
        drop table filme ;
        
        -- criação de outra tabela
        create table professor (
        idProfessor  int primary key,
        nome varchar(50),
        especialidade varchar(40),
        dtNasc date
        );
	
	-- colocar valor na tabela
    insert into professor values
    ('813','Albert Einstein','Matemática','1879-03-14'),
    ('385','Paulo Freire','português','1921-09-19'),
    ('925','Isaque Newton','Matemática','1643-01-04'),
    ('168','Marie Curie','Física','1867-11-07'),
    ('635','Jean Piaget','Biologia','1896-08-09'),
    ('868','Stephen Hawking','Física','1942-01-08'),
    ('228','Anísio Spínola','Português','1900-07-12');
    
    -- exibir os dados da tabela
    select * from professor;
    
    -- exibir apenas as especilidades
    -- dos professores
    select especialidade from professor;
    
    -- exibir apenas os dados 
    -- de uma determinada especialidade
    select * from professor
		where especialidade = 'física';
        
	-- exibir os dados da tabela 
    -- ordenadas pelo nome do 
    -- professor
    select * from professor order by nome;
    
    -- exibir os dados da tabela 
    -- ordenadas pela data de
    -- nascimento em ordem decrescente
    select * from professor order by dtNasc desc;
    
    -- exibir os dados da tabela
    -- cujo professores comece 
    -- com a letra a
    select * from professor
		where nome like 'a%';
        
	-- exibir os dados da tabela
    -- cujo professores termine 
    -- com a letra e
    select * from professor 
		where nome like '%e';
        
	-- exibir os dados da tabela
    -- cujo professores tenha
    -- a segunda letra a
    select * from professor
		where nome like '_a%';
        
	-- exibir os dados da tabela
    -- cujo professores tenha a 
    -- penúltima letra i 
    select * from professor
		where nome like '%i_';
        
	-- Eliminar a tabela
    Drop table professor ;
    
    -- criação de outra tabela
    Create table Curso ( 
    idCurso int primary key,
    nome varchar(50),
    sigla char(3),
    coordenador varchar(40)
    );
    
    -- colocar valor na tabela
    insert into Curso values
    ('197','Sistemas de informação','SIS','Alex Barreira'),
    ('980','Ciência da computação','CCO','Marise Miranda'),
    ('726','Análise e desenvolvimento de sistemas','ADS','Gerson Santos');
    
    -- exibir apenas os coordenadores
    select coordenador from curso;
    
    -- exibir os dados da tabela
    -- de uma determinada sigla
    select * from curso
		where sigla = 'sis';
        
	-- exibir os dados da tabela
    -- ordenados pelo nome do curso
    select * from curso order by nome;
    
   -- exibir os dados da tabela
   -- ordenados pelo nome do 
   -- coordenador em ordem decrescente
   select * from curso order by coordenador desc;
   
   
    -- exibir os dados da tabela
   -- ordenados pelo nome do curso
   -- cujo nome comece com s
   select * from curso
	where nome like 's%';
    
     -- exibir os dados da tabela
   -- ordenados pelo nome do curso
   -- cujo nome termine com o
   select * from curso
	where nome like '%o';
    
   -- exibir os dados da tabela
   -- ordenados pelo nome do curso
   -- que a segunda letra é i
   select * from curso
	where nome like '_i%';
    
    -- exibir os dados da tabela
   -- ordenados pelo nome do curso
   -- que a penúltima letra é a 
   select * from curso
	where nome like '%a_';
    
    -- eliminando a tabela
    drop table curso ;
    
    -- criação de outra tabela
    Create table Revista (
    idRevista int primary key auto_increment,
    nome varchar(40),
    categoria varchar(30)
    );
    
  --  colocar dados na tabela
  insert into revista (nome) values ('Veja');
  insert into revista (nome) values ('Isto é');
  insert into revista (nome) values ('Epoca');
  insert into revista (nome) values ('Quatro rodas');
  
  -- exibir todos os dados da tabela 
  select * from revista;
  
  -- atualizar os dados das categorias 
  -- e depois mostra-los
  update revista
  set categoria = 'notícias'
	where idRevista = 1;
  
  update revista
  set categoria = 'notícias'
	where idRevista = 2;
  
  update revista
  set categoria = 'notícias'
	where idRevista = 3;
    
    select * from revista;
    
    -- inserir mais 3 registros completos
    insert into revista (nome) values ('Vougue');
    insert into revista (nome) values ('Fashion');
    insert into revista (nome) values ('Elle');
    
    update revista 
    set categoria = 'Moda'
		where idRevista = 5 ;
    
    update revista 
    set categoria = 'Moda'
		where idRevista = 6 ;
        
	update revista 
    set categoria = 'Moda'
		Where idRevista = 7 ;
        
-- exibir novamente os dados da tabela
select * from revista;

-- Exibir a descrição da estrutura da tabela
describe revista;

-- alterar a tabela para
-- que a coluna categoria 
-- tenha no máximo 40 caracteres
alter table revista
drop categoria;
add categoria varchar(40);

-- exibir novamente a descrição para
-- ver se alterou a coluna categoria
describe revista;

-- acrescentar a coluna periodicamente
alter table revista 
add periodicamente varchar(15);

-- exibir os dados da tabela
select * from revista;

-- excluir a tabela periodicamente
alter table revista
	drop periodicamente;
    
-- excluir o banco de dados
drop database sprint1;

-- criar a base de dados
create database sprint1;

-- usar o banco de dados
use sprint1;

-- criar tabela
create table pessoa (
idPessoa int primary key,
Nome varchar(30),
altura float,
dtNasc date
);
		
 -- descrever a tabela
 describe pessoa;
 
 -- colocar valor na tabela
 insert into pessoa values
 ("100",'Eduardo',"1.69",'2006-06-10');
 
 -- mostrar os dados da tabela
 select * from pessoa;
 
 -- modifcar um campo
 alter table pessoa modify column idPessoa int auto_increment;
    
  describe pessoa; 
   
   insert into pessoa values 
   (default,'Carolina',"1.89",'2006-01-01');
   
   select * from pessoa;
   
   -- se não quiser colocar id,data de nascimento
   insert into pessoa (nome, altura) values
('giulia',1.34);

insert into pessoa values
(1039,'Joaquim',1.59,'1939-01-03');

select * from pessoa;
-- atualizar o dado do nome da giulia
update pessoa set nome = 'Giulia'
where idPessoa = 103;

-- atualizar a data de nascimento
update pessoa set dtNasc = '2000-01-01'
where idPessoa = 103;

-- excluir uma linha inteira
delete from pessoa 
 where idPessoa = 1039; 
  
	-- adicionar uma coluna chamada salário
alter table pessoa add column salario decimal(10,2);

update pessoa set salario = 1.99
 where idPessoa = 100;
 
 update pessoa set salario = 5.98
  where idPessoa in (101,102);
  
  select * from pessoa;
  
-- outra forma de add valor
-- update pessoa set salario = 5.98
-- 	where id = 101 or id = 102;

select * from pessoa;

alter table pessoa auto_increment = 104;
select * from pessoa;

-- excluir uma coluna inteira
alter table pessoa drop column dtNasc;

 
 -- renomear tabela
 alter table pessoa rename column nome to nomeCompleto;

-- delete = deletar uma linha ; drop = excluir a tabela ou coluna

-- limpar os dados da tabela
truncate table pessoa;

select * from pessoa;
  
alter table pessoa drop column salario, drop column altura;

-- add um campo chamado genero
alter table pessoa add column genero char(1);

-- constraint = configuração/restrição
alter table pessoa add constraint checkGenero 
	check (genero in ('F','M'));

insert into pessoa values
 (default,'Carolina','F');
 select * from pessoa;
 
 -- verificação de email
 alter table pessoa add column email varchar(50),
 add constraint checkEmail
 check(email like '%@%');
 

  
  Create table Cadastro (
  idCad int primary key,
  Nome varchar(40),
  cpnj char(14),
  usuario varchar(40),
  email varchar(100),
  senha char(8)
);
    -- add constraint Checkemail
	-- check(email like '%@%');
  
  Create table sessao (
  idsessao int primary key,
  umidade decimal(5,2),
  categoria varchar(40),
  qtdObras int
  );
  
  Create table logradouro (
  idLogradouro int primary key,
  pais varchar (30),
  cidade varchar(30),
  cep char(8),
  bairro varchar(40),
  endereco varchar(30),
  complemento varchar(20)
  );
  
  