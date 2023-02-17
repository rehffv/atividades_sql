Atividade de aula - 07/02/2023

CREATE TABLE artista (
id_artista SERIAL PRIMARY KEY,
nome VARCHAR(50) UNIQUE
)

CREATE TABLE musica (
id_musica serial PRIMARY key,
nome VARCHAR(50),
duracao_seg int
)

INSERT INTO artista
(nome)
VALUES
('My Chemical Romance'),
('The Used'),
('System of a Down')

INSERT into musica
(nome, duracao_seg)
VALUES
('Helena', 195),
('I Caught Fire', 195),
('Aerials', 213)


CREATE TABLE artista_musica (
fk_id_artista INT,
fk_id_musica INT,
CONSTRAINT artista_musica_pk PRIMARY KEY (fk_id_artista, fk_id_musica), 
CONSTRAINT fk_id_artista FOREIGN KEY(fk_id_artista) REFERENCES artista (id_artista),
CONSTRAINT fk_id_musica FOREIGN KEY(fk_id_musica) REFERENCES musica(id_musica)
)
 

INSERT INTO artista_musica VALUES
(1,1),
(2,2),
(3,3)