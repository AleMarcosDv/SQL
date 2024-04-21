CREATE DATABASE escola
USE escola

CREATE TABLE alunos (
  id_aluno SERIAL PRIMARY key,
  nome_al varchar(40) not NULL,
  sala varchar(4),
  disciplina_id INT NOT NULL,
  CONSTRAINT fk_disciplina foreign key (disciplina_id) REFERENCES professores(id_disciplina)
);

create table professores(
 id_disciplina SERIAL PRIMARY key,
 nm_prof varchar(40) not NULL,
 disciplina varchar(30) not null
);

create table historico(
id_hist SERIAL PRIMARY key,
nome varchar(20) NOT NULL,
serie varchar(2) not NULL,
id_aluno_hist INT not NULL,
CONSTRAINT fk_aluno FOREIGN key (id_aluno_hist) REFERENCES alunos(id_aluno)
);

Insert into professores (nm_prof, disciplina) values ('Joyce', 'Português'), ('Silvana', 'Matemática'), ('Cristian', 'Inglês');

SELECT * from professores

Insert into alunos (nome_al, sala,  disciplina_id) values ('Luiz','3A', 1), ('Victor', '3B', 2), ('Isaac', '3C', 3), ('Luka', '2F', 2);

select * from historico

select * from alunos inner join professores on professores.id_disciplina = alunos.disciplina_id;

select * from alunos right join professores on professores.id_disciplina = alunos.disciplina_id;

select * from alunos left join professores on professores.id_disciplina = alunos.disciplina_id;

DELIMITER //


create or replace FUNCTION inserir_historico()
RETURNS TRIGGER as $$
begin 
insert into historico (nome, serie, id_aluno_hist) VALUES ( NEW.nome_al, NEW.sala, NEw.id_aluno);
return NEW;
END;
$$LANGUAGE plpgsql;

CREATE TRIGGER nv_aluno
AFTER INSERT ON alunos 
FOR EACH ROW
EXECUTE function inserir_historico();

drop trigger nv_aluno
insert into alunos (nome_al, sala, disciplina_id) values ('Ale', '3A', 2)
