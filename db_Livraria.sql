-- apagando banco de dados
drop database db_Livraria;

create database db_Livraria;

use db_Livraria;

create table tbGeneros(
id_Genero int not null,
descricao varchar(100) not null,
primary key(id_Genero)
);

create table tbAutores(
id_Autor int not null,
nome varchar(100) not null,
email varchar(100) not null unique,
primary key(id_Autor)
);

create table tbClientes(
id_Cliente int not null,
nome varchar(100) not null,
telefone varchar(45) not null unique,
primary key(id_Cliente)
);

create table tbLivros(
id_Livro int not null,
titulo varchar(100) not null,
preco float not null default 0 check(preco >= 0),
estoque int not null default 0 check(preco >= 0),
id_Genero int not null,
primary key(id_Livro),
foreign key(id_Genero) references tbGeneros(id_Genero)
);

create table tbEscreve(
id_Livro int not null,
id_Autor int not null,
foreign key (id_Livro) references tbLivros(id_Livro),
foreign key (id_Autor) references tbAutores(id_Autor)
);

create table tbVenda(
id_Venda int not null,
data date,
total float not null,
id_Cliente int not null,
primary key (id_Venda),
foreign key (id_Cliente) references tbClientes(id_Cliente)
);

create table tbItens_Da_Venda(
id_Venda int not null,
id_Livro int not null,
qtd int not null default 0 check(qtd >= 0),
subtotal varchar(45) not null,
foreign key (id_Venda) references tbVenda (id_Venda),
foreign key (id_Livro) references tbLivros (id_Livro)
);

desc tbGeneros;
desc tbAutores;
desc tbClientes;
desc tbLivros;
desc tbEscreve;
desc tbVenda;
desc tbItens_Da_Venda;

insert into tbGeneros(id_Genero,descricao)values(1,'Romance');
insert into tbGeneros(id_Genero,descricao)values(2,'Comédia');
insert into tbGeneros(id_Genero,descricao)values(3,'Terror');
insert into tbGeneros(id_Genero,descricao)values(4,'Aventura');
insert into tbGeneros(id_Genero,descricao)values(5,'Documentário');
insert into tbGeneros(id_Genero,descricao)values(6,'Infantil');
insert into tbGeneros(id_Genero,descricao)values(7,'Mistério');
insert into tbGeneros(id_Genero,descricao)values(8,'Autoajuda');
insert into tbGeneros(id_Genero,descricao)values(9,'Quadrinhos');
insert into tbGeneros(id_Genero,descricao)values(10,'Religioso');

insert into tbAutores(id_Autor,nome,email)values(1,'Catarina Mailes','catarinaM@hotmail.com');
insert into tbAutores(id_Autor,nome,email)values(2,'Filipe Johnson','FilipJohn@gmail.com');
insert into tbAutores(id_Autor,nome,email)values(3,'Getulio Silva','GetulioSil@outlook.com');
insert into tbAutores(id_Autor,nome,email)values(4,'Collen Houver','HouverCollen@gmail.com');
insert into tbAutores(id_Autor,nome,email)values(5,'Pedro Carrilho','PeCa@hotmail.com');
insert into tbAutores(id_Autor,nome,email)values(6,'Geovanne Padilho','GeoPadilho@outlook.com');
insert into tbAutores(id_Autor,nome,email)values(7,'Kauan Pereira','KauanPereira@gmail.com');
insert into tbAutores(id_Autor,nome,email)values(8,'Rowling','Rowling@hotmail.com');
insert into tbAutores(id_Autor,nome,email)values(9,'Giovanna Spencer','GioSpencer@gmail.com');
insert into tbAutores(id_Autor,nome,email)values(10,'Alan Arlindo','AlanArlindo@outlook.com');

