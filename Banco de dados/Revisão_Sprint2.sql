CREATE DATABASE RevisaoSprint2;
USE SPRINT2;

CREATE TABLE projeto ( -- O nome da tabela deve refletir o nome da entidade no modelo de dados
					   -- Por isso sempre usamos o SINGULAR no nome de tabela
                       
	idProjeto INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    descricao VARCHAR(100)
);

CREATE TABLE aluno (
	ra CHAR(8) PRIMARY KEY, -- Não devemos colocar RA como INT,
							-- RA se trata de um campo com tamanho fixo e possibilidade de 0 a esquerda
    nome VARCHAR(45),
    telefone VARCHAR(9),    
    fkProjeto INT,
    CONSTRAINT fkProjetoAluno FOREIGN KEY (fkProjeto) REFERENCES projeto (idProjeto),
    
    fkRepresentante CHAR(8), -- O tipo da FK deve ser correspondente ao tipo da PK que ela espelha
    CONSTRAINT fkRepresentaAluno FOREIGN KEY (fkRepresentante) REFERENCES aluno (ra)
);


INSERT INTO projeto (nome, descricao) VALUES 
('MorangoTech', 'Solução para monitorar plantios de morangos'),
('AcquaTech', 'Solução para monitorar aquários residênciais'),
('ServerTemp', 'Solução para monitorar servidores em massa');

INSERT INTO aluno (ra, nome, telefone, fkProjeto, fkRepresentante) VALUES
('01241001', 'Alberto', '912345678', 1, NULL),
('01241002', 'Bernardo', '912345677', 1, '01241001'),
('01241003', 'Carlos', '912345676', 1, '01241001'),
('01241004', 'Daniel', '912345675', 2, NULL),
('01241005', 'Enzo', '912345674', 2, '01241004'),
('01241006', 'Fabrício', '912345673', 2, '01241004'),
('01241007', 'Gabriela', '912345672', 3, NULL),
('01241008', 'Helena', '912345671', 3, '01241007'),
('01241009', 'Isis', '912345670', 3, '01241007');

-- Exibir todos os dados de cada tabela criada, separadamente.
SELECT * FROM aluno;
SELECT * FROM projeto;


-- Exibir os dados dos alunos e dos projetos correspondentes.
SELECT *
FROM aluno
JOIN projeto
	ON aluno.fkProjeto = projeto.idProjeto;

-- Exibir os dados dos alunos e dos seus representantes.
SELECT *
FROM aluno AS representados
JOIN aluno AS representantes
	ON representados.fkRepresentante = representantes.ra;

-- Mesmo select, mas projetando apenas os nomes
SELECT
	representado.nome AS representado,
    representante.nome AS representante
FROM aluno AS representado
JOIN aluno AS representante
	ON representado.fkRepresentante = representante.ra;

-- Exibir os dados dos alunos e dos projetos correspondentes, mas somente de um determinado projeto (indicar o nome do projeto na consulta).
SELECT *
FROM aluno
JOIN projeto
	ON fkProjeto = idProjeto
WHERE
	projeto.nome = 'MorangoTech';

-- a) Criar um banco de dados chamado Campanha.
CREATE DATABASE campanha;

-- b) Selecionar esse banco de dados.
USE campanha;

-- c) Criar as tabelas correspondentes à sua modelagem.
CREATE TABLE organizador (
	idOrganizador INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    rua VARCHAR(45),
    bairro VARCHAR(45),
    email VARCHAR(45) UNIQUE -- Para evitar que dois organizadores tenham o mesmo e-mail
							 -- Avisar sobre o uso do UNIQUE na PRIMARY KEY
) AUTO_INCREMENT = 30;

CREATE TABLE campanha (
	idCampanha INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    categoria VARCHAR(45),
    instituicao1 VARCHAR(45),
    instituicao2 VARCHAR(45),
    dataFinal DATE,
    fkOrganizador INT,
    CONSTRAINT fkOrganizadorCampanha FOREIGN KEY (fkOrganizador) REFERENCES organizador (idOrganizador)
) AUTO_INCREMENT = 500;


ALTER TABLE organizador 
	ADD COLUMN fkOrientador INT,
    ADD CONSTRAINT fkOrganizadorOrientador FOREIGN KEY (fkOrientador) REFERENCES organizador (idOrganizador);
    
-- AVISAR QUE PODE SER CRIADO ANTES, É APENAS UMA ABORDAGEM DIFERENTE
    
-- d) Inserir dados nas tabelas, de forma que exista mais de uma campanha para algum organizador, 
-- 	  e mais de um organizador novato sendo orientado por algum organizador mais experiente.
 
