--Filtrando valores
select * from Hospedes h
where h.dataNascimento is null

select * from Hospedes h
where h.dataNascimento is not null
----------------------------------------------------------------------------
--ordenando resultados
select nome, sexo, CPF
from Hospedes
order by nome asc

select *
from Hospedes
order by nome desc
-----------------------------------------------------------------------------
--agrupar informações 
select h.dataNascimento, COUNT(*)
from Hospedes h
group by h.dataNascimento

--Mostra a quantidade de sexo masculino e feminino.
select sexo, count(*) as 'quantidadeSexo'
from Hospedes h
group by sexo
-----------------------------------------------------------------------------
--sub-consultas

--Pega menos valor e descrição
select s.descricao, s.preco
from Servicos s
where s.preco = (select min(preco) from Servicos)

--pega nome e sexo dos Hospedes com estadias em 2022
select h.nome, h.sexo
from Hospedes h
where h.CPF in (
	select e.hospede
	from Estadias e
	where e.dataEntrada between '01-01-2022' and '31-12-2022'
) 
-----------------------------------------------------------------------------
--funções do SQL
select top 5 CPF, nome, sexo 
from Hospedes

SELECT TOP 10 PERCENT *
FROM estadias

select nome, DATEPART(mm,dataNascimento) --Pega a data 
from Hospedes 
-- yy = ano | qq = trimestre
-- dd = dia | mm = mês
-- hh = horas | mi = minutos
-- ss = segundos | ms = milisegundos

select getdate() --Retorna data atual
select dateADD(dd, 3, getdate()) --adiciona +3 na data atual
select DATEDIFF(dd,'25-04-2024',getdate()) --Valor de diferenciade de uma data para atual.
SELECT DATENAME (mm, getdate()) --Retorna o nome do mês
-----------------------------------------------------------------------------
--Criação de tabelas
select CPF into tabela_fisica from Hospedes

select CPF into #tabela_Local from Hospedes
-- globais e Locais são destruidas
select CPF into ##tabela_Global from Hospedes

create table td_teste(
ds_teste varchar(100) not null
)

insert into td_teste
select nome
from Hospedes
where nome LIKE 'M%'

select * from td_teste
-----------------------------------------------------------------------------
--Junção de tabelas JOIN

select *
from Servicos se
join Solicitacoes s on se.codServico = s.servico



