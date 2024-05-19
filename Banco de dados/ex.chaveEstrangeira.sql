CREATE DATABASE sprint2;
use sprint2;

CREATE TABLE pais (
idPais int primary key auto_increment,
nome VARCHAR(30),
capital VARCHAR(40)
);

INSERT INTO pais VALUES 
 (default,'Brasil','Brasília'),
 (default,'Portugal','Lisboa'),
 (default,'Argentina','Buenos aires'),
 (default,'Inglaterra','Londres');
 
 CREATE TABLE atleta (
 idAtleta INT PRIMARY KEY AUTO_INCREMENT,
 nome VARCHAR (40),
 modalidade VARCHAR (40),
 qtdMedalha INT,
 fkPais INT,
 CONSTRAINT fkAtletaPais FOREIGN KEY (fkPais)
 references pais(idPais)
 );
 
 INSERT INTO atleta VALUES 
 (default,'Cleber','futebol',2,2),
 (default,'Jennifer','vôlei',10,1),
 (default,'Yasmin','vôlei',1,3),
 (default,'Raquel','basquete',5,2),
 (default,'Pedro','futebol',20,1);
 
 SELECT * FROM atleta INNER JOIN pais
  on idPais = fkPais;
  
update atleta set fkPais = 4
	where idAtleta = 1;
 
update atleta set fkPais = 2 
	where idAtleta = 2;
 
 update atleta set fkPais = 4
	where idAtleta = 3;
    
update atleta set fkPais = 3
	where idAtleta = 4;
    
update atleta set fkPais = 1
	where idAtleta = 5;
	
    -- mostrar o nome do país e o nome dos atleta
 SELECT a.nome AS "nome do atleta",
  p.nome AS "nome do país"
 FROM atleta AS a INNER JOIN pais as P
  On p.idPais = a.idAtleta;
  
  -- Exibir apenas o nome do atleta e o nome do respectivo país;
  
  SELECT a.nome AS "Nome do atleta",
  p.nome AS "nome do país"
  FROM atleta AS a INNER JOIN pais AS p
   ON p.idPais = a.idAtleta
		where a.nome = 'Cleber';
        
-- Exibir os dados dos atletas, seus respectivos países, de uma determinada capital

SELECT a.nome,a.modalidade,a.qtdMedalha,p.nome,p.capital
 FROM atleta AS a INNER JOIN pais AS p
 ON p.idPais = a.idAtleta
	where p.capital = 'brasília';
    
    CREATE TABLE album (
    idAlbum INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(40),
    tipo VARCHAR(40),
    dtLancamento DATE
    );
    
    INSERT INTO album VALUES
    (default,'sour','digital','2021-04-21'),
    (default,'especial sertanejo','fisico','2015-12-04');
    
    CREATE TABLE musica(
    idMusica INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(40),
    artista VARCHAR(40),
    genero VARCHAR(40),
    fkAlbum INT,
    CONSTRAINT fkMusicaAlbum FOREIGN KEY (fkAlbum)
     references album(idAlbum)
    );
    
    INSERT INTO musica VALUES
    (default,'Camisa 10','Turma do pagode','Samba',2),
    (default,'Tropa da lacoste','Kyan','Trap',1),
    (default,'Bendito','Ngc daddy','Trap',1),
    (default,'Yellow','Coldplay','Pop',2),
    (default,'Good 4 u','Olivia rodrigo','Pop',2);
    
    update musica set fkAlbum = 1
		where idMusica = 1;
        
	update musica set fkAlbum = 2
		where idMusica = 2;
	
    update musica set fkAlbum = 2
		where idMusica = 3;
        
	update musica SET fkAlbum = 1
			WHERE idMusica = 4;

    UPDATE musica SET fkAlbum = 1 
		WHERE idMusica = 5;
        
	SELECT titulo as 'título da música',
    nome as 'nome do album' from musica
    INNER JOIN album;
    
    -- Exibir somente o título da música e o nome do seu respectivo álbum;
    SELECT titulo as 'Título da música',
    nome as 'nome do album' 
    from musica INNER JOIN album
		WHERE titulo = 'camisa 10';
        
        -- xibir os dados das músicas e seu respectivo álbum, de um determinado tipo
        SELECT titulo,artista,genero from musica
        INNER JOIN album
        where tipo = 'fisico';
    
        
    
    
  
  
 
