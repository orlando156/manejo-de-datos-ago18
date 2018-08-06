create table clients(
id int auto_increment not null PRIMARY KEY,
name varchar (50),
age int,
gender boolean 
);


create table transactions(
id_cliente int not null PRIMARY KEY,
id_transaccion int NOT null,
 purchase_date date,
FOREIGN KEY (`id_cliente`) REFERENCES `clients`(`id`)
);

create table products(
id_products int Not null PRIMARY KEY,
name_product varchar (20),
price float
);

create table products_transactions(
id_products int not null,
id_transaccion int NOT null PRIMARY KEY,
FOREIGN KEY (id_transaccion) references transactions (id_cliente),
FOREIGN KEY (id_products) references products (id_products)    
);




