-- apagar banco de dados
drop database db_Manicure;
-- criar banco de dados
create database db_Manicure;
-- acessando banco de dados
use db_Manicure;
-- visualizar banco de dados
show databases;
-- criar tabelas no banco de dados
create table tbProdutos(
CodProd int,
descricao varchar(100),
quantidade decimal(9,2),
dataEntrada date,
valorUnit decimal(9,2)
);
-- visualizando as tabelas
show tables;
-- visualizando a estrutura da tabela
desc tbProdutos;
-- inserindo registro nas tabelas
insert into tbProdutos(codProd,descricao,quantidade,dataEntrada,valorUnit)values(1,'Alicate de unha',10,'2023/08/01',5.50);
insert into tbProdutos(codProd,descricao,quantidade,dataEntrada,valorUnit)values(2,'Algodão',100,'2023/07/31',2.53);
insert into tbProdutos(codProd,descricao,quantidade,dataEntrada,valorUnit)values(3,'Esmalte',25,'2023/08/01',15.00);
insert into tbProdutos(codProd,descricao,quantidade,dataEntrada,valorUnit)values(4,'Acetona',20,'2023/07/30',3.50);
insert into tbProdutos(codProd,descricao,quantidade,dataEntrada,valorUnit)values(5,'Unha postiça',50,'2023/07/25',9.99);
insert into tbProdutos(codProd,descricao,quantidade,dataEntrada,valorUnit)values(6,'Unha',50,'2023/07/25',9.99);
insert into tbProdutos(codProd,descricao,quantidade,dataEntrada,valorUnit)values(7,'Postiça',50,'2023/07/25',9.99);
-- visualizar os registros inseridos nas tabelas
select * from tbProdutos;
-- alterando registros das tabelas
update tbProdutos set descricao = 'Palito de unha', valorUnit = 1.35 where codProd = 6;
update tbProdutos set descricao = 'Mascara de proteção', valorUnit = 2.23 where codProd = 7;
-- visualizando registro alterados
select * from tbProdutos;
-- apagar registros das tabelas
delete from tbProdutos where codProd = 7;
-- visualizar registros apagados
select * from tbProdutos;