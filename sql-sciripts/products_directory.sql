CREATE DATABASE  IF NOT EXISTS `products_directory`;
USE `products_directory`;

DROP TABLE IF EXISTS `authorities`;
DROP TABLE IF EXISTS `users`;
DROP TABLE IF EXISTS `product`;

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `username` varchar(50) NOT NULL,
  `password` char(68) NOT NULL,
  `enabled` tinyint NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Inserting data for table `users`
--
-- NOTE: The passwords are encrypted using BCrypt
--
-- A generation tool is avail at: https://www.luv2code.com/generate-bcrypt-password
--
-- Default passwords here are: fun123
--

INSERT INTO `users` 
VALUES 
('MayarOsama','{bcrypt}$2y$10$CRV/r/Hx8NCPL15VNUMAEu3dIxuB/.xQTmaGK613Uza7Kia814OUa',1);


--
-- Table structure for table `authorities`
--

CREATE TABLE `authorities` (
  `username` varchar(50) NOT NULL,
  `authority` varchar(50) NOT NULL,
  UNIQUE KEY `authorities4_idx_1` (`username`,`authority`),
  CONSTRAINT `authorities4_ibfk_1` FOREIGN KEY (`username`) REFERENCES `users` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Inserting data for table `authorities`
--

INSERT INTO `authorities` 
VALUES 
('MayarOsama','ROLE_EMPLOYEE'),
('MayarOsama','ROLE_MANAGER'),
('MayarOsama','ROLE_ADMIN');


--
-- Table structure for table `product`
--

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
# id, Product_image, Product_name, Product_type, expiry_data, Product_price



INSERT INTO `product` (product_image, product_name, product_type, expiry_data, product_price) VALUES 
	('http://localhost:8080/images/Almarai Milk.jpeg', 'Almarai Milk', 'Dairy products', '12/10/2024', '80'),
	('http://localhost:8080/images/Roman cheese.jpeg', 'Roman cheese', 'Dairy products', '5/8/2024', '45'),
	('http://localhost:8080/images/Costa Blackcurrant Juice.jpg', 'Costa Blackcurrant Juice', 'Dairy products', '3/5/2024', '75'),
	('http://localhost:8080/images/Abourland milk.jpg', 'Milk', 'Dairy products', '7/6/2024', '98'),
	('http://localhost:8080/images/cheddar cheese.jpeg', 'cheddar cheese', 'Dairy products', '7/6/2024', '98'),
	('http://localhost:8080/images/bikhayrih milk.jpg', 'bikhayrih milk', 'Dairy products', '7/6/2024', '98'),
	('http://localhost:8080/images/Domty Juice.jpg', 'Domty Juice', 'Dairy products', '7/6/2024', '98'),
	('http://localhost:8080/images/Romano cheese Abourland.jpeg', 'Romano cheese Abourland', 'Dairy products', '7/6/2024', '98'),
	('http://localhost:8080/images/Milk.jpeg', 'Milk', 'Dairy products', '7/6/2024', '98'),
	('http://localhost:8080/images/Sun top juice.jpg', 'Sun top juice', 'Dairy products', '5/8/2024', '23'),
	('http://localhost:8080/images/Hala sunflower oil.jpg', 'Hala sunflower oil', 'Oil products', '3/5/2024', '75'),
	('http://localhost:8080/images/Afia sunflower oil.jpg', 'Afia sunflower oil', 'Oil products', '6/8/2024', '100'),
	('http://localhost:8080/images/Buy Sunny sunflower oil.jpg', 'Buy Sunny sunflower oil', 'Oil products', '8/9/2024', '150'),
	('http://localhost:8080/images/Crystal sunflower oil.jpg', 'Crystal sunflower oil', 'Oil products', '10/2/2024', '50'),
	('http://localhost:8080/images/royal sunflower oil.jpg', 'royal sunflower oil', 'Oil products', '23/5/2024', '200'),
	('http://localhost:8080/images/Crystal Corn Oil.jpg', 'Crystal Corn Oil', 'Oil products', '12/3/2024', '90'),
	('http://localhost:8080/images/Al Khazna meat product.jpeg', 'Al Khazna', 'Meat products', '12/7/2025', '200'),
	('http://localhost:8080/images/Alyoum Meat products.jpeg', 'Alyoum', 'Meat products', '5/9/2025', '180'),
	('http://localhost:8080/images/chicken sausage meat products.jpg', 'chicken sausage', 'Meat products', '8/10/2025', '100'),
	('http://localhost:8080/images/Dane Meat meat products.jpg', 'Dane Meat', 'Meat products', '10/2/2025', '155'),
	('http://localhost:8080/images/Meat kebab meat products.jpg', 'Meat kebab', 'Meat products', '12/6/2025', '120'),
	('http://localhost:8080/images/tender chicken breasts meat products.png', 'tender chicken breasts', 'Meat products', '9/10/2025', '160');