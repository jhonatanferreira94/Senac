/*
CRIAÇÃO DO BANCO DE DADOS BD_VENDAS - BD III
*/
create database bd_vendas;
-- ---------------------------------------------------------------------------------------------------------------------

/*
HABILITANDO O BANCO DE DADOS PARA USO
*/
use bd_vendas;
-- ---------------------------------------------------------------------------------------------------------------------

/*
CRIAÇÃO DA TABELA DE PRODUTOS
*/
create table tbl_produto (
  cod_produto   int unsigned auto_increment,
  nome_produto  varchar(100) not null,
  desc_produto  varchar(100) not null,
  unid_medida   varchar(2) not null,
  estoque_atual int default 0,
  estoque_min   int default 0,
  estoque_max   int default 0,
  valor         decimal(10,2) not null,
  primary key (cod_produto));
-- ---------------------------------------------------------------------------------------------------------------------

/*
CRIAÇÃO DA TABELA DE ENDEREÇO - CEP
*/
create table tbl_endereco (
  id int(10) not null,
  cep int(9) not null,
  logradouro varchar(90) not null,
  bairro varchar(50) not null,
  cidade varchar(50) not null,
  estado char(2) not null,
  
  primary key (cep)
);
-- ---------------------------------------------------------------------------------------------------------------------

/*
CRIAÇÃO DA TABELA DE CLIENTES
*/
create table tbl_cliente (
  cod_cliente  int unsigned auto_increment,
  nome_cliente varchar(45) not null,
  cpf          varchar(11) default '',
  data_nasc    date,
  cep          int(9) default 0,
  numero       varchar(10) default '',
  complemento  varchar(20) default '',
  
  primary key (cod_cliente),
  constraint foreign key fk_cliencep (cep) references tbl_endereco(cep)
  );
  
-- ---------------------------------------------------------------------------------------------------------------------

/*
CRIAÇÃO DA TABELA DE PEDIDOS
*/
create table tbl_pedido (
  cod_pedido   int unsigned auto_increment,
  data_pedido  date,
  data_entrega date,
  cod_cliente  int unsigned not null,
  primary key (cod_pedido),  
  constraint fk_cliente foreign key (cod_cliente)  
  references tbl_cliente(cod_cliente));    
-- ---------------------------------------------------------------------------------------------------------------------
    
/*
CRIAÇÃO DA TABELA DE ITENS DO PEDIDO
*/
create table tbl_itempedido (
  qtde          int unsigned not null,
  i_cod_pedido  int unsigned not null,
  i_cod_produto int unsigned not null,
  i_valor         decimal(10,2) not null,
  constraint fk_pedido1 foreign key (i_cod_pedido)  references tbl_pedido (cod_pedido),
  constraint fk_tbl_produto1 foreign key (i_cod_produto) references tbl_produto(cod_produto));
-- ---------------------------------------------------------------------------------------------------------------------

/*
CRIAÇÃO DA TABELA DE LOG
*/
create table tbl_log(
   id_log int not null auto_increment primary key,
   usuario varchar(50) not null,
   dt_log date not null,
   hora time not null,
   tipo_operacao varchar(15)
); 
-----------------------------------------------------------------------------------------------------------------------

/* trigger DELETE */

delimiter $ 

create trigger trg_log before delete
on tbl_cliente
for each row
begin
insert into tbl_log
(usuario, dt_log, hora)
values (user(), curdate(), curtime());

end$

show triggers from bd_vendas;

-----------------------------------------------------------------------------------------------------------------------

Exercício 

/*
Exercícios para fixação:

a) Modifique a tabela tbl_log acrescentando um campo onde armazene o tipo de 
operação realizada, sendo: “INSERÇÃO”, “ATUALIZAÇÃO” ou “EXCLUSÃO” e outro 
campo que armazene a tabela que está sendo realizadas as ações.
b) De acordo com o exercício A crie uma trigger que ao atualizar e antes de qualquer 
ação na tabela de Pedidos;
c) De acordo com o exercício A crie uma trigger que ao excluir e antes de qualquer 
ação na tabela de Produtos;
d) De acordo com o exercício A crie uma trigger que ao inserir e depois de qualquer 
ação na tabela de Clientes.

Essa atividade deverá ser desenvolvida em duplas e apresentada até a próxima aula.

*/


delimiter $

/*create trigger trg_log_ins after insert
on tbl_cliente
for each row
begin
insert into tbl_log
(usuario, dt_log, hora)
values (user(), curdate(), curtime());

end$

show triggers from bd_vendas;

alter table tbl_log add column operacao varchar (15);

alter table tbl_log drop tipo_operacao;

desc tbl_log; 

*/

/* Resolução do Exercício a e b  */

alter table tbl_log add column tipo_operacao varchar (15);

alter table tbl_log add column tabela varchar (15);

delimiter $

create trigger trg_logUp before update
on tbl_pedido
for each row
begin
insert into tbl_log
(usuario, dt_log, hora, tipo_operacao, tabela)
values (user(), curdate(), curtime(), 'ATUALIZAÇÃO', 'TBL_PEDIDO');

end $

SELECT * FROM TBL_PEDIDO;

update tbl_pedido set data_pedido = '2023-05-27'
where cod_pedido = 4;

select * from tbl_log;

alter table tbl_log drop operacao;

delimiter $

/*create trigger trg_logInc after insert
on tbl_pedido
for each row
begin
insert into tbl_log
(usuario, dt_log, hora, tipo_operacao, tabela)
values (user(), curdate(), curtime(), 'ATUALIZAÇÃO', 'TBL_PEDIDO');

end $ */

delimiter $

create trigger trg_logIncBef before insert
on tbl_pedido
for each row
begin
insert into tbl_log
(usuario, dt_log, hora, tipo_operacao, tabela)
values (user(), curdate(), curtime(), 'INCLUSÃO', 'TBL_PEDIDO');

end $

/*DROP TRIGGER trg_logIncBef;*/

select * from tbl_pedido;

select * from tbl_log;

insert into tbl_pedido (data_pedido, data_entrega, cod_cliente) values ('2023-05-20','2023-05-27', 8);

insert into tbl_pedido (data_pedido, data_entrega, cod_cliente) values ('2023-05-20','2023-05-27', 9);



/* Resolução do Exercício c */

delimiter $

create trigger trg_logDel before delete
on tbl_produto
for each row
begin
insert into tbl_log
(usuario, dt_log, hora, tipo_operacao, tabela)
values (user(), curdate(), curtime(), 'EXCLUSÃO', 'TBL_PEDIDO');

end $

DELETE FROM TBL_PRODUTO WHERE cod_produto = 10;

SELECT * FROM TBL_LOG;

/* Resolução do Exercício d */

delimiter $

create trigger trg_logClienteIns after insert
on tbl_cliente
for each row
begin
insert into tbl_log
(usuario, dt_log, hora, tipo_operacao, tabela)
values (user(), curdate(), curtime(), 'INCLUSÃO', 'TBL_CLIENTE');

end $

insert into tbl_cliente (nome_cliente,cpf,data_nasc,cep,numero,complemento) values
('Marcos Ferreira','12345678902','1981-02-09',6768100,'1625','apto 16C');


show triggers

select * from tbl_log















