drop database if exists homework2;
create database if not exists homework2;
ALTER DATABASE homework2 CHARACTER SET utf8 COLLATE utf8_general_ci;
use homework2;
# Используя операторы языка SQL, создайте табличку “sales”.
drop table if exists sales;
create table if not exists sales (
  id int primary key auto_increment,
  order_date date not null,
  count_product int not null
);
# Заполните ее данными
insert into
  sales (order_date, count_product)
values
  ('2022-01-01', 156),
  ('2022-01-02', 180),
  ('2022-01-03', 21),
  ('2022-01-04', 124),
  ('2022-01-05', 341);
# Для данных таблицы “sales” укажите тип заказа в зависимости от кол-ва :
  # меньше 100  -    Маленький заказ
  # от 100 до 300 - Средний заказ
  # больше 300  -     Большой заказ
select
  id as 'id заказа',
  if (
    count_product < 100,
    'Маленький заказ',
    if (
      count_product between 100
      and 300,
      'Средний заказ',
      'Большой заказ'
    )
  ) as 'Тип заказа'
from
  sales;
# Создайте таблицу “orders”, заполните ее значениями.
  drop table if exists orders;
create table if not exists orders (
    id int primary key auto_increment,
    employee_id varchar(45) not null,
    amount decimal(10, 2) not null,
    order_status varchar(45)
  );
insert into
  orders (employee_id, amount, order_status)
values
  ('e03', 15.00, 'OPEN'),
  ('e01', 25.50, 'OPEN'),
  ('e05', 100.70, 'CLOSED'),
  ('e02', 22.18, 'OPEN'),
  ('e04', 9.50, 'CANCELLED');
# Выберите все заказы.
select
  *
from
  orders;
# В зависимости от поля order_status выведите столбец
  # full_order_status:
  # OPEN – «Order is in open state» ;
  # CLOSED - «Order is closed»;
  # CANCELLED -  «Order is cancelled»
select
  id,
  case
    when order_status = 'OPEN' then 'Order is in open state'
    when order_status = 'CLOSED' then 'Order is closed'
    when order_status = 'CANCELLED' then 'Order is cancelled'
  end as full_order_status
from
  orders;

