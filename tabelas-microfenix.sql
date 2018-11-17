USE [master]
GO
/****** Object:  Database [MICROFENIX]    Script Date: 08/12/2017 00:22:40 ******/
CREATE DATABASE [MICROFENIX]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MICROFENIX', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\MICROFENIX.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'MICROFENIX_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\MICROFENIX_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [MICROFENIX] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MICROFENIX].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MICROFENIX] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MICROFENIX] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MICROFENIX] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MICROFENIX] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MICROFENIX] SET ARITHABORT OFF 
GO
ALTER DATABASE [MICROFENIX] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MICROFENIX] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [MICROFENIX] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MICROFENIX] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MICROFENIX] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MICROFENIX] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MICROFENIX] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MICROFENIX] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MICROFENIX] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MICROFENIX] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MICROFENIX] SET  DISABLE_BROKER 
GO
ALTER DATABASE [MICROFENIX] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MICROFENIX] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MICROFENIX] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MICROFENIX] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MICROFENIX] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MICROFENIX] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MICROFENIX] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MICROFENIX] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [MICROFENIX] SET  MULTI_USER 
GO
ALTER DATABASE [MICROFENIX] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MICROFENIX] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MICROFENIX] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MICROFENIX] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [MICROFENIX]
GO
/****** Object:  User [sistema.microfenix]    Script Date: 08/12/2017 00:22:40 ******/
CREATE USER [sistema.microfenix] FOR LOGIN [sistema.microfenix] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [sistema.microfenix]
GO
/****** Object:  StoredProcedure [dbo].[pd_Atividade]    Script Date: 08/12/2017 00:22:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[pd_Atividade]
@idAtividade int
as
delete Atividade
where idAtividade=@idAtividade

GO
/****** Object:  StoredProcedure [dbo].[pd_CadastroAluno]    Script Date: 08/12/2017 00:22:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[pd_CadastroAluno]

@cpfAluno   NUMERIC (11,0)

AS

DECLARE @idAluno	INT

SELECT @idAluno = idAluno

FROM Aluno

WHERE cpfAluno = @cpfAluno

DELETE MediaeFaltas

WHERE @idAluno = idAluno

DELETE MatriculaAluno

WHERE @idAluno = idAluno

DELETE Atividade

WHERE @idAluno = idAluno

DELETE Aluno

WHERE cpfAluno = @cpfAluno


GO
/****** Object:  StoredProcedure [dbo].[pd_Cronograma]    Script Date: 08/12/2017 00:22:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[pd_Cronograma]
@idCronograma int
as 
delete CronogramaSala
where idCronograma=@idCronograma
GO
/****** Object:  StoredProcedure [dbo].[pd_Disciplina]    Script Date: 08/12/2017 00:22:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[pd_Disciplina]
@idDisciplina int
as
delete Disciplina
where idDisciplina=@idDisciplina


GO
/****** Object:  StoredProcedure [dbo].[pd_Funcionario2]    Script Date: 08/12/2017 00:22:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[pd_Funcionario2]

@usuarioFuncionario VARCHAR(100)

as

delete Funcionario

where usuarioFuncionario = @usuarioFuncionario


GO
/****** Object:  StoredProcedure [dbo].[pd_Laboratorio]    Script Date: 08/12/2017 00:22:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[pd_Laboratorio]
@idLaboratorio              INT
AS
DELETE Laboratorio
WHERE idLaboratorio = @idLaboratorio


GO
/****** Object:  StoredProcedure [dbo].[pd_Material]    Script Date: 08/12/2017 00:22:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[pd_Material] 

@nomeMaterial VARCHAR(100)

as

delete Material

where nomeMaterial = @nomeMaterial

	

GO
/****** Object:  StoredProcedure [dbo].[pd_MatriculaAluno]    Script Date: 08/12/2017 00:22:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[pd_MatriculaAluno]

@cpfAluno   NUMERIC (11,0)

AS

DECLARE @idAluno	INT

SELECT @idAluno = idAluno

FROM Aluno

DELETE MatriculaAluno

WHERE @idAluno = idAluno
	

GO
/****** Object:  StoredProcedure [dbo].[pd_OcorrenciaGeral]    Script Date: 08/12/2017 00:22:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[pd_OcorrenciaGeral]
@codOcorrencia INT
AS
DELETE OcorrenciaGeral
WHERE codOcorrencia = @CodOcorrencia

GO
/****** Object:  StoredProcedure [dbo].[pd_OcorrenciaLaboratorio]    Script Date: 08/12/2017 00:22:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[pd_OcorrenciaLaboratorio]
@idOcorrenciaLaboratorio    INT 
 AS
DELETE OcorrenciaLaboratorio
WHERE idOcorrenciaLaboratorio = @idOcorrenciaLaboratorio

GO
/****** Object:  StoredProcedure [dbo].[pi_Atividade]    Script Date: 08/12/2017 00:22:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[pi_Atividade]
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

GO
/****** Object:  StoredProcedure [dbo].[pi_CadastroAluno]    Script Date: 08/12/2017 00:22:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[pi_CadastroAluno](
@nomeAluno			VARCHAR (100),
@rgAluno			INT,
@cpfAluno			NUMERIC (11,0),
@dnAluno			DATETIME,
@estadoCivilAluno	VARCHAR (100),
@generoAluno		VARCHAR (20),
@enderecoAluno		VARCHAR (100),
@telResAluno		NUMERIC (11,0),
@celAluno			NUMERIC (11,0) = NULL,
@whatsAluno			NUMERIC (11,0) = NULL,
@emailAluno			VARCHAR (100),
@obsAluno			VARCHAR (8000)
)
AS
INSERT INTO Aluno(nomeAluno, rgAluno, cpfAluno, dnAluno, estadoCivilAluno, generoAluno, enderecoAluno, telResAluno, celAluno, whatsAluno, emailAluno, obsAluno)
VALUES (@nomeAluno, @rgAluno, @cpfAluno, @dnAluno, @estadoCivilAluno, @generoAluno, @enderecoAluno, @telResAluno, @celAluno, @whatsAluno, @emailAluno, @obsAluno)


GO
/****** Object:  StoredProcedure [dbo].[pi_CronogramaSala]    Script Date: 08/12/2017 00:22:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	  create procedure [dbo].[pi_CronogramaSala]
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


GO
/****** Object:  StoredProcedure [dbo].[pi_Disciplina]    Script Date: 08/12/2017 00:22:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[pi_Disciplina]
@nomeDisciplina varchar(100),
@docenteDisciplina varchar(100),
@cargaHorariaDisciplina numeric(10,0),
@idFuncionario int
as
insert into Disciplina (nomeDisciplina,docenteDisciplina,cargaHorariaDisciplina,idFuncionario)
values(@nomeDisciplina,@docenteDisciplina,@cargaHorariaDisciplina,@idFuncionario)

GO
/****** Object:  StoredProcedure [dbo].[pi_Funcionario2]    Script Date: 08/12/2017 00:22:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[pi_Funcionario2] 

@nomeFuncionario VARCHAR(100),

@rgFuncionario VARCHAR(20),

@cpfFuncionario NUMERIC(11,0),

@dtNascFuncionario DATETIME ,

@endFuncionario VARCHAR(200),

@telFuncionario NUMERIC(15,0),

@whatsFuncionario NUMERIC(15,0),

@emailFuncionario VARCHAR(100),

@escolaridadeFuncionario VARCHAR(200),

@cargoFuncionario VARCHAR(100),

@dtemissao DATETIME ,

@dtdemissao DATETIME ,

@sexoFuncionario VARCHAR(10),

@estcivilFuncionario VARCHAR(20),

@dtPgtoFuncionario DATETIME ,

@valorSalarioFuncionario NUMERIC(10,2),

@usuarioFuncionario VARCHAR(100),

@senhaFuncionario VARCHAR(100)

AS

INSERT INTO Funcionario (nomeFuncionario, rgFuncionario, cpfFuncionario, dtNascFuncionario, endFuncionario, telFuncionario, whatsFuncionario, emailFuncionario, escolaridadeFuncionario, cargoFuncionario, dtemissao, dtdemissao, sexoFuncionario, estcivilFuncionario, dtPgtoFuncionario, valorSalarioFuncionario, usuarioFuncionario, senhaFuncionario)

values (@nomeFuncionario, @rgFuncionario, @cpfFuncionario, @dtNascFuncionario, @endFuncionario, @telFuncionario, @whatsFuncionario, @emailFuncionario, @escolaridadeFuncionario, @cargoFuncionario, @dtemissao, @dtdemissao, @sexoFuncionario, @estcivilFuncionario, @dtPgtoFuncionario, @valorSalarioFuncionario, @usuarioFuncionario, @senhaFuncionario)

GO
/****** Object:  StoredProcedure [dbo].[pi_Laboratorio]    Script Date: 08/12/2017 00:22:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[pi_Laboratorio]
@nomeLaboratorio            VARCHAR(20),
@horarioLaboratorio         DATETIME,
@nomeTecLaboratorio         VARCHAR(20),
@rgTecLaboratorio          VARCHAR(20),
@idFuncionario int
as
insert into Laboratorio (nomeLaboratorio, horarioLaboratorio, nomeTecLaboratorio, rgTecLaboratorio,idFuncionario)
values (@nomeLaboratorio, @horarioLaboratorio, @nomeTecLaboratorio, @rgTecLaboratorio,@idFuncionario)

GO
/****** Object:  StoredProcedure [dbo].[pi_MatriculaAluno]    Script Date: 08/12/2017 00:22:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[pi_MatriculaAluno]



@dataMatriculaAluno		DATETIME,



@valorTotalPagtoAluno	NUMERIC (10,2),



@formaPagtoAluno		VARCHAR (50),



@modoPagtoParcelado		VARCHAR (50),



@obsMatriculaAluno		VARCHAR (8000),

@idAluno				INT,
@idDisciplina int

AS

INSERT INTO MatriculaAluno(dataMatriculaAluno, valorTotalPagtoAluno, formaPagtoAluno, modoPagtoParcelado, obsMatriculaAluno, idAluno,idDisciplina)


VALUES (@dataMatriculaAluno, @valorTotalPagtoAluno, @formaPagtoAluno, @modoPagtoParcelado, @obsMatriculaAluno, @idAluno,@idDisciplina)

GO
/****** Object:  StoredProcedure [dbo].[pi_MediaeFaltas]    Script Date: 08/12/2017 00:22:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[pi_MediaeFaltas]
@notaMediaeFaltas numeric(3,2),
@faltasMediaeFaltas int,
@idAluno int,
@idDisciplina int
as
insert into MediaeFaltas(notaMediaeFaltas,faltasMediaeFaltas,idAluno,idDisciplina)
values(@notaMediaeFaltas,@faltasMediaeFaltas,@idAluno,@idDisciplina)


GO
/****** Object:  StoredProcedure [dbo].[pi_OcorrenciaGeral]    Script Date: 08/12/2017 00:22:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[pi_OcorrenciaGeral]
@codOcorrencia              INTEGER,
@dtOcorrencia               DATETIME,
@hrOcorrencia               DATETIME,
@dtAtendOcorrencia          DATETIME,
@hrAtendOcorrencia         DATETIME,
@descrOcorrencia           VARCHAR(200),
@nomeTecOcorrencia         VARCHAR(20),
@regTecOcorrencia          VARCHAR(20) ,
@setorTecOcorrencia        VARCHAR(10),
@descrEquipOcorrencia      VARCHAR(200),
@qtdEquipOcorrencia        INTEGER,
@nomeEnvOcorrencia         VARCHAR(20),
@medidaOcorrencia          VARCHAR(200),
@solucaoOcorrencia         VARCHAR(200),
@idFuncionario int
as
insert into OcorrenciaGeral (codOcorrencia, dtOcorrencia, hrOcorrencia, dtAtendOcorrencia, hrAtendOcorrencia, descrOcorrencia,nomeTecOcorrencia,regTecOcorrencia, setorTecOcorrencia, descrEquipOcorrencia, qtdEquipOcorrencia, nomeEnvOcorrencia, medidaOcorrencia, solucaoOcorrencia,idFuncionario)
values (@codOcorrencia, @dtOcorrencia, @hrOcorrencia, @dtAtendOcorrencia, @hrAtendOcorrencia, @descrOcorrencia, @nomeTecOcorrencia, @regTecOcorrencia, @setorTecOcorrencia, @descrEquipOcorrencia, @qtdEquipOcorrencia, @nomeEnvOcorrencia, @medidaOcorrencia, @solucaoOcorrencia,@idFuncionario)


GO
/****** Object:  StoredProcedure [dbo].[pi_OcorrenciaLaboratorio]    Script Date: 08/12/2017 00:22:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[pi_OcorrenciaLaboratorio]
@natOcorLaboratorio     varchar (100),
@dtOcorLaboratorio  DATETIME,
@hrOcorLaboratorio  DATETIME,
@provOcrLaboratorio  VARCHAR(200),
@solucaoOcorLaboratorio VARCHAR(200),
@idFuncionario int
as
insert into OcorrenciaLaboratorio(natOcorLaboratorio,dtOcorLaboratorio, hrOcorLaboratorio,provOcrLaboratorio, solucaoOcorLaboratorio,idFuncionario)
values (@natOcorLaboratorio, @dtOcorLaboratorio, @hrOcorLaboratorio, @provOcrLaboratorio, @solucaoOcorLaboratorio,@idFuncionario)


GO
/****** Object:  StoredProcedure [dbo].[ps_Atividade]    Script Date: 08/12/2017 00:22:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[ps_Atividade]
@nomeAtividade varchar(100)
as
SELECT At.nomeAtividade[Atividade], A.nomeAluno[Aluno],D.nomeDisciplina[Disciplina],At.conteudoAtividade[Conteudo], At.dtHrAtividade[Data e Hora],At.docenteAtividade[Docente],At.mencaoAtividade[Nota],At.faltasAtividade[Faltas],At.idAtividade,D.idDisciplina,A.idAluno
from Atividade At
inner JOIN  Disciplina D on At.idDisciplina= D.idDisciplina
inner JOIN Aluno A  ON A.idAluno = At.idAluno
where nomeAtividade like '%' +  @nomeAtividade + '%'
GO
/****** Object:  StoredProcedure [dbo].[ps_BuscaAlunoDisciplina]    Script Date: 08/12/2017 00:22:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[ps_BuscaAlunoDisciplina]
@nomeAluno varchar(100)
as
SELECT A.nomeAluno[Aluno],D.nomeDisciplina[Disciplina],A.idAluno,MA.idDisciplina 
from Aluno A
inner JOIN MatriculaAluno MA  on A.idAluno=MA.idAluno
inner join Disciplina D on MA.idDisciplina=D.idDisciplina
where nomeAluno like '%' +  @nomeAluno + '%'
order by A.nomeAluno
GO
/****** Object:  StoredProcedure [dbo].[ps_BuscaCronograma]    Script Date: 08/12/2017 00:22:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[ps_BuscaCronograma]
	@nomeDisciplina varchar(100)
	as
	select idDisciplina,nomeDisciplina
	from Disciplina
	where nomeDisciplina like '%' +  @nomeDisciplina + '%'
GO
/****** Object:  StoredProcedure [dbo].[ps_buscaDisciplinaMatricula]    Script Date: 08/12/2017 00:22:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ps_buscaDisciplinaMatricula]
@nomeDisciplina varchar(100)
as 
select*from Disciplina
where nomeDisciplina like '%' +  @nomeDisciplina + '%'
GO
/****** Object:  StoredProcedure [dbo].[ps_buscarFuncionario]    Script Date: 08/12/2017 00:22:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[ps_buscarFuncionario]
@cpfFuncionario numeric(11,0)
as
select*from Funcionario
where cpfFuncionario=@cpfFuncionario
GO
/****** Object:  StoredProcedure [dbo].[ps_Disciplina]    Script Date: 08/12/2017 00:22:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[ps_Disciplina]
@nomeDisciplina varchar(100)
as
select*from Disciplina
where nomeDisciplina=@nomeDisciplina
GO
/****** Object:  StoredProcedure [dbo].[ps_DisciplinaDgv]    Script Date: 08/12/2017 00:22:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[ps_DisciplinaDgv]
@nomeDisciplina varchar(100)
as
SELECT D.nomeDisciplina [Disciplina], D.docenteDisciplina [Docente], D.cargaHorariaDisciplina [Carga Horaria],F.nomeFuncionario [Funcionario],idDisciplina [idDisciplina]
from Disciplina D
inner JOIN Funcionario F  on D.idFuncionario = F.idFuncionario
where nomeDisciplina like '%' +  @nomeDisciplina + '%'

GO
/****** Object:  StoredProcedure [dbo].[ps_laboratorio]    Script Date: 08/12/2017 00:22:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ps_laboratorio]
@nomeLaboratorio VARCHAR (20)
AS
SELECT nomeLaboratorio, horarioLaboratorio, nomeTecLaboratorio, rgTecLaboratorio
From Laboratorio
WHERE nomeLaboratorio = @nomeLaboratorio

GO
/****** Object:  StoredProcedure [dbo].[ps_Login]    Script Date: 08/12/2017 00:22:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[ps_Login]
@usuarioFuncionario varchar(50),
@senhaFuncionario varchar(20)
as
select*from Funcionario
where usuarioFuncionario=@usuarioFuncionario
and senhaFuncionario=@senhaFuncionario
GO
/****** Object:  StoredProcedure [dbo].[ps_loginFuncionario]    Script Date: 08/12/2017 00:22:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ps_loginFuncionario] (
@usuarioFuncionario		VARCHAR (100),
@senhaFuncionario		VARCHAR (50)
)
AS
SELECT * FROM Funcionario
WHERE usuarioFuncionario = @usuarioFuncionario
AND senhaFuncionario = @senhaFuncionario


GO
/****** Object:  StoredProcedure [dbo].[ps_MatriculaAluno]    Script Date: 08/12/2017 00:22:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	CREATE PROCEDURE [dbo].[ps_MatriculaAluno]

@cpfAluno		NUMERIC (11,0)

AS

SELECT a.idAluno, A.nomeAluno, A.cpfAluno, M.dataMatriculaAluno, M.valorTotalPagtoAluno, M.formaPagtoAluno, M.modoPagtoParcelado, M.obsMatriculaAluno

FROM Aluno A

LEFT JOIN MatriculaAluno M

ON A.idAluno = M.idAluno

WHERE cpfAluno = @cpfAluno



GO
/****** Object:  StoredProcedure [dbo].[ps_notas]    Script Date: 08/12/2017 00:22:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[ps_notas]
@idAluno int
as
select*from MediaeFaltas
where idAluno=@idAluno
GO
/****** Object:  StoredProcedure [dbo].[ps_NotasDGV]    Script Date: 08/12/2017 00:22:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[ps_NotasDGV]
 @nomeAluno varchar(100)
 as
SELECT A.idAluno,A.nomeAluno,D.idDisciplina,D.nomeDisciplina,sum(At.mencaoAtividade) as 'mencao',avg(At.mencaoAtividade) as 'media',sum(At.faltasAtividade) as 'Faltas'
from Atividade At
inner JOIN Disciplina D  on At.idDisciplina=D.idDisciplina
inner join Aluno A  on A.idAluno=At.idAluno 
where nomeAluno like '%' +  @nomeAluno + '%' group by A.idAluno,A.nomeAluno,D.idDisciplina,D.nomeDisciplina
order by A.nomeAluno asc
GO
/****** Object:  StoredProcedure [dbo].[ps_OcorrenciaGeral]    Script Date: 08/12/2017 00:22:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ps_OcorrenciaGeral]
@codOcorrencia INT
AS
SELECT codOcorrencia, dtOcorrencia, hrOcorrencia, dtAtendOcorrencia, hrAtendOcorrencia, descrOcorrencia,nomeTecOcorrencia,regTecOcorrencia, setorTecOcorrencia, descrEquipOcorrencia, qtdEquipOcorrencia, nomeEnvOcorrencia, medidaOcorrencia, solucaoOcorrencia
From OcorrenciaGeral
WHERE codOcorrencia = @codOcorrencia

GO
/****** Object:  StoredProcedure [dbo].[ps_OcorrenciaLaboratorio]    Script Date: 08/12/2017 00:22:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ps_OcorrenciaLaboratorio]
@natOcorLaboratorio varchar(100)
AS
SELECT natOcorLaboratorio,dtOcorLaboratorio, hrOcorLaboratorio,provOcrLaboratorio, solucaoOcorLaboratorio
From OcorrenciaLaboratorio
WHERE natOcorLaboratorio = @natOcorLaboratorio

GO
/****** Object:  StoredProcedure [dbo].[ps_PesquisaAluno]    Script Date: 08/12/2017 00:22:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ps_PesquisaAluno]  

@cpfAluno  NUMERIC (11,0)  

AS  

SELECT A.nomeAluno, A.cpfAluno, M.idMatriculaAluno  

FROM Aluno A  

LEFT JOIN MatriculaAluno M  

ON A.idAluno = M.idAluno  

WHERE cpfAluno = @cpfAluno

GO
/****** Object:  StoredProcedure [dbo].[ps_Sala]    Script Date: 08/12/2017 00:22:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[ps_Sala]
@dadosSala varchar(20) 
as
select C.dadosSala[Sala],C.DisciplinaSala[Disciplina],C.nomeDocenteSala[Docente],C.dtHrSala [Data e hora],C.turmaSala[Turma],C.idDisciplina[cod Disciplina],F.nomeFuncionario[Funcionario],C.idFuncionario[Cod Funcionario],idCronograma[CodSala]
from CronogramaSala C
inner join Funcionario F on C.idFuncionario=F.idFuncionario
where dadosSala=@dadosSala
GO
/****** Object:  StoredProcedure [dbo].[pu_Atividade]    Script Date: 08/12/2017 00:22:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[pu_Atividade]
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


GO
/****** Object:  StoredProcedure [dbo].[pu_CadastroAluno]    Script Date: 08/12/2017 00:22:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[pu_CadastroAluno]

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

@obsAluno   VARCHAR (8000)  

AS    

UPDATE Aluno

SET nomeAluno = @nomeAluno,

    rgAluno = @rgAluno,

	cpfAluno = @cpfAluno,

	dnAluno = @dnAluno,

	estadoCivilAluno = @estadoCivilAluno,

	generoAluno = @generoAluno,

	enderecoAluno = @enderecoAluno,

	telResAluno = @telResAluno,

	celAluno = @celAluno,

	whatsAluno = @whatsAluno,

	emailAluno = @emailAluno,

	obsAluno = @obsAluno

WHERE cpfAluno = @cpfAluno
	

GO
/****** Object:  StoredProcedure [dbo].[pu_CronogramaSala]    Script Date: 08/12/2017 00:22:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[pu_CronogramaSala]
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
GO
/****** Object:  StoredProcedure [dbo].[pu_Disciplina]    Script Date: 08/12/2017 00:22:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[pu_Disciplina]
@idDisciplina int,
@docenteDisciplina varchar(100),
@cargaHorariaDisciplina numeric(10,0),
@idFuncionario int
as
update Disciplina
set docenteDisciplina=@docenteDisciplina,cargaHorariaDisciplina=@cargaHorariaDisciplina,idFuncionario=@idFuncionario
where idDisciplina=@idDisciplina
GO
/****** Object:  StoredProcedure [dbo].[pu_Funcionario]    Script Date: 08/12/2017 00:22:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[pu_Funcionario]
@nomeFuncionario varchar(100),
@rgFuncionario varchar(20),
@cpfFuncionario numeric(11,0),
@dtNascFuncionario datetime,
@endFuncionario varchar(200),
@telFuncionario numeric(15,0),
@whatsFuncionario numeric(15,0),
@emailFuncionario varchar(100),
@escolaridadeFuncionario varchar(200),
@cargoFuncionario varchar(100),
@dtemissao datetime,
@dtDemissao datetime,
@sexoFuncionario varchar(10),
@estcivilFuncionario varchar(20),
@dtPgtoFuncionario datetime,
@valorSalarioFuncionario numeric(10,2),
@usuarioFuncionario varchar(100),
@senhaFuncionario varchar(100)
as 
update Funcionario
set nomeFuncionario=@nomeFuncionario,rgFuncionario=@rgFuncionario,dtNascFuncionario=@dtNascFuncionario,endFuncionario=@endFuncionario,telFuncionario=@telFuncionario,whatsFuncionario=@whatsFuncionario,emailFuncionario=@emailFuncionario,escolaridadeFuncionario=@escolaridadeFuncionario,cargoFuncionario=@cargoFuncionario,dtemissao=@dtemissao,dtDemissao=@dtDemissao,sexoFuncionario=@sexoFuncionario,estcivilFuncionario=@estcivilFuncionario,dtPgtoFuncionario=@dtPgtoFuncionario,valorSalarioFuncionario=@valorSalarioFuncionario,usuarioFuncionario=@usuarioFuncionario,senhaFuncionario=@senhaFuncionario
where cpfFuncionario=@cpfFuncionario

GO
/****** Object:  StoredProcedure [dbo].[pu_Laboratorio]    Script Date: 08/12/2017 00:22:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[pu_Laboratorio]

@nomeLaboratorio VARCHAR (20),

@horarioLaboratorio DATETIME,

@nomeTecLaboratorio varchar (20),

@rgTecLaboratorio VARCHAR (20)

AS

UPDATE Laboratorio

SET nomeLaboratorio = @nomeLaboratorio,

    horarioLaboratorio = @horarioLaboratorio,

	nomeTecLaboratorio = @nomeTecLaboratorio,

	rgTecLaboratorio = @rgTecLaboratorio

WHERE @nomeLaboratorio = @nomeLaboratorio
	

GO
/****** Object:  StoredProcedure [dbo].[pu_MatriculaAluno]    Script Date: 08/12/2017 00:22:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[pu_MatriculaAluno]

@dataMatriculaAluno		DATETIME,

@valorTotalPagtoAluno	NUMERIC (6,2),

@formaPagtoAluno		VARCHAR (50),

@modoPagtoParcelado		VARCHAR (50),

@obsMatriculaAluno		VARCHAR (8000)

AS

DECLARE @idAluno	INT

UPDATE MatriculaAluno

SET

dataMatriculaAluno = @dataMatriculaAluno,

valorTotalPagtoAluno = @valorTotalPagtoAluno,

formaPagtoAluno = @formaPagtoAluno,

modoPagtoParcelado = @modoPagtoParcelado,

obsMatriculaAluno = @obsMatriculaAluno

WHERE

idAluno = @idAluno
	

GO
/****** Object:  StoredProcedure [dbo].[pu_OcorrenciaGeral]    Script Date: 08/12/2017 00:22:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[pu_OcorrenciaGeral]

@codOcorrencia             INT,

@dtOcorrencia              DATETIME,

@hrOcorrencia              DATETIME,

@dtAtendOcorrencia         DATETIME,

@hrAtendOcorrencia         DATETIME,

@descrOcorrencia           VARCHAR(200),

@nomeTecOcorrencia         VARCHAR(20),

@regTecOcorrencia          VARCHAR(20) ,

@setorTecOcorrencia        VARCHAR(10),

@descrEquipOcorrencia      VARCHAR(200),

@qtdEquipOcorrencia        INTEGER,

@nomeEnvOcorrencia         VARCHAR(20),

@medidaOcorrencia          VARCHAR(200),

@solucaoOcorrencia         VARCHAR(200)

AS

UPDATE OcorrenciaGeral

SET codOcorrencia = @codOcorrencia,

dtOcorrencia = @dtOcorrencia,

hrOcorrencia = @hrOcorrencia,

dtAtendOcorrencia = @dtAtendOcorrencia,

hrAtendOcorrencia = @hrAtendOcorrencia,

descrOcorrencia = @descrOcorrencia,

regTecOcorrencia = @nomeTecOcorrencia,

setorTecOcorrencia = @setorTecOcorrencia,

descrEquipOcorrencia = @descrEquipOcorrencia,

qtdEquipOcorrencia = @qtdEquipOcorrencia,

nomeEnvOcorrencia = @nomeEnvOcorrencia, 

medidaOcorrencia = @medidaOcorrencia,

solucaoOcorrencia = @solucaoOcorrencia 

 

WHERE codOcorrencia = @codOcorrencia

	

GO
/****** Object:  StoredProcedure [dbo].[pu_OcorrenciaLaboratorio]    Script Date: 08/12/2017 00:22:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[pu_OcorrenciaLaboratorio]
@idOcorrenciaLaboratorio    INT,
@natOcorLaboratorio         VARCHAR(100),
@dtOcorLaboratorio          DATETIME,
@hrOcorLaboratorio          DATETIME,
@provOcrLaboratorio         VARCHAR(200),
@solucaoOcorLaboratorio     VARCHAR(200) 
AS
UPDATE pu_OcorrenciaLaboratorio
SET idOcorrenciaLaboratorio = @idOcorrenciaLaboratorio,
   natOcorLaboratorio = @natOcorLaboratorio,   
   dtOcorLaboratorio = @dtOcorLaboratorio, 
   hrOcorLaboratorio = @hrOcorLaboratorio,
   provOcrLaboratorio = @provOcrLaboratorio, 
   solucaoOcorLaboratorio = @solucaoOcorLaboratorio
WHERE idOcorrenciaLaboratorio = @idOcorrenciaLaboratorio

GO
/****** Object:  Table [dbo].[Aluno]    Script Date: 08/12/2017 00:22:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Aluno](
	[idAluno] [int] IDENTITY(1,1) NOT NULL,
	[nomeAluno] [varchar](100) NOT NULL,
	[rgAluno] [int] NOT NULL,
	[cpfAluno] [numeric](11, 0) NOT NULL,
	[dnAluno] [datetime] NOT NULL,
	[estadoCivilAluno] [varchar](100) NULL,
	[generoAluno] [varchar](20) NULL,
	[enderecoAluno] [varchar](100) NOT NULL,
	[telResAluno] [numeric](11, 0) NOT NULL,
	[celAluno] [numeric](11, 0) NULL,
	[whatsAluno] [numeric](11, 0) NULL,
	[emailAluno] [varchar](100) NULL,
	[obsAluno] [varchar](8000) NULL,
PRIMARY KEY CLUSTERED 
(
	[idAluno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[cpfAluno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Atividade]    Script Date: 08/12/2017 00:22:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Atividade](
	[idAtividade] [int] IDENTITY(1,1) NOT NULL,
	[nomeAtividade] [varchar](100) NOT NULL,
	[conteudoAtividade] [varchar](200) NOT NULL,
	[dtHrAtividade] [datetime] NOT NULL,
	[docenteAtividade] [varchar](100) NOT NULL,
	[mencaoAtividade] [numeric](3, 0) NOT NULL,
	[faltasAtividade] [int] NOT NULL,
	[idAluno] [int] NOT NULL,
	[idDisciplina] [int] NOT NULL,
	[idFuncionario] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idAtividade] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CronogramaSala]    Script Date: 08/12/2017 00:22:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CronogramaSala](
	[idCronograma] [int] IDENTITY(1,1) NOT NULL,
	[dtHrSala] [datetime] NOT NULL,
	[nomeDocenteSala] [varchar](20) NOT NULL,
	[disciplinaSala] [varchar](20) NOT NULL,
	[turmaSala] [varchar](10) NOT NULL,
	[dadosSala] [varchar](20) NOT NULL,
	[idDisciplina] [int] NOT NULL,
	[idFuncionario] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idCronograma] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Disciplina]    Script Date: 08/12/2017 00:22:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Disciplina](
	[idDisciplina] [int] IDENTITY(1,1) NOT NULL,
	[nomeDisciplina] [varchar](100) NOT NULL,
	[docenteDisciplina] [varchar](100) NOT NULL,
	[idFuncionario] [int] NOT NULL,
	[cargaHorariaDisciplina] [numeric](10, 0) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idDisciplina] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Funcionario]    Script Date: 08/12/2017 00:22:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Funcionario](
	[idFuncionario] [int] IDENTITY(1,1) NOT NULL,
	[nomeFuncionario] [varchar](100) NOT NULL,
	[rgFuncionario] [varchar](20) NOT NULL,
	[cpfFuncionario] [numeric](11, 0) NOT NULL,
	[dtNascFuncionario] [datetime] NOT NULL,
	[endFuncionario] [varchar](200) NOT NULL,
	[telFuncionario] [numeric](15, 0) NOT NULL,
	[whatsFuncionario] [numeric](15, 0) NOT NULL,
	[emailFuncionario] [varchar](100) NOT NULL,
	[escolaridadeFuncionario] [varchar](200) NOT NULL,
	[cargoFuncionario] [varchar](100) NOT NULL,
	[dtemissao] [datetime] NOT NULL,
	[dtDemissao] [datetime] NOT NULL,
	[sexoFuncionario] [varchar](10) NOT NULL,
	[estcivilFuncionario] [varchar](20) NOT NULL,
	[dtPgtoFuncionario] [varchar](1) NOT NULL,
	[valorSalarioFuncionario] [numeric](10, 2) NOT NULL,
	[usuarioFuncionario] [varchar](100) NOT NULL,
	[senhaFuncionario] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idFuncionario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MatriculaAluno]    Script Date: 08/12/2017 00:22:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MatriculaAluno](
	[idMatriculaAluno] [int] IDENTITY(1,1) NOT NULL,
	[idAluno] [int] NOT NULL,
	[idDisciplina] [int] NOT NULL,
	[dataMatriculaAluno] [datetime] NOT NULL,
	[valorTotalPagtoAluno] [numeric](6, 2) NOT NULL,
	[formaPagtoAluno] [varchar](50) NOT NULL,
	[modoPagtoParcelado] [varchar](50) NOT NULL,
	[obsMatriculaAluno] [varchar](8000) NULL,
PRIMARY KEY CLUSTERED 
(
	[idMatriculaAluno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MediaeFaltas]    Script Date: 08/12/2017 00:22:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MediaeFaltas](
	[idMediaeFaltas] [int] IDENTITY(1,1) NOT NULL,
	[notaMediaeFaltas] [numeric](3, 2) NOT NULL,
	[faltasMediaeFaltas] [int] NOT NULL,
	[idAluno] [int] NOT NULL,
	[idDisciplina] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idMediaeFaltas] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[Atividade]  WITH CHECK ADD  CONSTRAINT [fk_Aluno_Atividade] FOREIGN KEY([idAluno])
REFERENCES [dbo].[Aluno] ([idAluno])
GO
ALTER TABLE [dbo].[Atividade] CHECK CONSTRAINT [fk_Aluno_Atividade]
GO
ALTER TABLE [dbo].[Atividade]  WITH CHECK ADD  CONSTRAINT [fk_Disciplina_Atividade] FOREIGN KEY([idDisciplina])
REFERENCES [dbo].[Disciplina] ([idDisciplina])
GO
ALTER TABLE [dbo].[Atividade] CHECK CONSTRAINT [fk_Disciplina_Atividade]
GO
ALTER TABLE [dbo].[Atividade]  WITH CHECK ADD  CONSTRAINT [fk_Funcionario] FOREIGN KEY([idFuncionario])
REFERENCES [dbo].[Funcionario] ([idFuncionario])
GO
ALTER TABLE [dbo].[Atividade] CHECK CONSTRAINT [fk_Funcionario]
GO
ALTER TABLE [dbo].[CronogramaSala]  WITH CHECK ADD  CONSTRAINT [fk_Disciplina_Cronograma] FOREIGN KEY([idDisciplina])
REFERENCES [dbo].[Disciplina] ([idDisciplina])
GO
ALTER TABLE [dbo].[CronogramaSala] CHECK CONSTRAINT [fk_Disciplina_Cronograma]
GO
ALTER TABLE [dbo].[CronogramaSala]  WITH CHECK ADD  CONSTRAINT [fk_Funcionario_Cronograma] FOREIGN KEY([idFuncionario])
REFERENCES [dbo].[Funcionario] ([idFuncionario])
GO
ALTER TABLE [dbo].[CronogramaSala] CHECK CONSTRAINT [fk_Funcionario_Cronograma]
GO
ALTER TABLE [dbo].[Disciplina]  WITH CHECK ADD  CONSTRAINT [fk_Funcionario_Disciplina] FOREIGN KEY([idFuncionario])
REFERENCES [dbo].[Funcionario] ([idFuncionario])
GO
ALTER TABLE [dbo].[Disciplina] CHECK CONSTRAINT [fk_Funcionario_Disciplina]
GO
ALTER TABLE [dbo].[MatriculaAluno]  WITH CHECK ADD  CONSTRAINT [fk_MatriculaAluno_Aluno] FOREIGN KEY([idAluno])
REFERENCES [dbo].[Aluno] ([idAluno])
GO
ALTER TABLE [dbo].[MatriculaAluno] CHECK CONSTRAINT [fk_MatriculaAluno_Aluno]
GO
ALTER TABLE [dbo].[MatriculaAluno]  WITH CHECK ADD  CONSTRAINT [fk_MatriculaAluno_Disciplina] FOREIGN KEY([idDisciplina])
REFERENCES [dbo].[Disciplina] ([idDisciplina])
GO
ALTER TABLE [dbo].[MatriculaAluno] CHECK CONSTRAINT [fk_MatriculaAluno_Disciplina]
GO
ALTER TABLE [dbo].[MediaeFaltas]  WITH CHECK ADD  CONSTRAINT [fk_Aluno_mediaseFaltas] FOREIGN KEY([idAluno])
REFERENCES [dbo].[Aluno] ([idAluno])
GO
ALTER TABLE [dbo].[MediaeFaltas] CHECK CONSTRAINT [fk_Aluno_mediaseFaltas]
GO
ALTER TABLE [dbo].[MediaeFaltas]  WITH CHECK ADD  CONSTRAINT [fk_DisciplinamediaeFaltas] FOREIGN KEY([idDisciplina])
REFERENCES [dbo].[Disciplina] ([idDisciplina])
GO
ALTER TABLE [dbo].[MediaeFaltas] CHECK CONSTRAINT [fk_DisciplinamediaeFaltas]
GO
USE [master]
GO
ALTER DATABASE [MICROFENIX] SET  READ_WRITE 
GO
