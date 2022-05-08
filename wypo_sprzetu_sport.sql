DROP DATABASE IF EXISTS wypo_sprzetu_sport;
CREATE DATABASE wypo_sprzetu_sport;
USE wypo_sprzetu_sport;
DROP TABLE IF EXISTS customer;
CREATE TABLE customer
(
    cust_id int AUTO_INCREMENT not null, PRIMARY KEY (cust_id),
    name varchar(50) not null,
    surname varchar(50) not null,
    address varchar(50) not null,
    house_nr varchar(10) not null,
    post_code varchar(6) not null,
    city varchar(30) not null
);
INSERT INTO customer(name, surname, address, house_nr, post_code, city)
VALUES
('Alan', 'Duda', 'Lomnicka', '63', '91-726', 'Lodz'),
('Marlena', 'Cieslak', 'Rokietnicka', '30', '62-079', 'Tarnowo Podgorne'),
('Roza', 'Kalinowska', 'Piaskowa', '119', '47-206', 'Katowice'),
('Alicja', 'Urbanska', 'Rondo imienia Generala Maczka Stanislawa', '68', '40-591', 'Warszawa'),
('Patryk', 'Dabrowski', 'Aleje Jerozolimskie', '11/23', '14-234', 'Krakow'),
('Anna', 'Waleczna', 'Polna', '45/198', '01-111', 'Krakow'),
('Esmeralda', 'Bonowska', 'Lesna', '13', '00-002', 'Gdansk'),
('Katarzyna', 'Ambroziak', 'Sloneczna', '34/2', '12-345', 'Slask'),
('Jaroslaw', 'Miecznicki', 'Krotka', '1/4', '09-999', 'Poznan'),
('Izabela', 'Kresnicka', 'Szkolna', '2/22', '33-333', 'Gdansk'),
('Mariusz', 'Gorecki', 'Cisowa', '101', '75-644', 'Koszalin'),
('Franciszek', 'Lewandowski', 'Regionalna', '33', '04-995', 'Lodz'),
('Jenek', 'Brzekwinski', 'Drzymaly Michala', '142', '30-136', 'Lodz (Baluty)'),
('Leonardo', 'Wojciechowski', 'Zloczowska', '29', '31-819', 'Tarnow'),
('Krystyna', 'Przybylska', 'Galczynska', '85', '10-903', 'Olsztyn'),
('Oktawia', 'Laskowska', 'Ketrzynskiego Wojciecha', '47', '10-506', 'Olsztyn'),
('Ariel', 'Marciniak', 'Koszykowa', '86', '00-562', 'Warszawa'),
('Dariusz', 'Piotrkowski', 'Jagodowa', '45', '71-033', 'Szczecin'),
('Danuta', 'Szewczyk', 'Miodowa', '40', '81-558', 'Gdynia'),
('Bogda', 'Brzezinska', 'Legionow', '71', '32-020', 'Wieliczka'),
('Teresa', 'Kolodziej', 'Staropolska', '20', '03-289', 'Warszawa'),
('Ilona', 'Urbanska', 'Kowalska', '51', '91-843', 'Lodz'),
('Bogna', 'Wojciechowska', 'Kosciuszki Tadeusza', '76', '40-691', 'Katowice');
DROP TABLE IF EXISTS rent_card;
CREATE TABLE rent_card
(
    card_id int AUTO_INCREMENT not null, PRIMARY KEY (card_id),
    cust_id int,
    creat_date datetime not null,
    exp_date datetime not null, foreign key (cust_id) references customer(cust_id)
);
INSERT INTO rent_card(cust_id, creat_date, exp_date)
VALUES
(1, '2020-05-12 10:20:11', '2020-05-18 10:20:11'),
(4, '2020-06-10 11:47:03', '2020-06-13 11:47:03'),
(2, '2020-07-08 16:35:57', '2020-07-20 16:35:57'),
(10, '2020-09-28 01:54:07', '2020-10-10 01:54:07'),
(4, '2020-10-07 18:09:11', '2021-10-07 18:09:11'),
(9, '2021-01-17 17:32:55', '2021-01-22 17:32:55'),
(3, '2021-03-05 02:00:56', '2021-03-10 02:00:56'),
(17, '2021-03-31 11:12:15', '2021-04-20 11:12:15'),
(2, '2021-05-09 08:39:37', '2021-06-02 08:39:37'),
(13, '2021-07-20 19:42:58', '2021-07-21 19:42:58'),
(13, '2021-08-16 09:47:27','2021-08-20 09:47:27'),
(17, '2021-10-08 20:19:23', '2021-10-12 20:19:23'),
(1, '2021-12-25 10:00:12', '2022-01-31 10:00:12'),
(19, '2022-01-10 16:02:16', '2022-01-22 16:02:16'),
(9, '2022-03-06 19:49:37', '2022-03-09 19:49:37'),
(7, '2022-04-07 11:39:10', '2022-04-10 11:39:10');
DROP TABLE IF EXISTS gear;
CREATE TABLE gear
(
    g_id int AUTO_INCREMENT not null,
    PRIMARY KEY (g_id),
    item varchar(30) not null,
    price decimal(6, 2),
    category varchar(30) not null
);
INSERT INTO gear(item, price, category)
VALUES
('Pilka do koszykowki',  30.00, 'Koszykowka'),
('Stroj do koszykowki', 60.00, 'Koszykowka'),
('Buty do koszykowki', 50.00, 'Koszykowka'),
('Pilka do nogi', 25.00, 'Pilka nozna'),
('Stroj do nogi', 35.00, 'Pilka nozna'),
('Korki do nogi', 40.00, 'Pilka nozna'),
('Narty', 65.00, 'Sporty zimowe'),
('Snowboard', 65.00, 'Sporty zimowe'),
('Kijki do nart', 25.00, 'Sporty zimowe'),
('Kask na narty/snowboard', 30.00, 'Sporty zimowe'),
('Buty na snowboard', 33.00, 'Sporty zimowe'),
('Buty na narty', 40.00, 'Sporty zimowe'),
('Czepek na basen', 5.00, 'Basen'),
('Meski stroj kompielowy', 17.00, 'Basen'),
('Damski stroj kompielowy', 17.00, 'Basen'),
('Okularki', 10.00, 'Basen'),
('Makaron basenowy', 5.00, 'Basen'),
('Deska do plywania', 5.00, 'Basen'),
('Kolo dmuchane', 10.00, 'Basen'),
('Rekawki do nauki plywania', 8.00, 'Basen');
DROP TABLE IF EXISTS rent_order;
CREATE TABLE rent_order
(
    ord_id int AUTO_INCREMENT not null, PRIMARY KEY (ord_id),
    cust_id int, foreign key (cust_id) references customer(cust_id),
    quantity int not null,
    g_id int not null, FOREIGN KEY (g_id) REFERENCES gear(g_id)
);
INSERT INTO rent_order(cust_id, quantity, g_id)
VALUES
(1, 1, 13),
(4, 2, 14),
(2, 7, 16),
(10, 35, 4),
(4, 4, 5),
(9, 8, 6),
(3, 3, 8),
(17, 19, 10),
(2, 5, 11),
(13, 69, 13),
(13, 13, 15),
(17, 20, 17), 
(1, 3, 1),
(19, 12, 18),
(9, 16, 10),
(7, 4, 20);
DROP TABLE IF EXISTS logi;
CREATE TABLE logi 
(
    id_l INT(6) UNSIGNED NOT NULL AUTO_INCREMENT, 
    operacja VARCHAR(30), 
    czas DATETIME, 
    PRIMARY KEY (id_l)
);
-- TRIGGERY CUSTOMER --
CREATE TRIGGER `BEFORE_INSERT_CUSTOMER` BEFORE INSERT ON `customer`
 FOR EACH ROW BEGIN
