***Retail sales analysis SQL projects***
**Objectives**
1.set up :creating and populate a retail sales database.  
2.Data cleaning : identify and remove any record with missing or null values.  
3.Business analysis : use SQL to answer specific business and derive insights from the sales data.  

***Data cleaning***  
**select null values**  
```sql
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
```  
**Deleting null values**  
```sql
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
```

***business questions***  
1.**how many sales we have ?**  
```sql  
 select count(*)
from dbo.shop_data;
```
2.**how many customer we have ?**  
```sql
select count(distinct customer_id)
from dbo.shop_data;
```  
3.**how many chategoty we have ?**  
```sql
select count(distinct category) 
from dbo.shop_data;
```  
4.**write a sql query to retrieve colunm sales made on'2022-11-05 ?**  
```sql
select * from dbo.shop_data
where sale_date='2022-11-05';
```  
5.**write a sql query to calculate the total sales  for each catagory ?**  
```sql
select
sum(total_sale)  as total_sale_amount ,
count(transactions_id ) as no_of_sales ,
category from dbo.shop_data
group by category;
exec s_all;
```  
6.**write a sql query to fine the average age of customer who purchase in category 'beauty' ?**  
```sql
select avg(age) as average_age 
from dbo.shop_data 
where category='Beauty';
```  
7.**write a sql query to fine all the transaction where the toal sales greater then 1000 ?**  
```sql
select * from dbo.shop_data  where total_sale>1000 ; 
```  
8.**write a sql query to fine the total no.of transaction in each category in each gender ?**  
```sql
select  category,
	gender,
	count(*)as total_t
	from dbo.shop_data 
	group by category,gender 
	order by 1;
```  
9.**write the sql query to find the best customer based on the highest total sale ?**  
```sql
elect 
customer_id,
sum(total_sale) as s_total_sales
from dbo.shop_data group by customer_id 
order by s_total_sales desc
offset 0 rows fetch next 5 rows only;
```  
10.**write sql query to find the no.of unique customer who purchase item in each category ?**  
```sql
select category,
count(distinct customer_id) as Unique_id
from dbo.shop_data
group by category;
```  
11.**write a sql query to create a shift(eg :morning,afternoon,evening) ?**  
```sql
select *,
case
when datepart(hour,sale_time) <=12 then 'morning'
when datepart(hour,sale_time) between 12 and 17 then 'afternoon'
else 'evening'
end as shift
from dbo.shop_data;
```  





