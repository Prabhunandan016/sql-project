-- sql retail sales analysis - p1
create database sql_project_p2;

-- create table
drop table if exists retail_sales;
create table retail_sales
(
    transaction_id int primary key,	
    sale_date date,	 
    sale_time time,	
    customer_id int,
    gender varchar(15),
    age int,
    category varchar(15),	
    quantity int,
    price_per_unit float,	
    cogs float,
    total_sale float
);

select * from retail_sales
limit 10;

select 
    count(*) 
from retail_sales;

-- data cleaning
select * from retail_sales
where transactions_id is null;

select * from retail_sales
where sale_date is null;

select * from retail_sales
where sale_time is null;

select * from retail_sales
where 
    transaction_id is null
    or
    sale_date is null
    or 
    sale_time is null
    or
    gender is null
    or
    category is null
    or
    quantity is null
    or
    cogs is null
    or
    total_sale is null;

delete from retail_sales
where 
    transaction_id is null
    or
    sale_date is null
    or 
    sale_time is null
    or
    gender is null
    or
    category is null
    or
    quantity is null
    or
    cogs is null
    or
    total_sale is null;

-- data exploration

-- how many sales we have?
select count(*) as total_sale from retail_sales;

-- how many unique customers we have?
select count(distinct customer_id) as total_sale from retail_sales;

select distinct category from retail_sales;

-- data analysis & business key problems & answers

-- my analysis & findings
-- q.1 write a sql query to retrieve all columns for sales made on '2022-11-05'
-- q.2 write a sql query to retrieve all transactions where the category is 'clothing' and the quantity sold is more than 10 in the month of nov-2022
-- q.3 write a sql query to calculate the total sales (total_sale) for each category
-- q.4 write a sql query to find the average age of customers who purchased items from the 'beauty' category
-- q.5 write a sql query to find all transactions where the total_sale is greater than 1000
-- q.6 write a sql query to find the total number of transactions (transaction_id) made by each gender in each category
-- q.7 write a sql query to calculate the average sale for each month. find out best selling month in each year
-- q.8 write a sql query to find the top 5 customers based on the highest total sales 
-- q.9 write a sql query to find the number of unique customers who purchased items from each category
-- q.10 write a sql query to create each shift and number of orders (example morning <=12, afternoon between 12 & 17, evening >17)

-- q.1
select *
from retail_sales
where sale_date = '2022-11-05';

-- q.2
select 
  *
from retail_sales
where 
    category = 'Clothing'
    and 
    to_char(sale_date, 'yyyy-mm') = '2022-11'
    and
    quantity >= 4;

-- q.3
select 
    category,
    sum(total_sale) as net_sale,
    count(*) as total_orders
from retail_sales
group by 1;

-- q.4
select
    round(avg(age), 2) as avg_age
from retail_sales
where category = 'Beauty';

-- q.5
select * from retail_sales
where total_sale > 1000;

-- q.6
select 
    category,
    gender,
    count(*) as total_trans
from retail_sales
group 
    by 
    category,
    gender
order by 1;

-- q.7
select 
       year,
       month,
       avg_sale
from 
(    
select 
    extract(year from sale_date) as year,
    extract(month from sale_date) as month,
    avg(total_sale) as avg_sale,
    rank() over(partition by extract(year from sale_date) order by avg(total_sale) desc) as rank
from retail_sales
group by 1, 2
) as t1
where rank = 1;

-- q.8
select 
    customer_id,
    sum(total_sale) as total_sales
from retail_sales
group by 1
order by 2 desc
limit 5;

-- q.9
select 
    category,    
    count(distinct customer_id) as cnt_unique_cs
from retail_sales
group by category;

-- q.10
with hourly_sale as
(
select *,
    case
        when extract(hour from sale_time) < 12 then 'Morning'
        when extract(hour from sale_time) between 12 and 17 then 'Afternoon'
        else 'Evening'
    end as shift
from retail_sales
)
select 
    shift,
    count(*) as total_orders    
from hourly_sale
group by shift;

-- end of project
