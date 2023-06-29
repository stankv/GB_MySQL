DROP DATABASE IF EXISTS lesson6;
CREATE DATABASE lesson6 DEFAULT CHARSET cp1251;
USE lesson6;

-- Создайте функцию, которая принимает кол-во сек и формат их в кол-во дней, часов, минут и секунд.
DROP FUNCTION IF EXISTS sectotime;
DELIMITER $$
CREATE FUNCTION sectotime(seconds INT)
RETURNS VARCHAR(39)
DETERMINISTIC
BEGIN
	DECLARE days INT;
	DECLARE hours INT;
	DECLARE minutes INT;
	
	SET days = floor(seconds / (24 * 60 *60));
	SET seconds = seconds % (24 * 60 *60);
	SET hours = floor(seconds / (60 * 60));
	SET seconds = seconds % (60 * 60);
	SET minutes = floor(seconds / 60);
	SET seconds = (seconds % 60);
	
	RETURN CONCAT(days, ' days ', hours, ' hours ', minutes, ' minutes ', seconds, ' seconds');    
END$$
DELIMITER ;

-- Вызов функции
SELECT sectotime(123456);

-- --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Выведите только четные числа от 1 до 10 (Через цикл внутри процедуры).
DROP PROCEDURE IF EXISTS print_even_numbers;
DELIMITER $$
CREATE PROCEDURE print_even_numbers
(
	IN input_number INT  
)
BEGIN
	DECLARE n INT;
    DECLARE result VARCHAR(45) DEFAULT "";
    IF input_number < 2 THEN SET result = "Input number must be >= 2 !";
    ELSE 
		SET n = 2;
		REPEAT
			IF n = input_number OR n = input_number - 1 THEN SET result = concat(result, n);
			ELSE SET result = concat(result, n, ",");
			END IF;
			SET n = n + 2;
			UNTIL n > input_number
		END REPEAT;
	END IF;
	SELECT result;
END$$
DELIMITER ;

-- Вызов процедуры
CALL print_even_numbers(10);

-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Создайте хранимую функцию hello(), которая будет возвращать приветствие, в зависимости от текущего времени суток. 
-- С 6:00 до 12:00 функция должна возвращать фразу "Доброе утро", с 12:00 до 18:00 функция должна возвращать фразу
-- "Добрый день", с 18:00 до 00:00 — "Добрый вечер", с 00:00 до 6:00 — "Доброй ночи".

DROP FUNCTION IF EXISTS hello;
DELIMITER $$
CREATE FUNCTION hello(curr_time TIME)
RETURNS VARCHAR(12)
DETERMINISTIC
BEGIN
    IF curr_time BETWEEN "6:00:00" AND "11:59:59" THEN RETURN "Доброе утро";
	ELSEIF curr_time BETWEEN "12:00:00" AND "17:59:59" THEN RETURN "Добрый день";
    ELSEIF curr_time BETWEEN "18:00:00" AND "23:59:59" THEN RETURN "Добрый вечер";
	ELSEIF curr_time BETWEEN "00:00:00" AND "05:59:59" THEN RETURN "Доброй ночи";
	END IF;
END$$
DELIMITER ;

-- Вызов функции
SELECT hello(NOW());
