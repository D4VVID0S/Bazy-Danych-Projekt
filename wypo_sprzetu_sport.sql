DROP DATABASE IF EXISTS wypo_sprzetu_sport;

CREATE DATABASE wypo_sprzetu_sport;

USE wypo_sprzetu_sport;

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

INSERT INTO customer(cust_id, name, surname, address, house_nr, post_code, city)
VALUES(1, 'Alan', 'Duda', 'Lomnicka', '63', '91-726', 'Lodz'),
(2, 'Marlena', 'Cieslak', 'Rokietnicka', '30', '62-079', 'Tarnowo Podgorne'),
(3, 'Roza', 'Kalinowska', 'Piaskowa', '119', '47-206', 'Katowice'),
(4, 'Alicja', 'Urbanska', 'Rondo imienia Generala Maczka Stanislawa', '68', '40-591', 'Warszawa'),
(5, 'Patryk', 'Dabrowski', 'Aleje Jerozolimskie', '11/23', '14-234', 'Krakow'),
(6, 'Anna', 'Waleczna', 'Polna', '45/198', '01-111', 'Krakow'),
(7, 'Esmeralda', 'Bonowska', 'Lesna', '13', '00-002', 'Gdansk'),
(8, 'Katarzyna', 'Ambroziak', 'Sloneczna', '34/2', '12-345', 'Slask'),
(9, 'Jaroslaw', 'Miecznicki', 'Krotka', '1/4', '09-999', 'Poznan'),
(10, 'Izabela', 'Kresnicka', 'Szkolna', '2/22', '33-333', 'Gdansk'),
(11, 'Mariusz', 'Gorecki', 'Cisowa', '101', '75-644', 'Koszalin'),
(12, 'Franciszek', 'Lewandowski', 'Regionalna', '33', '04-995', 'Lodz'),
(13, 'Jenek', 'Brzekwinski', 'Drzymaly Michala', '142', '30-136', 'Lodz (Baluty)'),
(14, 'Leonardo', 'Wojciechowski', 'Zloczowska', '29', '31-819', 'Tarnow'),
(15, 'Krystyna', 'Przybylska', 'Galczynska', '85', '10-903', 'Olsztyn'),
(16, 'Oktawia', 'Laskowska', 'Ketrzynskiego Wojciecha', '47', '10-506', 'Olsztyn'),
(17, 'Ariel', 'Marciniak', 'Koszykowa', '86', '00-562', 'Warszawa'),
(18, 'Dariusz', 'Piotrkowski', 'Jagodowa', '45', '71-033', 'Szczecin'),
(19, 'Danuta', 'Szewczyk', 'Miodowa', '40', '81-558', 'Gdynia'),
(20, 'Bogda', 'Brzezinska', 'Legionow', '71', '32-020', 'Wieliczka'),
(21, 'Teresa', 'Kolodziej', 'Staropolska', '20', '03-289', 'Warszawa'),
(22, 'Ilona', 'Urbanska', 'Kowalska', '51', '91-843', 'Lodz'),
(23, 'Bogna', 'Wojciechowska', 'Kosciuszki Tadeusza', '76', '40-691', 'Katowice');

CREATE TABLE rent_card
(
    card_id int AUTO_INCREMENT not null, PRIMARY KEY (card_id),
    cust_id int,
    creat_date datetime not null,
    exp_date datetime not null, foreign key (cust_id) references customer(cust_id)
);

INSERT INTO rent_card(card_id, cust_id, creat_date, exp_date)
VALUES(1, 1, '2020-05-12 10:20:11', '2020-05-18 10:20:11'),
(2, 4, '2020-06-10 11:47:03', '2020-06-13 11:47:03'),
(3, 2, '2020-07-08 16:35:57', '2020-07-20 16:35:57'),
(4, 10, '2020-09-28 01:54:07', '2020-10-10 01:54:07'),
(5, 4, '2020-10-07 18:09:11', '2021-10-07 18:09:11'),
(6, 9, '2021-01-17 17:32:55', '2021-01-22 17:32:55'),
(7, 3, '2021-03-05 02:00:56', '2021-03-10 02:00:56'),
(8, 17, '2021-03-31 11:12:15', '2021-04-20 11:12:15'),
(9, 2, '2021-05-09 08:39:37', '2021-06-02 08:39:37'),
(10, 13, '2021-07-20 19:42:58', '2021-07-21 19:42:58'),
(11, 13, '2021-08-16 09:47:27','2021-08-20 09:47:27'),
(12, 17, '2021-10-08 20:19:23', '2021-10-12 20:19:23'),
(13, 1, '2021-12-25 10:00:12', '2022-01-31 10:00:12'),
(14, 19, '2022-01-10 16:02:16', '2022-01-22 16:02:16'),
(15, 9, '2022-03-06 19:49:37', '2022-03-09 19:49:37'),
(16, 7, '2022-04-07 11:39:10', '2022-04-10 11:39:10');

CREATE TABLE gear
(
    g_id int AUTO_INCREMENT not null,
    PRIMARY KEY (g_id),
    item varchar(30) not null,
    price decimal(6, 2)
);

