drop database db_CDS;

create database db_CDS;

use db_CDS;

create table tbArtistas(
cod_art int not null,
nome_art varchar(100) not null unique,
primary key(cod_art)
);

create table tbGravadoras(
cod_grav int not null,
nome_grav varchar(50) not null unique,
primary key(cod_grav)
);

create table tbCategorias(
cod_cat int not null,
nome_cat varchar(50) not null unique,
primary key(cod_cat)
);

create table tbEstados(
sigla_est char(2) not null,
nome_est varchar(50) not null unique,
primary key(sigla_est)
);

create table tbCidades(
cod_cid int not null,
sigla_est char(2) not null,
nome_cid varchar(50) not null,
primary key(cod_cid),
foreign key(sigla_est) references tbEstados(sigla_est)
);

create table tbClientes(
cod_cli int not null,
cod_cid int not null,
nome_cli varchar(50) not null,
end_cli varchar(100) not null,
renda_cli decimal(9,2) not null default 0 check(renda_cli >= 0),
sexo_cli char(1) not null default 'F' check(sexo_cli in('F',"M")),
primary key(cod_cli),
foreign key(cod_cid) references tbCidades(cod_cid)
);

create table tbConjuge(
cod_conj int not null,
cod_cli int not null,
nome_conj varchar(50) not null,
renda_conj decimal(9,2) not null default 0 check(renda_conj >= 0),
sexo_conj char(1) not null default 'F' check(sexo_conj in('F','M')),
primary key(cod_conj),
foreign key(cod_cli) references tbClientes(cod_cli)
);

create table tbFuncionarios(
cod_func int not null,
nome_func varchar(50) not null,
end_func varchar(100) not null,
sal_func decimal(9,2) not null default 0 check(sal_func >= 0),
sexo_func char(1) not null default 'F' check(sexo_func in('F','M')),
primary key(cod_func)
);

create table tbDependentes(
cod_dep int not null,
cod_func int not null,
nome_dep varchar(100) not null,
sexo_dep char(1) not null default 'F' check(sexo_dep in('F','M')),
primary key(cod_dep),
foreign key(cod_func) references tbFuncionarios(cod_func)
);

create table tbTitulos(
cod_tit int not null,
cod_cat int not null,
cod_grav int not null,
nome_cd varchar(50) not null unique,
val_cd decimal(9,2) not null check(val_cd > 0),
qtd_estq int not null check(qtd_estq >= 0),
primary key(cod_tit),
foreign key(cod_cat) references tbCategorias(cod_cat),
foreign key(cod_grav) references tbGravadoras(cod_grav)
);

create table tbPedidos(
num_ped int not null,
cod_cli int not null,
cod_func int not null,
data_ped datetime not null,
val_ped decimal(9,2) not null default 0 check(val_ped >= 0),
primary key(num_ped),
foreign key(cod_cli) references tbClientes(cod_cli),
foreign key(cod_func) references tbFuncionarios(cod_func)
);

create table tbTitulosPedido(
num_ped int not null,
cod_tit int not null,
qtd_cd int not null check(qtd_cd >= 1),
val_cd decimal(9,2) not null check(qtd_cd > 0),
foreign key(num_ped) references tbPedidos(num_ped),
foreign key(cod_tit) references tbTitulos(cod_tit)
);

create table tbTitulosArtista(
cod_tit int not null,
cod_art int not null,
foreign key(cod_tit) references tbTitulos(cod_tit),
foreign key(cod_art) references tbArtistas(cod_art)
);

desc tbArtistas;
desc tbGravadoras;
desc tbCategorias;
desc tbEstados;
desc tbCidades;
desc tbClientes;
desc tbConjuge;
desc tbFuncionarios;
desc tbDependentes;
desc tbTitulos;
desc tbPedidos;
desc tbTitulosPedido;
desc tbTitulosArtista;

