--relação de clientes e consultas agendadas
select 
cliente.nome, cliente.rg, cliente.cpf, cliente.telefone, cliente.email, 
consulta.data, consulta.hora, consulta.valorconsulta, consulta.pago  
from 
cliente join consulta on cliente.idcliente = consulta.idcliente;


--relação de clientes e endereços
select 
cliente.nome, cliente.rg, cliente.cpf, 
cidade.nomecidade, estado.nomeestado
from cliente 
join cidade on cliente.idcidade = cidade.idcidade
join estado on cidade.idestado = estado.idestado;

--relação de clientes e parentes
/*select
cliente.nome as "Cliente", parentesco.tipoparente, cliente.nome as "Parente"
from cliente
join parentesco on cliente.idcliente = parentesco.idcliente
and parentesco.idparente = cliente.idcliente;*/

--relação de dentistas e formação
select
dentista.nome, dentista.cfo, dentista.rg, dentista.cpf, 
especialidade.nome, especialidade.nivel
from dentista
join formado on dentista.iddentista = formado.iddentista
join especialidade on formado.idespecialidade  = especialidade.idespecialidade;
;
--
--
--
--
--
--
--
--
