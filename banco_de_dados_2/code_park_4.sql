/* CODEPARK IV

Uma loja tem um banco de dados que contém todo o controle de vendas de produtos e de cadastro de clientes. 
Pensando nisso, crie uma função para somar todos os clientes que foram cadastrados na loja durante um dia.

Trabalhe esse código em seu IDE, suba ele para sua conta no GitHub e compartilhe o link desse projeto no campo ao lado para que outros desenvolvedores possam analisá-lo. */


CREATE FUNCTION add_clientes_today(id_cliente)
RETURNS VARCHAR(20)
BEGIN
   RETURN(count(id_cliente) FROM cadastro_cliente WHERE data_cadastro = '17/02/2023')
END