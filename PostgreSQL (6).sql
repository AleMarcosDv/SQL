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

Insert into professores (nm_prof, disciplina) values ('Joyce', 'Português'), ('Silvana', 'Matemática'), ('Cristian', 'Inglês');

SELECT * from professores

Insert into alunos (nome_al, sala,  disciplina_id) values ('Luiz','3A', 1), ('Victor', '3B', 2), ('Isaac', '3C', 3), ('Luka', '2F', 2);

select * from alunos

select * from alunos inner join professores on professores.id_disciplina = alunos.disciplina_id;

select * from alunos right join professores on professores.id_disciplina = alunos.disciplina_id;

select * from alunos left join professores on professores.id_disciplina = alunos.disciplina_id;

