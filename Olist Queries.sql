--Review of data in each table

--This has cust id, city, state
select *
from dbo.olist_customers_dataset


--This has order id, product id, seller, price
select *
from dbo.olist_order_items_dataset


--This has order id, pay type, installments, payment value (payments in Brazilian Real)
select *
from dbo.olist_order_payments_dataset


--Review id, order id, score, dates
select *
from dbo.olist_order_reviews_dataset


--Order id, customer id, status
select *
from dbo.olist_orders_dataset


--Product id, category, product dimensions
select *
from dbo.olist_products_dataset


--Seller id, seller zip, city
select *
from dbo.olist_sellers_dataset

--Product category translations Portuguese to English
select *
from dbo.product_category_name_translation



--Count the number of orders received on Olist

select count(order_id) AS total_orders_received
from dbo.olist_orders_dataset



--How many unique sellers are on Olist?

select COUNT(distinct seller_id) AS number_of_vendors_on_olist
from dbo.olist_order_items_dataset



--How many unique products are available for purchase?

select COUNT(distinct product_id) AS unique_products_available
from dbo.olist_order_items_dataset


--What are the 10 most popular products on Olist?
select product_id, count(*) AS times_ordered
from dbo.olist_order_items_dataset 
group by product_id
order by times_ordered DESC
offset 0 rows fetch first 10 rows only


--That data didn't include product categories, find that with product categories
select a.product_id, 
b.product_category_name,
count(*) AS times_ordered 
from dbo.olist_order_items_dataset a
join dbo.olist_products_dataset b
on a.product_id = b.product_id
group by a.product_id, b.product_category_name
order by times_ordered DESC






--What are the 5 most expensive items available?

select a.product_id, 
b.product_category_name, 
a.price  
from dbo.olist_order_items_dataset a
join dbo.olist_products_dataset b
on a.product_id = b.product_id
--join dbo.product_category_name_translation c
--on c.english_category_name = b.product_category_name
order by price desc
offset 0 rows fetch first 5 rows only




select s.order_id, s.order_status, o.price
from dbo.olist_orders_dataset AS s
left join dbo.olist_order_items_dataset AS o
on s.order_id = o.order_id
where s.order_status <> 'delivered'




--Total order value of orders that haven't been delivered

select ROUND(SUM(o.price),2) AS total_cost_not_delivered
from dbo.olist_orders_dataset AS s
left join dbo.olist_order_items_dataset AS o
on s.order_id = o.order_id
where s.order_status <> 'delivered'




--Total value of orders:
select order_id, payment_installments * payment_value AS total_price
from dbo.olist_order_payments_dataset
order by total_price DESC




select a.customer_city, 
round((c.payment_installments * c.payment_value),2) AS total_price, 
b.order_status 
from dbo.olist_customers_dataset a
join dbo.olist_orders_dataset b
on a.customer_id = b.customer_id
join dbo.olist_order_payments_dataset c
on b.order_id = c.order_id
where b.order_status in ('canceled')
order by total_price DESC



select a.customer_city, 
b.order_status 
from dbo.olist_customers_dataset a
join dbo.olist_orders_dataset b
on a.customer_id = b.customer_id
where b.order_status in ('canceled')



