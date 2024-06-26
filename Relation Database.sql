========PART2========

----NO.2A----

create table if not exists users(
id serial,
username varchar(255),
password varchar(255),
nama varchar(255),
alamat varchar(255),
telepon integer,
gender varchar(10),
email varchar(255),
created_at timestamp,
update_at timestamp,

primary key (id)
)

----NO.2B----

create table products(
id serial,
nama_product varchar(255),
price decimal (10,2),
stock_quantity integer,
product_type_id integer,
product_description_id varchar(255),
created_at timestamp,
updated_at timestamp,
deleted_at timestamp,

primary key (id),
foreign key (product_type_id) references product_type(id)
)



--------------------------------

create table product_type(
id serial,
type_name varchar(255),
created_at timestamp,
updated_at timestamp,
deleted_at timestamp,

primary key (id)
)
--------------------------------

create table product_description(
id serial,
product_id integer,
description text,

primary key (id),
foreign key (product_id) references products(id)
)

--------------------------------

create table payment_method(
id serial,
method_name varchar(255),
userid integer,

primary key (id),
foreign key (userid) references users(id)
)



----NO.2C----

create table transaction(
id serial,
userid integer,
product_id integer,
product_type_id integer,
quantity integer,
created_at timestamp,
updated_at timestamp,

primary key (id),
foreign key (userid) references users(id),
foreign key (product_id) references products(id),
foreign key (product_type_id) references products_type(id)
)




----------------------------------

create table transaction_detail(
id serial,
user_id integer,
total decimal (10,2),
created_at timestamp,
update_at timestamp,

primary key (id),
foreign key (user_id) references users(id)
)

----NO.3----

create table kurir(
id serial,
nama varchar(255),
created_at timestamp,
updated_at timestamp,

primary key (id)
)

----NO.4----

alter table kurir add column ongkos_dasar decimal(10,2);

----NO.5----

alter table kurir
rename to shipping;

----NO.6----

drop table shipping;

----NO.7----

	-a. 1-to-1			: users dengan transaction_detail
	-b. 1-to-many 		: transaction dengan products
	-c. many-to-many	: products dengan product_description dan product_type
	

	
========PART3========

====RELEASE1=====

-----NO.1-----

--A--

insert into product_type (type_name, created_at, updated_at, deleted_at)
values ('celana', now(), now(), now())

insert into product_type (type_name, created_at, updated_at, deleted_at)
values ('mainan', now(), now(), now())

insert into product_type (type_name, created_at, updated_at, deleted_at)
values ('baju', now(), now(), now())

--B--

insert into products (nama_product, price,stock_quantity, product_type_id, created_at, updated_at, deleted_at)
values ('Celana Katun', 250000, 10, 1, now(), now(), now())

insert into products (nama_product, price,stock_quantity, product_type_id, created_at, updated_at, deleted_at)
values ('Celana Chino', 450000, 10, 1, now(), now(), now())

--C--

insert into products (nama_product, price,stock_quantity, product_type_id, created_at, updated_at, deleted_at)
values ('Lego', 100000, 5, 2, now(), now(), now())

insert into products (nama_product, price,stock_quantity, product_type_id, created_at, updated_at, deleted_at)
values ('Hot Wheels', 25000, 20, 2, now(), now(), now())

insert into products (nama_product, price,stock_quantity, product_type_id, created_at, updated_at, deleted_at)
values ('Nerf', 200000, 6, 2, now(), now(), now())

--D--

insert into products (nama_product, price,stock_quantity, product_type_id, created_at, updated_at, deleted_at)
values ('Kemaja', 300000, 7, 3, now(), now(), now())

insert into products (nama_product, price,stock_quantity, product_type_id, created_at, updated_at, deleted_at)
values ('Polo', 150000, 8, 3, now(), now(), now())

insert into products (nama_product, price,stock_quantity, product_type_id, created_at, updated_at, deleted_at)
values ('Tshirt', 200000, 23, 3, now(), now(), now())

--E--

insert into product_description (product_id, description)
values (1, '100% katun')

insert into product_description (product_id, description)
values (2, 'Nyaman dan gaya')

insert into product_description (product_id, description)
values (3, 'Lego Lego')

insert into product_description (product_id, description)
values (4, 'Whooosh')

insert into product_description (product_id, description)
values (5, 'Headshot')

insert into product_description (product_id, description)
values (6, 'Langsung kece')

insert into product_description (product_id, description)
values (7, 'Bergaya dengan Polo')

insert into product_description (product_id, description)
values (8, 'Menyalah abangkuh')


--F--

insert into payment_method (method_name)
values ('Kartu Kredit')

insert into payment_method (method_name)
values ('Kartu E-Wallet')

insert into payment_method (method_name)
values ('COD')

--G--