insert into logi(operacja, czas)
VALUES ('Próba dopisania rekordu do tabeli Customer', now());
END

CREATE TRIGGER `AFTER_INSERT_CUSTOMER` AFTER INSERT ON `customer`
 FOR EACH ROW BEGIN
insert into logi(operacja, czas)
VALUES ('Dopisano rekord do tabeli Customer', now());
END

CREATE TRIGGER `BEFORE_DELETE_CUSTOMER` BEFORE DELETE ON `customer`
 FOR EACH ROW BEGIN
insert into logi(operacja, czas)
VALUES ('Próba usunięcia rekordu do tabeli Customer', now());
END

CREATE TRIGGER `AFTER_DELETE_CUSTOMER` AFTER DELETE ON `customer`
 FOR EACH ROW BEGIN
insert into logi(operacja, czas)
VALUES ('Usunięto rekord z tabeli Customer', now());
END

CREATE TRIGGER `BEFORE_UPDATE_CUSTOMER` BEFORE UPDATE ON `customer`
 FOR EACH ROW BEGIN
insert into logi(operacja, czas)
VALUES ('Próba modyfikacji rekordu w tabeli Customer', now());
END

CREATE TRIGGER `AFTER_UPDATE_CUSTOMER` AFTER UPDATE ON `customer`
 FOR EACH ROW BEGIN
