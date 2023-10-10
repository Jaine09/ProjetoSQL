drop database dbLojaAbC;

create database dbLojaAbC;

use dbLojaAbC;

create table tbFuncionarios(
codFunc int not null auto_increment,
nome varchar(100),
email varchar(100),
cpf char(14) unique,
dNasc date,
endereco varchar(100),
cep char(9),
numero char(10),
bairro varchar(100),
estado char(2),
cidade varchar(100),
primary key (codFunc)
);

create table tbUsuarios(
codUsu int not null auto_increment,
usuario varchar(30) not null,
senha varchar(10) not null,
codFunc int not null,
primary key(codUsu),
foreign key(codFunc) references tbFuncionarios(codFunc));

insert into tbUsuarios(usuario,senha,codFunc)values('admin','admin',1);

select usu.usuario, usu.senha, func.codFunc from tbFuncionarios as func inner join tbUsuarios as usu on func.codFunc = usu.codFunc where func.nome = 'Giovana Silva dos Santos';


select nome from tbFuncionarios order by nome asc;

select * from tbUsuarios where usuario = 'admin' and senha = 'admin';

-- insert into tbFuncionarios(nome,email,cpf,dNasc,endereco,cep,numero,bairro,estado,cidade)values();

-- Buscar por código
select * from tbFuncionarios where codFunc = 1;

-- Buscar por nome
select * from tbFuncionarios where nome like '%a%';

-- Inserir um campo de código não existente
select codFunc+1 from tbFuncionarios order by codFunc desc;

-- Buscar funcionário
select * from tbFuncionarios where nome = "@nome";

-- Alterar Funcionário
update tbFuncionarios set nome = @nome, email = @email, cpf = @cpf, dNasc = @dNasc, endereco = @endereco, cep = @cep, numero = @numero, bairro = @bairro, estado = @estado, cidade = @cidade where codFunc = @codFunc;

--Excluindo Funcionário
delete from tbFuncionarios where codFunc = @codFunc;

