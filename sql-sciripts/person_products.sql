CREATE DATABASE  IF NOT EXISTS `products_directory`;
USE `products_directory`;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS person_products;

CREATE TABLE person_products (
    person_id INT NOT NULL,
    product_id INT NOT NULL,
    PRIMARY KEY (person_id, product_id),
    FOREIGN KEY (person_id) REFERENCES person(id),
    FOREIGN KEY (product_id) REFERENCES product(id)
);