insert into tbArtistas(cod_art,nome_art)values(1,'Marisa Monte');
insert into tbArtistas(cod_art,nome_art)values(2,'Gilberto Gil');
insert into tbArtistas(cod_art,nome_art)values(3,'Caetano Veloso');
insert into tbArtistas(cod_art,nome_art)values(4,'Milton Nascimento');
insert into tbArtistas(cod_art,nome_art)values(5,'Legião Urbana');
insert into tbArtistas(cod_art,nome_art)values(6,'The Beatles');
insert into tbArtistas(cod_art,nome_art)values(7,'Rita Lee');

insert into tbGravadoras(cod_grav,nome_grav)values(1,'Polygram');
insert into tbGravadoras(cod_grav,nome_grav)values(2,'Emi');
insert into tbGravadoras(cod_grav,nome_grav)values(3,'Som Livre');
insert into tbGravadoras(cod_grav,nome_grav)values(4,'Som Music');

insert into tbCategorias(cod_cat,nome_cat)values(1,'MPB');
insert into tbCategorias(cod_cat,nome_cat)values(2,'Trilha Sonora');
insert into tbCategorias(cod_cat,nome_cat)values(3,'Rock Internacional');
insert into tbCategorias(cod_cat,nome_cat)values(4,'Rock Nacional');

insert into tbEstados(sigla_est,nome_est)values('SP','São Paulo');
insert into tbEstados(sigla_est,nome_est)values('MG','Minas Gerais');
insert into tbEstados(sigla_est,nome_est)values('RJ','Rio de Janeiro');
insert into tbEstados(sigla_est,nome_est)values('ES','Espirito Santo');

insert into tbCidades(cod_cid,sigla_est,nome_cid)values(1,'SP','São Paulo');
insert into tbCidades(cod_cid,sigla_est,nome_cid)values(2,'SP','Sorocaba');
insert into tbCidades(cod_cid,sigla_est,nome_cid)values(3,'SP','Jundiaí');
insert into tbCidades(cod_cid,sigla_est,nome_cid)values(4,'SP','Americana');
insert into tbCidades(cod_cid,sigla_est,nome_cid)values(5,'SP','Araraquara');
insert into tbCidades(cod_cid,sigla_est,nome_cid)values(6,'MG','Ouro Preto');
insert into tbCidades(cod_cid,sigla_est,nome_cid)values(7,'ES','Cachoeira do Itapemirim');

insert into tbClientes(cod_cli,cod_cid,nome_cli,end_cli,renda_cli,sexo_cli)values(1,1,'José Nogueira','Rua A',1500.00,'M');
insert into tbClientes(cod_cli,cod_cid,nome_cli,end_cli,renda_cli,sexo_cli)values(2,1,'Ângelo Pereira','Rua B',2000.00,'M');
insert into tbClientes(cod_cli,cod_cid,nome_cli,end_cli,renda_cli,sexo_cli)values(3,1,'Além Mar Paranhos','Rua C',1500.00,'M');
insert into tbClientes(cod_cli,cod_cid,nome_cli,end_cli,renda_cli,sexo_cli)values(4,1,'Catarina Souza','Rua D',892.00,'F');
insert into tbClientes(cod_cli,cod_cid,nome_cli,end_cli,renda_cli,sexo_cli)values(5,1,'Vagner Costa','Rua E',950.00,'M');
insert into tbClientes(cod_cli,cod_cid,nome_cli,end_cli,renda_cli,sexo_cli)values(6,2,'Antenor da Costa','Rua F',1582.00,'M');
insert into tbClientes(cod_cli,cod_cid,nome_cli,end_cli,renda_cli,sexo_cli)values(7,2,'Maria Amélia de Souza','Rua G',1152.00,'F');
insert into tbClientes(cod_cli,cod_cid,nome_cli,end_cli,renda_cli,sexo_cli)values(8,2,'Paulo Roberto Silva','Rua H',3250.00,'M');
insert into tbClientes(cod_cli,cod_cid,nome_cli,end_cli,renda_cli,sexo_cli)values(9,3,'Fátima Souza','Rua I',1632.00,'F');
insert into tbClientes(cod_cli,cod_cid,nome_cli,end_cli,renda_cli,sexo_cli)values(10,3,'Joel daa Rocha','Rua J',2000.00,'M');

