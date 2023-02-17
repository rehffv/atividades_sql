/*
CODEPARK I
Desenvolva um banco de dados e relacione tabelas através de chaves estrangeiras ou nomes de colunas iguais. Siga as instruções:
crie uma base de dados; 
crie tabelas nessa base de dados;
em cada tabela, adicione atributos;
insira dados em cada tabela;
utilize os comandos Joins para realizar consultas nas tabelas. 
 
Trabalhe esse código em seu IDE, suba ele para sua conta no GitHub e compartilhe o link desse projeto no campo ao lado para que outros desenvolvedores possam analisá-lo.*/

CREATE DATABASE biblioteca; 
USE biblioteca;

 CREATE TABLE livros (
  id SERIAL PRIMARY KEY,
  titulo VARCHAR(20) UNIQUE,
  autor VARCHAR(20)
  );


CREATE TABLE cliente (
  id SERIAL PRIMARY KEY,
  nome VARCHAR(50) not NULL,
  cpf VARCHAR(14) not null,
  telefone VARCHAR(19) not null
  );


CREATE TABLE livros_emprestimo (
  fk_id_livro INT,
  fk_id_cliente INT,
  retirada varchar(10),
  entrega varchar(10),
  dias_aluguel INT,
  CONSTRAINT livros_emprestimo_pk PRIMARY KEY(fk_id_livro,fk_id_cliente),
  CONSTRAINT fk_id_livro FOREIGN KEY(fk_id_livro) REFERENCES livros(id),
  CONSTRAINT fk_id_cliente FOREIGN KEY(fk_id_cliente) REFERENCES cliente(id)
  );


INSERT INTO livros
(titulo,autor)
VALUES
('Crepúsculo','Stephenie Meyer'),
('O senhor dos Anéis','J.R.R. Tolkien'),
('O Conto da Aia','Margareth Atwood')


INSERT INTO cliente
(nome,cpf,telefone)
VALUES
('Renata','364.246.918-39','(13) 98862-1696'),
('Giovanni','269.784.928-69','(11) 96321-4785'),
('Nicollas','247.854.231.02','(13) 95423-6974')


INSERT into livros_emprestimo
VALUES 
(1,3,'17/02/2023','22/02/2023',5),
(2,1,'10/02/2023','13/02/2023',6),
(3,2,'15/02/2023','16/02/2023',6)


select * from livros
select * from cliente
select * from livros_emprestimo

select livros.titulo, 
cliente.nome, 
retirada, 
entrega, 
dias_aluguel
from livros_emprestimo
inner join livros livros ON fk_id_livro = livros.id
inner join cliente cliente on fk_id_cliente = cliente.id