/* Using Database PostgreSQL */

/* create database ecommerce; */


/*Create table users*/

create table users(id SERIAL PRIMARY KEY,name text check(name ~ '^[a-zA-Z]*$') NOT NULL,email varchar(40) UNIQUE NOT NULL,password char(20) check(length(password)>7),type int NOT NULL);


create table user_types(id SERIAL PRIMARY KEY,type varchar(30) NOT NULL UNIQUE);

alter table users add FOREIGN KEY (type) REFERENCES user_types(id);

/*Queries*/

insert into user_types(type)values('buyer');
insert into user_types(type)values('inventory manager');	

insert into users(name,email,password,type)values('kiran','kiran@gmail.com','kiran1234',1);
insert into users(name,email,password,type)values('ray','ray@gmail.com','ray54321',2);



/*Create table products AND variants */

create table products(id SERIAL PRIMARY KEY,name varchar(40) NOT NULL UNIQUE);

create table variants(id SERIAL PRIMARY KEY,name varchar(40),color varchar(20),product_size varchar(10),price int,product_id int NOT NULL);

alter table variants add FOREIGN KEY (product_id) REFERENCES products(id);

/*Queries */


insert into products(name)values('shirts');
insert into products(name)values('pants');
insert into products(name)values('shoes');
insert into products(name)values('watch');
insert into products(name)values('handbag');


insert into variants(name,color,product_size,price,product_id)values('tshirt','yellow','medium',400,1);
insert into variants(name,color,product_size,price,product_id)values('casual pant','black','large',650,2);
insert into variants(name,color,product_size,price,product_id)values('sports shoe','white','8',1500,3);
insert into variants(name,color,product_size,price,product_id)values('wrist watch','black','medium',2000,4);
insert into variants(name,color,product_size,price,product_id)values('bag','pink','medium',1400,5);


/*Create table cart */

create table cart(id SERIAL PRIMARY KEY,product_id int NOT NULL,variant_id int,variant_price int,user_id int NOT NULL);

alter table cart add FOREIGN KEY (product_id) REFERENCES products(id);

alter table cart add FOREIGN KEY (variant_id) REFERENCES variants(id);

alter table cart add FOREIGN KEY (user_id) REFERENCES users(id);


/*Create table payments*/

create table payments(id SERIAL,payment_mode varchar(20),order_id SERIAL PRIMARY KEY,payment_status varchar(20),transaction_date date,user_id int NOT NULL);

alter table payments add FOREIGN KEY (user_id) REFERENCES users(id);


/*Create table orders*/

create table orders(id SERIAL PRIMARY KEY,order_price int,discount_id int,discount_price int,product_id int,variant_id int,user_id int,order_status varchar(20));


alter table orders add FOREIGN KEY (product_id) REFERENCES products(id);

alter table orders add FOREIGN KEY (variant_id) REFERENCES variants(id);

alter table orders add FOREIGN KEY (user_id) REFERENCES users(id);


/*Create table discounts*/

create table discounts(id SERIAL PRIMARY KEY,name varchar(20),percentage int);


alter table orders add FOREIGN KEY (discount_id) REFERENCES discounts(id);

/*Inser data into tables */











/*
insert into cart(product_id,variant_id,variant_price,user_id) select variants.product_id,variants.id,variants.price,users.id from variants INNER JOIN users ON users.id=1;

*/


