CREATE DATABASE  IF NOT EXISTS `products_directory`;
USE `products_directory`;

DROP TABLE IF EXISTS `authorities`;
DROP TABLE IF EXISTS `users`;

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
('FathiOsama','{bcrypt}$2y$10$CRV/r/Hx8NCPL15VNUMAEu3dIxuB/.xQTmaGK613Uza7Kia814OUa',1),
('ShehabOsama','{bcrypt}$2y$10$CRV/r/Hx8NCPL15VNUMAEu3dIxuB/.xQTmaGK613Uza7Kia814OUa',1),
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
('FathiOsama','ROLE_EMPLOYEE'),
('ShehabOsama','ROLE_EMPLOYEE'),
('ShehabOsama','ROLE_MANAGER'),
('MayarOsama','ROLE_EMPLOYEE'),
('MayarOsama','ROLE_MANAGER'),
('MayarOsama','ROLE_ADMIN');