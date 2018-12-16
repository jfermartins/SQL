
--tabela Disciplina


create table Disciplina(
idDisciplina int primary key identity(1,1),
nomeDisciplina varchar(100) not null,
docenteDisciplina varchar(100) not null,
cargaHorariaDisciplina numeric(10,0) not null,
idFuncionario int not null,
Constraint fk_Funcionario_Disciplina FOREIGN KEY(idFuncionario) References Funcionario (idFuncionario),
)


--procedure Cadastrar Disciplina


create procedure pi_Disciplina
@nomeDisciplina varchar(100),
@docenteDisciplina varchar(100),
@cargaHorariaDisciplina numeric(10,0),
@idFuncionario int
as
insert into Disciplina (nomeDisciplina,docenteDisciplina,cargaHorariaDisciplina,idFuncionario)
values(@nomeDisciplina,@docenteDisciplina,@cargaHorariaDisciplina,@idFuncionario)


--procedure busca Disciplina

create procedure ps_Disciplina
@nomeDisciplina varchar(100)
as
select*from Disciplina
where nomeDisciplina=@nomeDisciplina


--procedure Disciplina Datagrid View

drop procedure ps_DisciplinaDgv


create procedure ps_DisciplinaDgv
@nomeDisciplina varchar(100)
as
SELECT D.nomeDisciplina [Disciplina], D.docenteDisciplina [Docente], D.cargaHorariaDisciplina [Carga Horaria],F.nomeFuncionario [Funcionario],idDisciplina [idDisciplina]
from Disciplina D
inner JOIN Funcionario F  on D.idFuncionario = F.idFuncionario
where nomeDisciplina like '%' +  @nomeDisciplina + '%'


--procedure Atualizar Disciplina

drop procedure pu_Disciplina

create procedure pu_Disciplina
@idDisciplina int,
@docenteDisciplina varchar(100),
@cargaHorariaDisciplina numeric(10,0),
@idFuncionario int
as
update Disciplina
set docenteDisciplina=@docenteDisciplina,cargaHorariaDisciplina=@cargaHorariaDisciplina,idFuncionario=@idFuncionario
where idDisciplina=@idDisciplina


--procedure para excluir Disciplina

create procedure pd_Disciplina
@idDisciplina int
as
delete Disciplina
where idDisciplina=@idDisciplina


--teste de tabela alunos para testes em inserção de atividades


create table Aluno(
idAluno	int primary key identity(1,1),
nomeAluno	varchar(100) ,
rgAluno	int ,
cpfAluno	numeric(11,0),
dnAluno	datetime,
estadoCivilAluno	varchar(9),
generoAluno	varchar(3),
enderecoAluno	varchar(100),
telResAluno	numeric(11,0),
celAluno	numeric(11,0),
whatsAluno	numeric(11,0),
emailAluno	varchar(50),
obsAluno	varchar(200),
idDisciplina int,
Constraint fk_Disciplina_Aluno FOREIGN KEY(idDisciplina) References Disciplina (idDisciplina),
)


insert into Aluno(nomeAluno,idDisciplina)
values('Kaue',1)

insert into Aluno(nomeAluno,idDisciplina)
values('Nathalia',8)

insert into Aluno(nomeAluno,idDisciplina)
values('Fernanda',9)

select*from Aluno

select*from Disciplina


--tabela Atividade

create table Atividade(
idAtividade int primary key identity(1,1),
nomeAtividade varchar(100) not null,
conteudoAtividade varchar(200)not null,
dtHrAtividade datetime not null,
docenteAtividade varchar(100) not null,
mencaoAtividade numeric(3,0) not null,
faltasAtividade int not null,
idAluno int not null,
idDisciplina int not null,
idFuncionario int not null,
Constraint fk_Aluno_Atividade FOREIGN KEY(idAluno) References Aluno (idAluno),
Constraint fk_Disciplina_Atividade FOREIGN KEY(idDisciplina) References Disciplina (idDisciplina),
Constraint fk_Funcionario FOREIGN KEY(idFuncionario) References Funcionario (idFuncionario),
)



--procedure busca aluno e disciplina para inserção em Atividades



