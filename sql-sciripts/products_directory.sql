CREATE DATABASE IF NOT EXISTS `products_directory`;
USE `products_directory`;

DROP TABLE IF EXISTS `authorities`;
DROP TABLE IF EXISTS `users`;
DROP TABLE IF EXISTS `product_images`;
DROP TABLE IF EXISTS `product`;

CREATE TABLE `users` (
  `username` varchar(50) NOT NULL,
  `password` char(68) NOT NULL,
  `enabled` tinyint NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `users` VALUES 
('MayarOsama','{bcrypt}$2y$10$CRV/r/Hx8NCPL15VNUMAEu3dIxuB/.xQTmaGK613Uza7Kia814OUa',1);

CREATE TABLE `authorities` (
  `username` varchar(50) NOT NULL,
  `authority` varchar(50) NOT NULL,
  UNIQUE KEY `authorities4_idx_1` (`username`,`authority`),
  CONSTRAINT `authorities4_ibfk_1` FOREIGN KEY (`username`) REFERENCES `users` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- بيانات الصلاحيات
INSERT INTO `authorities` VALUES 
('MayarOsama','ROLE_EMPLOYEE'),
('MayarOsama','ROLE_MANAGER'),
('MayarOsama','ROLE_ADMIN');

CREATE TABLE `product` (
  id INT NOT NULL AUTO_INCREMENT,
  Product_image VARCHAR(255) DEFAULT NULL,
  Product_name VARCHAR(100),
  Product_type VARCHAR(100),
  expiry_data VARCHAR(20),
  Product_price DOUBLE,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `product` (id, Product_image, Product_name, Product_type, expiry_data, Product_price) VALUES
(1, 'http://localhost:8080/images/Almarai_Milk.jpeg', 'Almarai Milk', 'Dairy products', '2024-12-10', 80),
(2, 'http://localhost:8080/images/Roman_cheese.jpeg', 'Roman cheese', 'Dairy products', '2024-08-05', 45),
(3, 'http://localhost:8080/images/Costa_Blackcurrant_Juice.jpg', 'Costa Blackcurrant Juice', 'Dairy products', '2024-05-03', 75),
(4, 'http://localhost:8080/images/Abourland_milk.jpeg', 'Milk', 'Dairy products', '2024-06-07', 98),
(5, 'http://localhost:8080/images/cheddar_cheese.jpeg', 'cheddar cheese', 'Dairy products', '2024-06-07', 98),
(6, 'http://localhost:8080/images/bikhayrih_milk.jpeg','bikhayrih milk', 'Dairy products', '2024-06-07', 98),
(7, 'http://localhost:8080/images/Domty_Juice.jpeg', 'Domty Juice', 'Dairy products', '2024-06-07', 98),
(8, 'http://localhost:8080/images/Romano_cheese_Abourland.jpeg', 'Romano cheese Abourland', 'Dairy products', '2024-06-07', 98),
(9, 'http://localhost:8080/images/Milk_Package.jpeg', 'Milk', 'Dairy products', '2024-06-07', 98),
(10, 'http://localhost:8080/images/Sun-top_juice.jpeg', 'Sun top juice', 'Dairy products', '2024-08-05', 23),
(11, 'http://localhost:8080/images/Hala sunflower oil.jpg', 'Hala sunflower oil', 'Oil products', '2024-05-03', 75),
(12, 'http://localhost:8080/images/Afia sunflower oil.jpg', 'Afia sunflower oil', 'Oil products', '2024-08-06', 100),
(13, 'http://localhost:8080/images/Buy Sunny sunflower oil.jpg', 'Buy Sunny sunflower oil', 'Oil products', '2024-09-08', 150),
(14, 'http://localhost:8080/images/Crystal sunflower oil.jpg', 'Crystal sunflower oil', 'Oil products', '2024-02-10', 50),
(15, 'http://localhost:8080/images/royal sunflower oil.jpg', 'royal sunflower oil', 'Oil products', '2024-05-23', 200),
(16, 'http://localhost:8080/images/Crystal Corn Oil.jpg', 'Crystal Corn Oil', 'Oil products', '2024-03-12', 90),
(17, 'http://localhost:8080/images/Al Khazna meat product.jpeg', 'Al Khazna', 'Meat products', '2025-07-12', 200),
(18, 'http://localhost:8080/images/Alyoum Meat products.jpeg', 'Alyoum', 'Meat products', '2025-09-05', 180),
(19, 'http://localhost:8080/images/chicken sausage meat products.jpg', 'chicken sausage', 'Meat products', '2025-10-08', 100),
(20, 'http://localhost:8080/images/Dane Meat meat products.jpg', 'Dane Meat', 'Meat products', '2025-02-10', 155),
(21, 'http://localhost:8080/images/Meat kebab meat products.jpg', 'Meat kebab', 'Meat products', '2025-06-12', 120),
(22, 'http://localhost:8080/images/tender chicken breasts meat products.png', 'tender chicken breasts', 'Meat products', '2025-10-09', 160);

CREATE TABLE `product_images` (
  id INT AUTO_INCREMENT PRIMARY KEY,
  product_id INT NOT NULL,
  image_url VARCHAR(255) NOT NULL,
  image_order INT DEFAULT 1,
  is_primary BOOLEAN DEFAULT FALSE,
  FOREIGN KEY (product_id) REFERENCES product(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `product_images` (product_id, image_url, image_order, is_primary) VALUES
  (1, 'http://localhost:8080/images/Almarai_Milk.jpeg', 1, TRUE),
  (1, 'http://localhost:8080/images/Almarai_Milk_2.jpg', 2, FALSE),
  (1, 'http://localhost:8080/images/Almarai_Milk_3.jpeg', 3, FALSE),
  (2, 'http://localhost:8080/images/Roman_cheese.jpeg', 1, TRUE),
  (2, 'http://localhost:8080/images/Roman_cheese_2.jpeg', 2, FALSE),
  (2, 'http://localhost:8080/images/Roman_cheese_3.jpeg', 3, FALSE),
  (3, 'http://localhost:8080/images/Costa_Blackcurrant_Juice.jpg', 1, TRUE),
  (3, 'http://localhost:8080/images/Costa_Blackcurrant_Juice_2.jpg', 2, FALSE),
  (3, 'http://localhost:8080/images/Costa_Blackcurrant_Juice_3.jpg', 3, FALSE),
  (4, 'http://localhost:8080/images/Abourland_milk.jpeg', 1, TRUE),
  (4, 'http://localhost:8080/images/Abourland_milk_2.jpeg', 2, FALSE),
  (4, 'http://localhost:8080/images/Abourland_milk_3.jpg', 3, FALSE),
  (5, 'http://localhost:8080/images/cheddar_cheese.jpeg', 1, TRUE),
  (5, 'http://localhost:8080/images/cheddar_cheese_2.jpeg', 2, FALSE),
  (5, 'http://localhost:8080/images/cheddar_cheese_3.jpeg', 3, FALSE),
  (6, 'http://localhost:8080/images/bikhayrih_milk.jpeg', 1, TRUE),
  (6, 'http://localhost:8080/images/bikhayrih_milk_2.jpeg', 2, FALSE),
  (6, 'http://localhost:8080/images/bikhayrih_milk_3.jpeg', 3, FALSE),
  (7, 'http://localhost:8080/images/Domty_Juice.jpeg', 1, TRUE),
  (7, 'http://localhost:8080/images/Domty_Juice_2.jpeg', 2, FALSE),
  (7, 'http://localhost:8080/images/Domty_Juice_3.jpeg', 3, FALSE),
  (8, 'http://localhost:8080/images/Romano_cheese_Abourland.jpeg', 1, TRUE),
  (8, 'http://localhost:8080/images/Romano_cheese_Abourland_2.jpeg', 2, FALSE),
  (8, 'http://localhost:8080/images/Romano_cheese_Abourland_3.jpeg', 3, FALSE),
  (9, 'http://localhost:8080/images/Milk_Package.jpeg', 1, TRUE),
  (9, 'http://localhost:8080/images/Milk_Package_2.jpeg', 2, FALSE),
  (9, 'http://localhost:8080/images/Milk_Package_3.jpeg', 3, FALSE),
  (10, 'http://localhost:8080/images/Sun-top_juice.jpeg', 1, TRUE),
  (10, 'http://localhost:8080/images/Sun-top_juice_2.jpeg', 2, FALSE),
  (10, 'http://localhost:8080/images/Sun-top_juice_3.jpeg', 3, FALSE),
  (11, 'http://localhost:8080/images/Hala sunflower oil.jpg', 1, TRUE),
  (11, 'http://localhost:8080/images/Crystal Corn Oil.jpg', 2, FALSE),
  (11, 'http://localhost:8080/images/Crystal Corn Oil.jpg', 3, FALSE),
  (12, 'http://localhost:8080/images/Afia sunflower oil.jpg', 1, TRUE),
  (12, 'http://localhost:8080/images/Almarai Milk.jpeg', 2, FALSE),
  (12, 'http://localhost:8080/images/Almarai Milk.jpeg', 3, FALSE),
  (13, 'http://localhost:8080/images/Buy Sunny sunflower oil.jpg', 1, TRUE),
  (13, 'http://localhost:8080/images/Almarai Milk.jpeg', 2, FALSE),
  (13, 'http://localhost:8080/images/Almarai Milk.jpeg', 3, FALSE),
  (14, 'http://localhost:8080/images/Crystal sunflower oil.jpg', 1, TRUE),
  (14, 'http://localhost:8080/images/Almarai Milk.jpeg', 2, FALSE),
  (14, 'http://localhost:8080/images/Almarai Milk.jpeg', 3, FALSE),
  (15, 'http://localhost:8080/images/royal sunflower oil.jpg', 1, TRUE),
  (15, 'http://localhost:8080/images/Almarai Milk.jpeg', 2, FALSE),
  (15, 'http://localhost:8080/images/Almarai Milk.jpeg', 3, FALSE),
  (16, 'http://localhost:8080/images/Crystal Corn Oil.jpg', 1, TRUE),
  (16, 'http://localhost:8080/images/Almarai Milk.jpeg', 2, FALSE),
  (16, 'http://localhost:8080/images/Almarai Milk.jpeg', 3, FALSE),
  (17, 'http://localhost:8080/images/Al Khazna meat product.jpeg', 1, TRUE),
  (17, 'http://localhost:8080/images/Almarai Milk.jpeg', 2, FALSE),
  (17, 'http://localhost:8080/images/Almarai Milk.jpeg', 3, FALSE),
  (18, 'http://localhost:8080/images/Alyoum Meat products.jpeg', 1, TRUE),
  (18, 'http://localhost:8080/images/Almarai Milk.jpeg', 2, FALSE),
  (18, 'http://localhost:8080/images/Almarai Milk.jpeg', 3, FALSE),
  (19, 'http://localhost:8080/images/chicken sausage meat products.jpg', 1, TRUE),
  (19, 'http://localhost:8080/images/Almarai Milk.jpeg', 2, FALSE),
  (19, 'http://localhost:8080/images/Almarai Milk.jpeg', 3, FALSE),
  (20, 'http://localhost:8080/images/Dane Meat meat products.jpg', 1, TRUE),
  (20, 'http://localhost:8080/images/Almarai Milk.jpeg', 2, FALSE),
  (20, 'http://localhost:8080/images/Almarai Milk.jpeg', 3, FALSE),
  (21, 'http://localhost:8080/images/Meat kebab meat products.jpg', 1, TRUE),
  (21, 'http://localhost:8080/images/Almarai Milk.jpeg', 2, FALSE),
  (21, 'http://localhost:8080/images/Almarai Milk.jpeg', 3, FALSE),
  (22, 'http://localhost:8080/images/Almarai Milk.jpeg', 1, TRUE),
  (22, 'http://localhost:8080/images/Almarai Milk.jpeg', 2, FALSE),
  (22, 'http://localhost:8080/images/tender chicken breasts meat products.png', 3, FALSE);


<<<<<<< HEAD
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
=======

>>>>>>> development
