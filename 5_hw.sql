CREATE TABLE Cars (
id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
Name VARCHAR(50) NOT NULL,
Cost INT NOT NULL);

INSERT Cars VALUES
(1,"Audi" , 52642) ,
(2,"Mercedes" , 57127) ,
(3,"Skoda" , 9000) ,
(4,"Volvo" , 29000) ,
(5,"Bentley" , 350000) ,
(6,"Citroen" , 21000) ,
(7,"Hummer" ,  41400 ) ,
(8,"Volkswagen" ,  21600 );

SELECT * from Cars;

-- 1.	Создайте представление, в которое попадут автомобили стоимостью  до 25 000 долларов

CREATE VIEW Price25 AS SELECT * FROM Cars Where Cost < 25000;
SELECT * FROM  Price25;

-- 2.	Изменить в существующем представлении порог для стоимости: пусть цена будет до 30 000 долларов (используя оператор ALTER VIEW) 

ALTER VIEW Price25 AS SELECT * FROM Cars Where Cost < 30000;
SELECT * FROM  Price25;

-- 3. 	Создайте представление, в котором будут только автомобили марки “Шкода” и “Ауди”

CREATE VIEW S_A AS 
SELECT * FROM Cars Where Name = 'Skoda'
UNION
SELECT * FROM Cars Where Name = 'Audi';

SELECT * FROM  S_A;

-- 4 Вывести название и цену для всех анализов, которые продавались 5 февраля 2020 и всю следующую неделю.

CREATE TABLE Analysis (
an_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
an_name VARCHAR(50) NOT NULL,
an_cost INT NOT NULL,
an_price INT NOT NULL,
an_group INT NOT NULL);

INSERT Analysis VALUES
(1 , 'analysis_A',240,360,2),
(2 , 'analysis_B',520,780,1),
(3 , 'analysis_C',326,489,3),
(4 , 'analysis_D',541,811,3),
(5 , 'analysis_E',120,180,2),
(6 , 'analysis_F',106,159,1),
(7 , 'analysis_G',854,1281,1),
(8 , 'analysis_H',321,482,2),
(9 , 'analysis_J',591,887,3),
(10 , 'analysis_K',753,1129,3);

SELECT * FROM Analysis;

CREATE TABLE Orders (
ord_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
ord_datetime DATETIME NOT NULL,
ord_an INT NOT NULL);

INSERT Orders VALUES
(1 , '2020-02-05 12:49:30', 10),
(2 , '2020-02-05 17:03:15', 5),
(3 , '2020-02-05 10:40:36', 1),
(4 , '2020-02-05 15:23:30', 8),
(5 , '2020-02-07 10:24:34', 2),
(6 , '2020-02-07 17:03:24', 8),
(7 , '2020-02-09 11:26:20', 8),
(8 , '2020-02-09 10:17:00', 6),
(9 , '2020-02-11 16:53:25', 3),
(10 , '2020-02-11 12:17:20',9),
(11 , '2020-02-12 12:02:54',6),
(12 , '2020-02-12 14:30:49',5),
(13 , '2020-02-15 14:17:13',3),
(14 , '2020-02-16 17:48:46',10),
(15 , '2020-02-16 18:18:30',4),
(16 , '2020-02-16 15:52:14',3),
(17 , '2020-02-17 09:9:53',9),
(18 , '2020-02-18 11:44:37',8),
(19 , '2020-02-18 16:57:08',3),
(20 , '2020-02-20 16:48:35',2);

SELECT * FROM Orders;

CREATE VIEW unity as SELECT * from analysis INNER JOIN Orders ON analysis.an_id = Orders.ord_an;
with order_5_7 AS (SELECT an_name, an_price FROM unity WHERE ord_datetime BETWEEN "2020-02-05 00:00:00" AND "2020-02-13 00:00:00")