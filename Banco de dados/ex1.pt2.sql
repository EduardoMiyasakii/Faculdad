-- criar banco de dados
create database sprint1;

-- usar o banco de dados
use sprint1;

-- criar tabela

Create table Atleta (
idAtleta int primary key,
nome varchar(40),
modalidade varchar(40),
qtdMedalha int
);

insert into Atleta values
 (1,'Alex','futebol','3'),
 (2,'Gustavo','Handebol','0'),
 (3,'Heloisa','Volêi','3'),
 (4,'Pablo','futebol','1'),
 (5,'Pedro','basquete','2'),
 (6,'Murilo','tênis','1'),
 (7,'Nicolas','futebol','1'),
 (8,'Eduardo','basquete','2');
 
-- exibir todos os dados da tabela
select * from atleta;

-- Atualizar a quantidade de medalhas do atleta
-- com id=1
 update Atleta set qtdMedalha = 7
	where idAtleta = 1;
    
    -- Atualizar a quantidade de medalhas dos 
    -- atleta com id=2 e com o id=3;
    update Atleta set qtdMedalha = 2
		where idAtleta in (2,3);
        
-- Atualizar o nome do atleta com o id=4
update Atleta set nome = 'Eli'
 where idAtleta = 4;
 
 -- Adicionar o campo dtNasc na tabela,
 -- com a data de nascimento dos atletas,
 -- tipo date
 alter table Atleta add column dtNasc date;

-- Atualizar a data de nascimento de todos os atletas
update Atleta set dtNasc = '2006-06-10'
	where idAtleta =8 ;
  
 update Atleta set dtNasc = '2006-01-13'
		where idAtleta = 1;
 
 update Atleta set dtNasc = '2005-07-12'
	where idAtleta = 2;
 
 update Atleta set dtNasc = '2006-09-01'
 where idAtleta = 3;
 
 update Atleta set dtNasc = '2005-02-24'
	where idAtleta = 4;
    
update Atleta set dtNasc = '2006-06-12'
	where idAtleta = 5;

update Atleta set dtNasc = '1900-12-15'
	where idAtleta = 6 ;
    
update Atleta set dtNasc = '2024-02-20'
	where idAtleta = 7;
    
-- Excluir o atleta com o id=5
 delete from Atleta
	where idAtleta = 5;
    
-- Exibir os atletas onde a
-- modalidade é diferente de natação
 select * from Atleta 
	where modalidade != 'natacao';
    
    -- Exibir os dados dos atletas 
    -- que tem a quantidade de medalhas 
    -- maior ou igual a 3
    
    select * from Atleta
		where qtdMedalha >= 3;
        
	-- Modificar o campo modalidade do tamanho
    -- 40 para o tamanho 60
    
    alter table Atleta modify column modalidade varchar(60);
    
    -- Descrever os campos da tabela 
    describe atleta;
	
    -- limpar os dados da tabela
    truncate table Atleta;
    
    -- criar outra tabela 
    create table Musica (
    idMusica int primary key,
    titulo varchar(40),
    artista varchar(40),
    genero varchar(40)
    );
    insert into Musica values
(1,'camisa10','turma do pagode','pagode'),
(2,'Good4u','olivia rodrigo','pop'),
(3,'tropa da lacoste','kyan','trap'),
(4,'oi balde','zé neto e cristiano','sertanejo'),
(5,'bad guy','billie eilish','pop'),
(6,'mitsubishi','orochi','trap'),
(7,'baile da china','kyan','trap'),
(8,'barulho do foguete','zé neto e cristiano','sertanejo'),
(9,'deixaemoff','turmadopagode','pagode');
 
 -- exibir os dados da tabela
 select * from musica;
 
 -- Adicionar o campo curtidas do tipo int na tabela
 alter table Musica add column Curtidas int;
 
 update Musica set Curtidas = 1000000
	where idMusica = 1 ;

update Musica set Curtidas = 50050043
	where idMusica = 2;
    
update Musica set curtidas = 138932
	where idMusica = 3;

update Musica set curtidas = 567481
	where idMusica = 4;
    
update Musica set Curtidas = 932731
	where idMusica = 5;
    
update Musica set Curtidas = 463271
	where idMusica = 6;
    
update Musica set curtidas = 2749821
	where idMusica = 7;

update Musica set Curtidas = 42723986
	where idMusica = 8;
    
update Musica set Curtidas = 3827392
	where idMusica = 9;
    
-- Modificar o campo artista do tamanho 
-- 40 para o tamanho 80
alter table Musica modify column Artista varchar(80);

-- Atualizar a quantidade de curtidas da música com id=1
update Musica set curtidas = 1
	where idMusica = 1 ;

-- Atualizar a quantidade de curtidas 
-- das músicas com id=2 e com o id=3
update Musica set curtidas = 2
 where idMusica in (2,3);

-- Atualizar o nome da música com o id=5
update Musica set titulo = 'Heather'
	where idMusica = 5;
    
    -- Excluir a música com o id=4
    delete from Musica
		where idMusica = 4;

-- Exibir as músicas onde o
-- gênero é diferente de funk
select * from Musica
	where genero != 'funk';

-- Exibir os dados das músicas
-- que tem curtidas maior ou igual a 20
select * from Musica
	where curtidas >= 20;
    
-- Descrever os campos da tabela
describe Musica;