INSERT INTO organizador (nome, rua, bairro, email) VALUES
('Ana', 'Rua dos Alfeneiros', 'Cerqueira Cesar', 'ana@sptech.school'),
('Bruno', 'Rua Sésamo', 'Limoeiro', 'bruno@sptech.school'),
('Caio', 'Rua Baker', 'Barra Funda', 'caio@sptech.school'),
('Danilo', 'Avenida Brasil', 'Mooca', 'danilo@sptech.school'),
('Emerson', 'Rua das Flores', 'Morumbi', 'emerson@sptech.school');

-- tente criar um novo Emerson

SELECT * FROM organizador;

UPDATE organizador
SET fkOrientador = 30
WHERE idOrganizador IN (31, 32);

UPDATE organizador
SET fkOrientador = 33
WHERE idOrganizador = 34;

SELECT * FROM organizador;

INSERT INTO campanha (nome, categoria, instituicao1, instituicao2, dataFinal) VALUES
('TELETON', 'Financeiro', 'AACD', 'GRAAC', '2024-08-01'),
('Criança Esperança', 'Alimento', 'UNESCO', 'UNICEF', '2024-09-01'),
('Campanha do Agasalho', 'Vestuário', 'Orfanato Raio de Luz', 'Casa do Bem', '2024-08-01');

UPDATE campanha
SET fkOrganizador = 30
WHERE idCampanha = 500;

UPDATE campanha
SET fkOrganizador = 33
WHERE idCampanha = 501;

UPDATE campanha
SET fkOrganizador = 34
WHERE idCampanha = 502;

SELECT * FROM campanha;

-- e) Exibir todos os dados de cada tabela criada, separadamente.
SELECT * FROM campanha;
SELECT * FROM organizador;

-- g) Exibir os dados dos organizadores e os dados de suas respectivas campanhas.
SELECT *
FROM organizador
	JOIN campanha ON fkOrganizador = idOrganizador;

SELECT *
FROM organizador
	JOIN campanha;


-- h) Exibir os dados de um determinado organizador 
-- (informar o nome do organizador na consulta) e os dados de suas respectivas campanhas.
SELECT *
FROM organizador
	JOIN campanha ON fkOrganizador = idOrganizador
WHERE organizador.nome = 'Danilo';

-- i) Exibir os dados dos organizadores novatos e os dados dos respectivos organizadores orientadores.
SELECT *
FROM organizador AS novato
	JOIN organizador AS orientador
		ON novato.fkOrientador = orientador.idOrganizador;
        
SELECT 
	novato.nome AS NomeNovato,
    orientador.nome AS NomeOrientador
FROM organizador AS novato
	JOIN organizador AS orientador
		ON novato.fkOrientador = orientador.idOrganizador;

    

-- j) Exibir os dados dos organizadores novatos e os dados dos respectivos organizadores orientadores, 
-- porém somente de um determinado organizador orientador (informar o nome do organizador orientador na consulta).
SELECT *
FROM organizador AS novato
	JOIN organizador AS orientador
		ON novato.fkOrientador = orientador.idOrganizador
WHERE orientador.nome = 'Ana';


-- l) Exibir os dados dos organizadores novatos, os dados das respectivas campanhas 
--    organizadas e os dados dos respectivos organizadores orientadores.
SELECT * 
FROM organizador AS novato
	JOIN campanha
		ON campanha.fkOrganizador = novato.idOrganizador
	JOIN
		organizador AS orientador
	ON
		novato.fkOrientador = orientador.idOrganizador;
        
-- Query com as colunas selecionadas
SELECT
	novato.nome AS 'Novato',
    orientador.nome AS 'Orientador',
    campanha.nome AS 'Campanha'
FROM organizador AS novato
	JOIN campanha
		ON campanha.fkOrganizador = novato.idOrganizador
	JOIN
		organizador AS orientador
	ON
		novato.fkOrientador = orientador.idOrganizador;

-- m) Exibir os dados de um organizador novato (informar o seu nome na consulta), os dados das respectivas
--    campanhas em que trabalha e os dados do seu organizador orientador.
SELECT
	*
FROM organizador AS novato
	JOIN campanha
		ON campanha.fkOrganizador = novato.idOrganizador
	JOIN
		organizador AS orientador
	ON
		novato.fkOrientador = orientador.idOrganizador
WHERE novato.nome = 'Emerson';


-- Query com as colunas selecionadas
SELECT
	novato.nome AS 'Novato',
    orientador.nome AS 'Orientador',
    campanha.nome AS 'Campanha'
FROM organizador AS novato
	JOIN campanha
		ON campanha.fkOrganizador = novato.idOrganizador
	JOIN
		organizador AS orientador
	ON
		novato.fkOrientador = orientador.idOrganizador
WHERE novato.nome = 'Emerson';
-- Detalhe: só temos o Emerson como novato que possui alguma campanha
--  :(, então só conseguimos filtrar com o nome dele