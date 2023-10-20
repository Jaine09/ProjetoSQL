drop database db_LStreetwear;
create database db_LStreetwear;
use db_LStreetwear;

create table tbLogin(
usuario varchar(50) not null,
senha varchar(10) not null
);

create table tbProdutos(
codProd int not null auto_increment,
nomeProd varchar(100) not null,
marcaProd varchar(100) not null,
quantidade int(5) not null,
tamanho varchar(2) not null,
dataRepo date not null,
preco decimal(5,2) not null,
primary key(codProd)
);

insert into tbProdutos(nomeProd,marcaProd,quantidade,tamanho,dataRepo,preco)values('Jaqueta Sportswear Club Fleece Feminina','Nike',30,'M','2023/12/20',259.99);

insert into tbLogin(usuario,senha)values('admin','admin');

select codProd+1 from tbProdutos order by desc;