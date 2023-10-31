drop database db_LStreetwear;
create database db_LStreetwear;
use db_LStreetwear;

create table tbLogin(
codUsu int not null auto_increment,
usuario varchar(50) not null,
senha varchar(10) not null,
primary key(codUsu)
);

create table tbFuncionarios(
codFunc int not null auto_increment,
nomeFunc varchar(100),
email varchar(100),
cpf char(14) unique,
dNasc date,
primary key (codFunc)
);

create table tbComissao(
codComissao int not null auto_increment,
codFunc int not null,
nomeCliente varchar(100),
valorCompra decimal(9,2),
qualidade char(10),
valoComissao decimal(9,2),
valorTotal decimal(9,2),
primary key(codComissao),
foreign key(codFunc) references tbFuncionarios(codFunc)
);

create table tbProdutos(
codProd int not null auto_increment,
nomeProd varchar(100) not null,
marcaProd varchar(100) not null,
quantidade int(5) not null,
tamanho varchar(2) not null,
dataRepo date not null,
preco decimal(5,2) not null,
codUsu int not null,
primary key(codProd),
foreign key(codUsu) references tbLogin(codUsu)
);

-- insert into tbProdutos(nomeProd,marcaProd,quantidade,tamanho,dataRepo,preco,codUsu)values('Jaqueta Sportswear Club Fleece Feminina','Nike',30,'M','2023/12/20',259.99,1);

-- insert into tbLogin(codUsu,usuario,senha)values(1,'admin','admin');

-- select codProd+1 from tbProdutos order by desc;

-- puxar código do usuário
-- select codUsu from tbLogin;

-- update
-- update tbProdutos set nomeProd = @nomeProd, marcaProd = @marcaProd, quantidade = @quantidade, tamanho = @tamanho, dataRepo = @dataRepo, preco = @preco where codUsu = @codUsu;

-- pesquisa por codigo
-- select nomeProd from tbProdutos where codProd = @codProd;

-- pesquisa por marca
-- select nomeProd from tbProdutos where marcaProd = @marcaProd;