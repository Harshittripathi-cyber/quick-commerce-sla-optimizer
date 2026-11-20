create table dark_stores(store_id varchar(60) primary key,city varchar(30) not null, zone varchar(30) not null,hub_tier varchar(60),monthly_rent_inr int(10));
create table customers(
    customer_id varchar(60) primary key,
    city varchar(30) not null,
    signup_date varchar(30),
    is_pass_member int
);
create table riders(
    rider_id varchar(60) primary key,
    store_id varchar(60),
    vehicle_type varchar(30),
    shift varchar(30),
    foreign key(store_id) references dark_stores(store_id)
);
create table inventory_stockouts(
    stockout_id varchar(60) primary key,
    store_id varchar(60),
    category varchar(50),
    stockout_date varchar(30),
    estimated_lost_orders int,
    foreign key(store_id) references dark_stores(store_id)
);
create table orders(
    order_id varchar(60) primary key,
    customer_id varchar(60),
    store_id varchar(60),
    rider_id varchar(60),
    order_timestamp varchar(40),
    delivery_minutes decimal(5,2),
    order_value_inr decimal(10,2),
    order_status varchar(30),
    weather varchar(30),
    customer_rating decimal(3,1),
    foreign key(customer_id) references customers(customer_id),
    foreign key(store_id) references dark_stores(store_id),
    foreign key(rider_id) references riders(rider_id)
);