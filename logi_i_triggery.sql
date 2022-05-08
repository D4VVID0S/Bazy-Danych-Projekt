DROP TABLE IF EXISTS logi;
CREATE TABLE logi 
(
    id_l INT(6) UNSIGNED NOT NULL AUTO_INCREMENT, 
    operacja VARCHAR(30), 
    czas DATETIME, 
    PRIMARY KEY (id_l)
);
-- TRIGGER - zanim coś zostanie dodane wyświetla komunikat
CREATE TRIGGER `before_insert_miasta` BEFORE INSERT ON `logi`
 FOR EACH ROW BEGIN
insert into logi(operacja, czas)
VALUES ('Próba dopisania rekordu do tabeli miasta', now());
END
-- TRIGGER - po dodaniu czegoś zostanie wyświetlony komunikat
CREATE TRIGGER `after_insert_miasta` AFTER INSERT ON `logi`
 FOR EACH ROW BEGIN
insert into logi(operacja, czas)
VALUES ('Dopisano rekord do tabeli miasta', now());
END
-- TRIGGER - przed usunieciem wyswietl komunikat
CREATE TRIGGER `before_delete_miasta` BEFORE DELETE ON `logi`
 FOR EACH ROW BEGIN
insert into logi(operacja, czas)
VALUES ('Próba usunięcia rekordu do tabeli miasta', now());
END
-- TRIGGER - po usunieciu wyswietl komunikat
CREATE TRIGGER `after_delete_miasta` AFTER DELETE ON `logi`
 FOR EACH ROW BEGIN
insert into logi(operacja, czas)
VALUES ('Usunięto rekord z tabeli miasta', now());
END
-- TRIGGER - przed zmiana rekordu wyswietl komunikat
CREATE TRIGGER `before_update_miasta` BEFORE UPDATE ON `logi`
 FOR EACH ROW BEGIN
insert into logi(operacja, czas)
VALUES ('Próba modyfikacji rekordu w tabeli miasta', now());
END
-- TRIGGER - po zmianie rekordu wyswietl komunikat
CREATE TRIGGER `after_update_miasta` AFTER UPDATE ON `logi`
 FOR EACH ROW BEGIN
insert into logi(operacja, czas)
VALUES ('Zmodyfikowano rekord w tabeli miasta', now());
END