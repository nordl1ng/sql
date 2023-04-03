CREATE TABLE SALESPEOPLE
(
snum INT NOT NULL,
sname CHAR(100) NOT NULL,
city CHAR(100) NOT NULL,
comm CHAR(100) NOT NULL
);

INSERT INTO SALESPEOPLE(snum, sname, city, comm)
VALUES
(1001, 'Peel', 'London', '.12'),
(1002, 'Serres', 'San Jose', '.13'),
(1004, 'Motika', 'London', '.11'),
(1007, 'Rifkin', 'Barcelona ', '.15'),
(1003, 'Axelrod', 'New York', '.10');
Select * from SALESPEOPLE;
CREATE TABLE CUSTOMERS
(
cnum INT NOT NULL,
cname CHAR(100) NOT NULL,
city CHAR(100) NOT NULL,
rating INT NOT NULL,
snum INT NOT NULL
);

INSERT INTO CUSTOMERS(cnum, cname, city, rating, snum)
VALUES
(2002, 'Giovanni', 'Rome', 200, 1003),
(2003,  'Liu'       , 'SanJose' ,   200  , 1002),
(2004,  'Grass'     , 'Berlin'  ,   300  , 1002),
(2006,  'Clemens'   , 'London'  ,   100  , 1001),
(2008,  'Cisneros'  , 'SanJose' ,   300  , 1007),
(2007,  'Pereira'   , 'Rome'    ,   100  , 1004);
Select * from CUSTOMERS;


CREATE TABLE ORDERS
(
onum INT NOT NULL,
amt FLOAT NOT NULL,
odate DATE NOT NULL,
cnum INT NOT NULL,
snum INT NOT NULL
);

ALTER TABLE ORDERS MODIFY COLUMN odate CHAR(100);

INSERT INTO ORDERS (onum, amt, odate, cnum, snum)
VALUES
(3001  ,    18.69  ,  '10/03/1990' , 2008 , 1007),
(3003  ,   767.19  ,  '10/03/1990' , 2001 , 1001),
(3002  ,  1900.10  ,  '10/03/1990' , 2007 , 1004),
(3005  ,  5160.45  ,  '10/03/1990' , 2003 , 1002),
(3006  ,  1098.16  ,  '10/03/1990' , 2008 , 1007),
(3009  ,  1713.23  ,  '10/04/1990' , 2002 , 1003),
(3007  ,    75.75  ,  '10/04/1990' , 2004 , 1002),
(3008  ,  4723.00  ,  '10/05/1990' , 2006 , 1001),
(3010  ,  1309.95  ,  '10/06/1990' , 2004 , 1002),
(3011  ,  9891.88  ,  '10/06/1990' , 2006 , 1001);

CREATE TABLE 3_hw
(
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
name CHAR(100) NOT NULL,
surnamename CHAR(100) NOT NULL,
specialty CHAR(100) NOT NULL,
seniority INT NOT NULL,
salary INT NOT NULL,
age INT NOT NULL
 );

INSERT INTO 3_hw (id, name, surnamename, specialty, seniority, salary, age)
VALUES
(1, 'Вася', 'Васькин', 'начальник', 40,100000 ,60),
(2, 'Петя', 'Петькин', 'начальник', 8,70000 ,30),
(3, 'Катя', 'Каткана', 'инженер', 2, 70000,25),
(4, 'Саша', 'Сашкин', 'инженер', 12, 50000,35),
(5, 'Иван', 'Иванов', 'рабочий',40 ,30000 ,59),
(6, 'Петр', 'Петров', 'рабочий', 20, 25000,40),
(7, 'Сидор', 'Сидоров', 'рабочий',10 ,20000 ,35),
(8, 'Антон', 'Антонов', 'рабочий', 8, 19000,28),
(9, 'Юра', 'Юркин', 'рабочий', 5, 15000,25),
(10, 'Максим', 'Воронин', 'рабочий', 2,11000 ,22),
(11, 'Юра', 'Галкин', 'рабочий', 3,12000 ,24),
(12, 'Люся', 'Люськина', 'уборщик', 10, 10000,49);
Select * from 3_hw;

-- 1. Напишите запрос, который вывел бы таблицу со столбцами в следующем порядке: city, sname, snum, comm. (к первой или второй таблице, используя SELECT)
Select city, sname, snum, comm from SALESPEOPLE;

-- 2. Напишите команду SELECT, которая вывела бы оценку(rating), сопровождаемую именем каждого заказчика в городе San Jose. (“заказчики”)
SELECT rating, cname FROM CUSTOMERS WHERE city = 'SanJose';

-- 3. Напишите запрос, который вывел бы значения snum всех продавцов из таблицы заказов без каких бы то ни было повторений. (уникальные значения в “snum“ “Продавцы”) 
SELECT DISTINCT snum from ORDERS;

-- 4*. Напишите запрос, который бы выбирал заказчиков, чьи имена начинаются с буквы G. Используется оператор "LIKE": (“заказчики”)
SELECT cname FROM customers WHERE cname LIKE 'G%';

-- 4. Напишите запрос, который может дать вам все заказы со значениями суммы выше чем $1,000. (“Заказы”, “amt” - сумма)
SELECT * from ORDERS WHERE amt > 1000;

-- 5. Напишите запрос который выбрал бы наименьшую сумму заказа. (Из поля “amt” - сумма в таблице “Заказы” выбрать наименьшее значение)
SELECT MIN(amt) from ORDERS;

-- 6. Напишите запрос к таблице “Заказчики”, который может показать всех заказчиков, у которых рейтинг больше 100 и они находятся не в Риме.
SELECT * FROM customers WHERE rating > 100 AND city != 'Rome'; 

-- 7. Отсортируйте поле “зарплата” в порядке убывания и возрастания
SELECT * FROM 3_hw ORDER BY salary;

SELECT * FROM 3_hw ORDER BY salary DESC;

-- 8. Выполните группировку всех сотрудников по специальности , суммарная зарплата которых превышает 100000
SELECT specialty, COUNT(*) AS specialty  FROM 3_hw WHERE salary > 10000  GROUP BY specialty;