-- 1 Ключевые слова лучше писать в верхнем регистре 
-- 2 После SELECT-а лучше перейти на новую строку и поставить табуляцию для тех полей которые мы перечисляем


-- USE hr;

-- SELECT
-- 	employee_id
--     ,first_name
--     ,last_name
--     ,department_id
-- FROM employees;


-- CASE - условный операотр который возращает новое поле
-- Для проверки пишем ключевое слово CASE после этого длеаем проверку через WHEN после этого 
-- пишем условие и под ним пишим THEN "то значение которое хотим возращать"
-- Когда мы закончили писать условия то объязательно пишем END, так мы указываем где заканчивается наш оператир CASE
USE lesson1;

-- <3000 -> класс 1
-- < 5000 -> класс 2
-- >5000 -> класс 3

SELECT
    CASE
		WHEN price < 3000
			THEN '1axsd'
		WHEN price < 5000
			THEN "2"
		WHEN price > 5000
			THEN "3"
	END AS group_cateogry
FROM products;

USE hr;

select * from employees;
-- возращать зп сотудника 
-- также возращать новое поле cateogry у которого значение будет:
-- Если сотрудник заработывает меньше 3000 то "Меньше среднего"
-- Если сотрудник зрабатывает меньше 10.000 то "Средний"
-- Если сотрудник заработывает больше 10.000 "высше среднего"


-- SELECT 
-- 	salary,
--     CASE 
-- 		WHEN salary < 3000
-- 			THEN "Меньше среднего"
-- 		WHEN salary < 10000
-- 			THEN "Средний"
-- 		WHEN salary >= 10000
-- 			THEN "высше среднего"
-- 	END AS cateogry
-- FROM employees;
-- 		

-- Оператор ELSE - когда мы написали все оснавные 
-- услови и хотим написать условие отличающееся от передущих вместо ручного набора можно просто написать ELSE
-- Особенность условных оператров состоит в том что переход к 
-- нободму блоку происходит в тот момент когда усливе во всех п
-- SELECT 
-- 	salary,
--     CASE 
-- 		WHEN salary < 3000
-- 			THEN "Меньше среднего"
-- 		WHEN salary < 10000
-- 			THEN "Средний"
--         ELSE "высше среднего"
-- 	END AS cateogry
-- FROM employees;


USE hr;

-- если цена у нас 9000 то cat_groups будет 1 поскольку проверка у нас идет сверху вниз и если условие верно то строка примет значени 1
-- а все остальные прверки будут игнорироватся
-- SELECT 
-- 	price,
--     CASE
-- 		WHEN price <= 9000
-- 			THEN 1
-- 		WHEN price BETWEEN 9000 AND 10000
-- 			THEN 2
-- 		ELSE 3
-- 	END AS cat_groups
-- FROM products


-- Если мы хотим сдлеать расчет но в поле может быть NULL (с ним нельзя выполнять какую либо операцию)
-- Мы написали след условие: Если commission_pct null то возращй 0 -> salary * 0
-- Если commission_pct не null то воращй значение commission_pct (которая указана в таблице)
-- SELECT 
-- 	salary,
--     commission_pct,
--     salary *
-- 		CASE
-- 			WHEN commission_pct IS NULL
-- 				THEN 0
-- 			ELSE commission_pct
-- 		END AS premia
-- FROM employees;


-- COALESCE - для переобразование поле NULL в какое то лиоб значение. Больше используется как функция
-- принимает 2 параметра. Первый само поле. Если поле null то вместо null берется значение которое было переданно 
-- в качестве 2ого параметра функции. Если поле не null то значение не изменится а будет применятся то которе в поле
-- SELECT 
-- 	salary,
--     commission_pct,
--     salary * COALESCE (commission_pct, 1) as premia
-- FROM employees;


CREATE DATABASE airports;
USE airports;

-- Задание 1
-- Разделите самолеты на ближне-, средне- и дальнемагистральные. 
-- Ближнемагистральными будем считать самолеты, дальность полета которых > 1000 км и <= 2500 км. 
-- Среднемагистральными — с дальностью полета > 2500 км и <= 6000 км. Дальнемагистральными — с дальностью полета > 6000 км. 
-- В выборке должно быть два столбца, где в первом указана модель самолета. Во втором, category, — категория, со значениями short-haul, medium-haul, long-haul (ближне-, средне- и дальнемагистральные соответственно). Каждый самолет точно попадает ровно в одну категорию.
-- В выборке должны присутствовать два атрибута — model_name, category.

-- SELECT
-- 	model_name,
--     CASE
-- 		WHEN range_value > 1000 AND range_value <= 2500
-- 			THEN "short-haul"
-- 		WHEN range_value > 2500 AND range_value <= 6000
-- 			THEN "medium-haul"
-- 		WHEN range_value > 6000
-- 			THEN "long-haul"
-- 	END as cateogry
-- FROM airliners;


-- Выведите данные о билетах разной ценовой категории. Среди билетов экономкласса (Economy) добавьте в выборку билеты с ценой от 10 000 до 11 000 включительно. 
-- Среди билетов комфорт-класса (PremiumEconomy) — билеты с ценой от 20 000 до 30 000 включительно. 
-- Среди билетов бизнес-класса (Business) — с ценой строго больше 100 000. В решении необходимо использовать оператор CASE.
-- В выборке должны присутствовать три атрибута — id, service_class, price.



SELECT 
	id,
    service_class,
    price
FROM tickets
WHERE
    CASE service_class
		WHEN "Business" THEN price > 100000
		WHEN "PremiumEconomy" THEN price BETWEEN 20000 AND 30000
		WHEN "Economy"  THEN price BETWEEN 10000 AND 11000
END;

-- SELECT
-- 	id,
--     service_class,
--     price,
--     CASE 
-- 		WHEN price BETWEEN 10000 AND 11000
-- 			THEN "Economy"
-- 		WHEN price BETWEEN 20000 AND 30000
-- 			THEN "PremiumEconomy"
-- 		WHEN price > 100000
-- 			THEN "Business"
-- 	END as category
-- FROM tickets


-- Разделите самолеты на три класса по возрасту. Если самолет произведен раньше 2000 года, то отнесите его к классу 'Old'. 
-- Если самолет произведен между 2000 и 2010 годами включительно, то отнесите его к классу 'Mid'. Более новые самолеты отнесите к классу 'New'. Исключите из выборки дальнемагистральные самолеты с максимальной дальностью полета больше 10000 км. 
-- Отсортируйте выборку по классу возраста в порядке возрастания.
-- В выборке должны присутствовать два атрибута — side_number, age.

SELECT
	side_number,
    CASE
		WHEN production_year < 2000 THEN "Old"
        WHEN production_year <= 2010 THEN "Mid"
        ELSE "New"
	END age
FROM airliners
-- В результате выборки выбираем те самалеты у которых  range_value <= 10.0000
WHERE range_value < 30000
ORDER BY production_year;
-- ORDER BY делает соритировку 

