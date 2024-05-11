
--Proxima atividade

--a) Mostre os nomes dos hóspedes e a descrição dos serviços solicitados, para cada hóspede que
--solicitou serviço no segundo semestre de 2023.
select h.nome,s.descricao
from Hospedes h, Solicitacoes so, Servicos s
where h.CPF = so.hospede and so.servico = s.codServico and so.data between '01-07-2023' and '31-12-2023'

--b) Exiba os dados dos serviços solicitados por hóspedes cujo nome tenha “Santos” em qualquer parte.
--Ordene pela descrição do serviço.
select *
from Hospedes h, Solicitacoes so, Servicos s
where h.CPF = so.hospede and so.servico = s.codServico and h.nome like '%santos%'
order by s.descricao

--c) Mostre os nomes dos hóspedes e as datas de suas estadias, para hospedes que tiveram estadias
--em quartos do tipo Standard ou Luxo Superior em 2012.
select h.nome, e.dataEntrada, e.dataSaida
from Hospedes h, Estadias e, Quartos q
where h.CPF = e.hospede and e.quarto = q.numero and q.tipo in('Luxo Superior','Standard') and e.dataEntrada between '01-01-2012' and '31-12-2012'

--d) Mostre as datas de entrada e saída das estadias realizadas por hóspedes que informaram a data de
--nascimento. Ordene pela data de entrada em ordem descendente.
select e.dataEntrada, e.dataSaida
from Estadias e, Hospedes h
where e.hospede = h.CPF and h.dataNascimento is not null
order by e.dataEntrada desc

--e) Quais as datas e horas dos serviços solicitados por hóspedes do sexo feminino?
select so.data, so.hora, h.nome
from Solicitacoes so, Hospedes h, Servicos s
where so.hospede = h.CPF and  s.codServico = so.servico and h.sexo = 'F'

--f) Mostre a quantidade de hóspedes por sexo.
select h.sexo, COUNT(*) as quantidade
from Hospedes h
group by sexo

--g) Mostre, para cada serviço, a sua descrição e uma média de preços pagos, apenas para serviços
--solicitados entre os anos de 2015 e 2018.
select s.descricao, avg(s.preco) as 'mediaPreços'
from Servicos s, Solicitacoes so
where s.codServico = so.servico and so.data between '01-01-2015' and '31-12-2018'
group by s.descricao

--h) Exiba os distintos nomes dos hóspedes que tiveram estadias em quartos cujo valor da diária é
--maior que R$500, e que solicitaram serviço de Lanchonete ou Passadeira.
select distinct h.nome
from Hospedes h, Estadias e, Quartos q, Servicos s, Solicitacoes so
where h.CPF = e.hospede and so.hospede = h.CPF and e.quarto = q.numero and s.codServico = so.servico and s.descricao in('Lanchonete','Passadeira') and q.valorDiaria > 500

--i) Mostre, para cada quarto, o seu tipo, valor de diária e quantidade de estadias. Ordene pelo tipo do quarto.
select q.tipo, q.valorDiaria, count(*) as qauntEstadias
from Quartos q
group by q.tipo, q.valorDiaria
order by q.tipo