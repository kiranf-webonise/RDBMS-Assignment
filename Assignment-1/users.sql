
create table users(id SERIAL PRIMARY KEY,name text check(name ~ '^[a-zA-Z]*$') NOT NULL,email varchar(40) UNIQUE NOT NULL,password char(20) check(length(password)>7),user_type int NOT NULL);


create table users_type(id SERIAL PRIMARY KEY,type varchar(30) NOT NULL UNIQUE);

alter table users add FOREIGN KEY (user_type) REFERENCES users_type(id);
