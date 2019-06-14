create view cliente_consulta_dentista as
select cliente.nome as Cliente, cliente.rg, 
consulta.data, consulta.hora, consulta.valorConsulta, consulta.pago,
dentista.nome, dentista.cfo
from cliente 
join consulta on cliente.idCliente = consulta.idCliente
join dentista on consulta.idDentista = dentista.idDentista;



create view qtd_de_consultas_por_cliente as
select cliente.nome, count(consulta.*) as quantidade
from cliente
join consulta on cliente.idCliente = consulta.idCliente
group by cliente.nome;



create view endereço_completo_cliente as
select cliente.nome, cliente.rua, cliente.numero, cliente.bairro,
cidade.nome, estado.nome
from cliente
join cidade on cliente.idCidade = cidade.idCidade
join estado on cidade.idEstado = estado.idEstado
order by estado.nome;



create view dentista_formacao as
select dentista.nome, dentista.cfo, dentista.rg, dentista.cpf,
formado.data,
especialidade.nome, especialidade.nivel, especialidade.descricao
from dentista
join formado on dentista.idDentista = formado.idDentista
join especialidade on formado.idEspecialidade = especialidade.idEspecialidade;



create view dentista_sem_formacao as
select dentista.nome from dentista
except
select dentista.nome from dentista
join formado on dentista.idDentista = formado.idDentista;



create view consultorio_sem_consulta as
select consultorio.nomeFantasia from consultorio
except
select consultorio.nomeFantasia from consultorio
join consulta on consultorio.idConsultorio = consulta.idConsultorio;



create view valor_total_recebido_por_consultorio as
select sum(consulta.valorConsulta) as Pago, consultorio.nomeFantasia
from consulta
join consultorio on consulta.idConsultorio = consultorio.idConsultorio
where consulta.pago=true
group by consulta.idConsultorio, consultorio.nomeFantasia
order by consultorio.nomeFantasia;



create view valor_total_pendente_por_consultorio as
select sum(consulta.valorConsulta) as pendente, consultorio.nomeFantasia
from consulta
join consultorio on consulta.idConsultorio = consultorio.idConsultorio
where consulta.pago=false
group by consulta.idConsultorio, consultorio.nomeFantasia
order by consultorio.nomeFantasia;



create view comissao_por_dentista as 
select consulta.valorConsulta*0.6 as comissao,
dentista.nome
from consulta
join dentista on consulta.idDentista = dentista.idDentista
where consulta.pago=true;