INSERT INTO gear(g_id, item, price)
VALUES(1, 'Pilka do koszykowki',  30.00),
(2, 'Stroj do koszykowki', 60.00),
(3, 'Buty do koszykowki', 50.00),
(4, 'Pilka do nogi', 25.00),
(5, 'Stroj do nogi', 35.00),
(6, 'Korki do nogi', 40.00),
(7, 'Narty', 65.00),
(8, 'Snowboard', 65.00),
(9, 'Kijki do nart', 25.00),
(10, 'Kask na narty/snowboard', 30.00),
(11, 'Buty na snowboard', 33.00),
(12, 'Buty na narty', 40.00),
(13, 'Czepek na basen', 5.00),
(14, 'Meski stroj kompielowy', 17.00),
(15, 'Damski stroj kompielowy', 17.00),
(16, 'Okularki', 10.00),
(17, 'Makaron basenowy', 5.00),
(18, 'Deska do plywania', 5.00),
(19, 'Kolo dmuchane', 10.00),
(20, 'Rekawki do nauki plywania', 8.00);

CREATE index g_id on gear(g_id);

create index gear_item on gear(item);

-- kolumna nie jest primary key wiec musi byc indeksowana
CREATE index price on gear(price);

CREATE TABLE gear_type
(
    id_gtype int AUTO_INCREMENT not null, PRIMARY KEY (id_gtype),
    g_id int,
    category varchar(30) not null,
    item varchar(30) not null,
    foreign key (item, g_id) references gear(item, g_id)
);

INSERT INTO gear_type(id_gtype, g_id, category, item)
VALUES(1, 1, 'Koszykowka', 'Pilka do koszykowki'),
(2, 2, 'Koszykowka', 'Stroj do koszykowki'),
(3, 3, 'Koszykowka', 'Buty do koszykowki'),
(4, 4, 'Pilka nozna', 'Pilka do nogi'),
(5, 5, 'Pilka nozna', 'Stroj do nogi'),
(6, 6, 'Pilka nozna', 'Korki do nogi'),
(7, 7, 'Sporty zimowe', 'Narty'),
(8, 8, 'Sporty zimowe', 'Snowboard'),
(9, 9, 'Sporty zimowe', 'Kijki do nart'),
(10, 10, 'Sporty zimowe', 'Kask na narty/snowboard'),
(11, 11, 'Sporty zimowe', 'Buty na snowboard'),
(12, 12, 'Sporty zimowe', 'Buty na narty'),
(13, 13, 'Basen', 'Czepek na basen'),
(14, 14, 'Basen', 'Meski stroj kompielowy'),
(15, 15, 'Basen', 'Damski stroj kompielowy'),
(16, 16, 'Basen', 'Okularki'),
(17, 17, 'Basen', 'Makaron basenowy'),
(18, 18, 'Basen', 'Deska do plywania'),
(19, 19, 'Basen', 'Kolo dmuchane'),
(20, 20, 'Basen', 'Rekawki do nauki plywania');

CREATE TABLE rent_order
(
    ord_id int AUTO_INCREMENT not null, PRIMARY KEY (ord_id),
    cust_id int, foreign key (cust_id) references customer(cust_id),
    item varchar(30), foreign key (item) references gear(item),
    quantity int not null,
    g_id int not null, FOREIGN KEY (g_id) REFERENCES gear(g_id)
);

INSERT INTO rent_order(ord_id, cust_id, item, quantity, g_id)
VALUES(1, 1, 'Czepek na basen', 1, 13),
(2, 4, 'Meski stroj kompielowy', 2, 14),
(3, 2, 'Okularki', 7, 16),
(4, 10, 'Pilka do nogi', 35, 4),
(5, 4, 'Stroj do nogi', 4, 5),
(6, 9, 'Korki do nogi', 8, 6),
(7, 3, 'Snowboard', 3, 8),
(8, 17, 'Kask na narty/snowboard', 19, 10),
(9, 2, 'Buty na snowboard', 5, 11),
(10, 13, 'Czepek na basen', 69, 13),
(11, 13, 'Damski stroj kompielowy', 13, 15),
(12, 17, 'Makaron basenowy', 20, 17), 
(13, 1, 'Pilka do koszykowki', 3, 1),
(14, 19, 'Deska do plywania', 12, 18),
(15, 9, 'Kask na narty/snowboard', 16, 10),
(16, 7, 'Rekawki do nauki plywania', 4, 20);

-- Procedura Total_price_order
SELECT quantity, price,
quantity * price as 'Total_Amount'
FROM rent_order, gear
WHERE rent_order.g_id = gear.g_id;

-- Procedura Rent_card_2020
SELECT * from rent_card
WHERE creat_date >= '2020-01-01 00:00:00' AND exp_date <= '2020-12-31 23:59:59';

-- Procedura Rent_card_2021
SELECT * from rent_card
WHERE creat_date >= '2021-01-01 00:00:00' AND exp_date <= '2021-12-31 23:59:59';

-- Procedura Rent_card_2022
SELECT * from rent_card
WHERE creat_date >= '2022-01-01 00:00:00' AND exp_date <= '2022-12-31 23:59:59';

-- where
SELECT customer.name,
gear_type.category,
rent_order.item
FROM customer, gear_type, rent_order
WHERE customer.cust_id = rent_order.cust_id
AND rent_order.g_id = gear_type.g_id;

-- natural join - tworzy się lekki iloczyn kartezjański
SELECT * FROM customer
NATURAL JOIN rent_card
NATURAL JOIN rent_order
WHERE customer.cust_id = rent_card.cust_id
AND customer.cust_id = rent_order.cust_id
AND rent_card.cust_id = rent_order.cust_id;
-- inner join - tworzy się lekki iloczyn kartezjański
SELECT * FROM customer
INNER JOIN rent_card
INNER JOIN rent_order
ON customer.cust_id = rent_card.cust_id
AND customer.cust_id = rent_order.cust_id
AND rent_card.cust_id = rent_order.cust_id;
-- left outer join

-- right outer join