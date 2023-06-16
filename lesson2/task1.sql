CREATE DATABASE lesson2;
USE lesson2;

-- 1. Используя операторы языка SQL, создайте таблицу “sales”. Заполните ее данными.
DROP TABLE IF EXISTS sales;
CREATE TABLE IF NOT EXISTS sales
(
	id INT PRIMARY KEY AUTO_INCREMENT,
	order_date DATE,
	count_product INT
  );
  
INSERT sales (order_date, count_product)
VALUES
("2022-01-01", 156),
("2022-01-02", 180),
("2022-01-03", 21),
("2022-01-04", 124),
("2022-01-05", 341);
 
 /* 2.  Для данных таблицы “sales” укажите тип заказа в зависимости от кол-ва : 
меньше 100  -    Маленький заказ
от 100 до 300 - Средний заказ
больше 300  -     Большой заказ  */
SELECT id,
	CASE
		WHEN count_product < 100
			THEN "Маленький заказ"
		WHEN count_product > 100 AND count_product < 300
			THEN "Средний заказ"
		ELSE "Большой заказ"
	END AS result_message
FROM sales;

-- 3. Создайте таблицу “orders”, заполните ее значениями
DROP TABLE IF EXISTS orders;
CREATE TABLE IF NOT EXISTS orders
(
	id INT PRIMARY KEY AUTO_INCREMENT,
	employee_id CHAR(3) NOT NULL,
	amount DECIMAL(5,2) NOT NULL,
    order_status VARCHAR(9) NOT NULL
  );
  
INSERT orders (employee_id, amount, order_status)
VALUES
("e03", 15.00, "OPEN"),
("e01", 25.50, "OPEN"),
("e05", 100.70, "CLOSED"),
("e02", 22.18, "OPEN"),
("eo4", 9.50, "CANCELLED");

-- Выберите все заказы. В зависимости от поля order_status выведите столбец full_order_status:
-- OPEN – «Order is in open state» ; CLOSED - «Order is closed»; CANCELLED -  «Order is cancelled»
SELECT id, employee_id, amount, order_status,
	CASE
		WHEN order_status = "OPEN"
			THEN "Order is in open state"
		WHEN order_status = "CLOSED"
			THEN "Order is closed"
		WHEN order_status = "CANCELLED"
			THEN "Order is cancelled"
	END AS full_order_status
FROM orders;