insert into tbConjuge(cod_cli,cod_conj,nome_conj,renda_conj,sexo_conj)values(1,1,'Carla Nogueira',2500.00,'F');
insert into tbConjuge(cod_cli,cod_conj,nome_conj,renda_conj,sexo_conj)values(2,2,'Emilia Pereira',5500.00,'F');
insert into tbConjuge(cod_cli,cod_conj,nome_conj,renda_conj,sexo_conj)values(6,3,'Altiva da Costa',3000.00,'F');
insert into tbConjuge(cod_cli,cod_conj,nome_conj,renda_conj,sexo_conj)values(7,4,'Carlos de Souza',3250.00,'M');

insert into tbFuncionarios(cod_func,nome_func,end_func,sal_func,sexo_func)values(1,'Vânia Gabriela Pereira','Rua A',2500.00,'F');
insert into tbFuncionarios(cod_func,nome_func,end_func,sal_func,sexo_func)values(2,'Norberto Pereira da Silva','Rua B',300.00,'M');
insert into tbFuncionarios(cod_func,nome_func,end_func,sal_func,sexo_func)values(3,'Olavo Linhares','Rua C',580.00,'M');
insert into tbFuncionarios(cod_func,nome_func,end_func,sal_func,sexo_func)values(4,'Paula da Silva','Rua D',3000.00,'F');
insert into tbFuncionarios(cod_func,nome_func,end_func,sal_func,sexo_func)values(5,'Rolando Rocha','Rua E',2000.00,'M');
insert into tbFuncionarios(cod_func,nome_func,end_func,sal_func,sexo_func)values(7,'Catarina Silva','Rua F',2350.00,'F');

insert into tbDependentes(cod_dep,cod_func,nome_dep,sexo_dep)values(1,1,'Ana Pereira','F');
insert into tbDependentes(cod_dep,cod_func,nome_dep,sexo_dep)values(2,1,'Roberto Pereira','M');
insert into tbDependentes(cod_dep,cod_func,nome_dep,sexo_dep)values(3,1,'Celso Pereira','M');
insert into tbDependentes(cod_dep,cod_func,nome_dep,sexo_dep)values(4,3,'Brisa Linhares','F');
insert into tbDependentes(cod_dep,cod_func,nome_dep,sexo_dep)values(5,3,'Mari Sol Pereira','F');
insert into tbDependentes(cod_dep,cod_func,nome_dep,sexo_dep)values(6,4,'Sonia da Silva','F');

insert into tbTitulos(cod_tit,cod_cat,cod_grav,nome_cd,val_cd,qtd_estq)values(1,1,1,'Tribalista',30.00,1500);
insert into tbTitulos(cod_tit,cod_cat,cod_grav,nome_cd,val_cd,qtd_estq)values(2,1,2,'Tropicália',50.00,500);
insert into tbTitulos(cod_tit,cod_cat,cod_grav,nome_cd,val_cd,qtd_estq)values(3,1,1,'Aquele Abraço',50.00,600);
insert into tbTitulos(cod_tit,cod_cat,cod_grav,nome_cd,val_cd,qtd_estq)values(4,1,2,'Refazenda',60.00,1000);
insert into tbTitulos(cod_tit,cod_cat,cod_grav,nome_cd,val_cd,qtd_estq)values(5,1,3,'Totalmente Demais',50.00,2000);
insert into tbTitulos(cod_tit,cod_cat,cod_grav,nome_cd,val_cd,qtd_estq)values(6,1,3,'Travessia',55.00,500);
insert into tbTitulos(cod_tit,cod_cat,cod_grav,nome_cd,val_cd,qtd_estq)values(7,1,2,'Courage',30.00,200);
insert into tbTitulos(cod_tit,cod_cat,cod_grav,nome_cd,val_cd,qtd_estq)values(8,4,3,'Legião Urbana',20.00,100);
insert into tbTitulos(cod_tit,cod_cat,cod_grav,nome_cd,val_cd,qtd_estq)values(9,3,2,'The Beatles',30.00,300);
insert into tbTitulos(cod_tit,cod_cat,cod_grav,nome_cd,val_cd,qtd_estq)values(10,4,1,'Rita Lee',30.00,500);

