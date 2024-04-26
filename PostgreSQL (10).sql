CREATE TABLE clientes (
    cliente_id SERIAL PRIMARY KEY,
    nome VARCHAR(100),
    email VARCHAR(100),
    data_cadastro DATE
);

CREATE TABLE vendas (
    venda_id SERIAL PRIMARY KEY,
    cliente_id INTEGER,
    produto VARCHAR(100),
    valor NUMERIC(10, 2),
    data_venda DATE,
  	CONSTRAINT fk_cliente foreign key (cliente_id)  REFERENCES clientes(cliente_id)
);

create or replace function clientes_hoje(data_pesquisa DATE)
returns INTEGER as $$
DECLARE
	total_clientes INT;
BEGIN

select COUNT(*) into total_clientes 
from clientes
where date(data_cadastro) = data_pesquisa;

return total_clientes;
end;
$$ language plpgsql

SELECT clientes_hoje('2024-04-25') AS total_clientes_cadastrados;

insert into clientes(nome, email, data_cadastro) values ('EX1', 'emailexemple@gmail.com','2024-04-25'), ('EX2', 'emailexemple@gmail.com', '2024-04-25'), ('EX3','emailexemple@gmail.com', '2024-04-25')

