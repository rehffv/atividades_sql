Atividade de aula - 09/02/2023

CREATE TABLE cliente(
  ID SERIAL PRIMARY KEY,
  nome VARCHAR NOT NULL,
  sobrenome VARCHAR NOT NULL,
  idade INT NOT NULL
)

CREATE TABLE pedido(
  ID SERIAL PRIMARY KEY,
  item VARCHAR NOT NULL,
  quantidade INT NOT NULL,
  fk_id_cliente INT NOT NULL,
  CONSTRAINT fk_id_cliente FOREIGN KEY (fk_id_cliente) REFERENCES cliente (ID)
)


INSERT INTO cliente
(nome, sobrenome, idade)
VALUES 
('Renata', 'de Paula', 36),
('Giovanni', 'Kobayashi', 28),
('Nicollas', 'Assis', 12)

INSERT INTO pedido
(item , quantidade, fk_id_cliente)
VALUES 
('Tênis', 1, 1),
('Camiseta', 4, 2),
('Lego', 10, 3)


SELECT * FROM pedido
INNER JOIN cliente
ON pedido.fk_id_cliente = cliente.id


SELECT * FROM pedido
RIGHT JOIN cliente
ON pedido.fk_id_cliente = cliente.id


SELECT * FROM pedido
RIGHT JOIN cliente
ON pedido.fk_id_cliente = cliente.id
WHERE pedido.id IS NULL;


SELECT * FROM pedido
LEFT JOIN cliente
ON pedido.fk_id_cliente = cliente.id


SELECT * FROM pedido
LEFT JOIN cliente
ON pedido.fk_id_cliente = cliente.id
WHERE pedido.id IS NULL


SELECT pedido.id, cliente.id
FROM pedido
JOIN  cliente 
ON pedido.id = cliente.id


SELECT pedido.id, pedido.item, cliente.id
FROM pedido
JOIN cliente
ON pedido.id = cliente.id;