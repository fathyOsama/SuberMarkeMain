CREATE DATABASE  IF NOT EXISTS `products_directory`;
USE `products_directory`;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Product_image` varchar(100) Default NULL,
  `Product_name` varchar(45) DEFAULT NULL,
  `Product_type` varchar(45) DEFAULT NULL,
  `expiry_data` varchar(45) DEFAULT NULL,
  `Product_price` double,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

--
-- Data for table `product`
--

INSERT INTO `product` VALUES 
	(1,'http://localhost:8080/images/Milk.jpeg','Milk','Dairy products','12/10/2024','80'),
	(2,'http://localhost:8080/images/Cheese.jpeg','Cheese','Dairy products','5/8/2024','45'),
	(3,'http://localhost:8080/images/juice.jpeg','juice','Dairy products','3/5/2024','75'),
	(5,'http://localhost:8080/images/Milk.jpeg','Milk','Dairy products','7/6/2024','98'),
	(6,'http://localhost:8080/images/Cheese.jpeg','Cheese','Dairy products','7/6/2024','98'),
    (7,'http://localhost:8080/images/Milk.jpeg','Milk','Dairy products','7/6/2024','98'),
    (8,'http://localhost:8080/images/juice.jpeg','juice','Aairy products','7/6/2024','98'),
    (9,'http://localhost:8080/images/Cheese.jpeg','Cheese','Dairy products','7/6/2024','98'),
	(10,'http://localhost:8080/images/Milk.jpeg','Milk','Dairy products','7/6/2024','98'),
	(11,'http://localhost:8080/images/juice.jpeg','juice','Dairy products','5/8/2024','23');

