CREATE DATABASE db_pizzaria_legal;
USE db_pizzaria_legal;

CREATE TABLE tb_categorias (
  id BIGINT AUTO_INCREMENT,
  nome VARCHAR(100) NOT NULL,
  PRIMARY KEY (id)
);
INSERT INTO tb_categorias (nome)
VALUES ("Salgados"), ("Doces"), ("Vegetarianos"), ("Especiais"), ("Recheadão");

CREATE TABLE tb_pizzas (
  id BIGINT AUTO_INCREMENT,
  nome VARCHAR(100),
  valor DECIMAL(10, 2),
  categoria_id BIGINT,
  PRIMARY KEY (id),
  FOREIGN KEY (categoria_id) REFERENCES tb_categorias (id)
);

INSERT INTO tb_pizzas (nome, valor, categoria_id)
VALUES ("Margherita", 50.00, 1),
       ("Calabresa", 45.00, 1),
       ("Brigadeiro", 30.00, 2),
       ("Quatro Queijos", 60.00, 1);


SELECT * FROM tb_pizzas WHERE valor > 45.00;
SELECT * FROM tb_pizzas WHERE valor BETWEEN 50.00 AND 100.00;
SELECT * FROM tb_pizzas WHERE nome LIKE '%M%';

SELECT p.*, c.nome AS categoria_nome
FROM tb_pizzas p
INNER JOIN tb_categorias c ON p.categoria_id = c.id;

SELECT p.*, c.nome AS categoria_nome
FROM tb_pizzas p
INNER JOIN tb_categorias c ON p.categoria_id = c.id
WHERE c.nome = 'Doces';