-- DROP TABLE IF EXISTS `comentarios`;

-- CREATE TABLE `comentarios` (
--   `id` int NOT NULL AUTO_INCREMENT,
--   `comentario` varchar(510) NOT NULL,
--   `feed` int NOT NULL,
--   `nome` varchar(255) DEFAULT NULL,
--   `conta` varchar(255) NOT NULL,
--   `data` datetime NOT NULL,
--   PRIMARY KEY (`id`),
--   KEY `fk_feed_idx` (`feed`),
--   CONSTRAINT `fk_comentarios_feeds` FOREIGN KEY (`feed`) REFERENCES `feeds` (`id`)
-- ) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- LOCK TABLES `comentarios` WRITE;
-- INSERT INTO `comentarios` VALUES (1,'teste',1,'Rafael Carvalho','fanfones.10@outlook.com','2025-02-07 22:18:23');
-- UNLOCK TABLES;

-- DROP TABLE IF EXISTS `empresas`;
-- CREATE TABLE `empresas` (
--   `id` int NOT NULL AUTO_INCREMENT,
--   `nome` varchar(255) NOT NULL,
--   `avatar` varchar(255) NOT NULL,
--   PRIMARY KEY (`id`)
-- ) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- LOCK TABLES `empresas` WRITE;
-- INSERT INTO `empresas` VALUES (1,'Ifba','ifba-divulgao.jpg');
-- UNLOCK TABLES;

-- DROP TABLE IF EXISTS `feeds`;
-- CREATE TABLE `feeds` (
--   `id` int NOT NULL AUTO_INCREMENT,
--   `data` datetime NOT NULL,
--   `curso` int DEFAULT NULL,
--   PRIMARY KEY (`id`),
--   KEY `fk_feeds_cursos_idx` (`curso`),
--   CONSTRAINT `fk_feeds_cursos` FOREIGN KEY (`curso`) REFERENCES `cursos` (`id`)
-- ) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- LOCK TABLES `feeds` WRITE;
-- INSERT INTO `feeds` VALUES (1,'2025-03-10 18:21:11',1),(2,'2025-04-14 18:21:11',2),(3,'2025-04-14 18:21:11',3),(4,'2025-04-14 18:21:11',4),(5,'2025-04-14 18:21:11',5),(6,'2025-04-14 18:21:11',6),(7,'2025-04-14 18:21:11',7);
-- UNLOCK TABLES;

-- DROP TABLE IF EXISTS `likes`;
-- CREATE TABLE `likes` (
--   `id` int NOT NULL AUTO_INCREMENT,
--   `feed` int NOT NULL,
--   `email` varchar(255) NOT NULL,
--   PRIMARY KEY (`id`),
--   KEY `fk_likes_feeds_idx` (`feed`),
--   CONSTRAINT `fk_likes_feeds` FOREIGN KEY (`feed`) REFERENCES `feeds` (`id`)
-- ) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- LOCK TABLES `likes` WRITE;
-- INSERT INTO `likes` VALUES (5,1,'fanfones.10@gmail.com');
-- UNLOCK TABLES;

