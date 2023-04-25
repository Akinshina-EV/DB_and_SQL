SET
  NAMES 'utf8';
SET
  CHARACTER SET 'utf8';
DROP DATABASE IF EXISTS homework5;
CREATE DATABASE IF NOT EXISTS homework5;
ALTER DATABASE lesson4 CHARACTER SET utf8 COLLATE utf8_general_ci;
USE homework5;
DROP TABLE IF EXISTS cars;
CREATE TABLE cars (
    id INT NOT NULL PRIMARY KEY,
    car_name VARCHAR(45),
    cost INT
  );
INSERT
  cars
VALUES
  (1, 'Audi', 52642),
  (2, 'Mercedes', 57127),
  (3, 'Skoda', 9000),
  (4, 'Volvo', 29000),
  (5, 'Bentley', 350000),
  (6, 'Citroen', 21000),
  (7, 'Hummer', 41400),
  (8, 'Volkswagen', 21600);
SELECT
  *
FROM
  cars;

# Создайте представление, в которое попадут автомобили стоимостью
  # до 25 000 долларов
  CREATE
  OR REPLACE VIEW cheap_car AS
SELECT
  id,
  car_name,
  cost
FROM
  cars
WHERE
  cost < 25000;
SELECT
  *
FROM
  cheap_car;

# Изменить в существующем представлении порог для стоимости:
  # пусть цена будет до 30 000 долларов (используя оператор ALTER VIEW)
  ALTER VIEW cheap_car AS
SELECT
  id,
  car_name,
  cost
FROM
  cars
WHERE
  cost < 30000;
SELECT
  *
FROM
  cheap_car;

# Создайте представление, в котором будут только автомобили
  # марки “Шкода” и “Ауди”
  CREATE VIEW skoda_audi_car AS
SELECT
  id,
  car_name,
  cost
FROM
  cars
WHERE
  car_name IN ('Skoda', 'Audi');
SELECT
  *
FROM
  skoda_audi_car;