create procedure [dbo].[ps_buscarFuncionario]
@cpfFuncionario numeric(11,0)
as
select*from Funcionario
where cpfFuncionario=@cpfFuncionario