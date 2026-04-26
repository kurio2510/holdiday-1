CREATE DATABASE HOLIDAY;
USE HOLIDAY;

-- TẠO BẢNG
CREATE TABLE customers (
    id INT PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(100) NOT NULL,
    phone VARCHAR(20) UNIQUE,
    address VARCHAR(255),
    customer_type VARCHAR(10) DEFAULT 'Normal',
    CHECK (customer_type IN ('Normal', 'VIP'))
);

CREATE TABLE products (
    id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50),
    price DECIMAL(10,2) CHECK (price >= 0),
    stock INT CHECK (stock >= 0)
);

CREATE TABLE orders (
    id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    order_date DATE,
    status VARCHAR(20) DEFAULT 'completed',
    CHECK (status IN ('completed', 'cancelled')),
    FOREIGN KEY (customer_id) REFERENCES customers(id)
);

CREATE TABLE order_details (
    id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    product_id INT,
    quantity INT CHECK (quantity > 0),
    total_price DECIMAL(10,2),
    FOREIGN KEY (order_id) REFERENCES orders(id),
    FOREIGN KEY (product_id) REFERENCES products(id)
);

-- INSERT CUSTOMERS
INSERT INTO customers (full_name, phone, address, customer_type) VALUES
('Nguyen Van A', '0901', 'Ha Noi', 'VIP'),
('Tran Thi B', '0902', 'Ha Noi', 'Normal'),
('Le Van C', '0903', 'Hai Phong', 'VIP'),
('Pham Thi D', '0904', 'Da Nang', 'Normal'),
('Hoang Van E', '0905', 'HCM', 'Normal'),
('Do Thi F', '0906', 'Hue', 'Normal'),
('Bui Van G', '0907', 'Can Tho', 'Normal');

-- INSERT PRODUCTS
INSERT INTO products (product_name, category, price, stock) VALUES
('Laptop', 'Electronics', 1000, 10),
('Phone', 'Electronics', 500, 20),
('Tablet', 'Electronics', 300, 0),
('Shirt', 'Clothing', 30, 50),
('Jeans', 'Clothing', 40, 40),
('Jacket', 'Clothing', 60, 25),
('Apple', 'Food', 2, 100),
('Milk', 'Food', 3, 80),
('Bread', 'Food', 1.5, 60),
('Coffee', 'Food', 5, 70);

-- INSERT ORDERS
INSERT INTO orders (customer_id, order_date, status) VALUES
(1, '2026-04-01', 'completed'),
(2, '2026-04-02', 'completed'),
(3, '2026-04-03', 'cancelled'),
(4, '2026-04-04', 'completed'),
(5, '2026-04-05', 'completed');

-- INSERT ORDER DETAILS
INSERT INTO order_details (order_id, product_id, quantity, total_price) VALUES
(1, 1, 1, 1000),
(1, 4, 2, 60),
(1, 7, 5, 10),
(2, 2, 1, 500),
(2, 5, 2, 80),
(3, 3, 1, 300),
(3, 6, 1, 60),
(4, 1, 1, 1000),
(4, 8, 3, 9),
(4, 9, 2, 3),
(5, 10, 2, 10),
(5, 7, 10, 20);

-- UPDATE STOCK
UPDATE products
SET stock = stock - 5
WHERE id = 1;