insert into tbPedidos(num_ped,cod_cli,cod_func,data_ped,val_ped)values(1,1,2,'02/05/02',1500.00);
insert into tbPedidos(num_ped,cod_cli,cod_func,data_ped,val_ped)values(2,3,4,'02/05/02',50.00);
insert into tbPedidos(num_ped,cod_cli,cod_func,data_ped,val_ped)values(3,4,7,'02/06/02',100.00);
insert into tbPedidos(num_ped,cod_cli,cod_func,data_ped,val_ped)values(4,1,4,'02/02/03',200.00);
insert into tbPedidos(num_ped,cod_cli,cod_func,data_ped,val_ped)values(5,7,5,'02/03/03',300.00);
insert into tbPedidos(num_ped,cod_cli,cod_func,data_ped,val_ped)values(6,4,4,'02/03/03',100.00);
insert into tbPedidos(num_ped,cod_cli,cod_func,data_ped,val_ped)values(7,5,5,'02/03/03',50.00);
insert into tbPedidos(num_ped,cod_cli,cod_func,data_ped,val_ped)values(8,8,2,'02/03/03',50.00);
insert into tbPedidos(num_ped,cod_cli,cod_func,data_ped,val_ped)values(9,2,2,'02/03/03',2000.00);
insert into tbPedidos(num_ped,cod_cli,cod_func,data_ped,val_ped)values(10,7,2,'02/03/03',3000.00);

insert into tbTitulosArtista(cod_tit,cod_art)values(1,1);
insert into tbTitulosArtista(cod_tit,cod_art)values(2,2);
insert into tbTitulosArtista(cod_tit,cod_art)values(3,2);
insert into tbTitulosArtista(cod_tit,cod_art)values(4,2);
insert into tbTitulosArtista(cod_tit,cod_art)values(5,3);
insert into tbTitulosArtista(cod_tit,cod_art)values(6,4);
insert into tbTitulosArtista(cod_tit,cod_art)values(7,4);
insert into tbTitulosArtista(cod_tit,cod_art)values(8,5);
insert into tbTitulosArtista(cod_tit,cod_art)values(9,6);
insert into tbTitulosArtista(cod_tit,cod_art)values(10,7);

insert into tbTitulosPedido(num_ped,cod_tit,qtd_cd,val_cd)values(1,1,2,30.00);
insert into tbTitulosPedido(num_ped,cod_tit,qtd_cd,val_cd)values(1,2,3,20.00);
insert into tbTitulosPedido(num_ped,cod_tit,qtd_cd,val_cd)values(2,1,1,50.00);
insert into tbTitulosPedido(num_ped,cod_tit,qtd_cd,val_cd)values(2,2,3,30.00);
insert into tbTitulosPedido(num_ped,cod_tit,qtd_cd,val_cd)values(3,1,2,40.00);
insert into tbTitulosPedido(num_ped,cod_tit,qtd_cd,val_cd)values(4,2,3,20.00);
insert into tbTitulosPedido(num_ped,cod_tit,qtd_cd,val_cd)values(5,1,2,25.00);
insert into tbTitulosPedido(num_ped,cod_tit,qtd_cd,val_cd)values(6,2,3,30.00);
insert into tbTitulosPedido(num_ped,cod_tit,qtd_cd,val_cd)values(7,4,2,55.00);
insert into tbTitulosPedido(num_ped,cod_tit,qtd_cd,val_cd)values(8,1,4,60.00);
insert into tbTitulosPedido(num_ped,cod_tit,qtd_cd,val_cd)values(9,2,3,15.00);
insert into tbTitulosPedido(num_ped,cod_tit,qtd_cd,val_cd)values(10,7,2,15.00);

select * from tbArtistas order by cod_art asc;
select * from tbGravadoras order by cod_grav asc;
select * from tbCategorias order by cod_cat asc;
select * from tbEstados order by sigla_est asc;
select * from tbCidades order by cod_cid asc;
select * from tbClientes order by cod_cli asc;
select * from tbConjuge order by cod_cli asc;
select * from tbFuncionarios order by cod_func asc;
select * from tbDependentes order by cod_dep asc;
select * from tbTitulos order by cod_tit asc;
select * from tbPedidos order by num_ped asc;
select * from tbTitulosArtista order by cod_tit asc;
select * from tbTitulosPedido order by num_ped asc;

