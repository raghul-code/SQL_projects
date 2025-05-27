use retail_shop

--storde procedures
create procedure select_all
as
select * from dbo.shop_data
go;

--select null value(data cleaning)
select * from dbo.shop_data
where
transactions_id is null
or sale_date is null
or sale_time is null
or customer_id is null
or gender is null
or age is null
or category is null
or quantiy is null
or price_per_unit is null
or cogs is null
or total_sale is null;
--delete null value
delete  from dbo.shop_data
where
transactions_id is null
or sale_date is null
or sale_time is null
or customer_id is null
or gender is null
or age is null
or category is null
or quantiy is null
or price_per_unit is null
or cogs is null
or total_sale is null;


-- how many sales we have ?
select count(*)
from dbo.shop_data;

--how many customer we have ?
select count(distinct customer_id)
from dbo.shop_data;

--how many chategoty we have ?
select count(distinct category) 
from dbo.shop_data;

--write a sql query to retrieve colunm sales made on'2022-11-05 ?
select * from dbo.shop_data
where sale_date='2022-11-05';

--write a sql query to calculate the total sales  for each catagory ?
select
sum(total_sale)  as total_sale_amount ,
count(transactions_id ) as no_of_sales ,
category from dbo.shop_data
group by category;
exec s_all;

--write a sql query to fine the average age of customer who purchase in category 'beauty' ?
select avg(age) as average_age 
from dbo.shop_data 
where category='Beauty';

--write a sql query to fine all the transaction where the toal sales greater then 1000 ?
select * from dbo.shop_data  where total_sale>1000 ; 

--write a sql query to fine the total no.of transaction in each category in each gender ?
	select  category,
	gender,
	count(*)as total_t
	from dbo.shop_data 
	group by category,gender 
	order by 1;

--write the sql query to find the best customer based on the highest total sale ?
select 
customer_id,
sum(total_sale) as s_total_sales
from dbo.shop_data group by customer_id 
order by s_total_sales desc
offset 0 rows fetch next 5 rows only;

--write sql query to find the no.of unique customer who purchase item in each category ?
select category,
count(distinct customer_id) as Unique_id
from dbo.shop_data
group by category;

--write a sql query to create a shift(eg :morning,afternoon,evening) ?
select *,
case
when datepart(hour,sale_time) <=12 then 'morning'
when datepart(hour,sale_time) between 12 and 17 then 'afternoon'
else 'evening'
end as shift
from dbo.shop_data;