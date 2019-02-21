CREATE DATABASE INF354CA3
GO

USE INF354CA3
GO

CREATE TABLE categories (
	category_ID INT IDENTITY(1,1) NOT NULL,
	category_name VARCHAR(128),
	CONSTRAINT categories_pk PRIMARY KEY (category_ID)
)
GO

CREATE TABLE suppliers (
	supplier_ID INT IDENTITY(1,1) NOT NULL,
	supplier_name VARCHAR(128),
	spllier_address TEXT,
	supplier_phone VARCHAR(10),
	supplier_email VARCHAR(100),
	CONSTRAINT suppliers_pk PRIMARY KEY (supplier_ID)
)
GO

CREATE TABLE products (
	product_ID INT IDENTITY(1,1) NOT NULL,
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

USE INF354CA3
GO

INSERT INTO categories (categories.category_name) VALUES ('Dogs'), ('Cats'), ('Birds'), ('Rodents')

INSERT INTO suppliers (supplier_name, supplier_email, supplier_phone) VALUES 
	('Bob''s pets', 'bob@bobspets.com', '5551231234'),
	('Furry Fiesta', 'furry@furryfiesta.co.za', '5555551235'),
	('Pretoria Pets', 'info@pretoriapets.co.za', '0123456789')

INSERT INTO products (product_name, product_price, category_ID, supplier_ID) VALUES
	('Hamster', 10.50, 4, 3),
	('Yorkie', 3000.00, 1, 2),
	('Labrador', 2000.0, 1, 2),
	('Scottish Fold', 8000.00, 2, 1),
	('Tortoise Shell', 500.00, 2, 1),
	('Rabbit', 200.00, 4, 3),
	('Parrot', 3000.00, 3, 3),
	('Chicken', 50.00, 3, 3),
	('Chihuahua', 10000.00, 1, 2)