-- 1. Selecione o nome dos CDs e o nome da gravadora de cada CD.

select tit.nome_cd as 'Nome do CD', grav.nome_grav as 'Nome gravadora' from tbTitulos as tit inner join tbGravadoras as grav on tit.cod_grav = grav.cod_grav;

-- 2. Selecione o nome dos CDs e o nome da categoria de cada CD. 

select tit.nome_cd as 'Nome do CD', cat.nome_cat as 'Categoria' from tbTitulos as tit right join tbCategorias as cat on tit.cod_cat = cat.cod_cat;

-- 3. Selecione o nome dos CDs, o nome das gravadoras de cada CD e o nome da categoria de 
-- cada CD.

select tit.nome_cd as 'Nome do CD', grav.nome_grav as 'Nome Gravadora', cat.nome_cat as 'Categoria' from tbTitulos as tit 
inner join tbGravadoras as grav on tit.cod_grav = grav.cod_grav 
inner join tbCategorias as cat on tit.cod_cat = cat.cod_cat;

-- 4. Selecione o nome dos clientes e os títulos dos CDs vendidos em cada pedido que o 
-- cliente fez. 

select cli.nome_cli as 'Nome Cliente', tit.nome_cd as 'Nome CD', titP.num_ped as 'Numero do pedido'from tbClientes as cli 
left join tbPedidos as ped on cli.cod_cli = ped.cod_cli 
left join tbTitulosPedido as titP on ped.num_ped = titP.num_ped
left join tbTitulos as tit on titP.cod_tit = tit.cod_tit;

-- 5. Selecione o nome do funcionário, número, data e valor dos pedidos que este 
-- funcionário registrou, além do nome do cliente que está fazendo o pedido. 

select func.nome_func as 'Nome do Funcionario', ped.num_ped 'Número do pedido', ped.data_ped as 'Data do Pedido', ped.val_ped as 'Valor do Pedido', cli.nome_cli as 'Nome do Cliente' from tbFuncionarios as func 
left join tbPedidos as ped on func.cod_func = ped.cod_func
left join tbClientes as cli on ped.cod_cli = cli.cod_cli;

-- 6. Selecione o nome dos funcionários e o nome de todos os dependentes de cada 
-- funcionário. 

select func.nome_func as 'Funcionário', nome_dep as 'Dependente' from tbFuncionarios as func 
left join tbDependentes as dep on func.cod_func = dep.cod_func;

-- 7. Selecione o nome dos clientes e o nome dos cônjuges de cada cliente. 

select cli.nome_cli as 'Cliente', conj.nome_conj as 'Conjugê' from tbClientes as cli inner join tbConjuge as conj on cli.cod_cli = conj.cod_cli;

-- 8. Selecione o nome de todos os clientes. Se estes possuem cônjuges, mostrar os nomes 
-- de seus cônjuges também. 

select cli.nome_cli as 'Nome do Cliente', conj.nome_conj as 'Nome do Conjugê' from tbClientes as cli left join tbConjuge as conj on cli.cod_cli = conj.cod_cli;

-- 9. Selecione nome do cliente, nome do cônjuge, número do pedido que cada cliente fez, 
-- valor de cada pedido que cada cliente fez e código do funcionário que atendeu a cada 
-- pedido. 

select cli.nome_cli as 'Nome do Cliente', conj.nome_conj as 'Nome do Conjugê', ped.num_ped as 'Número do Pedido', ped.val_ped as 'Valor do Pedido', func.cod_func as 'Código fo Funcionário' from tbClientes as cli
left join tbConjuge as conj on cli.cod_cli = conj.cod_cli 
left join tbPedidos as ped on cli.cod_cli = ped.cod_cli 
left join tbFuncionarios as func on ped.cod_func = func.cod_func;         

