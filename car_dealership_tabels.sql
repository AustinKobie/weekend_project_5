DROP TABLE IF EXISTS car_dealership;
CREATE TABLE car_dealership(
	car_dealership_id SERIAL PRIMARY KEY,
	dealership_name VARCHAR(50)
);

INSERT INTO car_dealership(
	car_dealership_id,
	dealership_name
)VALUES(
	1,
	'Wowza Cars'
),(
	2,
	'FL Exotics'
);

DROP TABLE IF EXISTS customer;
CREATE TABLE customer(
	customer_id SERIAL PRIMARY KEY,
	first_name VARCHAR(50),
	last_name VARCHAR(50),
	phone_number VARCHAR(50),
	car_dealership_id INTEGER NOT NULL,
	FOREIGN KEY (car_dealership_id) REFERENCES car_dealership(car_dealership_id)
);
	
INSERT INTO customer(
	customer_id,
	first_name,
	last_name,
	phone_number,
	car_dealership_id
)VALUES(
	1,
	'Robert',
	'Simmons',
	'239-555-5555',
	1
),(
	2,
	'Joe',
	'Bennet',
	'239-458-5555',
	2
);

DROP TABLE IF EXISTS car;
CREATE TABLE car(
	car_id SERIAL PRIMARY KEY,
	make VARCHAR(25),
	model VARCHAR(25),
	car_year INTEGER NOT NULL,
	color VARCHAR(15),
	price float,
	customer_id INTEGER NOT NULL,
	FOREIGN KEY (customer_id) REFERENCES customer(customer_id)
);

INSERT INTO car(
	car_id,
	make,
	model,
	car_year,
	color,
	price,
	customer_id
)VALUES(
	1,
	'Subaru',
	'BRZ',
	2013,
	'Blue',
	14000.00,
	1
);

DROP TABLE IF EXISTS car_inventory;
CREATE TABLE car_inventory(
	car_inventory_id SERIAL PRIMARY KEY,
	stock INTEGER NOT NULL,
	car_id INTEGER NOT NULL,
	FOREIGN KEY (car_id) REFERENCES car(car_id)
);

INSERT INTO car_inventory(
	car_inventory_id,
	stock,
	car_id
)VALUES(
	1,
	4,
	1
);

DROP TABLE IF EXISTS seller;
CREATE TABLE seller(
	seller_id SERIAL PRIMARY KEY,
	first_name VARCHAR(50),
	last_name VARCHAR(50),
	car_inventory_id INTEGER NOT NULL,
	car_dealership_id INTEGER NOT NULL,
	FOREIGN KEY (car_inventory_id) REFERENCES car_inventory(car_inventory_id),
	FOREIGN KEY (car_dealership_id) REFERENCES car_dealership(car_dealership_id)
);

INSERT INTO seller(
	seller_id,
	first_name,
	last_name,
	car_inventory_id,
	car_dealership_id
)VALUES(
	1,
	'Mark',
	'Kobie',
	1,
	1
);


DROP TABLE IF EXISTS invoice;
CREATE TABLE invoice(
	invoice_id SERIAL PRIMARY KEY,
	description TEXT,
	seller_id INTEGER NOT NULL,
	FOREIGN KEY (seller_id) REFERENCES seller(seller_id)
);

INSERT INTO invoice(
	invoice_id,
	description,
	seller_id
)VALUES(
	1,
	'this is a inovice for the sale of a car',
	1
);

DROP TABLE IF EXISTS repair;
CREATE TABLE repair(
	repair_id SERIAL PRIMARY KEY,
	ticket INTEGER NOT NULL,
	car_id INTEGER NOT NULL,
	FOREIGN KEY (car_id) REFERENCES car(car_id)
);

INSERT INTO repair(
	repair_id,
	ticket,
	car_id
)VALUES(
	1,
	1,
	1
);

DROP TABLE IF EXISTS mechanic;
CREATE TABLE mechanic(
	mechanic_id SERIAL PRIMARY KEY,
	first_name VARCHAR(15),
	last_name VARCHAR(15),
	repair_id INTEGER NOT NULL,
	FOREIGN KEY (repair_id) REFERENCES repair(repair_id)
);

INSERT INTO mechanic(
	mechanic_id,
	first_name,
	last_name,
	repair_id
)values(
	1,
	'Darien',
	'Crump',
	1
);