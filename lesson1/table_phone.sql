/* 1.	Создайте таблицу с мобильными телефонами, используя графический интерфейс. 
Заполните БД данными. Добавьте скриншот на платформу в качестве ответа на ДЗ
*/

-- 2. 	Выведите название, производителя и цену для товаров, количество которых превышает 2
SELECT ProductName, Manufacturer, Price 
FROM phone 
WHERE ProductCount > 2;

-- 3.  	Выведите весь ассортимент товаров марки “Samsung”
SELECT *
FROM phone
WHERE Manufacturer = "Samsung";

-- 4. 	Выведите информацию о телефонах, где суммарный чек больше 100 000 и меньше 145 000**
SELECT *
FROM phone
WHERE ProductCount * Price > 100000 AND ProductCount * Price < 145000;
