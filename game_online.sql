CREATE DATABASE db_generation_game_online;
USE db_generation_game_online;

CREATE TABLE tb_classes (
  id BIGINT AUTO_INCREMENT,
  nome VARCHAR(255) NOT NULL,
  habilidade VARCHAR(255),
  arma VARCHAR(255),
  PRIMARY KEY (id)
);
INSERT INTO tb_classes (nome, habilidade, arma)
VALUES ("Druida", "Magia", "Rod");
INSERT INTO tb_classes (nome, habilidade, arma)
VALUES ("Paladino", "Ataque a Distancia", "Arco e Flecha");
INSERT INTO tb_classes (nome, habilidade, arma)
VALUES ("Mago", "Magia e distancia", "Wand");
INSERT INTO tb_classes (nome, habilidade, arma)
VALUES ("Cavalheiro", "Ataque corpo a corpo", "Espada");

CREATE TABLE tb_personagens (
  id BIGINT AUTO_INCREMENT,
  nome VARCHAR(100),
  nivel INT,
  ataque INT,
  defesa INT,
  classe_id BIGINT,
  PRIMARY KEY (id),
  FOREIGN KEY (classe_id) REFERENCES tb_classes (id)
);


INSERT INTO tb_personagens (nome, nivel, ataque, defesa, classe_id)
VALUES ("Lord Paulista", 500, 3000, 1200, 4);
INSERT INTO tb_personagens (nome, nivel, ataque, defesa, classe_id)
VALUES ("Lord Cachorrinho", 400, 2500, 900, 3);
INSERT INTO tb_personagens (nome, nivel, ataque, defesa, classe_id)
VALUES ("Dragon Blast", 398, 2200, 700, 2);
INSERT INTO tb_personagens (nome, nivel, ataque, defesa, classe_id)
VALUES ("Doutor Blast", 600, 400, 2400, 1);



SELECT * FROM tb_personagens WHERE ataque > 2000;
SELECT * FROM tb_personagens WHERE defesa BETWEEN 1000 AND 2000;
SELECT * FROM tb_personagens WHERE nome LIKE '%C%';
SELECT p.*, c.nome AS classe_nome

FROM tb_personagens p
INNER JOIN tb_classes c ON p.classe_id = c.id;


SELECT p.*, c.nome AS classe_nome
FROM tb_personagens p
INNER JOIN tb_classes c ON p.classe_id = c.id
WHERE c.nome = 'Cavalheiro';

