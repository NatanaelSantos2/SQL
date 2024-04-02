USE Hotel
CREATE database Hotel

Create Table Hospedes (
CPF varchar (12) not null,
nome varchar (50) not null,
endereco varchar (50),
sexo char(1),
dataNascimento datetime,

Primary Key (CPF),
check (sexo in ('M', 'F'))
)

Create Table Quartos (
numero int not null,
tipo varchar (40),
valorDiaria money,

Primary Key (numero),
check (valorDiaria > 0)
)

Create Table Estadias (
hospede varchar(12) not null,
quarto int not null,
dataEntrada datetime,
dataSaida datetime,

Foreign Key (hospede) References Hospedes (CPF),
Foreign Key (quarto) References Quartos (numero),
Check (dataSaida > dataEntrada)
)

Create Table Servicos (
codServico int not null,
descricao varchar (40),
preco money,

Primary Key (codServico),
check (preco > 0)
)

Create Table Solicitacoes (
hospede varchar(12) not null,
servico int not null,
data datetime,
hora datetime,

Foreign Key (hospede) References Hospedes (CPF),
Foreign Key (servico) References Servicos (codServico)
)