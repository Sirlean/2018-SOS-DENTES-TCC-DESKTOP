create view view_agendamento
as
select
	Tratamento.id_tratamento,
	Tratamento.id_paciente,
	Paciente.Nome as NomePaciente,
	Paciente.Celular as Celular,
	Tipo_Servico.id_servico,
	Tipo_Servico.Des_servico as NomeServico,
	Tipo_Servico.Tempo_Atendimento,
	Tratamento.id_dentista,
	Funcionario.Nome as NomeDentista,
	Tratamento.data as DataInicio,
	Tratamento.data + convert(datetime, Tipo_Servico.Tempo_Atendimento) as DataFim,
	Tratamento.status
from tratamento
inner join Paciente on Paciente.id_Paciente=Tratamento.id_paciente 
inner join Tipo_Servico on Tipo_Servico.id_servico=Tratamento.id_servico_FK
inner join Funcionario  on Funcionario.id_funcionario  =Tratamento.id_dentista 

