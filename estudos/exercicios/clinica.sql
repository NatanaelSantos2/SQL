create table Pacientes(
codP int not null identity,
nome varchar(80) not null,
CPF int not null,
sexo char(1) not null,
idade int not null,
convenio varchar(80) not null default 'solteiro',

primary key(codP),
unique(CPF),
check(sexo in('M','F'))
)


create table Medicos(
codM int not null identity,
nome varchar(80) not null,
especialidade varchar(80) not null,
truno varchar(80) not null,
salario numeric(3,2) not null,

primary key(codM),
check(salario > 0),
)

create table Consultas(
codC int not null identity,
paciente int not null,
medico int not null,
datetime datetime,
diagnostico varchar(80) not null,
preco int not null,

primary key(codC),
foreign key(paciente) references Pacientes (codP),
foreign key(medico) references Medicos (codM)
)


--inserção de dados nessas tabelas
insert into Pacientes values('Natanael', 1231231,'M', 24, 'namorando')
insert into Pacientes values('Lais', 2323132,'F', 21, 'namorando')
select * from Pacientes --Realize consultas simples
update Pacientes
set convenio ='casado'
where convenio = 'namorando'

--inserção de dados nessas tabelas
insert into Medicos values('Neru','cirrugião', 'Manhã', 5)
insert into Medicos values('Rei Mago', 'pedologo','Tarde', 9)
select * from Medicos --Realize consultas simples

--Atualize os salários dos médicos pediatras para que eles ganhem o dobro.
update Medicos
set salario = salario*2

--Exclua da tabela de médicos todos os que tiverem salário menor do que R$ 1500,00.
delete from Medicos
where salario < 3

--inserção de dados nessas tabelas
insert into Consultas values(1,18,'23-03-2024','Diarreia',9)
insert into Consultas values(2,19,'23-03-2024','Dor',4)
select * from Consultas --Realize consultas simples

--Atualize os preços das consultas para R$ 120,45.
update Consultas
set preco = 120.45

update Consultas
set horario = '10:10'

--cria o atributo horario
alter table Consultas
add horario time

--Exclua da tabela de consultas todas as que custaram menos de R$ 80
delete from Consultas
where preco < 80

--exclui um atributo especifico
alter table Consultas
drop column hoario

--Exclui a tabela consulta
drop table Consultas

--Exclua a base de dados Clinica.
drop database Clinica