insert into tbClientes(id_Cliente,nome,telefone)values(1,'Fábio','(11)97856-6785');
insert into tbClientes(id_Cliente,nome,telefone)values(2,'Grazielly','(13)95436-5432');
insert into tbClientes(id_Cliente,nome,telefone)values(3,'Carlos','(21)99098-4321');
insert into tbClientes(id_Cliente,nome,telefone)values(4,'Gabriela','(14)90742-7539');
insert into tbClientes(id_Cliente,nome,telefone)values(5,'Matheus','(11)94618-8080');
insert into tbClientes(id_Cliente,nome,telefone)values(6,'Suzana','(17)98321-9781');
insert into tbClientes(id_Cliente,nome,telefone)values(7,'Aline','(23)98756-2016');
insert into tbClientes(id_Cliente,nome,telefone)values(8,'Alessandra','(11)98315-6724');
insert into tbClientes(id_Cliente,nome,telefone)values(9,'Francisca','(17)97068-5674');
insert into tbClientes(id_Cliente,nome,telefone)values(10,'Fábio','(13)97556-6095');

insert into tbLivros(id_Livro,titulo,preco,estoque,id_Genero)values(1,'Para todos garotos que já amei',30.00,20,1);
insert into tbLivros(id_Livro,titulo,preco,estoque,id_Genero)values(2,'Objetos cortantes',50.00,10,7);
insert into tbLivros(id_Livro,titulo,preco,estoque,id_Genero)values(3,'O lado feio do amor',25.00,5,1);
insert into tbLivros(id_Livro,titulo,preco,estoque,id_Genero)values(4,'A culpa é das estrelas',60.00,50,1);
insert into tbLivros(id_Livro,titulo,preco,estoque,id_Genero)values(5,'Talvez você precise conversar',40.00,15,8);
insert into tbLivros(id_Livro,titulo,preco,estoque,id_Genero)values(6,'Harry Potter',65.00,100,4);
insert into tbLivros(id_Livro,titulo,preco,estoque,id_Genero)values(7,'Turma da mônica jovem',25.00,20,9);
insert into tbLivros(id_Livro,titulo,preco,estoque,id_Genero)values(8,'A menina que roubava livros',70.00,35,1);
insert into tbLivros(id_Livro,titulo,preco,estoque,id_Genero)values(9,'A cabana',40.00,100,10);
insert into tbLivros(id_Livro,titulo,preco,estoque,id_Genero)values(10,'O cimitério',24.50,75,3);

insert into tbEscreve(id_Livro,id_Autor)values(2,3);
insert into tbEscreve(id_Livro,id_Autor)values(10,1);
insert into tbEscreve(id_Livro,id_Autor)values(8,6);
insert into tbEscreve(id_Livro,id_Autor)values(1,1);
insert into tbEscreve(id_Livro,id_Autor)values(3,7);
insert into tbEscreve(id_Livro,id_Autor)values(4,10);
insert into tbEscreve(id_Livro,id_Autor)values(5,10);
insert into tbEscreve(id_Livro,id_Autor)values(6,5);
insert into tbEscreve(id_Livro,id_Autor)values(7,4);
insert into tbEscreve(id_Livro,id_Autor)values(9,2);

insert into tbVenda(id_Venda,data,total,id_Cliente)values(1,'2023/08/01',100.00,1);
insert into tbVenda(id_Venda,data,total,id_Cliente)values(2,'2023/08/30',150.00,9);
insert into tbVenda(id_Venda,data,total,id_Cliente)values(3,'2023/10/11',49.00,8);
insert into tbVenda(id_Venda,data,total,id_Cliente)values(4,'2023/03/22',50.00,6);
insert into tbVenda(id_Venda,data,total,id_Cliente)values(5,'2023/09/19',260.00,10);
insert into tbVenda(id_Venda,data,total,id_Cliente)values(6,'2023/11/09',70.00,7);
insert into tbVenda(id_Venda,data,total,id_Cliente)values(7,'2023/08/01',80.00,2);
insert into tbVenda(id_Venda,data,total,id_Cliente)values(8,'2023/02/29',75.00,4);
insert into tbVenda(id_Venda,data,total,id_Cliente)values(9,'2023/08/01',140.00,5);
insert into tbVenda(id_Venda,data,total,id_Cliente)values(10,'2023/08/01',40.00,3);

