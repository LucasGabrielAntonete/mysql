create database empresa_2info3;
use empresa_2info3;

create table depto (
pk_depto int auto_increment primary key,
nome_depto varchar(20));

create table funcionario(
pk_funcionario int auto_increment primary key not null,
nome_funcionario varchar(45),
cargo_funcionario varchar(45),
salario_funcionario decimal(10,2),
fk_depto int not null,
foreign key(fk_depto) references depto(pk_depto)
on delete restrict on update cascade);

insert depto values (1,'gerencia'), (2,'vendas'), (3,'estoque'), (4,'TI');

select * from depto;

insert funcionario values
(1,'Marco André','Analista Sistemas',5000.00,4),
(2,'Marina','Gerente de RH',4500.00,1),
(3,'Marco Roja','Gerente de Software',6200.00,4),
(4,'Julio Batista','Diretor',8800.00,1),
(5,'Luiza Silva','Estoquista',1500.00,3),
(6,'Roberto Sousa','Vendedor',5000.00,2),
(7,'Adamo dal Berto','Gerente de Redes',8900.00,4),
(8,'Pedro Sobrinho','Gerente de RH',3000.00,1);

/* trabalhando com selects*/

select * from funcionario;
select nome_funcionario,cargo_funcionario from funcionario;
select cargo_funcionario,salario_funcionario from funcionario;
select salario_funcionario,cargo_funcionario,nome_funcionario from funcionario;
select nome_funcionario,cargo_funcionario from funcionario where fk_depto = 4;
select nome_funcionario,cargo_funcionario from funcionario where fk_depto = 1;
select nome_funcionario,cargo_funcionario from funcionario 
where cargo_funcionario = 'Gerente de RH';
select nome_funcionario,cargo_funcionario from funcionario 
where fk_depto = 4 order by nome_funcionario desc;
select nome_funcionario,salario_funcionario from funcionario 
where fk_depto = 4 order by nome_funcionario;
select nome_funcionario,salario_funcionario from funcionario
where salario_funcionario >=6500.00;
select nome_funcionario,salario_funcionario from funcionario 
where salario_funcionario <5500.00 order by salario_funcionario;
select nome_funcionario,salario_funcionario from funcionario 
where salario_funcionario >=3000.00 and salario_funcionario <= 5000.00;
select nome_funcionario,cargo_funcionario from funcionario 
where cargo_funcionario = 'Diretor' or cargo_funcionario = 'Gerente de Redes';


/* alteração de estrutura da tabela é o ALTER*/

select * from funcionario;

alter table funcionario add admissao_funcionario date;
alter table funcionario add dependentes_funcionario varchar(45);
alter table funcionario drop dependentes_funcionario;
alter table funcionario change admissao_funcionario dums_funcionario date;
alter table funcionario modify nome_funcionario varchar(60) ;
alter table funcionario add sexo_funcionario set('f','m') 
after nome_funcionario;  /* after = Depois de qual campo*/

/* trabalhando com alteração de registros*/
select * from funcionario;
update funcionario set sexo_funcionario = 'm' where pk_funcionario = 1;
update funcionario set dums_funcionario = '2010-01-08' where pk_funcionario = 1;
update funcionario set nome_funcionario = 'Marco Antonio Rojas' where pk_funcionario = 3;
update funcionario set cargo_funcionario = 'Gerente de Sistemas' where pk_funcionario = 1;

/* Apagando registros*/
delete from funcionario where pk_funcionario = 5;


