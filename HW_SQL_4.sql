CREATE SCHEMA IF NOT EXISTS `LibraryManagement`;
USE  LibraryManagement

CREATE 

CREATE TABLE IF NOT EXISTS `authors`
(author_id INT auto_increment PRIMARY KEY,
author_name VARCHAR(50) NOT NULL
);


CREATE TABLE IF NOT EXISTS `genres`
(genre_id INT auto_increment PRIMARY KEY,
genre_name VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS `books`
(book_id INT auto_increment PRIMARY KEY,
title VARCHAR(50) NOT NULL,
publication_year YEAR, 
author_id INT NOT NULL,
genre_id INT NOT NULL,
foreign key (author_id) references authors(author_id),
foreign key (genre_id) references genres(genre_id)
);


CREATE TABLE IF NOT EXISTS `users`
(user_id INT auto_increment PRIMARY KEY,
username VARCHAR(50) NOT NULL,
email VARCHAR (50) NOT NULL
);

CREATE TABLE IF NOT EXISTS `borrowed_books`
(borrow_id INT auto_increment PRIMARY KEY,
book_id INT NOT NULL,
user_id INT NOT NULL,
foreign key (book_id) references books(book_id),
foreign key (user_id) references users(user_id),
borrow_date DATE,
return_date DATE
);

-- 2

INSERT INTO authors(author_name) values('Den Brown'), ('Paolo Koelio');
INSERT INTO genres(genre_name) values('Detective'), ('Roman');
INSERT INTO books(title, publication_year, author_id, genre_id) values('Angels and Demons', 2003, 1,1), ('Alchemic', 2005, 2,2);

SELECT * FROM books;

-- 3

-- order_details, orders, customers, products, categories, employees, shippers, suppliers

use hw3;

SELECT *
FROM order_details as od
INNER JOIN orders as o ON od.order_id = o.id
INNER JOIN products as pr ON od.product_id = pr.id
INNER JOIN customers as cs ON o.customer_id = cs.id
INNER JOIN suppliers as sp ON pr.supplier_id = sp.id
INNER JOIN categories as ct ON pr.category_id = ct.id
INNER JOIN employees as em ON o.employee_id = em.employee_id
INNER JOIN shippers as sh ON o.shipper_id = sh.id
;

-- 4.1

SELECT count(*)
FROM order_details as od
INNER JOIN orders as o ON od.order_id = o.id
INNER JOIN products as pr ON od.product_id = pr.id
INNER JOIN customers as cs ON o.customer_id = cs.id
INNER JOIN suppliers as sp ON pr.supplier_id = sp.id
INNER JOIN categories as ct ON pr.category_id = ct.id
INNER JOIN employees as em ON o.employee_id = em.employee_id
INNER JOIN shippers as sh ON o.shipper_id = sh.id
;

-- 4.2

SELECT count(*)
FROM order_details as od
LEFT JOIN orders as o ON od.order_id = o.id
LEFT JOIN products as pr ON od.product_id = pr.id
RIGHT JOIN customers as cs ON o.customer_id = cs.id
INNER JOIN suppliers as sp ON pr.supplier_id = sp.id
INNER JOIN categories as ct ON pr.category_id = ct.id
INNER JOIN employees as em ON o.employee_id = em.employee_id
INNER JOIN shippers as sh ON o.shipper_id = sh.id
;

-- 4.3

SELECT *
FROM order_details as od
INNER JOIN orders as o ON od.order_id = o.id
INNER JOIN products as pr ON od.product_id = pr.id
INNER JOIN customers as cs ON o.customer_id = cs.id
INNER JOIN suppliers as sp ON pr.supplier_id = sp.id
INNER JOIN categories as ct ON pr.category_id = ct.id
INNER JOIN employees as em ON o.employee_id = em.employee_id
INNER JOIN shippers as sh ON o.shipper_id = sh.id
WHERE o.employee_id > 3 <= 10
;

-- 4.4

SELECT od.order_id, count(*) as kilkist
FROM order_details as od
INNER JOIN orders as o ON od.order_id = o.id
INNER JOIN products as pr ON od.product_id = pr.id
INNER JOIN customers as cs ON o.customer_id = cs.id
INNER JOIN suppliers as sp ON pr.supplier_id = sp.id
INNER JOIN categories as ct ON pr.category_id = ct.id
INNER JOIN employees as em ON o.employee_id = em.employee_id
INNER JOIN shippers as sh ON o.shipper_id = sh.id
WHERE od.product_id > 3
GROUP BY od.order_id
;

-- 4.5

SELECT od.order_id, avg(quantity) as seredna
FROM order_details as od
INNER JOIN orders as o ON od.order_id = o.id
INNER JOIN products as pr ON od.product_id = pr.id
INNER JOIN customers as cs ON o.customer_id = cs.id
INNER JOIN suppliers as sp ON pr.supplier_id = sp.id
INNER JOIN categories as ct ON pr.category_id = ct.id
INNER JOIN employees as em ON o.employee_id = em.employee_id
INNER JOIN shippers as sh ON o.shipper_id = sh.id
WHERE od.product_id > 3
GROUP BY od.order_id
HAVING seredna > 10
;

-- 4.6

SELECT od.order_id, avg(quantity) as seredna
FROM order_details as od
INNER JOIN orders as o ON od.order_id = o.id
INNER JOIN products as pr ON od.product_id = pr.id
INNER JOIN customers as cs ON o.customer_id = cs.id
INNER JOIN suppliers as sp ON pr.supplier_id = sp.id
INNER JOIN categories as ct ON pr.category_id = ct.id
INNER JOIN employees as em ON o.employee_id = em.employee_id
INNER JOIN shippers as sh ON o.shipper_id = sh.id
WHERE od.product_id > 3
GROUP BY od.order_id
HAVING seredna > 10
ORDER BY od.order_id desc
;

-- 4.7

SELECT od.order_id, avg(quantity) as seredna
FROM order_details as od
INNER JOIN orders as o ON od.order_id = o.id
INNER JOIN products as pr ON od.product_id = pr.id
INNER JOIN customers as cs ON o.customer_id = cs.id
INNER JOIN suppliers as sp ON pr.supplier_id = sp.id
INNER JOIN categories as ct ON pr.category_id = ct.id
INNER JOIN employees as em ON o.employee_id = em.employee_id
INNER JOIN shippers as sh ON o.shipper_id = sh.id
WHERE od.product_id > 3
GROUP BY od.order_id
HAVING seredna > 10
ORDER BY od.order_id desc
LIMIT 5 OFFSET 1;
;







