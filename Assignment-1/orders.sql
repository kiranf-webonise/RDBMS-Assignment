create table orders(order_id SERIAL PRIMARY KEY,user_id int NOT NULL,product_id int NOT NULL,order_cost int NOT NULL);

alter table orders add FOREIGN KEY (user_id) REFERENCES users(id);

alter table orders add FOREIGN KEY (product_id) REFERENCES products(product_id);