-- limpar os dados da tabela
 truncate table Musica;
 
 -- criação de outra tabela
 create table Filme (
 idFilme int primary key,
 titulo varchar(50),
 genero varchar(40),
 diretor varchar(40)
 );
  insert into Filme Values
    (1,'Gente Grande','Comédia','Dennis dugan'),
    (2,'Tropa de elite','ação','José Padilha'),
    (3,'O jogo da imitação','guerra','Morten Tyldum'),
    (4,'The flash','ação','Andy Muschietti'),
    (5,'Sr e Sra Smith','ação','Doug Liman'),
	(6,'Todo mundo em pânico','comédia','Keenen Ivory Wayans'),
    (7,'Annabelle','Terror','James wan'),
    (8,'O telefone preto','Terror','Scott derrickson');
    
    -- exibir os dados da tabela
    describe Filme;
    
    -- Adicionar o campo protagonista 
    -- do tipo varchar(50) na tabela
    alter table Filme add column Protagonista varchar(50);
    
    -- Atualizar o campo protagonista 
    -- de todas os filmes inseridos
    update Filme set Protagonista = 'Adam Sandler'
		Where idFilme = 1;
        
    update Filme set Protagonista = 'Wagner Moura'
		where idFilme= 2;
        
	update Filme set Protagonista = 'Benedict Cumberbatch'
		where idFilme = 3;

	update Filme set Protagonista = 'Ezra Miller'
		where idFilme = 4;
    
    update Filme set Protagonista = 'Brad Pitt e Angelina Jolie'
		where idFilme = 5;
	
    update Filme set Protagonista = 'Anna Faris'
		where idFilme = 6;
    
    update Filme set Protagonista = 'Annabelle Wallis'
		where idFilme = 7;
        
	update Filme set Protagonista = 'Ethan Hawke'
		where idFilme = 8;
        
	-- Modificar o campo diretor 
    -- do tamanho 40 para o tamanho 150 
    alter table Filme Modify column Diretor varchar (150);
    
    -- Atualizar o diretor 
    -- do filme com id=5;
     update Filme set Diretor = 'Eu'
        where idFilme = 1;
        
	-- Atualizar o diretor dos
	-- filmes com id=2 e com o id=7;
    update Filme set Diretor = 'Você'
    Where idFilme in (2,7);
    
   -- Atualizar o título do filme com o id=6
   update Filme set Titulo = 'Homem aranha'
	where idFilme = 6;
    
   -- Excluir o filme com o id=3
    delete from Filme
		where idFilme = 3;
        
 --  Exibir os filmes em que o
 -- gênero é diferente de drama
  select * from filme 
	where genero !='drama';
    
    -- Exibir os dados dos filmes que
    -- o gênero é igual ‘suspense’
    select * from Filme
    where genero = 'suspense';
    
    -- Descrever os campos da tabela 
    -- mostrando a atualização do 
    -- campo protagonista e diretor
   describe filme;
   
   -- limpar os dados da tabela
   truncate table Filme ;
   
   -- Criação de outra tabela
   Create table Professor (
   idProfessor int primary key,
   nome varchar (50),
   especialidade varchar (40),
   dtNasc date
   );
   insert into Professor values
    (1,'Albert Einstein','Matemática','1879-03-14'),
    (2,'Paulo Freire','português','1921-09-19'),
    (3,'Isaque Newton','Matemática','1643-01-04'),
    (4,'Marie Curie','Física','1867-11-07'),
    (5,'Jean Piaget','Biologia','1896-08-09'),
    (6,'Stephen Hawking','Física','1942-01-08'),
    (7,'Anísio Spínola','Português','1900-07-12');
    
    -- exibir todos os dados da tabela
    select * from Professor;
    
-- Adicionar o campo funcao do tipo varchar(50)
-- onde a função só pode ser monitor, 
-- assistente ou titular;

  alter table Professor add column funcao varchar(50);
  
  alter table Professor add constraint CheckFuncao
   Check(Funcao in ('Monitor','Assistente','Titular'));
   
   -- Atualizar os professores 
   -- inseridos e suas respectivas funções;
    update Professor set funcao = 'Monitor'
		where idProfessor = 1;
        
	update Professor set funcao = 'Assistente'
		where idProfessor = 2;
        
        update Professor set funcao = 'assistente'
			where idProfessor = 3;
            
		update Professor set funcao = 'monitor'
			where idProfessor = 4;
            
		update Professor set funcao = 'titular'
			where idProfessor = 5;
		
        update Professor set funcao = 'titular'
			where idProfessor = 6;
		
        update Professor set funcao = 'monitor'
			where idProfessor = 7;
            
-- Inserir um novo professor
	  select * from professor;
      insert into Professor value
      (8,'Cleber','Ciências','1988-06-17','monitor');
      
	-- Excluir o professor onde
    -- o idProfessor é igual a 5
    delete from Professor 
		where idProfessor = 5;

-- Exibir apenas os nomes dos professores titulares
  select * from Professor
  where funcao = 'titular';
  
  --  Exibir apenas as especialidades
  -- e as datas de nascimento dos
  -- professores monitores;
   select especialidade, dtNasc from Professor
	where funcao = 'monitor';
    
    --  Atualizar a data de nascimento
    -- do idProfessor igual a 3
    update Professor set dtNasc = '1929-03-14'
    where idProfessor = 3;
    
    -- limpar a tabela
    truncate table Professor;
    
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
    
    -- exibir apenas os coordenadores do curso
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
  update revista set categoria = 'notícias'
	where idRevista = 1;
  
  update revista set categoria = 'notícias'
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
alter table revista modify column categoria varchar(40);

-- exibir novamente a descrição para
-- ver se alterou a coluna categoria
describe revista;

-- acrescentar a coluna periodicamente
alter table revista 
add periodicamente varchar(15);

-- exibir os dados da tabela
select * from revista;

-- excluir a coluna periodicamente
alter table revista drop column periodicamente;

      
        
            
       
     
        
      




        