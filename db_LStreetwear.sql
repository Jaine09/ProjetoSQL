drop database db_LStreetwear;
create database db_LStreetwear;
use db_LStreetwear;

create table tbProdutos(
codProd int not null auto_increment,
nomeProd varchar(100) not null,
marcaProd varchar(100) not null,
quantidade int(50) not null,
tamanho char(2) not null,
dataRepo date not null,
preco decimal(5,2) not null,
primary key(codProd)
);

insert into tbProdutos(nomeProd,marcaProd,quantidade,tamanho,dataRepo,preco)values('Jaqueta Sportswear Club Fleece Feminina','Nike',30,'M','2023/12/20',259.99);
