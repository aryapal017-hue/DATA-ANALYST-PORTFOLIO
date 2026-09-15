create database project;
use project;

create table customers
(customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    city VARCHAR(100),
    signup_date DATE);
    
    select * from customers;
    
    create table products
    (product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(100));
    
    select * from products;
    
    create table orders
    (  order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    status VARCHAR(20),
    total_amount DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id));
    
   select * from orders;
   
   create table order_items
   (   order_item_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    unit_price DECIMAL(10,2),
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id));
    
select * from order_items;
    
insert into customers values
(1, 'Aarav Sharma', 'Delhi', '2025-01-05'),
(2, 'Priya Patel', 'Mumbai', '2025-01-12'),
(3, 'Rahul Verma', 'Bengaluru', '2025-02-01'),
(4, 'Sneha Gupta', 'Delhi', '2025-02-10'),
(5, 'Vikram Singh', 'Pune', '2025-02-18'),
(6, 'Ananya Iyer', 'Chennai', '2025-03-02'),
(7, 'Karan Mehta', 'Mumbai', '2025-03-14'),
(8, 'Neha Kapoor', 'Delhi', '2025-03-20'),
(9, 'Rohan Das', 'Kolkata', '2025-04-04'),
(10, 'Isha Nair', 'Bengaluru', '2025-04-15'),
(11, 'Manish Kumar', 'Pune', '2025-05-01'),
(12, 'Zoya Khan', 'Hyderabad', '2025-05-10');

insert into products values
(101, 'Wireless Mouse', 'Electronics'),
(102, 'Keyboard', 'Electronics'),
(103, 'Laptop Stand', 'Electronics'),
(104, 'Notebook Pack', 'Stationery'),
(105, 'Water Bottle', 'Home'),
(106, 'Desk Lamp', 'Home'),
(107, 'USB Cable', 'Electronics'),
(108, 'Office Chair', 'Furniture'),
(109, 'Pen Set', 'Stationery'),
(110, 'Monitor', 'Electronics'),
(111, 'Whiteboard', 'Office');

insert into orders values
(1001, 1, '2025-01-10', 'Completed', 1200.00),
(1002, 2, '2025-01-18', 'Completed', 850.00),
(1003, 1, '2025-02-02', 'Completed', 2200.00),
(1004, 3, '2025-02-08', 'Cancelled', 1500.00),
(1005, 4, '2025-02-15', 'Completed', 650.00),
(1006, 2, '2025-03-01', 'Completed', 1800.00),
(1007, 5, '2025-03-05', 'Returned', 900.00),
(1008, 1, '2025-03-12', 'Completed', 1450.00),
(1009, 6, '2025-03-16', 'Completed', 700.00),
(1010, 7, '2025-03-22', 'Cancelled', 1100.00),
(1011, 2, '2025-04-03', 'Completed', 3200.00),
(1012, 4, '2025-04-08', 'Completed', 950.00),
(1013, 8, '2025-04-14', 'Completed', 400.00),
(1014, 1, '2025-04-21', 'Completed', 2800.00),
(1015, 9, '2025-05-02', 'Completed', 1600.00),
(1016, 6, '2025-05-07', 'Completed', 1250.00),
(1017, 2, '2025-05-12', 'Completed', 600.00),
(1018, 10, '2025-05-18', 'Cancelled', 2000.00),
(1019, 4, '2025-06-01', 'Completed', 1750.00),
(1020, 1, '2025-06-05', 'Completed', 900.00),
(1021, 7, '2025-06-11', 'Completed', 1400.00),
(1022, 3, '2025-06-16', 'Completed', 2100.00);

