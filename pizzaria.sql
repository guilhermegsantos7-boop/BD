
CREATE DATABASE db_pizzaria;
USE db_pizzaria;

CREATE TABLE cliente (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    senha VARCHAR(255) NOT NULL
);

CREATE TABLE pedido (
    id_pedido INT AUTO_INCREMENT PRIMARY KEY,
    idcliente INT NOT NULL,
    quantidade INT NOT NULL,
    data_pedido DATE NOT NULL,
    valor_total DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (idcliente) REFERENCES cliente(id_cliente)
);

CREATE TABLE pizza (
    id_pizza INT AUTO_INCREMENT PRIMARY KEY,
    idpedido INT NOT NULL,
    sabor VARCHAR(100) NOT NULL,
    valor DECIMAL(10,2) NOT NULL,
    tamanho VARCHAR(20) NOT NULL,
    FOREIGN KEY (idpedido) REFERENCES pedido(id_pedido)
);

CREATE TABLE contem (
    id_pedido INT NOT NULL,
    id_pizza INT NOT NULL,
    quantidade INT NOT NULL,
    PRIMARY KEY (id_pedido, id_pizza),
    FOREIGN KEY (id_pedido) REFERENCES pedido(id_pedido),
    FOREIGN KEY (id_pizza) REFERENCES pizza(id_pizza)
);

INSERT INTO cliente (nome, email, senha) VALUES
('Pedro Almeida', 'pedro@email.com', 'hash_pedro_123'),
('Juliana Martins', 'juliana@email.com', 'hash_juliana_456'),
('Rafael Souza', 'rafael@email.com', 'hash_rafael_789');


INSERT INTO pedido
(idcliente, quantidade, data_pedido, valor_total) VALUES
(1, 2, '2026-10-10', 82.00),
(2, 1, '2026-10-11', 48.00),
(3, 1, '2026-10-12', 42.00);


INSERT INTO pizza (idpedido, sabor, valor, tamanho) VALUES
(1, 'Portuguesa', 40.00, 'Grande'),
(1, 'Quatro Queijos', 42.00, 'Grande'),
(2, 'Pepperoni', 48.00, 'Grande'),
(3, 'Bacon', 42.00, 'Média');


INSERT INTO contem (id_pedido, id_pizza, quantidade) VALUES
(1, 1, 1),
(1, 2, 1),
(2, 3, 1),
(3, 4, 1);
