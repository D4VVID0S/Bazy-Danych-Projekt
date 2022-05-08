procedura
create temporary table do wyswietlenia zamówień z produktem, ceną i pełną ceną

trigger - wyzwalacz
logi zmian w tablicach
np. dodanie rekordu badz zmiana w tablicy lub usuniecie/dodane tablicy

one mogą być tylko przed lub po akcji
Może być maks 6 wyzwalaczy:
after_delete_miasta
after_miasta_insert
after_miasta_update
before_delete_miasta
before_miasta_insert
before_miasta_update

Nazwa Wyzwalacza - before_update_miasta
Tabela - miasta
Czas - BEFORE
Zdarzenie - UPDATE

określenie - kod
BEGIN
-- Trzeba utworzyć tablicę logi
insert into logi(operacja, czas)
VALUES ('Proba modyfikacji rekordu w tabeli miasta', now());
END