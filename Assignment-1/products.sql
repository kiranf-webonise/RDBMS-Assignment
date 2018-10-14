create table colors(id SERIAL PRIMARY KEY,color_name varchar(20) NOT NULL UNIQUE);

create table cost(product_id int NOT NULL,color_id int NOT NULL,price int NOT NULL);

create table products(product_id SERIAL PRIMARY KEY,name varchar(50) NOT NULL);

alter table cost add FOREIGN KEY (color_id) REFERENCES colors(id);

alter table cost add FOREIGN KEY (product_id) REFERENCES products(product_id);
