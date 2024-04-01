CREATE DATABASE db_construindo_vidas;
USE db_construindo_vidas;

CREATE TABLE tb_categorias (
  id BIGINT AUTO_INCREMENT,
  nome VARCHAR(100) NOT NULL,
  PRIMARY KEY (id)
);

INSERT INTO tb_categorias (nome)
VALUES ("Ferramentas"), ("Elétrica"), ("Hidráulica"), ("Materiais de Acabamento"), ("Materiais de Construção");

CREATE TABLE tb_produtos (
  id BIGINT AUTO_INCREMENT,
  nome VARCHAR(100),
  valor DECIMAL(10, 2),
  categoria_id BIGINT,
  PRIMARY KEY (id),
  FOREIGN KEY (categoria_id) REFERENCES tb_categorias (id)
);
INSERT INTO tb_produtos (nome, valor, categoria_id)
VALUES ("Martelo", 20.00, 1),
       ("Tinta", 80.00, 5),
       ("Chuveiro", 50.00, 2),
       ("Kit Tomada", 150.00, 2);

SELECT * FROM tb_produtos WHERE valor > 100.00;
SELECT * FROM tb_produtos WHERE valor BETWEEN 70.00 AND 150.00;
SELECT * FROM tb_produtos WHERE nome LIKE '%C%';
SELECT p.*, c.nome AS categoria_nome
FROM tb_produtos p
INNER JOIN tb_categorias c ON p.categoria_id = c.id;
SELECT p.*, c.nome AS categoria_nome
FROM tb_produtos p
INNER JOIN tb_categorias c ON p.categoria_id = c.id
WHERE c.nome = 'Hidráulica';
