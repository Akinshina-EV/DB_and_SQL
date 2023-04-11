create database homework1;
use homework1;
create table mobile_phone (
  id int primary key not null,
  product_name varchar(45) not null unique,
  manufacturer varchar(45) not null,
  product_count int not null,
  price int not null
);
insert
  mobile_phone (
    id,
    product_name,
    manufacturer,
    product_count,
    price
  )
values
  (1, 'iPhone X', 'Apple', 3, 76000),
  (2, 'iPhone 8', 'Apple', 2, 51000),
  (3, 'Galaxy S9', 'Samsung', 2, 56000),
  (4, 'Galaxy S8', 'Samsung', 1, 41000),
  (5, 'P20 PRO', 'Huawei', 5, 36000);
  /* Выведите название, производителя и цену для товаров, количество которых
         превышает 2 (SQL - файл, скриншот, либо сам код)
       */
use homework1;
select
  manufacturer,
  price
from
  mobile_phone
where
  product_count > 2;
-- Выведите весь ассортимент товаров марки “Samsung”
select
  id,
  product_name,
  manufacturer,
  product_count,
  price
from
  mobile_phone
where
  manufacturer = 'Samsung';
  /* *** С помощью регулярных выражений найти:
      	4.1. Товары, в которых есть упоминание "Iphone"
      	4.2. "Samsung"
      	4.3.  Товары, в которых есть ЦИФРА "8"
       */
select
  id,
  product_name,
  manufacturer,
  product_count,
  price
from
  mobile_phone
where
  product_name like '%iphone%';
select
  id,
  product_name,
  manufacturer,
  product_count,
  price
from
  mobile_phone
where
  manufacturer like '%samsung%';
select
  id,
  product_name,
  manufacturer,
  product_count,
  price
from
  mobile_phone
where
  product_name like '%8%'