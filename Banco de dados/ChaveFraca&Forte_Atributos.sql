-- Tipos de atributo
-- Atributo identificador - Chave primária
-- Atributo Simples - não se divide em subpartes
-- Exemplos : NomeCompleto (vai depender da regra de negócio)
-- Atributo composto - deve ser dividido em subpartes
-- Exemplo : Endereço = dividido em três partes
-- CEP, número e complemento
-- Outro exemplo : Email
-- user e o domínio 
-- domínio = gmail,outlook.

-- INSERT INTO funcionario (endereco) VALUES
-- ('-Rua Haddock Lobo, 595. Cerqueira Cesar. São Paulo. 01414-905')

-- Atributo monovalorado : ele tem apenas 1 valor
-- Exemplo: bairro
-- Atributo multivalorado 
-- Exemplo: Telefone, TelefoneCelular ou telefoneFixo
-- email: Pessoal ou acadêmico
-- Atributo derivado
-- Exemplo : idade
-- Derivada da data de nascimento.

USE sisa;

CREATE TABLE Funcionario (
idFuncionario int primary key auto_increment,
nome varchar(45), -- atributo simples
cep char(9), -- atributo composto: cep,NumeroEndereco,Complemento : endereço
numeroEndereco varchar(45),
complemento varchar(45),
telefoneCelular varchar(45), -- Atributo multivalorado ; Telefone celular + telefone fixo
telefoneFixo varchar(45)
);

INSERT INTO Funcionario VALUES
(default,"Pica-Pau","01414-095","595","11 Andar"," 11 987654321", "11 54321122"),
(default,"Papai Smurf","01414-095","595","7 Andar"," 11 987654422", "11 54324433"),
(default,"Bob esponja","01414-095","595","2 Andar"," 11 987612345", "11 54327788");

SELECT * FROM Funcionario;

CREATE TABLE dependente (
idDependente int, -- chave primaria composta
fkFuncionario int,
constraint pkComposta PRIMARY KEY (idDependente, fkFuncionario),
nome varchar(45),
parentesco varchar(45),
dataNascimento date,
CONSTRAINT fkFuncionarioDependente FOREIGN KEY (fkFuncionario)
	REFERENCES Funcionario(idFuncionario)
    );
    
INSERT INTO Dependente VALUES
-- pk1 + pk2 = idDependente + fkFuncionario;

(1,1,"Zeca urubu","Pai","1990-01-01"),
(2,1,"Leoncio","Avô","1930-01-01"),
(1,2,"Mamãe Smurf","Esposa","1967-01-01");

SELECT * FROM funcionario
INNER JOIN dependente 
ON fkFuncionario = idFuncionario;

-- (3,1,"XPTO"...)