-- DROP TABLE IF EXISTS `cursos`;
-- CREATE TABLE `cursos` (
--   `id` int NOT NULL AUTO_INCREMENT,
--   `nome` varchar(255) NOT NULL,
--   `descricao` varchar(510) NOT NULL,
--   `preco` decimal(10,2) NOT NULL,
--   `url` varchar(1020) NOT NULL,
--   `imagemCurso` VARCHAR(255) NOT NULL,
--   `imagemEmpresa` VARCHAR(255) NOT NULL,
--   `empresa` int NOT NULL,
--   PRIMARY KEY (`id`),
--   KEY `fk_cursos_empesas_idx` (`empresa`),
--   CONSTRAINT `fk_cursos_empesas` FOREIGN KEY (`empresa`) REFERENCES `empresas` (`id`)
-- ) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- LOCK TABLES `cursos` WRITE;
-- INSERT INTO `cursos` VALUES 
-- (1, 'Curso Flutter', 'Aprenda a desenvolver aplicativos móveis multiplataforma usando Flutter e Dart. Criar aplicativos rápidos e bonitos para Android e iOS.', 100.00, 'https://cursos.flutter.com.br/', 'ifba-divulgao.jpg', 'flutter.png'),
-- (2, 'Python para Iniciantes', 'Descubra como começar na programação com Python. Ideal para automação, ciência de dados e desenvolvimento web.', 199.90, 'https://cursos.pythoniniciante.com/', 'ifba-divulgao.jpg', 'python.jpg'),
-- (3, 'Marketing Digital', 'Entenda como criar estratégias de marketing digital, incluindo SEO, anúncios pagos e redes sociais, para alcançar mais clientes online.', 149.90, 'https://marketingdigital.expert/', 'ifba-divulgao.jpg', 'marketing-digital.png'),
-- (4, 'Design Gráfico com Canva', 'Aprenda a criar designs profissionais e chamativos usando o Canva, uma ferramenta intuitiva e poderosa para iniciantes e profissionais.', 129.90, 'https://canvadesign.com/', 'ifba-divulgao.jpg', 'canva.png'),
-- (5, 'Desenvolvimento Web', 'Construa páginas da web modernas e interativas dominando os pilares do desenvolvimento front-end. Indicado para quem quer criar sites do zero.', 249.00, 'https://webdev.expert/', 'ifba-divulgao.jpg', 'web.png'),
-- (6, 'Edição de Vídeo', 'Descubra as ferramentas básicas e avançadas do Adobe Premiere Pro para editar vídeos de forma profissional para YouTube e redes sociais.', 279.00, 'https://videoedit.com.br/', 'ifba-divulgao.jpg', 'edicao-video.png'),
-- (7, 'Excel Avançado', 'Domine recursos avançados do Excel, como tabelas dinâmicas, macros e funções complexas. Ideal para melhorar a produtividade no trabalho.', 99.00, 'https://excelpro.com.br/', 'ifba-divulgao.jpg', 'excel.png'),
-- (8, 'Curso de Fotografia', 'Aprenda técnicas para tirar fotos incríveis usando apenas seu celular, desde a composição até a edição básica.', 89.00, 'https://fotografiafacil.com/', 'ifba-divulgao.jpg', 'fotografia.png');

-- UNLOCK TABLES;




---------------------------------------------------------------------------------------------------



/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- DROP TABLE IF EXISTS likes, comentarios, feeds, produtos, empresas;

--
-- Table structure for table empresas
--