insert into logi(operacja, czas)
VALUES ('Zmodyfikowano rekord w tabeli Customer', now());
END

-- TRIGGERY GEAR --
CREATE TRIGGER `BEFORE_INSERT_GEAR` BEFORE INSERT ON `gear`
 FOR EACH ROW BEGIN
insert into logi(operacja, czas)
VALUES ('Próba dopisania rekordu do tabeli Gear', now());
END

CREATE TRIGGER `AFTER_INSERT_GEAR` AFTER INSERT ON `gear`
 FOR EACH ROW BEGIN
insert into logi(operacja, czas)
VALUES ('Dopisano rekord do tabeli Gear', now());
END

CREATE TRIGGER `BEFORE_DELETE_GEAR` BEFORE DELETE ON `gear`
 FOR EACH ROW BEGIN
insert into logi(operacja, czas)
VALUES ('Próba usunięcia rekordu do tabeli Gear', now());
END

CREATE TRIGGER `AFTER_DELETE_GEAR` AFTER DELETE ON `gear`
 FOR EACH ROW BEGIN
insert into logi(operacja, czas)
VALUES ('Usunięto rekord z tabeli Gear', now());
END

CREATE TRIGGER `BEFORE_UPDATE_GEAR` BEFORE UPDATE ON `gear`
 FOR EACH ROW BEGIN
insert into logi(operacja, czas)
VALUES ('Próba modyfikacji rekordu w tabeli Gear', now());
END

CREATE TRIGGER `AFTER_UPDATE_GEAR` AFTER UPDATE ON `gear`
 FOR EACH ROW BEGIN
insert into logi(operacja, czas)
VALUES ('Zmodyfikowano rekord w tabeli Gear', now());
END

-- TRIGGERY RENT_CARD --
CREATE TRIGGER `BEFORE_INSERT_RENT_CARD` BEFORE INSERT ON `rent_card`
 FOR EACH ROW BEGIN
insert into logi(operacja, czas)
VALUES ('Próba dopisania rekordu do tabeli Rent Card', now());
END

CREATE TRIGGER `AFTER_INSERT_RENT_CARD` AFTER INSERT ON `rent_card`
 FOR EACH ROW BEGIN
insert into logi(operacja, czas)
VALUES ('Dopisano rekord do tabeli Rent Card', now());
END

CREATE TRIGGER `BEFORE_DELETE_RENT_CARD` BEFORE DELETE ON `rent_card`
 FOR EACH ROW BEGIN
insert into logi(operacja, czas)
VALUES ('Próba usunięcia rekordu do tabeli Rent Card', now());
END

CREATE TRIGGER `AFTER_DELETE_RENT_CARD` AFTER DELETE ON `rent_card`
 FOR EACH ROW BEGIN
insert into logi(operacja, czas)
VALUES ('Usunięto rekord z tabeli Rent Card', now());
END

CREATE TRIGGER `BEFORE_UPDATE_RENT_CARD` BEFORE UPDATE ON `rent_card`
 FOR EACH ROW BEGIN
insert into logi(operacja, czas)
VALUES ('Próba modyfikacji rekordu w tabeli Rent Card', now());
END

CREATE TRIGGER `AFTER_UPDATE_RENT_CARD` AFTER UPDATE ON `rent_card`
 FOR EACH ROW BEGIN
insert into logi(operacja, czas)
VALUES ('Zmodyfikowano rekord w tabeli Rent Card', now());
END

-- TRIGGERY RENT_ORDER --
CREATE TRIGGER `BEFORE_INSERT_RENT_ORDER` BEFORE INSERT ON `rent_order`
 FOR EACH ROW BEGIN
insert into logi(operacja, czas)
VALUES ('Próba dopisania rekordu do tabeli Rent Order', now());
END

CREATE TRIGGER `AFTER_INSERT_RENT_ORDER` AFTER INSERT ON `rent_order`
 FOR EACH ROW BEGIN
insert into logi(operacja, czas)
VALUES ('Dopisano rekord do tabeli Rent Order', now());
END

CREATE TRIGGER `BEFORE_DELETE_RENT_ORDER` BEFORE DELETE ON `rent_order`
 FOR EACH ROW BEGIN
