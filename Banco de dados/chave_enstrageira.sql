use sisa;

show tables;

CREATE TABLE empresa(
idEmpresa int primary key auto_increment,
nome varchar(45),
responsavel varchar(45)
);


INSERT INTO empresa values
 (default,"stefanini","Daniela"),
 (default,"c6bank","Vanessa");
 
 select * from empresa;
 
 CREATE TABLE aluno(
 ra char(8) primary key,
 nome varchar(45),
 bairro varchar(45),
 fkEmpresa int not null,
 constraint fkAlunoEmpresa foreign key (fkEmpresa)
references empresa(idEmpresa));


INSERT INTO aluno VALUES
 ("03241999","Cebolinha","consolação",1),
 ("03241998","Mônica","paraíso",1),
 ("03241997","Cascão","Triaton masp",2);
 
 select * from aluno;
 
 -- alter table
 /*
 ALTER TABLE aluno add constrainst FkAlunoEmpresa
 foreign key (fkEmpresa) references Empresa (idEmpresa);
 */
 
 -- nosso primeiro join
 /* exibir os alunos e as respectivas empresa
 */
 

 SELECT * FROM aluno JOIN empresa
  ON  idEmpresa = fkEmpresa;
  
  --  SELECT * FROM aluno INNER JOIN empresa
 -- ON  idEmpresa = fkEmpresa;
 
 select bairro,responsavel from aluno inner join empresa
  on idEmpresa = fkEmpresa;
  
SELECT aluno.nome,empresa.nome FROM aluno INNER JOIN empresa
 ON idEmpresa = fkEmpresa;
 
 SELECT aluno.nome as NomeAluno,
 empresa.nome as nomeEmpresa
 FROM aluno INNER JOIN empresa
   ON idEmpresa = fkEmpresa;
   
   SELECT a.nome AS "nome do aluno",
   e.nome AS "nome da empresa"
   FROM aluno AS a INNER JOIN empresa as e
   ON e.idEmpresa = a.fkEmpresa;
   
   
   SELECT a.nome AS "nome do aluno",
   e.nome AS "nome da empresa"
   FROM aluno AS a INNER JOIN empresa as e
   ON e.idEmpresa = a.fkEmpresa
   where e.nome = "stefanini";
   
  

 
 
 
 
 