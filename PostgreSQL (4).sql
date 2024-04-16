
CREATE database escola

USE escola

create TABLE aluno(
 id_aluno serial PRIMARY key,
 nome varchar(35) not NULL,
 email varchar(60) not NULL,
 telefone varchar(13)not null,
 endereco varchar (70) not NULL
);

alter table aluno drop column telefone

SELECT * from aluno

insert into aluno (nome, email, telefone, endereco) values ('Luka', 'Lukaloot@gmail.com', '74989138190', 'Rua Pelicanos ')