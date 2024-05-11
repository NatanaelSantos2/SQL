--a) Exibir o nome de todos os Hospides
select nome from Hospedes

--b) Exiba todos os dados dos serviços.
select * from Servicos

--c) Mostre o tipo, o valor da diária, e o lucro mensal de cada quarto
--(valor da diária * 31). Renomeie esta última coluna para Valor da Diária/Mês.
select s.tipo, s.valorDiaria, s.valorDiaria * 31 as 'Diária/Mês'
from Quartos s

--d) Mostre a soma e a média dos preços de todos os serviços.
select sum(preco) as 'somaPreco', avg(preco) as 'MediaPreco'
from Servicos

--e) Mostre o valor da diária do quarto mais caro e do mais barato.
select max(valorDiaria) valorDiaria, min(valorDiaria) valorDiaria
from Quartos

--f) Exiba a data de nascimento do hóspede mais novo.
SELECT MAX(dataNascimento) as HospedeNovo
FROM Hospedes

--g) Mostre quantos serviços foram solicitados pelo hóspede de CPF 922411035844.
select count(distinct s.servico) as qauntSolicitacoes
from Solicitacoes s, Hospedes h
where h.CPF = '922411035844'

--h) Mostre quantos hóspedes distintos já tiveram estadias.
select count(distinct hospede) as jativeramEstadias
from Estadias

--i) Mostre a descrição, preço e o preço com 35% de aumento, de todos os serviços.
select descricao, preco, format(preco + (preco * 0.35), '#.00') novoValor
from Servicos

--j) Quais os nomes dos hóspedes que nasceram no ano de 1990?
select nome
from Hospedes
where dataNascimento >= '01-01-1990' and dataNascimento <= '31-12-1990'

--k) Quais os dados dos quartos que possuem valor de diária maior que R$ 300?
select valorDiaria
from Quartos
where valorDiaria >= 300

--l) Mostre os dados de todos os hóspedes que tiveram estadias no ano de 2018.
select h.*, e.dataEntrada
from Hospedes h, Estadias e
where h.CPF = e.hospede and e.dataEntrada >=  '01-01-2018' and dataEntrada <= '31-12-2018'

--m) Exiba os dados dos serviços solicitados em setembro de 2023.
select s.*, so.data
from Servicos s, Solicitacoes so
where s.codServico = so.servico and so.data >= '01-09-2023' and so.data <= '30-09-2023'

--n) Exiba os nomes dos hóspedes e a hora da solicitação do serviço, para hospedes que solicitaram
--serviços de Lavanderia ou de Babá.
select distinct h.nome, so.hora
from Hospedes h, Solicitacoes so, Servicos s
where h.CPF = so.hospede and so.servico = s.codServico  and s.descricao in ('Lavanderia', 'Babá')

--o) Mostre quantos serviços foram solicitados por hóspedes do sexo masculino, no primeiro semestre de 2012.
select count(so.servico) as 'qauntServiços'
from Solicitacoes so, Hospedes h, Servicos s
where so.hospede = h.CPF and s.codServico = so.servico and h.sexo = 'M' and so.data between '01-01-2012' and '30-06-2012'