DROP TABLE IF EXISTS empresas;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE empresas (
  id int NOT NULL AUTO_INCREMENT,
  nome varchar(255) NOT NULL,
  avatar varchar(255) NOT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table empresas
--

LOCK TABLES empresas WRITE;
/*!40000 ALTER TABLE empresas DISABLE KEYS */;
-- INSERT INTO empresas VALUES (1,'Chilli Beans','chillibeans.png'),(2,'Ray-Ban','rayban.png'),(3,'H. Stern','hstern.png'),(4,'Boticário','boticario.png'),(5,'Arezzo','arezzo.png'),(6,'Dafiti','dafiti.png');
INSERT INTO empresas VALUES (1,'Ifba','ifba-divulgao.jpg');
/*!40000 ALTER TABLE empresas ENABLE KEYS */;
UNLOCK TABLES;



--
-- Table structure for table produtos
--

DROP TABLE IF EXISTS cursos;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE cursos (
  id int NOT NULL AUTO_INCREMENT,
  nome varchar(255) NOT NULL,
  descricao varchar(510) NOT NULL,
  preco decimal(10,2) NOT NULL,
  url varchar(1020) NOT NULL,
  imagemCurso VARCHAR(255) NOT NULL,
  imagemEmpresa VARCHAR(255) NOT NULL,
  empresa int NOT NULL,
  PRIMARY KEY (id),
  KEY fk_cursos_empresas_idx (empresa),
  CONSTRAINT fk_cursos_empresas FOREIGN KEY (empresa) REFERENCES empresas (id)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table cursos
--

LOCK TABLES cursos WRITE;
/*!40000 ALTER TABLE cursos DISABLE KEYS */;
INSERT INTO cursos VALUES 
(1, 'Curso Flutter', 'Aprenda a desenvolver aplicativos móveis multiplataforma usando Flutter e Dart. Criar aplicativos rápidos e bonitos para Android e iOS.', 100.00, 'https://cursos.flutter.com.br/', 'ifba-divulgao.jpg', 'flutter.png', 1),
(2, 'Python para Iniciantes', 'Descubra como começar na programação com Python. Ideal para automação, ciência de dados e desenvolvimento web.', 199.90, 'https://cursos.pythoniniciante.com/', 'ifba-divulgao.jpg', 'python.jpg', 1),
(3, 'Marketing Digital', 'Entenda como criar estratégias de marketing digital, incluindo SEO, anúncios pagos e redes sociais, para alcançar mais clientes online.', 149.90, 'https://marketingdigital.expert/', 'ifba-divulgao.jpg', 'marketing-digital.png', 1),
(4, 'Design Gráfico com Canva', 'Aprenda a criar designs profissionais e chamativos usando o Canva, uma ferramenta intuitiva e poderosa para iniciantes e profissionais.', 129.90, 'https://canvadesign.com/', 'ifba-divulgao.jpg', 'canva.png', 1),
(5, 'Desenvolvimento Web', 'Construa páginas da web modernas e interativas dominando os pilares do desenvolvimento front-end. Indicado para quem quer criar sites do zero.', 249.00, 'https://webdev.expert/', 'ifba-divulgao.jpg', 'web.png', 1),
(6, 'Edição de Vídeo', 'Descubra as ferramentas básicas e avançadas do Adobe Premiere Pro para editar vídeos de forma profissional para YouTube e redes sociais.', 279.00, 'https://videoedit.com.br/', 'ifba-divulgao.jpg', 'edicao-video.png', 1),
(7, 'Excel Avançado', 'Domine recursos avançados do Excel, como tabelas dinâmicas, macros e funções complexas. Ideal para melhorar a produtividade no trabalho.', 99.00, 'https://excelpro.com.br/', 'ifba-divulgao.jpg', 'excel.png', 1),
(8, 'Curso de Fotografia', 'Aprenda técnicas para tirar fotos incríveis usando apenas seu celular, desde a composição até a edição básica.', 89.00, 'https://fotografiafacil.com/', 'ifba-divulgao.jpg', 'fotografia.png', 1);
/*!40000 ALTER TABLE cursos ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-04-16 21:48:40



--
-- Table structure for table feeds
--

DROP TABLE IF EXISTS feeds;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE feeds (
  id int NOT NULL AUTO_INCREMENT,
  data datetime NOT NULL,
  curso int DEFAULT NULL,
  PRIMARY KEY (id),
  KEY fk_feeds_produtos_idx (curso),
  CONSTRAINT fk_feeds_curso FOREIGN KEY (curso) REFERENCES curso (id)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table feeds
--

LOCK TABLES feeds WRITE;
/*!40000 ALTER TABLE feeds DISABLE KEYS */;
-- INSERT INTO feeds VALUES (1,'2021-04-14 18:21:11',1),(2,'2021-04-14 18:21:11',2),(3,'2021-04-14 18:21:11',3),(4,'2021-04-14 18:21:11',4),(5,'2021-04-14 18:21:11',5),(6,'2021-04-14 18:21:11',6),(7,'2021-04-14 18:21:11',7);
INSERT INTO feeds VALUES (1,'2025-03-10 18:21:11',1),(2,'2025-04-14 18:21:11',2),(3,'2025-04-14 18:21:11',3),(4,'2025-04-14 18:21:11',4),(5,'2025-04-14 18:21:11',5),(6,'2025-04-14 18:21:11',6),(7,'2025-04-14 18:21:11',7);
/*!40000 ALTER TABLE feeds ENABLE KEYS */;
UNLOCK TABLES;





--
-- Table structure for table comentarios
--

DROP TABLE IF EXISTS comentarios;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE comentarios (
  id int NOT NULL AUTO_INCREMENT,
  comentario varchar(510) NOT NULL,
  feed int NOT NULL,
  nome varchar(255) DEFAULT NULL,
  conta varchar(255) NOT NULL,
  data datetime NOT NULL,
  PRIMARY KEY (id),
  KEY fk_feed_idx (feed),
  CONSTRAINT fk_comentarios_feeds FOREIGN KEY (feed) REFERENCES feeds (id)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table comentarios
--

LOCK TABLES comentarios WRITE;
/*!40000 ALTER TABLE comentarios DISABLE KEYS */;
-- INSERT INTO comentarios VALUES (1,'teste',1,'Luis Paulo','luispscarvalho@gmail.com','2021-04-16 21:32:35');
INSERT INTO comentarios VALUES (1,'teste',1,'Rafael Carvalho','fanfones.10@gmail.com','2025-02-07 22:18:23');
/*!40000 ALTER TABLE comentarios ENABLE KEYS */;
UNLOCK TABLES;


--
-- Table structure for table likes
--

DROP TABLE IF EXISTS likes;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE likes (
  id int NOT NULL AUTO_INCREMENT,
  feed int NOT NULL,
  email varchar(255) NOT NULL,
  PRIMARY KEY (id),
  KEY fk_likes_feeds_idx (feed),
  CONSTRAINT fk_likes_feeds FOREIGN KEY (feed) REFERENCES feeds (id)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table likes
--

LOCK TABLES likes WRITE;
/*!40000 ALTER TABLE likes DISABLE KEYS */;
-- INSERT INTO likes VALUES (8,1,'luispscarvalho@gmail.com');
INSERT INTO likes VALUES (5,1,'fanfones.10@gmail.com');
/*!40000 ALTER TABLE likes ENABLE KEYS */;
UNLOCK TABLES;