--relação de clientes, consultas agendadas e dentista que ira executar a consulta
select 
cliente.nome as "Cliente", cliente.cpf, cliente.telefone, cliente.email, 
consulta.data, consulta.hora, consulta.valorconsulta, consulta.pago, 
dentista.nome as "Dentista", dentista.cfo
from cliente 
join consulta on cliente.idcliente = consulta.idcliente
join dentista on consulta.iddentista = dentista.iddentista;


--relação de clientes e endereços
select 
cliente.nome, cliente.cep, cliente.rua, cliente.numero, cliente.bairro, 
cidade.nome, estado.nome
from cliente 
join cidade on cliente.idcidade = cidade.idcidade
join estado on cidade.idestado = estado.idestado;

--relação de dentistas e formação
select
dentista.nome as "Dentista", dentista.cfo, dentista.rg, dentista.cpf, 
formado.data,
especialidade.nome as "Especialidade", especialidade.nivel
from dentista
join formado on dentista.iddentista = formado.iddentista
join especialidade on formado.idespecialidade  = especialidade.idespecialidade;

--Consultórios e dentistas/atendentes que trabalhem nele
select 
consultorio.nomefantasia as "Consultório", consultorio.cnpj, 
dentista.nome as "Dentista", 
atendente.nome as "Atendente"
from atendente
join consultorio on atendente.idconsultorio = consultorio.idconsultorio
join trabalha on consultorio.idconsultorio = trabalha.idconsultorio
join dentista on trabalha.iddentista = dentista.iddentista;

--

--
--
--
--
--
--
