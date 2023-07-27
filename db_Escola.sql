-- Jaíne Jesus Costa
drop database db_Escola;
create database db_Escola;
use db_Escola;
show databases;
create table tbAtividades(
id int,
atividade varchar(45)
);
create table tbRegistros(
id_aluno int,
id_turma int,
ausencia int,
id_registro int
);
create table tbTurmas(
id int,
quant_alunos int,
horario_aula datetime,
duracao_aula datetime,
data_inicio date,
data_fim date,
atividade int,
id_instrutor int,
id_monitor int
);
create table tbAlunos(
matricula int,
data_matricula date,
nome varchar(45),
endereco varchar(45),
telefone varchar(45),
nascimento date,
altura float,
peso float,
id_turma int
);
create table tbInstrutor(
rg int,
nome varchar(45),
nascimento date,
titulacao varchar(45),
telefone varchar(45)
);
create table tbMonitor(
id_aluno int
);
show tables;
desc tbRegistros;
desc tbTurmas;
desc tbAlunos;
desc tbInstrutor;
desc tbMonitor;
