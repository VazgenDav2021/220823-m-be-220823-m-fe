-- Для создания базы данных исползуем ключевые слова CREATE DATABASE {название базы данных}
CREATE DATABASE lesson1;

-- После этого как создалась база данных мы указвыаем ключевым словом USE {название базы данных} для того 
-- чтоб текстовый редактор понял что все последуйщие команды относятся именно к конкретной базе данных 
USE lesson1;

-- Псоле создания БД, мы создаем таблицу продуктов и описываем каждое (Что в одной БД могут быть сразу несколько таблиц)
CREATE TABLE products (
	-- тип данных INTGER - число, PRIMARY KEY - указвыает что это значените будет использоватся в качестве первичного ключа 
    -- AUTO_INCREMENT - будет автоматически увеличивать значение
	id INTEGER PRIMARY KEY AUTO_INCREMENT,
    -- передаем значение title(название продукта),  VARCHAR (128) - тип данных строка до 128 символов
    title VARCHAR(128),    
    -- передаем значение price с типом integer - число
    price INTEGER,
    --  пердаем значение disocut, у которого тип танных 
    -- decimal - число который будет содержать десятичное значение с двумя знаками после запятой и одним знаком до запятой
    discount DECIMAL(2,1)
);

-- Очень важно не перепутать очередность значениий
INSERT INTO products (title, price, discount) values ("Велосипед", 4500, 0.9),
													("Мопед", 12400, 0.6),
                                                    ("Баги", 20000, 0.6),
                                                    ("Ролики", 2220, 0.4),
                                                    ("Санки", 9000, 0.2),
                                                    ("Сноуборд", 14500, 0.4);


-- базовая выборка всех поле из таблицы products;
-- Select - команда  формирования выборки
-- * -  перечень всех полей
-- Если мы хотим получить конкнреты поля во время втборки вместо * ставим название поля
SELECT * FROM products;
SeLeCT title from products;

-- MYSQL не регистрозависим
-- Не запускаем код с 0я. Мы не реализуем процесс с 0ой точки


-- если мы хотим поменять название быборки, для этого можно использовать псевдоним(alias),
-- еко указывают после название поле через оператор as


-- Для выведение определннойз записи используем оператор where
-- <, >, <=, >=, <>
-- select * from products where price  <> 12400;
-- можно длеать выборку как и в диапазоне так и вне диапазона
-- select * from products where price between 2000 and 5000;
-- select * from products where price not between 2000 and 5000;


-- для поиска строки в запросе можно использовать опертор = если хотим найти одну строку или оператор in для поска несколько строк
-- select * from products where title = "баги";
-- select * from products where title in("баги", 'ролики');

-- Оператор like, позволяет сформировать маску строку и сравнить с каким то значениям. Для формирования 
-- маски мы используем % (n-ое количество символов до опеределонного символа (И))
-- берем все значения у которых имя заканчивается на букву к
select * from products where title like "%к%";
-- берем все значения у которых имя начинается на букву к
select * from products where title like "кр%";
-- Здесь мы делаем выборки техт полек у котроых в названии продукета после символа "к" идет еще символ
select * from products where title like "%к_";

-- здесь сдлелали комбинацую в выборки "найди все товары которые заканчиваются на "и" и у них цена больше 5000"
-- еслы длеаем запрос через and то нам выводится те поля которые соответсвуют всем условиям
select * from products where title like "%и" and price > 5000 and discount = 0.2;

-- если длеаем запорс через or то нам выводится все поля в которых значение соответстувет хотя бы одному усливию
select * from products where title like "%и" or price > 5000 or discount = 0.2;




-- 1. Найти всех сотрудников, работающих в департаменте с id 90
select * from departments where department_id = 90;
-- 2. Найти всех сотрудников, зарабатывающих больше 5000
select * from employees where salary > 5000;
-- 3. Найти всех сотрудников, чья фамилия начинается на букву L
select * from employees where last_name like "L%";


-- 1. Найти все департаменты, у которых location_id 1700
 select * from departments where location_id = 1700;
-- 2. Найти все города с country_id US
select city from locations where country_id = "US";
select city from locations where country_id like "US";
-- 3. Вывести зарплату сотрудника с именем ‘Lex’ и фамилией ‘De Haan'
select salary from employees where first_name = "Lex" and last_name = 'De Haan';
-- 4. Вывести всех сотрудников с job_id ‘FI_ACCOUNT’ и зарабатывающих меньше 8000
select * from employees where job_id = "FI_ACCOUNT" and salary < 8000;
-- 5. Вывести сотрудников, у которых в фамилии в середине слова встречаются сочетания ‘kk’ или ‘ll’
select * from employees where last_name like "_%kk%_" or last_name like "_%ll%_";

select * from departments;
-- Значение null это псевдно значение которое указывает при отсутсвии иного. Для просоты понимания если у товара
-- cena стоит null это означает мы знаем какое у нее значение. Null это не 0 и не пустя строка. Исхося из этого
-- мы не можем сравнить null с оператрами значенияalter
-- 102 - 104 строку код нечего не выдаст так как null нельзя так сравнинвать
select * from departments where manager_id = null;
select * from departments where manager_id > null;
select * from departments where manager_id like null;
-- Для того чотбы найти определенные строки у которых какое то значение является null то используем (is null)
select * from departments where manager_id is null;
-- Для того чотбы найти определенные строки у которых какое то значение является не null то используем (is not null)
select * from departments where manager_id is not null;


-- 1. Вывести сотрудников с commission_pct NULL
select * from employees where commission_pct is null;
-- 2. Вывести сотрудников зарабатывающих от 5000 до 7000 (включая концы)
select * from employees where salary >= 5000 and salary <= 7000;
select * from employees where salary between 5000 and 7000;

-- с помощю метда in мы можем делать праверку сразу по нескольким значениям
-- select * from employees where salary in (6000, 7000, 9000);
-- select * from employees where salary = 6000 or salary = 7000 or salary = 9000;

select * from employees where salary not in (6000, 7000, 9000);
select * from employees where salary <> 6000 and salary <> 7000 and salary <> 9000;


-- Вывести всех сотрудников кроме тех, кто работает в департаментах 80 и 110.
select * from employees where department_id not in (80,110);

