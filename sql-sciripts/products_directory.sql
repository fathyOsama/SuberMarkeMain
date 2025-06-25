CREATE DATABASE IF NOT EXISTS `products_directory`;
USE `products_directory`;

DROP TABLE IF EXISTS `authorities`;
DROP TABLE IF EXISTS `users`;
DROP TABLE IF EXISTS `product_images`;
DROP TABLE IF EXISTS `product`;
DROP TABLE IF EXISTS `product_type`;


CREATE TABLE `users` (
  `username` varchar(50) NOT NULL,
  `password` char(68) NOT NULL,
  `enabled` tinyint NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `users` VALUES 
('Mayar_osama','$2y$10$agnI6MK.CVuGuQZZ.AwChuZk9iWLsSWvtlN.9CmF5Cl1iewdPI6TW',1);

CREATE TABLE `authorities` (
  `username` varchar(50) NOT NULL,
  `authority` varchar(50) NOT NULL,
  UNIQUE KEY `authorities4_idx_1` (`username`,`authority`),
  CONSTRAINT `authorities4_ibfk_1` FOREIGN KEY (`username`) REFERENCES `users` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `authorities` VALUES 
('Mayar_osama','ROLE_EMPLOYEE'),
('Mayar_osama','ROLE_MANAGER'),
('Mayar_osama','ROLE_ADMIN');

CREATE TABLE product_type (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


INSERT INTO product_type (name) VALUES
('Dairy products'),
('Oil products'),
('Meat products');


CREATE TABLE `product` (
  id INT NOT NULL AUTO_INCREMENT,
  Product_image VARCHAR(255) DEFAULT NULL,
  Product_name VARCHAR(100),
  Product_type_id INT,
  expiry_data VARCHAR(20),
  Product_price DOUBLE,
  PRIMARY KEY (id),
  FOREIGN KEY (product_type_id) REFERENCES product_type(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO product (id, Product_image, Product_name, Product_type_id, expiry_data, Product_price) VALUES
(1, 'http://localhost:8080/images/Almarai_Milk.jpeg', 'Almarai Milk', 1, '2024-12-10', 80),
(2, 'http://localhost:8080/images/Roman_cheese.jpeg', 'Roman cheese', 1, '2024-08-05', 45),
(3, 'http://localhost:8080/images/Costa_Blackcurrant_Juice.jpg', 'Costa Blackcurrant Juice', 1, '2024-05-03', 75),
(4, 'http://localhost:8080/images/Abourland_milk.jpeg', 'Milk', 1, '2024-06-07', 98),
(5, 'http://localhost:8080/images/cheddar_cheese.jpeg', 'cheddar cheese', 1, '2024-06-07', 98),
(6, 'http://localhost:8080/images/bikhayrih_milk.jpeg', 'bikhayrih milk', 1, '2024-06-07', 98),
(7, 'http://localhost:8080/images/Domty_Juice.jpeg', 'Domty Juice', 1, '2024-06-07', 98),
(8, 'http://localhost:8080/images/Romano_cheese_Abourland.jpeg', 'Romano cheese Abourland', 1, '2024-06-07', 98),
(9, 'http://localhost:8080/images/Milk_Package.jpeg', 'Milk', 1, '2024-06-07', 98),
(10, 'http://localhost:8080/images/Sun-top_juice.jpeg', 'Sun top juice', 1, '2024-08-05', 23),
(11, 'http://localhost:8080/images/Hala_sunflower_oil.jpg', 'Hala sunflower oil', 2, '2024-05-03', 75),
(12, 'http://localhost:8080/images/Afia_sunflower_oil.jpg', 'Afia sunflower oil', 2, '2024-08-06', 100),
(13, 'http://localhost:8080/images/Buy_Sunny_sunflower_oil.jpg', 'Buy Sunny sunflower oil', 2, '2024-09-08', 150),
(14, 'http://localhost:8080/images/Crystal_sunflower_oil.jpg', 'Crystal sunflower oil', 2, '2024-02-10', 50),
(15, 'http://localhost:8080/images/royal_sunflower_oil.jpg', 'royal sunflower oil', 2, '2024-05-23', 200),
(16, 'http://localhost:8080/images/Crystal_Corn_Oil.jpg', 'Crystal Corn Oil', 2, '2024-03-12', 90),
(17, 'http://localhost:8080/images/Al_Khazna_meat_product.jpeg', 'Al Khazna', 3, '2025-07-12', 200),
(18, 'http://localhost:8080/images/Alyoum_Meat_products.jpeg', 'Alyoum', 3, '2025-09-05', 180),
(19, 'http://localhost:8080/images/chicken_sausage_meat_products.jpg', 'chicken sausage', 3, '2025-10-08', 100),
(20, 'http://localhost:8080/images/Dane_Meat_meat_products.jpg', 'Dane Meat', 3, '2025-02-10', 155),
(21, 'http://localhost:8080/images/Meat_kebab_meat_products.jpg', 'Meat kebab', 3, '2025-06-12', 120),
(22, 'http://localhost:8080/images/tender_chicken_breasts_meat_products.png', 'tender chicken breasts', 3, '2025-10-09', 160);


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
  (11, 'http://localhost:8080/images/Hala_sunflower_oil.jpg', 1, TRUE),
  (11, 'http://localhost:8080/images/Hala_sunflower_oil_2.jpeg', 2, FALSE),
  (11, 'http://localhost:8080/images/Hala_sunflower_oil_3.jpeg', 3, FALSE),
  (12, 'http://localhost:8080/images/Afia_sunflower_oil.jpg', 1, TRUE),
  (12, 'http://localhost:8080/images/Afia_sunflower_oil_2.jpeg', 2, FALSE),
  (12, 'http://localhost:8080/images/Afia_sunflower_oil_3.jpeg', 3, FALSE),
  (13, 'http://localhost:8080/images/Buy_Sunny_sunflower_oil.jpg', 1, TRUE),
  (13, 'http://localhost:8080/images/Buy_Sunny_sunflower_oil_2.jpeg', 2, FALSE),
  (13, 'http://localhost:8080/images/Buy_Sunny_sunflower_oil_3.jpeg', 3, FALSE),
  (14, 'http://localhost:8080/images/Crystal_sunflower_oil.jpg', 1, TRUE),
  (14, 'http://localhost:8080/images/Crystal_sunflower_oil_2.jpeg', 2, FALSE),
  (14, 'http://localhost:8080/images/Crystal_sunflower_oil_3.jpeg', 3, FALSE),
  (15, 'http://localhost:8080/images/royal_sunflower_oil.jpg', 1, TRUE),
  (15, 'http://localhost:8080/images/royal_sunflower_oil_2.jpeg', 2, FALSE),
  (15, 'http://localhost:8080/images/royal_sunflower_oil_3.jpeg', 3, FALSE),
  (16, 'http://localhost:8080/images/Crystal_Corn_Oil.jpg', 1, TRUE),
  (16, 'http://localhost:8080/images/Crystal_Corn_Oil_2.jpeg', 2, FALSE),
  (16, 'http://localhost:8080/images/Crystal_Corn_Oil_3.jpeg', 3, FALSE),
  (17, 'http://localhost:8080/images/Al_Khazna_meat_product.jpeg', 1, TRUE),
  (17, 'http://localhost:8080/images/Al_Khazna_meat_product_2.jpeg', 2, FALSE),
  (17, 'http://localhost:8080/images/Al_Khazna_meat_product_3.jpeg', 3, FALSE),
  (18, 'http://localhost:8080/images/Alyoum_Meat_products.jpeg', 1, TRUE),
  (18, 'http://localhost:8080/images/Alyoum_Meat_products_2.jpeg', 2, FALSE),
  (18, 'http://localhost:8080/images/Alyoum_Meat_products_3.jpeg', 3, FALSE),
  (19, 'http://localhost:8080/images/chicken_sausage_meat_products.jpg', 1, TRUE),
  (19, 'http://localhost:8080/images/chicken_sausage_meat_products_2.jpeg', 2, FALSE),
  (19, 'http://localhost:8080/images/chicken_sausage_meat_products_3.jpeg', 3, FALSE),
  (20, 'http://localhost:8080/images/Dane_Meat_meat_products.jpg', 1, TRUE),
  (20, 'http://localhost:8080/images/Dane_Meat_meat_products_2.jpeg', 2, FALSE),
  (20, 'http://localhost:8080/images/Dane_Meat_meat_products_3.jpeg', 3, FALSE),
  (21, 'http://localhost:8080/images/Meat_kebab_meat_products.jpg', 1, TRUE),
  (21, 'http://localhost:8080/images/Meat_kebab_meat_products_2.jpeg', 2, FALSE),
  (21, 'http://localhost:8080/images/Meat_kebab_meat_products_3.jpeg', 3, FALSE),
  (22, 'http://localhost:8080/images/tender_chicken_breasts_meat_products.png', 1, TRUE),
  (22, 'http://localhost:8080/images/tender_chicken_breasts_meat_products_2.jpeg', 2, FALSE),
  (22, 'http://localhost:8080/images/tender_chicken_breasts_meat_products_3.jpeg', 3, FALSE);



