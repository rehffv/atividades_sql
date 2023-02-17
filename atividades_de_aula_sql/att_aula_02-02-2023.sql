Atividade de aula - 02/02/2023


CREATE TABLE artista(
	id_artista SERIAL PRIMARY KEY,
	nome VARCHAR (50) UNIQUE
)

CREATE TABLE gravacao (
id SERIAL PRIMARY KEY,
ducacao_seg int not null
)

CREATE TABLE musica(
	id_musica SERIAL PRIMARY KEY,
	nome VARCHAR (50) NOT NULL
)

DROP TABLE gravacao

ALTER TABLE musica 
ADD COLUMN duracao_seg INT

INSERT INTO artista
(nome)
VALUES
('My Chemical Romance'),
('The Used'),
('Evanescence'),
('System of a Down')

INSERT INTO musica 
(nome, duracao_seg)
VALUES
('Helena', 195),
('I Caught Fire', 195),
('Missing', 250),
('Aerials', 213)

ALTER TABLE musica
	ADD COLUMN fk_id_artista INT,
	ADD CONSTRAINT fk_id_artista FOREIGN KEY(fk_id_artista) REFERENCES artista (id_artista)

UPDATE musica
SET fk_id_artista = 1
where nome = 'Helena'

UPDATE musica
SET fk_id_artista = 2
where nome = 'I Caught Fire'

UPDATE musica
SET fk_id_artista = 3
where nome = 'Missing'

UPDATE musica
SET fk_id_artista = 4
where nome = 'Aerials'
 

ALTER TABLE musica
	DROP CONSTRAINT fk_id_artista

ALTER TABLE musica
	ADD CONSTRAINT fk_id_artista
	FOREIGN KEY (fk_id_artista) 
	REFERENCES artista (id_artista)
	ON DELETE CASCATE

DELETE FROM artista
	WHERE nome = 'Evanescence'