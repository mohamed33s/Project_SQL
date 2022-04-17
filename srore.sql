/* ------------------------------------------------Created Database and Tables----------------------------------------------------------*/

create database store;

use store;

create table countries (
    code int primary key , name varchar(20) , continent_name varchar(20)
);

create table users (
    id int primary key , full_name varchar(20) , email varchar(20) , gender char(1) , date_of_birth varchar(15) , created_at datetime , country_code int
);

create table orders (
    id int primary key , user_id int , status varchar(6) , created_at datetime
);

create table order_products (
    order_id int  , product_id int  , quantity int
);

create table products (
    id int primary key  , name varchar(10) , price int , status varchar(10) , created_at datetime
);

/* --------------------------------------------------Created Connect Between the Tables----------------------------------------------------------*/

alter table users
add foreign key (country_code) references countries (code);

alter table orders
add foreign key (user_id) references users (id);

alter table order_products
add foreign key (order_id) references orders (id);

alter table order_products
add foreign key (product_id) references products (id);

alter table order_products
add primary key (order_id);

alter table order_products
add primary key  (product_id);

/* ---------------------------------------------Created the constraints----------------------------------------------------------------*/

alter table countries
add constraint unique (name);

alter table countries modify column continent_name varchar(20) not null ;

alter table users
add constraint unique (email);

ALTER TABLE users
ADD CONSTRAINT chk_val CHECK (gender in ('M','F'));

ALTER TABLE orders
ADD CONSTRAINT chk_val CHECK (status in ('start','finish'));

ALTER TABLE order_products
ALTER quantity SET DEFAULT 0;

ALTER TABLE products
ALTER price SET DEFAULT 0;

ALTER TABLE products
MODIFY name varchar(10) NOT NULL;

ALTER TABLE products
ADD CHECK (status in ('valid','expires'));

/* ---------------------------------------------Write the DML commands----------------------------------------------------------------*/


insert into countries values(
1 , 'Saudi Arabia' , 'Asia'
                            );

insert into users values(
1 , 'Mohammed Alsharadin' , 'mohamed_s33@' , 'M' , '1995-11-18' , '2022-04-01  14:33:44' , 1
                            );

insert into orders values(
1 , 1 , 'start' , '2022-04-10 10:50:01'
                            );

update users set created_at = '2022-04-01  14:33:44'
where id = 1;

insert into products values(
1 , 'Shoes' , 350 , 'valid' , '2022-01-10  09:05:01'
                            );

insert into order_products values(
1 , 1 , 2
                            );

update countries set code = 00966
where code = 00966;

insert into products (id, name, status, created_at)
values(
2 , 'teshert' , 'valid' , '2022-01-10  09:05:01'
                            );

delete from products where id = 2;
