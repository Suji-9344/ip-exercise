CREATE DATABASE IF NOT EXISTS ecommerce_management CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE ecommerce_management;
DROP TABLE IF EXISTS order_items, orders, cart_items, products, users;
CREATE TABLE users (id INT AUTO_INCREMENT PRIMARY KEY,name VARCHAR(100) NOT NULL,email VARCHAR(150) UNIQUE NOT NULL,password VARCHAR(255) NOT NULL,role ENUM('customer','admin') DEFAULT 'customer',created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP);
CREATE TABLE products (id INT AUTO_INCREMENT PRIMARY KEY,name VARCHAR(160) NOT NULL,category VARCHAR(80) NOT NULL,description TEXT,price DECIMAL(10,2) NOT NULL,old_price DECIMAL(10,2) DEFAULT NULL,image VARCHAR(255),stock INT DEFAULT 0,rating DECIMAL(2,1) DEFAULT 4.5,badge VARCHAR(30),created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP);
CREATE TABLE cart_items (id INT AUTO_INCREMENT PRIMARY KEY,user_id INT NOT NULL,product_id INT NOT NULL,quantity INT NOT NULL DEFAULT 1,UNIQUE KEY uq_cart(user_id,product_id),FOREIGN KEY(user_id) REFERENCES users(id) ON DELETE CASCADE,FOREIGN KEY(product_id) REFERENCES products(id) ON DELETE CASCADE);
CREATE TABLE orders (id INT AUTO_INCREMENT PRIMARY KEY,user_id INT NOT NULL,total DECIMAL(10,2) NOT NULL,status ENUM('Placed','Packed','Shipped','Delivered','Cancelled') DEFAULT 'Placed',address VARCHAR(255) NOT NULL,created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,FOREIGN KEY(user_id) REFERENCES users(id));
CREATE TABLE order_items (id INT AUTO_INCREMENT PRIMARY KEY,order_id INT NOT NULL,product_id INT NOT NULL,quantity INT NOT NULL,price DECIMAL(10,2) NOT NULL,FOREIGN KEY(order_id) REFERENCES orders(id) ON DELETE CASCADE,FOREIGN KEY(product_id) REFERENCES products(id));
INSERT INTO users(name,email,password,role) VALUES ('Admin User','admin@shopnest.test', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC8v7eJxJ2H8t2YjH2m', 'admin');
INSERT INTO products(name,category,description,price,old_price,image,stock,rating,badge) VALUES
('Nova X Pro Smartphone','Electronics','6.7-inch AMOLED display, 256GB storage, dual camera and all-day battery.',49999,54999,'phone.svg',24,4.8,'Bestseller'),
('Pulse Wireless Headphones','Electronics','Adaptive noise cancellation, 40-hour battery and low-latency audio.',3499,4999,'headphones.svg',42,4.7,'-30%'),
('AeroFit Smart Watch','Wearables','Fitness tracking, heart-rate monitoring, GPS and 7-day battery.',5999,7999,'watch.svg',31,4.6,'Trending'),
('Urban Everyday Backpack','Fashion','Water-resistant laptop backpack with organized compartments.',1899,2499,'backpack.svg',65,4.5,'New'),
('CloudStep Running Shoes','Fashion','Lightweight cushioned running shoes for everyday training.',2799,3499,'shoes.svg',38,4.6,'Hot'),
('GlowDesk LED Lamp','Home','Adjustable desk lamp with three light modes and USB charging.',1299,1699,'lamp.svg',57,4.4,'Deal'),
('BrewMate Coffee Maker','Home','Compact drip coffee maker with reusable filter.',2499,3199,'coffee.svg',18,4.5,'Popular'),
('CleanWave Air Purifier','Home','HEPA filtration and quiet night mode for bedrooms and offices.',6999,8999,'purifier.svg',12,4.7,'Deal');