insert into tbItens_Da_Venda(id_Venda,id_Livro,qtd,subtotal)values(2,3,10,150.00);
insert into tbItens_Da_Venda(id_Venda,id_Livro,qtd,subtotal)values(10,9,1,40.00);
insert into tbItens_Da_Venda(id_Venda,id_Livro,qtd,subtotal)values(9,8,2,140.00);
insert into tbItens_Da_Venda(id_Venda,id_Livro,qtd,subtotal)values(1,2,2,50.00);
insert into tbItens_Da_Venda(id_Venda,id_Livro,qtd,subtotal)values(7,9,2,80.00);
insert into tbItens_Da_Venda(id_Venda,id_Livro,qtd,subtotal)values(3,10,2,49.00);
insert into tbItens_Da_Venda(id_Venda,id_Livro,qtd,subtotal)values(4,2,1,50.00);
insert into tbItens_Da_Venda(id_Venda,id_Livro,qtd,subtotal)values(8,7,3,75.00);
insert into tbItens_Da_Venda(id_Venda,id_Livro,qtd,subtotal)values(5,6,3,260.00);
insert into tbItens_Da_Venda(id_Venda,id_Livro,qtd,subtotal)values(6,8,1,70.00);

select * from tbGeneros order by id_Genero asc;
select * from tbAutores order by id_Autor asc;
select * from tbClientes order by id_Cliente asc;
select * from tbLivros order by id_Livro asc;
select * from tbEscreve order by id_Livro asc;
select * from tbVenda order by id_Venda asc;
select * from tbItens_Da_Venda order by id_Venda asc;

-- realizando update
update tbGeneros set descricao = 'Suspense' where descricao = 'Terror';
update tbGeneros set descricao = 'Ficção' where descricao = 'Aventura';
update tbGeneros set descricao = 'Espiritual' where descricao = 'Religioso';
update tbGeneros set descricao = '-18' where descricao = 'Infantil';
update tbGeneros set descricao = 'Terror' where descricao = 'Mistério';

select * from tbGeneros order by id_Genero asc;

update tbAutores set nome = 'Gillian Flynn' where nome = 'Kauan Pereira';
update tbAutores set nome = 'William P. Young' where nome = 'Filipe Johnson';
update tbAutores set nome = 'Jenny Han' where nome = 'Catarina Mailes';
update tbAutores set nome = 'Ziraldo Alves' where nome = 'Alan Arlindo';
update tbAutores set email = 'ZiraldoAlves@gmail.com' where nome = 'Alan Santos'; 

select * from tbAutores order by id_Autor asc;

update tbClientes set telefone = '(11)97988-6741' where nome = 'Aline';
update tbClientes set telefone = '(71)95632-1268' where nome = 'Suzana';
update tbClientes set nome = 'Fernando' where id_Cliente = 10;
update tbClientes set telefone = '(44)97745-8090' where nome = 'Grazielly';
update tbClientes set telefone = '(61)97659-0539' where nome = 'Alessandra';

select * from tbClientes order by id_Cliente asc;

update tbLivros set preco = preco * 0.85 where preco > 30;
update tbLivros set estoque = estoque - 10 where preco > 50;
update tbLivros set titulo = 'Menino Maluquinho' where titulo = 'Turma da mônica jovem';
update tbLivros set titulo = 'A travessia' where titulo = 'A cabana';
update tbLivros set estoque = estoque - 50 where estoque >= 100;

select * from tbLivros order by id_Livro asc;

update tbEscreve set id_Autor = 4 where id_Livro = 3;
update tbEscreve set id_Autor = 10 where id_Livro = 7;
update tbEscreve set id_Autor = 2 where id_Livro = 10;
update tbEscreve set id_Autor = 7 where id_Livro = 2;
update tbEscreve set id_Livro = 6 where id_Autor = 8;

select * from tbEscreve order by id_Livro asc;

update tbVenda set total = total * 0.90 where total > 100;
update tbVenda set total = total/2 where total < 50;

select * from tbVenda order by id_Venda asc;

update tbItens_Da_Venda set subtotal = subtotal * 0.80 where subtotal > 100;
update tbItens_Da_Venda set subtotal = subtotal * 0.50 where subtotal > 200;

select * from tbItens_Da_Venda order by id_Venda asc;

-- deletando
