/*Instruções do projeto
Crie um banco de dados, adicione tabelas e determine quais são os atributos de cada uma. 
Em seguida, execute um trigger que se relacione com algum comando, como insert, select, delete ou update.

Trabalhe esse código em seu IDE, suba ele para sua conta no GitHub e compartilhe o link desse projeto no campo ao lado para que outros desenvolvedores possam analisá-lo.*/


CREATE DATABASE empresa_x;
USE empresa_x;


CREATE TABLE cliente (
  id SERIAL PRIMARY KEY,
  nome VARCHAR(50),
  cpf VARCHAR(14),
  telefone VARCHAR(19),
  endereco VARCHAR(75),
  cidade VARCHAR(20),
  estado CHAR(2)
);


CREATE TABLE negocios (
  id SERIAL PRIMARY KEY,
  cliente_id INT,
  investimento VARCHAR,
  valor INT,
  FOREIGN KEY (cliente_id) REFERENCES cliente(id)
);


INSERT INTO cliente (nome, cpf, telefone, endereco, cidade, estado)
VALUES
  ('Renata', '364.246.918-39', '(13) 98862-1696', 'Av das Praças', 'Santos', 'SP'),
  ('Giovanni', '269.784.928-69', '(11) 96321-4785', 'Rua das Alamedas', 'Guarulhos', 'SP'),
  ('Nicollas', '247.854.231.02', '(13) 95423-6974', 'Travessa ABC', 'Santos', 'SP')


INSERT INTO negocios (cliente_id, investimento, valor)
VALUES
  (1, '10 mil cabeças de bois', 100000),
  (2, 'Ações Petrobrás', 500000),
  (3, 'Bitcoins', 1000000);


SELECT cliente.nome, negocios.investimento, negocios.valor
FROM cliente
INNER JOIN negocios ON cliente.id = negocios.cliente_id;


DELIMITER $$
CREATE TRIGGER log_update_dados
AFTER UPDATE ON cliente 
FOR EACH ROW
BEGIN
  INSERT INTO update_dados (cliente_id, nome_anterior, nome_atual, endereco_anterior, endereco_atual)
  VALUES (OLD.id, OLD.nome, NEW.nome, OLD.endereco, NEW.endereco);
END$$
DELIMITER ;