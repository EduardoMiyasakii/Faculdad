CREATE DATABASE prova;
use prova;

CREATE TABLE mercado(
idMercado int primary key auto_increment,
prateleiras char(3),
mercadorias varchar(30)
);

INSERT INTO mercado VALUES
(default,"2","miojo");
 
update mercado set mercadorias = "ovo"
where idMercado = 1;

ALTER TABlE mercado add column prazo date;

alter table mercado drop column prazo;

select mercadorias as produtos from mercado;

select mercadorias as produtos,
concat("quantidade de pordutos",produtos);