create procedure ps_BuscaAlunoDisciplina
@nomeAluno varchar(100)
as
SELECT A.nomeAluno[Aluno],D.nomeDisciplina[Disciplina],A.idAluno,A.idDisciplina 
from Aluno A
left JOIN Disciplina D  on A.idDisciplina=D.idDisciplina
where nomeAluno like '%' +  @nomeAluno + '%'
order by A.nomeAluno

drop procedure ps_BuscaAlunoDisciplina


select*from Atividade
exec ps_BuscaAlunoDisciplina 'Nath'


--procedure inserção atividade

create procedure pi_Atividade
@nomeAtividade varchar(100),
@conteudoAtividade varchar(200),
@dtHrAtividade datetime,
@docenteAtividade varchar(100),
@mencaoAtividade numeric(3,0),
@faltasAtividade int,
@idAluno int,
@idDisciplina int,
@idFuncionario int
as
insert into Atividade (nomeAtividade,conteudoAtividade, dtHrAtividade,docenteAtividade,mencaoAtividade,faltasAtividade,idAluno,idDisciplina,idFuncionario)
values (@nomeAtividade,@conteudoAtividade,@dtHrAtividade,@docenteAtividade,@mencaoAtividade,@faltasAtividade,@idAluno,@idDisciplina,@idFuncionario)

select*from Atividade

--procedure busca atividade

drop procedure ps_Atividade

create procedure ps_Atividade
@nomeAtividade varchar(100)
as
SELECT At.nomeAtividade[Atividade], A.nomeAluno[Aluno],D.nomeDisciplina[Disciplina],At.conteudoAtividade[Conteudo], At.dtHrAtividade[Data e Hora],At.docenteAtividade[Docente],At.mencaoAtividade[Nota],At.faltasAtividade[Faltas],At.idAtividade,D.idDisciplina,A.idAluno
from Atividade At
inner JOIN  Disciplina D on At.idDisciplina= D.idDisciplina
inner JOIN Aluno A  ON A.idAluno = At.idAluno
where nomeAtividade like '%' +  @nomeAtividade + '%'

drop procedure ps_Atividade

exec ps_Atividade 'fa'


--procedure alterar Atividade

create procedure pu_Atividade
@nomeAtividade varchar(100),
@conteudoAtividade varchar(200),
@dtHrAtividade datetime,
@docenteAtividade varchar(100),
@mencaoAtividade numeric(3,0),
@faltasAtividade int,
@idAluno int,
@idDisciplina int,
@idFuncionario int,
@idAtividade int
as
update Atividade
set nomeAtividade=@nomeAtividade,conteudoAtividade=@conteudoAtividade,dtHrAtividade=@dtHrAtividade,docenteAtividade=@docenteAtividade,mencaoAtividade=@mencaoAtividade,faltasAtividade=@faltasAtividade,idAluno=@idAluno,idDisciplina=@idDisciplina,idFuncionario=@idFuncionario
where idAtividade=@idAtividade

--procedure deletar atividade


create procedure pd_Atividade
@idAtividade int
as
delete Atividade
where idAtividade=@idAtividade


sp_helptext pd_Atividade


insert into Aluno
Values('Nathalia','215424',21452214,'01/10/2000','solteiro','m','rua',12321412,5424455,21455,'kaue@','',3)

insert  into Funcionario
values('Jane','231542',214545,'01/12/1986','rua alguma',21315,2154245,'jfer','sei la','Admin','20/03/2000','','f','s','05/10/2000',2000,'jane.fer','abc123')

select*from Atividade

--calcular média


select idAluno, sum(mencaoAtividade) as 'mencao',avg(mencaoAtividade) as 'media',sum(faltasAtividade) as 'Faltas'
from Atividade group by idAluno


select*from Atividade

--tabela média

create table MediaeFaltas(
idMediaeFaltas int primary key identity(1,1),
notaMediaeFaltas numeric(3,2) not null,
faltasMediaeFaltas int not null,
idAluno int not null,
idDisciplina int not null,
Constraint fk_Aluno_mediaseFaltas FOREIGN KEY(idAluno) References Aluno (idAluno),
Constraint fk_DisciplinamediaeFaltas FOREIGN KEY(idDisciplina) References Disciplina (idDisciplina),
)