insert into logi(operacja, czas)
VALUES ('Próba usunięcia rekordu do tabeli Rent Order', now());
END

CREATE TRIGGER `AFTER_DELETE_RENT_ORDER` AFTER DELETE ON `rent_order`
 FOR EACH ROW BEGIN
insert into logi(operacja, czas)
VALUES ('Usunięto rekord z tabeli Rent Order', now());
END

CREATE TRIGGER `BEFORE_UPDATE_RENT_ORDER` BEFORE UPDATE ON `rent_order`
 FOR EACH ROW BEGIN
insert into logi(operacja, czas)
VALUES ('Próba modyfikacji rekordu w tabeli Rent Order', now());
END

CREATE TRIGGER `AFTER_UPDATE_RENT_ORDER` AFTER UPDATE ON `rent_order`
 FOR EACH ROW BEGIN
insert into logi(operacja, czas)
VALUES ('Zmodyfikowano rekord w tabeli Rent Order', now());
END

-- Procedura Total_price_order
BEGIN
SELECT ord_id, cust_id, item, quantity, price,
quantity * price as 'Total_Price'
FROM rent_order, gear
WHERE rent_order.g_id = gear.g_id;
END
-- Procedura Rent_card_2020
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `2020_RENT_CARDS`()
BEGIN
SELECT * from rent_card
WHERE creat_date >= '2020-01-01 00:00:00' AND exp_date <= '2020-12-31 23:59:59';
END$$
DELIMITER ;
-- Procedura Rent_card_2021
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `2021_RENT_CARDS`()
BEGIN
SELECT * from rent_card
WHERE creat_date >= '2021-01-01 00:00:00' AND exp_date <= '2021-12-31 23:59:59';
END$$
DELIMITER ;
-- Procedura Rent_card_2022
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `2022_RENT_CARDS`()
BEGIN
SELECT * from rent_card
WHERE creat_date >= '2022-01-01 00:00:00' AND exp_date <= '2022-12-31 23:59:59';
END$$
DELIMITER ;

------------------------------------------------- Do dodania do pliku do zdania -------------------------------------------------
-- WHERE
SELECT customer.name, gear.category, rent_order.quantity
FROM customer, gear, rent_order
WHERE customer.cust_id = rent_order.cust_id
AND rent_order.g_id = gear.g_id;

SELECT * FROM customer, rent_card, rent_order 
WHERE customer.cust_id = 7 
AND rent_card.cust_id = 7 
AND rent_order.cust_id = 7;
-- NATURAL JOIN - tworzy się lekki iloczyn kartezjański
SELECT * FROM customer
NATURAL JOIN rent_card
NATURAL JOIN rent_order;
-- INNER JOIN - tworzy się lekki iloczyn kartezjański
SELECT * FROM customer
INNER JOIN rent_card
INNER JOIN rent_order
ON customer.cust_id = rent_card.cust_id
AND customer.cust_id = rent_order.cust_id
AND rent_card.cust_id = rent_order.cust_id;
-- LEFT OUTER JOIN
SELECT customer.name, customer.surname, rent_order.quantity, rent_card.creat_date, rent_card.exp_date
FROM customer
LEFT OUTER JOIN rent_order ON customer.cust_id = rent_order.cust_id
LEFT OUTER JOIN rent_card ON customer.cust_id = rent_card.cust_id;
-- RIGHT OUTER JOIN
SELECT customer.name, customer.surname, rent_order.quantity, rent_card.creat_date, rent_card.exp_date
FROM customer
RIGHT OUTER JOIN rent_order ON customer.cust_id = rent_order.cust_id
RIGHT OUTER JOIN rent_card ON customer.cust_id = rent_card.cust_id;

-- GROUP BY
SELECT category, COUNT(g_id) AS Item_Per_Category 
FROM gear 
GROUP BY category;
-- HAVING
SELECT *
FROM gear
GROUP BY category
HAVING price >= 20;
-- BETWEEN
SELECT creat_date, exp_date, COUNT(card_id) AS Card_Quantity
FROM rent_card
WHERE exp_date
BETWEEN '2020-01-01 00:00:00' and '2021-01-01 00:00:00';
-- LIKE
SELECT item, category, COUNT((g_id)) AS Item_Quantity
FROM gear
WHERE item LIKE 'P%';
-- ORDER BY
SELECT item, category, price
FROM gear
HAVING price BETWEEN 5 and 15
ORDER BY category;