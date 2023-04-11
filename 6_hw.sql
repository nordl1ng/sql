-- 1. Создайте функцию, которая принимает кол-во сек и формат их в кол-во дней часов.
-- Пример: 123456 ->'1 days 10 hours 17 minutes 36 seconds '

DELIMITER $$
CREATE FUNCTION time_sd(num INT)
RETURNS VARCHAR(100)
DETERMINISTIC
BEGIN
DECLARE DAY_T INT DEFAULT 0;
DECLARE HOUR_T INT DEFAULT 0;
DECLARE MIN_T INT DEFAULT 0;
DECLARE SEC_T INT DEFAULT 0;
DECLARE str VARCHAR(255) DEFAULT '0';

SET DAY_T = FLOOR (NUM / 86400);
SET HOUR_T = FLOOR((NUM - DAY_T * 86400) / 3600);
SET MIN_T = FLOOR((NUM - DAY_T * 86400 - HOUR_T * 3600) / 60);
SET SEC_T = NUM - DAY_T * 86400 - HOUR_T * 3600 - MIN_T*60;
SET str = CONCAT(DAY_T," days ", HOUR_T, " hours ", MIN_T, " min ",SEC_T, " sec");
RETURN str;
END $$
DELIMITER ;

SELECT time_sd(123456);

-- 2.Выведите только четные числа от 1 до 10.
-- Пример: 2,4,6,8,10

DELIMITER $$
CREATE FUNCTION evennumbers()
RETURNS VARCHAR(100)
DETERMINISTIC
BEGIN
DECLARE i INT DEFAULT 1;
DECLARE str VARCHAR(255) DEFAULT '';
	WHILE i < 11 DO
    IF i % 2 = 0 THEN
		SET str = CONCAT(str ,"  ", i);
	END IF;
    SET i = i+1;
    END WHILE;
RETURN str;
END $$
DELIMITER ;

SELECT evennumbers();