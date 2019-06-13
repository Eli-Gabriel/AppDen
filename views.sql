
/*cliente_consulta_dentista
select cliente.nome as Cliente, cliente.rg, 
consulta.data, consulta.hora, consulta.valorConsulta, consulta.pago,
dentista.nome, dentista.cfo
from cliente 
join consulta on cliente.idCliente = consulta.idCliente
join dentista on consulta.idDentista = dentista.idDentista;--*/

/*qtd_de_consultas_por_cliente
select cliente.nome, count(consulta.*) as quantidade
from cliente
join consulta on cliente.idCliente = consulta.idCliente
group by cliente.nome;--*/

/*endereço_completo_cliente
select cliente.nome, cliente.rua, cliente.numero, cliente.bairro,
cidade.nome, estado.nome
from cliente
join cidade on cliente.idCidade = cidade.idCidade
join estado on cidade.idEstado = estado.idEstado
order by estado.nome;--*/


/*dentista_e_sua(s)_formação
select dentista.nome, dentista.cfo, dentista.rg, dentista.cpf,
formado.data,
especialidade.nome, especialidade.nivel, especialidade.descricao
from dentista
join formado on dentista.idDentista = formado.idDentista
join especialidade on formado.idEspecialidade = especialidade.idEspecialidade;--*/

/*dentista_sem_formacao
select dentista.nome from dentista
except
select dentista.nome from dentista
join formado on dentista.idDentista = formado.idDentista--*/

/*consultorio_sem_consulta
select consultorio.nomeFantasia from consultorio
except
select consultorio.nomeFantasia from consultorio
join consulta on consultorio.idConsultorio = consulta.idConsultorio--*/

select consultorio.idConsultorio,
--/*valor_total_recebido_por_consultorio
(select sum(consulta.valorConsulta)--,consultorio.nomeFantasia
from consulta
join consultorio on consulta.idConsultorio = consultorio.idConsultorio
where consulta.pago=true ),
--group by consulta.idConsultorio, consultorio.nomeFantasia),--*/

--/*valor_total_pendente_por_consultorio
(select sum(consulta.valorConsulta)--,consultorio.nomeFantasia
from consulta
join consultorio on consulta.idConsultorio = consultorio.idConsultorio
where consulta.pago=false ),
--group by consulta.idConsultorio, consultorio.nomeFantasia)--*/
consultorio.nomeFantasia
from consulta
join consultorio on consulta.idConsultorio = consultorio.idConsultorio
group by consultorio.idConsultorio, consulta.idConsultorio, consultorio.nomeFantasia

/*comissao_por_dentista
select sum(consulta.valorConsulta)*0.6,
Dentista.nome
from consulta
join dentista on consulta.idDentista = dentista.idDentista
where consulta.pago=true 
group by consulta.idDentista, Dentista.nome--*/