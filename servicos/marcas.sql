DROP TABLE IF EXISTS `comentarios`;

CREATE TABLE `comentarios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `comentario` varchar(510) NOT NULL,
  `feed` int NOT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `conta` varchar(255) NOT NULL,
  `data` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_feed_idx` (`feed`),
  CONSTRAINT `fk_comentarios_feeds` FOREIGN KEY (`feed`) REFERENCES `feeds` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `comentarios` WRITE;
INSERT INTO `comentarios` VALUES (1,'teste',1,'Rafael Carvalho','fanfones.10@outlook.com','2025-02-07 22:18:23');
UNLOCK TABLES;

DROP TABLE IF EXISTS `empresas`;
CREATE TABLE `empresas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `avatar` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `empresas` WRITE;
INSERT INTO `empresas` VALUES (1,'Ifba','ifba-divulgao.jpg');
UNLOCK TABLES;

DROP TABLE IF EXISTS `feeds`;
CREATE TABLE `feeds` (
  `id` int NOT NULL AUTO_INCREMENT,
  `data` datetime NOT NULL,
  `curso` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_feeds_cursos_idx` (`curso`),
  CONSTRAINT `fk_feeds_cursos` FOREIGN KEY (`curso`) REFERENCES `cursos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `feeds` WRITE;
INSERT INTO `feeds` VALUES (1,'2025-03-10 18:21:11',1),(2,'2025-04-14 18:21:11',2),(3,'2025-04-14 18:21:11',3),(4,'2025-04-14 18:21:11',4),(5,'2025-04-14 18:21:11',5),(6,'2025-04-14 18:21:11',6),(7,'2025-04-14 18:21:11',7);
UNLOCK TABLES;

DROP TABLE IF EXISTS `likes`;
CREATE TABLE `likes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `feed` int NOT NULL,
  `email` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_likes_feeds_idx` (`feed`),
  CONSTRAINT `fk_likes_feeds` FOREIGN KEY (`feed`) REFERENCES `feeds` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `likes` WRITE;
INSERT INTO `likes` VALUES (5,1,'fanfones.10@gmail.com');
UNLOCK TABLES;

DROP TABLE IF EXISTS `cursos`;
CREATE TABLE `cursos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `descricao` varchar(510) NOT NULL,
  `preco` decimal(10,2) NOT NULL,
  `url` varchar(1020) NOT NULL,
  `imagemCurso` VARCHAR(255) NOT NULL,
  `imagemEmpresa` VARCHAR(255) NOT NULL,
  `empresa` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_cursos_empesas_idx` (`empresa`),
  CONSTRAINT `fk_cursos_empesas` FOREIGN KEY (`empresa`) REFERENCES `empresas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `cursos` WRITE;
INSERT INTO `cursos` VALUES 
(1, 'Curso Flutter', 'Aprenda a desenvolver aplicativos móveis multiplataforma usando Flutter e Dart. Criar aplicativos rápidos e bonitos para Android e iOS.', 100.00, 'https://cursos.flutter.com.br/', 'ifba-divulgao.jpg', 'flutter.png'),
(2, 'Python para Iniciantes', 'Descubra como começar na programação com Python. Ideal para automação, ciência de dados e desenvolvimento web.', 199.90, 'https://cursos.pythoniniciante.com/', 'ifba-divulgao.jpg', 'python.jpg'),
(3, 'Marketing Digital', 'Entenda como criar estratégias de marketing digital, incluindo SEO, anúncios pagos e redes sociais, para alcançar mais clientes online.', 149.90, 'https://marketingdigital.expert/', 'ifba-divulgao.jpg', 'marketing-digital.png'),
(4, 'Design Gráfico com Canva', 'Aprenda a criar designs profissionais e chamativos usando o Canva, uma ferramenta intuitiva e poderosa para iniciantes e profissionais.', 129.90, 'https://canvadesign.com/', 'ifba-divulgao.jpg', 'canva.png'),
(5, 'Desenvolvimento Web', 'Construa páginas da web modernas e interativas dominando os pilares do desenvolvimento front-end. Indicado para quem quer criar sites do zero.', 249.00, 'https://webdev.expert/', 'ifba-divulgao.jpg', 'web.png'),
(6, 'Edição de Vídeo', 'Descubra as ferramentas básicas e avançadas do Adobe Premiere Pro para editar vídeos de forma profissional para YouTube e redes sociais.', 279.00, 'https://videoedit.com.br/', 'ifba-divulgao.jpg', 'edicao-video.png'),
(7, 'Excel Avançado', 'Domine recursos avançados do Excel, como tabelas dinâmicas, macros e funções complexas. Ideal para melhorar a produtividade no trabalho.', 99.00, 'https://excelpro.com.br/', 'ifba-divulgao.jpg', 'excel.png'),
(8, 'Curso de Fotografia', 'Aprenda técnicas para tirar fotos incríveis usando apenas seu celular, desde a composição até a edição básica.', 89.00, 'https://fotografiafacil.com/', 'ifba-divulgao.jpg', 'fotografia.png');

UNLOCK TABLES;