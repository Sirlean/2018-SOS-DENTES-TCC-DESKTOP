use SOS_DENTES;
go
insert into Tipo_Servico (Des_servico, Valor, Tempo_Atendimento) values ('Restauração','150.00','02:00');
insert into Tipo_Servico (Des_servico, Valor, Tempo_Atendimento) values ('Limpeza','150.00','01:00');
insert into Tipo_Servico (Des_servico, Valor, Tempo_Atendimento) values ('Extração','150.00','03:00');
insert into Tipo_Servico (Des_servico, Valor, Tempo_Atendimento) values ('Canal','150.00','03:00');
go
--Insert funcionário 
INSERT INTO Funcionario VALUES ('ADRIAN GONÇALVES','03/03/2001','547161979','50321748824','MASCULINO','adrianamazonas2015@gmail.com',
'123456789','11982138584','Rua Alfa','257', 'Vila Gióia', 'apt 322B apto 3B', 'Itapevi', '06680103', 'Dentista', 'SP',1)
INSERT INTO Funcionario VALUES ('JOAO','03/03/2001','547161979','50321748824','MASCULINO','adrianamazonas2015@gmail.com',
'123456789','11982138584','Rua Alfa','257', 'Vila Gióia', 'apt 322B apto 3B', 'Itapevi', '06680103', 'Dentista', 'SP',1)
INSERT INTO Funcionario VALUES ('JOSÉ','03/03/2001','547161979','50321748824','MASCULINO','adrianamazonas2015@gmail.com',
'123456789','11982138584','Rua Alfa','257', 'Vila Gióia', 'apt 322B apto 3B', 'Itapevi', '06680103', 'Dentista', 'SP',1)

go

--Insert Paciente
INSERT INTO Paciente VALUES('adrian','03/03/2001','adrianamazonas2015@gmail.com','11982138584','547161979','1141449520','Masculino','rua alfa','50321748824','vila gióia','','257','06657230','sp','itapevi','',1)
INSERT INTO Paciente VALUES('LUCAS','03/03/2001','','11982138584','547161979','1141449520','Masculino','rua alfa','50321748824','vila gióia','','257','06657230','sp','itapevi','',1)
INSERT INTO Paciente VALUES('PEDRO','03/03/2001','','11982138584','547161979','1141449520','Masculino','rua alfa','50321748824','vila gióia','','257','06657230','sp','itapevi','',1)
INSERT INTO Paciente VALUES('MARCELO','03/03/2001','','11982138584','547161979','1141449520','Masculino','rua alfa','50321748824','vila gióia','','257','06657230','sp','itapevi','',1)
INSERT INTO Paciente VALUES('MARIA','09/09/1998','','11982138584','547161979','1141449520','Feminino','rua alfa','50321748824','vila gióia','','257','06657230','sp','itapevi','',1)

go

insert into t_UF(UF) values ('AL')
insert into t_UF(UF) values ('AP')
insert into t_UF(UF) values ('AM')
insert into t_UF(UF) values ('BA')
insert into t_UF(UF) values ('CE')
insert into t_UF(UF) values ('DF')
insert into t_UF(UF) values ('ES')
insert into t_UF(UF) values ('GO')
insert into t_UF(UF) values ('MA')
insert into t_UF(UF) values ('MT')
insert into t_UF(UF) values ('MS')
insert into t_UF(UF) values ('MG')
insert into t_UF(UF) values ('PA')
insert into t_UF(UF) values ('PB')
insert into t_UF(UF) values ('PR')
insert into t_UF(UF) values ('PE')
insert into t_UF(UF) values ('PI')
insert into t_UF(UF) values ('RJ')
insert into t_UF(UF) values ('RN')
insert into t_UF(UF) values ('RS')
insert into t_UF(UF) values ('RO')
insert into t_UF(UF) values ('RR')
insert into t_UF(UF) values ('SC')
insert into t_UF(UF) values ('SP')
insert into t_UF(UF) values ('SE')
insert into t_UF(UF) values ('TO')

go

INSERT INTO logins VALUES
('ADM','123456','RECEPCIONISTA'),
('joao','123456','DENTISTA')

go


insert into dentista_servico (id_dentista, id_servico) values (1,1);
insert into dentista_servico (id_dentista, id_servico) values (1,2);
insert into dentista_servico (id_dentista, id_servico) values (1,3);
insert into dentista_servico (id_dentista, id_servico) values (2,1);
insert into dentista_servico (id_dentista, id_servico) values (2,2);
insert into dentista_servico (id_dentista, id_servico) values (3,3);

go