insert into users (username, password, nama, alamat, telepon, gender, email, created_at, update_at)
values ('bambang', 12345, 'Bambang Setia', 'Jakarta', 081234567, 'Laki-Laki', 'bambang@gmail.com', now(), now())

insert into users (username, password, nama, alamat, telepon, gender, email, created_at, update_at)
values ('agus', 12345, 'Agus Gus', 'Surabaya', 123, 'Laki-Laki', 'agus@gmail.com', now(), now())

insert into users (username, password, nama, alamat, telepon, gender, email, created_at, update_at)
values ('asep', 12345, 'Asep Soleh', 'Bandung', 123, 'Laki-Laki', 'asep@gmail.com', now(), now())

insert into users (username, password, nama, alamat, telepon, gender, email, created_at, update_at)
values ('Cindy', 12345, 'Cindy Gula', 'Depok', 123, 'Perempuan', 'cindy@gmail.com', now(), now())

insert into users (username, password, nama, alamat, telepon, gender, email, created_at, update_at)
values ('Euis', 12345, 'Neng Euis', 'Cianjur', 123, 'Perempuan', 'euis@gmail.com', now(), now())

insert into users (username, password, nama, alamat, telepon, gender, email, created_at, update_at)
values ('Intan', 12345, 'Intan Rani', 'Bali', 123, 'Perempuan', 'intan@gmail.com', now(), now())

--H--

insert into transaction (userid, product_id, product_type_id, quantity, created_at, updated_at)
values (1, 1, 1, 1, now(), now())

insert into transaction (userid, product_id, product_type_id, quantity, created_at, updated_at)
values (1, 3, 2, 3, now(), now())

insert into transaction (userid, product_id, product_type_id, quantity, created_at, updated_at)
values (1, 6, 3, 2, now(), now())

insert into transaction (userid, product_id, product_type_id, quantity, created_at, updated_at)
values (1, 8, 3, 3, now(), now())

insert into transaction (userid, product_id, product_type_id, quantity, created_at, updated_at)
values (2, 3, 2, 2, now(), now())

insert into transaction (userid, product_id, product_type_id, quantity, created_at, updated_at)
values (2, 4, 2, 5, now(), now())

insert into transaction (userid, product_id, product_type_id, quantity, created_at, updated_at)
values (2, 2, 1, 1, now(), now())

insert into transaction (userid, product_id, product_type_id, quantity, created_at, updated_at)
values (2, 3, 2, 2, now(), now())
 
insert into transaction (userid, product_id, product_type_id, quantity, created_at, updated_at)
values (4, 6, 3, 3, now(), now())

insert into transaction (userid, product_id, product_type_id, quantity, created_at, updated_at)
values (4, 3, 2, 5, now(), now())

insert into transaction (userid, product_id, product_type_id, quantity, created_at, updated_at)
values (4, 6, 3, 1, now(), now())

insert into transaction (userid, product_id, product_type_id, quantity, created_at, updated_at)
values (4, 1, 1, 2, now(), now())

insert into transaction (userid, product_id, product_type_id, quantity, created_at, updated_at)
values (6, 5, 2, 2, now(), now())

insert into transaction (userid, product_id, product_type_id, quantity, created_at, updated_at)
values (6, 8, 3, 3, now(), now())

insert into transaction (userid, product_id, product_type_id, quantity, created_at, updated_at)
values (6, 6, 3, 1, now(), now())

insert into transaction (userid, product_id, product_type_id, quantity, created_at, updated_at)
values (6, 3, 2, 2, now(), now())

insert into transaction (userid, product_id, product_type_id, quantity, created_at, updated_at)
values (5, 3, 2, 4, now(), now())

--I--

insert into transaction 


----NO.2----

--A--
select nama
from users u 
where gender = 'Laki-Laki';

--B--
select nama_product
from products p 
where id = 3

--C--
select updated_at
from users u 
where nama like '%a'
and updated_at >= current_date - interval '7 days';

--D--
select count(id) from users u
where gender = 'Perempuan'

--E--
select nama
from users u
order by nama asc

--F--
select product_id
from transaction t
where product_id = 3
limit 5;


----NO.3----

--A--
update products 
set nama_product = 'product dummy'
where id=1;

--B--
update transaction_detail 


----NO.4----

--A--
delete from products 
where id = 1;

--B--
delete from products 
where product_type_id = 1


====RELEASE2=====

--NO.1--
select *
from transaction t 
where userid = 1

union

select *
from transaction t 
where userid = 2;

--NO.2--



--NO.3--
select sum(quantity) AS total_quantity
from transaction  
where product_type = 2;


--NO.4--
SELECT products.*, produk_type.name AS produk_type_name
FROM produk
JOIN produk_type ON produk.produk_type_id = produk_type.id;

select products, product_type.type_name from product_type pt 
inner join product_type on product_type.type_name =product_type.id;




		






