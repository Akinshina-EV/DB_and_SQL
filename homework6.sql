# Создайте функцию, которая принимает кол-во сек и формат их в кол-во дней часов.
# Пример: 123456 ->'1 days 10 hours 17 minutes 36 seconds '
USE homework5;
delimiter //
DROP FUNCTION IF EXISTS GetPeriod;
CREATE FUNCTION GetPeriod(number INT)
RETURNS VARCHAR(100)
DETERMINISTIC
BEGIN
	DECLARE days INT DEFAULT 0;
    DECLARE hours INT DEFAULT 0;
    DECLARE minutes INT DEFAULT 0;
    DECLARE seconds INT DEFAULT 0;
	DECLARE result VARCHAR(100) DEFAULT ' ';
	SET days = number DIV 86400;
	SET hours = (number - days * 86400) DIV 3600;
	SET minutes = ((number - days * 86400) - hours * 3600) DIV 60;
	SET seconds = (number - days * 86400) - hours * 3600 - minutes * 60;
	SET result = CONCAT(days, ' days ', hours, ' hours ', minutes, ' minutes ', seconds, ' seconds');
    RETURN result;
    END //
    delimiter ;

SELECT GetPeriod(123456);

# Выведите только четные числа от 1 до 10.
# Пример: 2,4,6,8,10
delimiter //
DROP FUNCTION IF EXISTS GetEvenNumbers;
CREATE FUNCTION GetEvenNumbers(num1 INT, num2 INT)
RETURNS VARCHAR(100)
DETERMINISTIC
BEGIN
    DECLARE result VARCHAR(100) DEFAULT '';
    WHILE num1 <= num2 DO
IF num1 % 2 = 0 THEN
        SET result = CONCAT(result, ' ', num1);
        SET num1 = num1 + 1;
        ELSE
    SET num1 = num1 + 1;
        END IF;
END WHILE;
    RETURN result;
    END //
    delimiter ;

SELECT GetEvenNumbers(1, 10);