
select *
from Hospedes

SELECT tipo, valorDiaria, valorDiaria * 31 as Lucro FROM Quartos
SELECT SUM(preco) as valorDiaria, AVG(preco) as mediaPrecos FROM Servicos
SELECT MAX(valorDiaria) as valorQuartos, MIN(valorDiaria) as quartosBaratos FROM Quartos

SELECT COUNT(*) as quantServico FROM Solicitacoes where hospede = '92241103584'
SELECT COUNT(DISTINCT hospede) as hospedesDestinto FROM Solicitacoes

SELECT descricao 'Descrição', preco 'Preço', FORMAT (preco + (preco * 0.35), '#.00') 'novo valor com aumento de 35%'
FROM Servicos

SELECT nome
FROM Hospedes
WHERE dataNascimento >= '01-01-1990' AND dataNascimento <= '31-12-1990'

SELECT valorDiaria FROM Quartos WHERE valorDiaria > 300
--SELECT h. * FROM Hospedes hs

SELECT * from Estadias
where dataEntrada between '01-01-2020' and '03-12-2020'

SELECT * from Estadias
where quarto in (220, 310, 320)

SELECT * from Hospedes
where nome like 'M%'

SELECT * from Hospedes
where nome like 'M_r%'

SELECT * from Hospedes
where nome like '%santos%'

SELECT * from Hospedes
where dataNascimento IS NOT NULL
order by nome, endereco desc


SELECT h.nome, COUNT(*) as quantEstadia
From Estadias e, Hospedes h
where h.CPF = e.hospede
group by h.nome

SELECT nome,descricao from Hospedes,Servicos, Solicitacoes
where data between '2023-01-01' and '2023-07-01'

select s. *
FROM servicos s, Hospedes h, solicitacoes so
where s.codServico = so.servico AND h.CPF = so.hospede AND
h.nome like '%santos%'
order by s.descricao

select sexo, COUNT(*)
from Hospedes
group by sexo

select distinct h.nome
from Hospedes h, Quartos q, Estadias e, Servicos s, Solicitacoes so
where h.CPF = e.hospede AND h.CPF = so.hospede and q.numero = e.quarto
and s.codServico = so.servico and q.valorDiaria > 500 and s.descricao in ('Lanchonete','Passadeira')