drop table MediaeFaltas


--procedure inserir médias

create procedure pi_MediaeFaltas
@notaMediaeFaltas numeric(3,2),
@faltasMediaeFaltas int,
@idAluno int,
@idDisciplina int
as
insert into MediaeFaltas(notaMediaeFaltas,faltasMediaeFaltas,idAluno,idDisciplina)
values(@notaMediaeFaltas,@faltasMediaeFaltas,@idAluno,@idDisciplina)


drop procedure pi_MediaeFaltas



exec pi_MediaeFaltas 3.5555,2,1,1

select*from MediaeFaltas


--join para notas e faltas


select * from Material

 create procedure ps_NotasDGV
 @nomeAluno varchar(100)
 as
SELECT A.idAluno,A.nomeAluno,D.idDisciplina,D.nomeDisciplina,sum(At.mencaoAtividade) as 'mencao',avg(At.mencaoAtividade) as 'media',sum(At.faltasAtividade) as 'Faltas'
from Atividade At
inner JOIN Disciplina D  on At.idDisciplina=D.idDisciplina
inner join Aluno A  on A.idAluno=At.idAluno 
where nomeAluno like '%' +  @nomeAluno + '%' group by A.idAluno,A.nomeAluno,D.idDisciplina,D.nomeDisciplina
order by A.nomeAluno asc



--procedure busca simples notas e faltas


create procedure ps_notas
@idAluno int
as
select*from MediaeFaltas
where idAluno=@idAluno

4,2

select*from sys.procedures








SELECT A.idAluno,A.nomeAluno,D.idDisciplina,D.nomeDisciplina,sum(At.mencaoAtividade) as 'mencao',avg(At.mencaoAtividade) as 'media',sum(At.faltasAtividade) as 'Faltas' from Atividade At inner JOIN Disciplina D  on At.idDisciplina=D.idDisciplina inner join Aluno A  on A.idAluno=At.idAluno  group by A.idAluno,A.nomeAluno,D.idDisciplina,D.nomeDisciplina
      
	
	
	--procedure busca cronograma
	
	create procedure ps_BuscaCronograma
	@nomeDisciplina varchar(100)
	as
	select idDisciplina,nomeDisciplina
	from Disciplina
	where nomeDisciplina like '%' +  @nomeDisciplina + '%'



	--tabela cronograma

	create table CronogramaSala(
idCronograma int primary key identity(1,1),
dtHrSala datetime not null,
nomeDocenteSala varchar(20) not null,
disciplinaSala varchar(20) not null,
turmaSala varchar(10) not null,
dadosSala varchar(20) not null,
idDisciplina int not null,
idFuncionario int not null,
Constraint fk_Disciplina_Cronograma FOREIGN KEY(idDisciplina) References Disciplina (idDisciplina),
Constraint fk_Funcionario_Cronograma FOREIGN KEY(idFuncionario) References Funcionario (idFuncionario),
)
	  

	  drop procedure pi_CronogramaSala

	  --procedure cadastrar cronograma

	  create procedure pi_CronogramaSala
	  @dtHrSala datetime,
	  @nomeDocenteSala varchar(20),
@disciplinaSala varchar(20) ,
@turmaSala varchar(10),
@dadosSala varchar(20) ,
@idDisciplina int ,
@idFuncionario int 
 as 
 insert into CronogramaSala (dtHrSala,nomeDocenteSala,disciplinaSala,turmaSala,dadosSala,idDisciplina,idFuncionario)
 values( @dtHrSala,@nomeDocenteSala,@disciplinaSala,@turmaSala,@dadosSala,@idDisciplina,@idFuncionario)


 drop procedure pi_CronogramaSala

 --procedure busca sala

 create procedure ps_Sala
