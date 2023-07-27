-- JAÍNE
-- apagando banco de dados
drop database db_ClinicaMedica;
-- criando banco de dados 
create database db_ClinicaMedica;
-- Acessando banco de dados
use db_ClinicaMedica;
-- Visualizando banco de dados
show databases;
-- Criando tabelas
create table tbMedicos(
idMedico int,
nomeMedico varchar(45),
telefoneMedico varchar(9)
);
create table tbConsultas(
idConsulta int,
data_consulta datetime,
Medico_idMedico int,
Paciente_idPaciente int,
ReceitaMedica_idReceitaMedica int
);
create table tbPacientes(
idPaciente int,
nomePaciente varchar(45),
telefonePaciente varchar(9),
convenio varchar(45)
);
create table tbReceitasMedicas(
idReceitaMedica int,
descricao varchar(500)
);
-- Visualizar tabelas criadas
show tables;
-- Visualizar a estrutura da tabela
desc tbMedicos;
desc tbConsultas;
desc tbPacientes;
desc tbReceitasMedicas;