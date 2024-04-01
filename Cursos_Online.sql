CREATE DATABASE db_curso_da_minha_vida;

USE db_curso_da_minha_vida;

CREATE TABLE tb_categorias (
  id BIGINT AUTO_INCREMENT,
  nome VARCHAR(100) NOT NULL,
  PRIMARY KEY (id)
);

INSERT INTO tb_categorias (nome)
VALUES ("Programação"), ("Beleza"), ("Culinaria"), ("Idiomas Estrangeiros"), ("Atividade Física");

CREATE TABLE tb_cursos (
  id BIGINT AUTO_INCREMENT,
  nome VARCHAR(100),
  valor DECIMAL(10, 2),
  categoria_id BIGINT,
  PRIMARY KEY (id),
  FOREIGN KEY (categoria_id) REFERENCES tb_categorias (id)
);

INSERT INTO tb_cursos (nome, valor, categoria_id)
VALUES ("Curso de Desenvolvimento Python", 800.00, 1),
       ("Curso Design de Sobrancelha", 600.00, 2),
       ("Curso Geladinho Gourmet", 900.00, 3),
       ("Curso de Espanhol basico", 1200.00, 4);

SELECT * FROM tb_cursos WHERE valor > 500.00;
SELECT * FROM tb_cursos WHERE valor BETWEEN 600.00 AND 1000.00;
SELECT * FROM tb_cursos WHERE nome LIKE '%J%';

SELECT c.*, cat.nome AS categoria_nome
FROM tb_cursos c
INNER JOIN tb_categorias cat ON c.categoria_id = cat.id;

SELECT c.*, cat.nome AS categoria_nome
FROM tb_cursos c
INNER JOIN tb_categorias cat ON c.categoria_id = cat.id
WHERE cat.nome = 'Programação';
