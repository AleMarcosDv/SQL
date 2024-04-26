create table produtos(
id_prod serial primary key,
prod_nome varchar(20) not NULL unique
);

alter table produtos 
add column qntd_est INT,
add constraint fk_estoque FOREIGN key (qntd_est) references estoque(id_prod_est)

create table estoque(
id_prod_est serial PRIMARY key,
nome VARCHAR(20) not NULL,
quantidade INT not NULL
);

alter table estoque add constraint fk_produtos FOREIGN key (nome) references  produtos(prod_nome);

CREATE or replace PROCEDURE alter_estoque()
as $$
BEGIN
    perform  *  FROM estoque;
END;
$$ language PLPGSQL;

CREATE function alter_in_estoque()
returns trigger 
as $$
BEGIN
	call alter_estoque();
    return new;
   end ;
 $$ language PLPGSQL;
    
    
    CREATE trigger alter_tabela
    after insert on estoque
    for each ROW
    execute function alter_in_estoque();

INSERT INTO estoque (nome, quantidade) VALUES ('Banana', 10);
INSERT INTO produtos (prod_nome) VALUES ('Banana');


create or replace procedure bnc_estoque (produto INT, mnr_quantidade INT)
as $$ 
BEGIN
	update estoque 
    set quantidade = 	quantidade - mnr_quantidade
	where id_prod_est = produto;
end ;
$$ Language plpgsql;

call bnc_estoque( 7, 2)

select * from estoque