@dadosSala varchar(20) 
as
select C.dadosSala[Sala],C.DisciplinaSala[Disciplina],C.nomeDocenteSala[Docente],C.dtHrSala [Data e hora],C.turmaSala[Turma],C.idDisciplina[cod Disciplina],F.nomeFuncionario[Funcionario],C.idFuncionario[Cod Funcionario],idCronograma[CodSala]
from CronogramaSala C
inner join Funcionario F on C.idFuncionario=F.idFuncionario
where dadosSala=@dadosSala

drop procedure ps_Sala


--procedure alterar cronograma

create procedure pu_CronogramaSala
@dtHrSala datetime,
@nomeDocenteSala varchar(20),
@disciplinaSala varchar(20) ,
@turmaSala varchar(10),
@dadosSala varchar(20) ,
@idDisciplina int ,
@idFuncionario int,
@idCronograma int
as
update CronogramaSala
set dtHrSala=@dtHrSala,nomeDocenteSala=@nomeDocenteSala,disciplinaSala=@disciplinaSala,turmaSala=@turmaSala,dadosSala=@dadosSala,idDisciplina=@idDisciplina,idFuncionario=@idFuncionario
where idCronograma=@idCronograma


drop Procedure pu_CronogramaSala


--procedure deletar cronograma

create procedure pd_Cronograma
@idCronograma int
as 
delete CronogramaSala
where idCronograma=@idCronograma

SP_HELPTEXT pi_CadastroAluno

select*from Aluno

CREATE PROCEDURE pi_CadastroAluno(    
@nomeAluno   VARCHAR (100),    
@rgAluno   VARCHAR (50),    
@cpfAluno   NUMERIC (11,0),    
@dnAluno   DATETIME,    
@estadoCivilAluno VARCHAR (100),    
@generoAluno  VARCHAR (20),    
@enderecoAluno  VARCHAR (100),    
@telResAluno  NUMERIC (11,0),    
@celAluno   NUMERIC (11,0) = NULL,    
@whatsAluno   NUMERIC (11,0) = NULL,    
@emailAluno   VARCHAR (100),    
@obsAluno   VARCHAR (8000),
@idDisciplina int  
)    
AS    
INSERT INTO Aluno(nomeAluno, rgAluno, cpfAluno, dnAluno, estadoCivilAluno, generoAluno, enderecoAluno, telResAluno, celAluno, whatsAluno, emailAluno, obsAluno,idDisciplina)    
VALUES (@nomeAluno, @rgAluno, @cpfAluno, @dnAluno, @estadoCivilAluno, @generoAluno, @enderecoAluno, @telResAluno, @celAluno, @whatsAluno, @emailAluno, @obsAluno,@idDisciplina) 


drop procedure  pi_CadastroAluno

SELECT * FROM Aluno

create procedure ps_BuscaAlunoDisciplina  
@nomeAluno varchar(100)  
as  
SELECT A.nomeAluno[Aluno],D.nomeDisciplina[Disciplina],A.idAluno,A.idDisciplina   
from Aluno A  
left JOIN Disciplina D  on A.idDisciplina=D.idDisciplina  
where nomeAluno like '%' +  @nomeAluno + '%'

drop procedure ps_BuscaAlunoDisciplina 

create procedure ps_BuscaAlunoDisciplina
@nomeAluno varchar(100)
as
SELECT A.nomeAluno[Aluno],D.nomeDisciplina[Disciplina],A.idAluno,D.idDisciplina 
from Aluno A
left JOIN Disciplina D on A.idDisciplina=D.idDisciplina
where nomeAluno like '%' +  @nomeAluno + '%'




drop procedure ps_BuscaAlunoAtividade

select*from Disciplina

insert into Aluno
values('Jane','21542',23214521,'01/12/1985','solteira','feminino','rua',21214521,25421,214522,'jfer','',2)


CREATE PROCEDURE ps_buscaDisciplinaMatricula
@nomeDisciplina varchar(100)
as 
select*from Disciplina
where nomeDisciplina like '%' +  @nomeDisciplina + '%'

drop procedure ps_buscaDisciplinaMatricula


--procedure busca laboratorio Nathy

CREATE PROCEDURE ps_BuscarLaboratorioDgv
@nomeLaboratorio varchar(100)
as 
select*from Laboratorio
where nomeLaboratorio like '%' +  @nomeLaboratorio + '%'

