USE MASTER;
GO
CREATE DATABASE SOS_DENTES;
go
USE [SOS_DENTES]
GO
CREATE TABLE [dbo].[t_UF](
	[CodUF] [int] IDENTITY(1,1) NOT NULL,
	[UF] [varchar](2) NOT NULL) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Funcionario](
	[id_funcionario] [int] IDENTITY(1,1) NOT NULL primary key,
	[Nome] [varchar](100) NOT NULL,
	[Dt_Nasc] date NOT NULL,
	[RG] [varchar](15) NOT NULL,
	[CPF] [varchar](15) NULL,
	[Genero] [char](15) NOT NULL,
	[Email] [varchar](150) NULL,
	[Tel_fixo] [varchar](15) NOT NULL,
	[Celular] [varchar](15) NOT NULL,
	[Endereco] [varchar](100) NOT NULL,
	[numero] [varchar](20) NOT NULL,
	[Bairro] [varchar](100) NOT NULL,
	[Complemento] [varchar](150) NULL,
	[Cidade] [varchar](100) NOT NULL,
	[Cep] [varchar](8) NOT NULL,
	[CARGO] [varchar](150) NOT NULL,
	[UF] [varchar](2) NOT NULL,
	[Ativo] [int] NOT NULL
) ON [PRIMARY]
GO
CREATE TABLE [dbo].[Paciente](
	[id_Paciente] [int] IDENTITY(1,1) NOT NULL primary key,
	[Nome] [varchar](100) NOT NULL,
	[Dt_Nasc] date NOT NULL,
	[Email] [varchar](150) NOT NULL,
	[Celular] [varchar](15) NOT NULL,
	[RG] [varchar](15) NOT NULL,
	[Tel_Fixo] [varchar](15) NOT NULL,
	[Genero] [varchar](15) NOT NULL,
	[Endereco] [varchar](100) NOT NULL,
	[CPF] [varchar](15) NULL,
	[Bairro] [varchar](100) NOT NULL,
	[Complemento] [varchar](150) NOT NULL,
	[numero] [varchar](20) NULL,
	[CEP] [varchar](10) NOT NULL,
	[UF] [varchar](2) NOT NULL,
	[Cidade] [varchar](100) NOT NULL,
	[Observacao] [text] NULL,
	[Ativo] [int] NULL
) 
GO
GO
CREATE TABLE [dbo].[Tipo_Servico](
	[id_servico] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[Des_servico] [varchar](150) NOT NULL,
	[valor] [decimal](15, 2) NOT NULL,
	[Tempo_Atendimento] [time](7) NOT NULL
)
GO
CREATE TABLE [dbo].[Tratamento](
	[id_tratamento] [int] IDENTITY(1,1) NOT NULL primary key,
	[id_paciente] [int] NOT NULL,
	[id_servico_FK] [int] NOT NULL,
	[Data] [datetime] NOT NULL,
	[status] [varchar](100) NOT NULL,
	[id_dentista] [int] NOT NULL,
	[Ativo] [bit] NOT NULL
)
GO
CREATE view [dbo].[view_agendamento]
AS
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

GO
CREATE TABLE [dbo].[CepFiltradas$](
	[CEP] [nvarchar](255) NULL,
	[UF] [nvarchar](255) NULL,
	[Descricao] [nvarchar](255) NULL,
	[Cidade] [nvarchar](255) NULL,
	[Bairro] [nvarchar](255) NULL
)
GO
CREATE TABLE [dbo].[dentista_servico](
	[id_dentista] [int] NOT NULL,
	[id_servico] [int] NOT NULL,
	primary key ([id_dentista], [id_servico])
)
GO
CREATE TABLE [dbo].[logins](
	[id_logins] [int] IDENTITY(1,1) NOT NULL primary key,
	[email] [varchar](150) NULL,
	[senha] [varchar](50) NULL,
	[cargo] [varchar](100) NULL,
)
GO
ALTER TABLE [dbo].[Tipo_Servico] ADD  DEFAULT ('01:00:00') FOR [Tempo_Atendimento]
GO
ALTER TABLE [dbo].[Tratamento] ADD  DEFAULT ((1)) FOR [Ativo]
GO
ALTER TABLE [dbo].[dentista_servico]  WITH CHECK ADD  CONSTRAINT [fk_dentista_servico] FOREIGN KEY([id_dentista])
REFERENCES [dbo].[Funcionario] ([id_funcionario])
GO
ALTER TABLE [dbo].[dentista_servico] CHECK CONSTRAINT [fk_dentista_servico]

GO
ALTER TABLE [dbo].[Tratamento]  WITH CHECK ADD FOREIGN KEY([id_dentista])
REFERENCES [dbo].[Funcionario] ([id_funcionario])
GO
ALTER TABLE [dbo].[Tratamento]  WITH CHECK ADD FOREIGN KEY([id_paciente])
REFERENCES [dbo].[Paciente] ([id_Paciente])
GO
ALTER TABLE [dbo].[Tratamento]  WITH CHECK ADD CHECK  (([STATUS]='Cancelado' OR [STATUS]='Concluído' OR [STATUS]='Agendado'))
GO
