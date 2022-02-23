Create table produtos(

	Codigo			int				not null,
	Descricao		varchar(50)		not null,
	Data_Validade	datetime,
	EAN				varchar(15)     not null,
	Ind_Nativo		int				not null default 0

);

alter table produtos
add constraint pk_produtos
primary key (Codigo);

alter table produtos
add EAN varchar(15) not null
;

create index IDX_PRODUTOS_EAN
on produtos(EAN);


insert into produtos values(1, 'Nome do produto',GETDATE(),0,'123456789');

select * from produtos
where Descricao like '%produto'

select count(*) as total
 from produtos


 create table lojas(
 Codigo			int				not null,
 Nome			varchar(50)		not null,
 Ind_Nativo		int				not null default 0,
 constraint lojas_pk primary key(codigo)
);

insert into lojas(Codigo, Nome) values (1000, 'Filial Nova Iguaçu');
insert into lojas(Codigo, Nome) values (2000, 'Filial São Paulo');
insert into lojas(Codigo, Nome) values (3000, 'Filial Recife');

select * from lojas

select codigo
, nome
from lojas
where Ind_Nativo = 0 

create table estoque(
	codigo_produto int not null,
	codigo_filial int not null,
	quantidade decimal not null default 0,
	constraint estoque_pk primary key (codigo_produto,  codigo_filial)
);

alter table estoque
add constraint fk_estoque_produtos
foreign key (codigo_produto)
references produtos(Codigo);

alter table estoque
add constraint fk_estoque_lojas
foreign key (codigo_filial)
references lojas(Codigo);

insert into estoque(codigo_produto, codigo_filial, quantidade) values (1, 1000, 10)

alter table estoque
drop constraint fk_estoque_lojas


select e.codigo_filial,
	L.Nome,
	e.codigo_produto,
	p.Descricao,
	e.quantidade
 from estoque E
inner join lojas L
on e.codigo_filial = l.codigo
Inner join produtos P
on e.codigo_produto = p.Codigo
