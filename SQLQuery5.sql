select * from pizza_sales;

--TOTAL REVENUE
select ROUND(sum(total_price),2) as Total_revenue from pizza_sales;

--AVERAGE ORDER VALUE
SELECT round(sum(total_price)/count(distinct order_id),2) as average_order_value from pizza_sales;

--TOTAL PIZZA SOLD
select sum(quantity) as totsl_pizza_sold from pizza_sales;

--TOTAL ORDER PLACED
select count(distinct order_id) as total_order_placed from pizza_sales;

-- AVERAGE PIZZA PER ORDER
select cast(cast(sum(quantity) as decimal (10,2))/cast(count(distinct order_id) as decimal (10,2)) as decimal (10,2)) 
as average_pizza_per_order from pizza_sales;

--DAILY TRENDS OF ORDERS
select datename(dw,order_date) as order_day ,count(distinct order_id) as total_orders
from pizza_sales 
group by datename(dw,order_date);

--MONTHLY TREND FOR TOTAL ORDER
select datename(month, order_date) as months ,count(distinct order_id) as total_order
from pizza_sales
group by datename(month, order_date)
order by total_order desc;

--PERCENTAGE OF SALES BY PIZZA CATEGORY
select pizza_category, cast(sum(total_price) as decimal (10,2)) as total_sales , cast(sum(total_price)*100/(select sum(total_price) from pizza_sales) as decimal (10,2)) as percentage_
from pizza_sales
group by pizza_category;

--PERCENTAGE OF SALES BY PIZZA SIZE
SELECT pizza_size , cast(sum (total_price) as decimal (10,2)) as total_sales, cast(sum(total_price)*100/(select sum(total_price) from pizza_sales) as decimal (10,2)) as total_sales_pst
from pizza_sales
group by pizza_size;

--TOP 5 PIZZA BY REVENUE
select top 5 pizza_name, sum(total_price) as total_revenue from pizza_sales
group by pizza_name
order by total_revenue desc

-- BOTTOM 5 PIZZA BY REVENUE
select top 5 pizza_name, sum(total_price) as total_revenue from pizza_sales
group by pizza_name
order by total_revenue

--TOP 5 PIZZA BY QUANTITY
select top 5 pizza_name, sum(quantity) as total_quantity from pizza_sales
group by pizza_name
order by total_quantity desc

--BOTTOM 5 PIZZA BY QUANTITY
select top 5 pizza_name, sum(quantity) as total_quantity from pizza_sales
group by pizza_name
order by total_quantity 

--TOP 5 PIZZA BY ORDER
select top 5 pizza_name, sum(DISTINCT order_id) as total_orders from pizza_sales
group by pizza_name
order by total_orders desc

--BOTTOM 5 PIZZA BY ORDER
select top 5 pizza_name, sum(distinct order_id) as total_orders from pizza_sales
group by pizza_name
order by total_orders 