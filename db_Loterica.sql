-- apagando banco de dados
drop database db_Loterica;
-- criando banco de dados
create database db_Loterica;
-- acessar banco de dados
use db_Loterica;
-- visualizando banco de dados
show databases;
-- criando tabela
create table tbJogos(
codigo int,
nome varchar(100),
valor decimal (10,2),
dataJogo  date
);
-- visualizar tabela
show tables;
-- visualiando estrutura da tabela
desc tbJogos;
-- inserindo registro na tabela
insert into tbJogos(codigo,nome,valor,dataJogo)values(1,'Mega Sena',10.00,'2023/09/15');
insert into tbJogos(codigo,nome,valor,dataJogo)values(2,'Quina',3.50,'2023/11/05');
insert into tbJogos(codigo,nome,valor,dataJogo)values(3,'Dupla Sena',6.00,'2023/03/13');
insert into tbJogos(codigo,nome,valor,dataJogo)values(4,'Super Sete',5.00,'2023/10/23');
insert into tbJogos(codigo,nome,valor,dataJogo)values(5,'+Milionária',2.50,'2023/06/06');
insert into tbJogos(codigo,nome,valor,dataJogo)values(6,'Dia de Sorte',2.50,'2023/07/09');
insert into tbJogos(codigo,nome,valor,dataJogo)values(7,'Timemania',2.00,'2023/11/11');
insert into tbJogos(codigo,nome,valor,dataJogo)values(8,'Lotofácil',4.50,'2023/01/27');
insert into tbJogos(codigo,nome,valor,dataJogo)values(9,'Lotomania',6.50,'2023/02/24');
insert into tbJogos(codigo,nome,valor,dataJogo)values(10,'Federal',2.00,'2023/10/31');
-- visulizar registros inseridos
select * from tbJogos;
-- alterando registros
update tbJogos set valor = 2.35, dataJogo = '2023/12/23' where codigo = 7;
update tbJogos set valor = 7.00, dataJogo = '2023/08/02' where codigo = 9;
-- visualizar alteração
select * from tbJogos;
-- deletar registros
delete from tbJogos where codigo = 8;
delete from tbJogos where codigo = 3;
delete from tbJogos where codigo = 5;
-- visualizar registros deletados
select * from tbJogos;