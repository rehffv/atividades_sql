/* CODEPARK III
Uma empresa de vendas tem um banco de dados com informações sobre os seus produtos. 
Ela precisa criar um relatório que faça um levantamento diário da quantidade de produtos comprados por dia. 
Para ajudar a empresa, crie um procedure para agilizar esse processo.

Trabalhe esse código em seu IDE, suba ele para sua conta no GitHub e compartilhe o link desse projeto no campo ao lado para que outros desenvolvedores possam analisá-lo. */


CREATE DATABASE vendinha_do_seu_ze;

USE vendinha_do_seu_ze;


create table produtos_gerais(
  id serial PRIMARY KEY,
  data_chegada DATE NOT NULL,
  laticinios INT,
  bebidas INT,
  nao_pereciveis INT,
  pereciveis INT
);


INSERT INTO produtos_gerais
(id, data_chegada, laticinios, bebidas, nao_pereciveis, pereciveis)
VALUES
(1, '2023-02-13',10,10,20,10),
(2, '2023-02-14',7,15,30,9),
(3, '2023-02-15',9,25,15,12),
(4, '2023-02-16',15,40,25,14),
(5, '2023-02-17',4,100,32,10)


CREATE or REPLACE PROCEDURE vendas_pre_carnaval(data_entrada DATE)
LANGUAGE plpgsql;
RETURNS TABLE (id INT, data_chegada DATE, laticinios INT, bebidas INT, nao_pereciveis INT, pereciveis INT) AS $$
BEGIN
  RETURN QUERY
  SELECT *
  FROM produtos_gerais
  WHERE produtos_gerais.data_chegada = data_entrada;
END; 
$$;