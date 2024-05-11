create database loja

create table cliente(
idUsuario int not null identity,
nome varchar(80) not null,
sexo char(1) not null,
RG varchar(6) not null 
primary key (idUsuario),
unique (RG),
check (sexo in('M','F'))
)

insert into cliente
values('Natanel','M','123456')

update cliente
set nome = 'Natanael'

select * from cliente