insert into order_items values
(1, 1001, 101, 2, 500.00), (2, 1001, 107, 2, 100.00),
(3, 1002, 102, 1, 800.00), (4, 1002, 109, 1, 50.00),
(5, 1003, 103, 1, 1200.00), (6, 1003, 106, 2, 500.00),
(7, 1004, 101, 3, 500.00),
(8, 1005, 104, 5, 100.00), (9, 1005, 109, 3, 50.00),
(10, 1006, 102, 1, 800.00), (11, 1006, 103, 1, 1000.00),
(12, 1007, 105, 3, 300.00),
(13, 1008, 101, 1, 500.00), (14, 1008, 106, 1, 850.00),
(15, 1009, 104, 4, 100.00), (16, 1009, 105, 1, 300.00),
(17, 1010, 102, 1, 800.00), (18, 1010, 107, 3, 100.00),
(19, 1011, 110, 1, 2500.00), (20, 1011, 101, 1, 500.00),
(21, 1011, 107, 2, 100.00),
(22, 1012, 106, 1, 800.00), (23, 1012, 109, 3, 50.00),
(24, 1013, 104, 2, 100.00), (25, 1013, 105, 1, 200.00),
(26, 1014, 108, 1, 2800.00),
(27, 1015, 102, 1, 800.00), (28, 1015, 103, 1, 800.00),
(29, 1016, 106, 1, 850.00), (30, 1016, 104, 4, 100.00),
(31, 1017, 101, 1, 500.00), (32, 1017, 109, 2, 50.00),
(33, 1018, 110, 1, 2000.00),
(34, 1019, 108, 1, 1500.00), (35, 1019, 109, 5, 50.00),
(36, 1020, 101, 1, 500.00), (37, 1020, 107, 4, 100.00),
(38, 1021, 102, 1, 800.00), (39, 1021, 105, 2, 300.00),
(40, 1022, 110, 1, 1800.00), (41, 1022, 104, 3, 100.00);




select * from customers;

select customer_name,city,order_date,total_amount from customers,orders;

select sum(total_amount) revenue from orders where status="completed";

select
year(order_date) year,
month(order_date) month,
sum(total_amount) revenue
from orders
where status= "completed"
group by year(order_date),month(order_date)
order by revenue desc;

select
customer_id,
count(order_id) completed_orders
from orders
where status= "completed"
group by customer_id
order by completed_orders desc
limit 5;

select city,
count(customer_id) total_customers
from customers
group by city;

select * from customers
where customer_id not in(select customer_id from orders);


select * from products
where product_id not in(select product_id from order_items);

select product_id,
sum(quantity) total_quantity_sold
from order_items
group by product_id
order by total_quantity_sold desc
limit 5;


select sum(total_amount) total_sales_revenue,category	
from orders,products
group by category;

select customer_id,count(*) completed_orders
from orders
where status="completed"
group by customer_id
having count(*) >2;

select city,avg(total_amount) avg_completed_order_value
from orders,customers
where status="completed"
group by city;

select month(order_date) month,
count(order_id) tota_orders
from orders
group by month(order_date)
order by month;

select month(order_id) month,
count(order_id) completed_orders
from orders
where status="completed"
group by month
order by month;

select month(order_date) month,
count(order_id) cancelled_orders
from orders
where status="cancelled"
group by month;


select month(order_date) month,
count(order_id) returned_orders
from orders
where status="returned"
group by month;

select month(order_date) month,
sum(total_amount) completed_revenue from orders
where status="completed"
group by month
order by month desc;

select customer_id,
min(order_date) first_order_date
from orders
group by customer_id;

select customer_id,
min(order_date) first_completed_order
from orders
group by customer_id;


select customer_id,
max(order_date) latest_completed_order
from orders
where status="completed"
group by customer_id;

select customer_id,
count(total_amount) total_completed_sending
from orders
where status="completed"
group by customer_id;


select month(order_date) month,
max(total_amount) highest_completed_order
from orders
where status="completed"
group by month
order by month desc;


describe orders;


select 
month(order_date) month,
count(distinct customer_id) active_customer,
count(case when status="completed" then order_id end) completed_orders,
sum(case when status="completed" then total_amount else 0 end) total_revenue,
avg(case when status="completed" then total_amount end) average_order_value
from orders
group by month;
