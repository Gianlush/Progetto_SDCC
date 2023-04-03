use my_library;


CREATE TABLE `book` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `genre` varchar(45) NOT NULL,
  `age` int(11) NOT NULL,
  `author` varchar(60) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=latin1;

CREATE TABLE `user` (
  `id` int(11) AUTO_INCREMENT NOT NULL,
  `name` varchar(45) NOT NULL,
  `surname` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `review` (
  `id` int(11) AUTO_INCREMENT NOT NULL,
  `book` int(11) NOT NULL,
  `user` int(11) NOT NULL,
  `comment` varchar(600) NOT NULL,
  `star_number` int(11) NOT NULL,
  `images` varchar(600) NOT NULL,
  `title` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `review_idx` (`book`),
  KEY `ref_user_idx` (`user`),
  CONSTRAINT `ref_book` FOREIGN KEY (`book`) REFERENCES `book` (`id`),
  CONSTRAINT `ref_user` FOREIGN KEY (`user`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `book` VALUES (2,'50 sfumature di grigio','Romanzo','Per adulti (18+)','E. L. James'),(3,'50 sfumature di nero','Romanzo','Per adulti (18+)','E. L. James'),(4,'50 sfumature di rosso','Romanzo','Per adulti (18+)','E. L. James'),(5,'Assassinio sull\'Orient Express','Giallo ','Per ragazzi (11-17)','Agatha Christie'),(6,'La serie infernale','Giallo ','Per ragazzi (11-17)','Agatha Christie'),(7,'Fuoco e sangue','Avventura','Per ragazzi (11-17)','George R. R. Martin'),(8,'L\'ascesa del drago','Avventura','Per ragazzi (11-17)','George R. R. Martin'),(9,'Uno scontro di Re','Avventura','Per ragazzi (11-17)','George R. R. Martin'),(10,'Harry Potter e il Calice di Fuoco','Fantasy','Per ragazzi (11-17)','J. K. Rowling'),(11,'Harry Potter e il prigioniero di Azkaban','Fantasy','Per ragazzi (11-17)','J. K. Rowling'),(12,'Harry Potter e il principe Mezzosangue','Fantasy','Per ragazzi (11-17)','J. K. Rowling'),(13,'Harry Potter e i Doni della Morte','Fantasy','Per ragazzi (11-17)','J. K. Rowling'),(14,'Harry Potter e l\'Ordine della Fenice','Fantasy','Per ragazzi (11-17)','J. K. Rowling'),(15,'Harry Potter e la Camera dei Segreti','Fantasy','Per ragazzi (11-17)','J. K. Rowling'),(16,'Harry Potter e la Pietra Filosofale','Fantasy','Per ragazzi (11-17)','J. K. Rowling'),(17,'Il giro del mondo in 80 giorni','Avventura','Per bambini (3-10)','Jules Verne'),(18,'Il nome della rosa','Romanzo','Per adulti (18+)','Umberto Eco'),(19,'Il piccolo Principe','Fantasy','Per bambini (3-10)','Antoine de Saint-Exupéry'),(20,'IT','Horror','Per adulti (18+)','Stephen King'),(21,'L\'altra verità','Autobiografico','Per adulti (18+)','Alda Merini'),(22,'L\'isola misteriosa','Avventura','Per bambini (3-10)','Jules Verne'),(23,'Lungo cammino verso la libertà','Autobiografico','Per ragazzi (11-17)','Nelson Mandela'),(24,'Storia delle tenebre e dei luoghi leggendari','Romanzo','Per adulti (18+)','Umberto Eco'),(25,'The Shining','Horror','Per adulti (18+)','Stephen King'),(26,'The Outsider','Horror','Per adulti (18+)','Stephen King'),(27,'Ventimila leghe sotto i mari','Avventura','Per bambini (3-10)','Jules Verne'),(28,'Billy Budd','Romanzo','Per adulti (18+)','Herman Melville'),(29,'Io, Nelson Mandela','Autobiografico','Per adulti (18+)','Nelson Mandela'),(30,'Io sono Malala','Autobiografico','Per ragazzi (11-17)','Christina Lamb'),(31,'La compagnia dell\'anello','Avventura','Per ragazzi (11-17)','J. R. R. Tolkien'),(32,'Lettere dal carcere','Autobiografico','Per adulti (18+)','Antonio Gramsci'),(33,'Le due torri','Avventura','Per ragazzi (11-17)','J. R. R. Tolkien'),(34,'Lo Hobbit','Avventura','Per ragazzi (11-17)','J. R. R. Tolkien'),(35,'Moby Dick','Avventura','Per ragazzi (11-17)','Herman Melville'),(36,'Taipi','Romanzo','Per ragazzi (11-17)','Herman Melville'),(37,'Terra degli uomini','Autobiografico','Per ragazzi (11-17)','Antoine de Saint-Exupéry'),(38,'Una persona alla volta','Autobiografico','Per ragazzi (11-17)','Gino Strada'),(39,'Una terra promessa','Autobiografico','Per adulti (18+)','Barack Obama'),(40,'Volo di notte','Romanzo','Per ragazzi (11-17)','Antoine de Saint-Exupéry');