CREATE table cliente (
  id SERIAL PRIMARY key,
  nome VARCHAR(16) NOT NULL,
  sobrenome VARCHAR(24) not NULL,
  idade INT,
  pais VARCHAR(4)
  );
CREATE table pedido (
    id SERIAL,
    item VARCHAR(48) not NULL,
    quantidade INT NOT NULL,
    fk_id_cliente INT NOT NULL,
    CONSTRAINT fk_cliente FOREIGN key(fk_id_cliente) REFERENCES cliente(id)
);
INSERT INTO cliente(nome, sobrenome, idade, pais) VALUES
  ('João', 'Alves', 48, 'BR'),
  ('Roberto', 'Garcia', 36, 'MX'),
  ('Dario', 'Rubens', 39, 'ARG'),
  ('Julia', 'Lopes', 28, 'PE'),
  ('Rebeca', 'Giglio', 54, 'IT');
INSERT INTO pedido(item, quantidade, fk_id_cliente) VALUES
  ('teclado', 1, 4),
  ('mouse', 2, 4),
  ('monitor', 8, 3),
  ('teclado', 1, 1),
  ('mousepad', 4, 2);
  
  select * from pedido inner join cliente on pedido.fk_id_cliente = cliente.id;
  
  select * from pedido right join cliente on pedido.fk_id_cliente = cliente.id;
  
  select * from pedido left join cliente on pedido.fk_id_cliente = cliente.id;
  
  select pedido.id as num_pedidos, cliente.id as num_cliente from pedido inner join cliente on pedido.fk_id_cliente = cliente.id;  
  
  select pedido.id as num_pedidos, cliente.id as num_cliente from pedido right join cliente on pedido.fk_id_cliente = cliente.id;
  
  select pedido.id as num_pedidos, cliente.id as num_cliente from pedido left join cliente on pedido.fk_id_cliente = cliente.id;
