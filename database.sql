CREATE DATABASE INF354CA3
GO

USE INF354CA3
GO

CREATE TABLE categories (
	category_ID INT NOT NULL,
	category_name VARCHAR(128),
	CONSTRAINT categories_pk PRIMARY KEY (category_ID)
)
GO

CREATE TABLE suppliers (
	supplier_ID INT NOT NULL,
	supplier_name VARCHAR(128),
	spllier_address TEXT,
	supplier_phone VARCHAR(10),
	supplier_email VARCHAR(100),
	CONSTRAINT suppliers_pk PRIMARY KEY (supplier_ID)
)
GO

CREATE TABLE products (
	product_ID INT NOT NULL,
	product_name VARCHAR(128),
	product_price DECIMAL,

	category_ID INT,
	supplier_ID INT,
	
	CONSTRAINT products_pk PRIMARY KEY (product_ID),
	CONSTRAINT products_category_fk FOREIGN KEY (category_ID) REFERENCES categories(category_ID),
	CONSTRAINT products_supplier_fk FOREIGN KEY (supplier_ID) REFERENCES suppliers(supplier_ID)
)
GO

-- insert data

INSERT INTO categories (categories.category_ID, categories.category_name) VALUES (1, 'Dogs'), (2, 'Cats'), (3, 'Birds'), (4, 'Rodents')

INSERT INTO suppliers (supplier_ID, supplier_name, supplier_email, supplier_phone) VALUES 
	(1, 'Bob''s pets', 'bob@bobspets.com', '5551231234'),
	(2, 'Furry Fiesta', 'furry@furryfiesta.co.za', '5555551235'),
	(3, 'Pretoria Pets', 'info@pretoriapets.co.za', '0123456789')

INSERT INTO products (product_ID, product_name, product_price, category_ID, supplier_ID) VALUES
	(1, 'Hamster', 10.50, 4, 3),
	(2, 'Yorkie', 3000.00, 1, 2),
	(3, 'Labrador', 2000.0, 1, 2),
	(4, 'Scottish Fold', 8000.00, 2, 1),
	(5, 'Tortoise Shell', 500.00, 2, 1),
	(6, 'Rabbit', 200.00, 4, 3),
	(7, 'Parrot', 3000.00, 3, 3),
	(8, 'Chicken', 50.00, 3, 3),
	(9, 'Chihuahua', 10000.00, 1, 2)