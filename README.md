# KMS_Inventory_Project
This repository documents the process and steps take on build the DSA Captone project on SQL, Kultra Mega Stores (KMS) Inventory.

### Project Topic: Kultra Mega Stores (KMS) Inventory

### Project Overview
This data analysis project aims analyzing the given data and presentation of key insights and Findings on KMS Abuja Division Sales Inventory.

### Data Sources
The primary source of Data used is KMS Abuja Division Database (main) and Order Status. This is a data that can be easily sourced from an open source online from Kaggle among others.
 
### Tools Used

-  My SQL (Structured Query Language)[Download Here](https://www.mysql.com/downloads/)
  - For Data Storage and Data Sourcing
  - For Data Querying 
   - For Data Cleaning and Filtering

### Data Loading and Set-up
At the preliminary stage of this, I performed Data Loading and Set-up. These include: 
-	Creation of a database called KMS_db
-	Loading of KMS SQL Case Study as a flat file to the database.
-	Setting up of the database using Order_id as primary key.
-	Altering of monetary data type from float to Discount decimal (10,2).

``` SQL

alter table [dbo].[KMS Sql Case Study]
alter column sales decimal (10,2)

```

<img src="KMS Inventory Database.png" />

-	Columns that were modified include: Sales, Discount, Unit Price, Discount, Profit, and Shipping Cost.

### Questions KPI
1. Which product category had the highest sales? 
2. What are the Top 3 and Bottom 3 regions in terms of sales? 
3. What were the total sales of appliances in Ontario? 
4. Advise the management of KMS on what to do to increase the revenue from the bottom 
10 customers 
5. KMS incurred the most shipping cost using which shipping method?Case Scenario II 
6. Who are the most valuable customers, and what products or services do they typically 
purchase? 
7. Which small business customer had the highest sales? 
8. Which Corporate Customer placed the most number of orders in 2009 – 2012? 
9. Which consumer customer was the most profitable one? 
10. Which customer returned items, and what segment do they belong to? 
11. If the delivery truck is the most economical but the slowest shipping method and 
Express Air is the fastest but the most expensive one, do you think the company 
appropriately spent shipping costs based on the Order Priority? Explain your answer

## Querying Syntax

This involves x-raying the analytic questions and providing answers to the questions such as:

Call the table by inserting this syntax:

```SQL

select * from [dbo].[KMS Sql Case Study]

```

### 1. Which Product Category had the highest sales?

Insert this syntax and Execute afterwards:

```SQL

select top 1 product_category, sum(sales) as Highest_Sales
from [dbo].[KMS Sql Case Study]
group by product_category

```

Then, execute by calling the table:

```SQL

select * from [dbo].[KMS Sql Case Study]

```

<img src="Product Category With Highest Sales.png" />


### 2. Top 3 Highest Regions in Terms of Sales

Insert this syntax and Execute afterwards:

```SQL

select top 3 Region, sum (sales) as Top_3_Regions
from [dbo].[KMS Sql Case Study]
group by region
order by Top_3_Regions desc

```

Then, execute by calling the table:

```SQL

select * from [dbo].[KMS Sql Case Study]

```

<img src="Top 3 Region.png" />


### 2. Top 3 Lowest Regions in Terms of Sales

Insert this syntax and Execute afterwards:

```SQL

select top 3 Region, sum (sales) as Bottom_3_Regions
from [dbo].[KMS Sql Case Study]
group by region
order by Bottom_3_Regions asc

```

Then, execute by calling the table:

```SQL

select * from [dbo].[KMS Sql Case Study]

```

<img src="Bottom 3 Region.png" />


### 3. Total Sales of Appliances in Ontario

Insert this syntax and Execute afterwards:

```SQL

select sum(sales) as [Total Appliance Sales in Ontario]
from [dbo].[KMS Sql Case Study]
where Product_Sub_Category = 'appliances' and region = 'ontario'

```

Then, execute by calling the table:

```SQL

select * from [dbo].[KMS Sql Case Study]

```

<img src="Total Sales at Ontario.png" />


### 4. Advice to Increase Revenue from Bottom 10

Insert this syntax and Execute afterwards:

```SQL

Select top 10 customer_name, sum (sales)as [Lowest Customer Sales], sum (profit) as [Total Profit],
sum (shipping_cost) as [Total Shipping Cost], sum (Order_quantity) as [Total Quantity]
from [dbo].[KMS Sql Case Study]
group by customer_name
order by [Lowest Customer Sales] asc

```

Then, execute by calling the table:

```SQL

select * from [dbo].[KMS Sql Case Study]

```

<img src="Increase of Revenue Advice.png" />

#### Advice to Increase Revenue.
-
-
-

### 5. Shipping Method with most Shipping Cost

Insert this syntax and Execute afterwards:

```SQL

select top 1 ship_mode, sum (shipping_cost) as [Most Shipping Cost]
from [dbo].[KMS Sql Case Study]
group by ship_mode
order by [Most Shipping Cost] desc

```

Then, execute by calling the table:

```SQL

select * from [dbo].[KMS Sql Case Study]

```

<img src="Incurred Shipping Method.png" />


## CASE SCENERIO 2

### 6. Most Valuable Customers and Preferred Products or Services

Insert this syntax and Execute afterwards:

```SQL

select top 10 Customer_name, Product_sub_category,Product_name, sum (profit) as [Most Valuable Customers and Preferred Products]
from [dbo].[KMS Sql Case Study]
group by Customer_name, Product_sub_category,Product_name
order by [Most Valuable Customers and Preferred Products] desc

```

Then, execute by calling the table:

```SQL

select * from [dbo].[KMS Sql Case Study]

```

<img src="Most Valuable Customers.png" />


### 7. Small Business Customer with Highest Sales

Insert this syntax and Execute afterwards:

```SQL

select top 1 Customer_name, sum(sales) as [Small Business Customer with Highest Sales]
from [dbo].[KMS Sql Case Study]
where customer_segment = 'Small Business'
group by Customer_name
order by [Small Business Customer with Highest Sales] desc

```

Then, execute by calling the table:

```SQL

select * from [dbo].[KMS Sql Case Study]

```

<img src="Small Business Customer.png" />


### 8. Most Order By Corporate Customer (2009-2012)

Insert this syntax and Execute afterwards:

```SQL

select top 1 customer_name, customer_segment, count (order_quantity) as [Most Order By Corporate Customer]
from [dbo].[KMS Sql Case Study]
where customer_segment = 'corporate' and order_date >= '2009-01-01' and order_date <= '2012-12-31'
group by customer_name, customer_segment
order by [Most Order By Corporate Customer] desc

```

Then, execute by calling the table:

```SQL

select * from [dbo].[KMS Sql Case Study]

```

<img src="Most Order By Corporate Customer.png" />


### 9. Most Profitable Consumer Customer

Insert this syntax and Execute afterwards:

```SQL

select top 1 Customer_name, sum(profit) as [Most Profitable Consumer Customer]
from [dbo].[KMS Sql Case Study]
where customer_segment = 'consumer'
group by Customer_name
order by [Most Profitable Consumer Customer] desc

```

Then, execute by calling the table:

```SQL

select * from [dbo].[KMS Sql Case Study]

```

<img src="Profitable Consumer Customer.png" />

-------------------------------------------------------



### 10. Customer with Retuned items and Segment

- Call each of the table to study it for use.

```SQL

select * from [dbo].[KMS Sql Case Study]
select * from [dbo].[Order_Status]

```

-	Then, join table KMS SQL and table Order status together using this syntax:

```SQL

select *
from [dbo].[KMS Sql Case Study]
full outer join [dbo].[Order_Status] on [dbo].[KMS Sql Case Study].order_id =
[dbo].[Order_Status].order_id

```

<img src="Joined Tables.png" />


Afterwards, insert this syntax and Execute afterwards

```SQL

select distinct Customer_Name
from Order_Status
where 'Status' = 'Returned'

```

Then, execute by calling the table:

```SQL

select * from [dbo].[KMS Sql Case Study]

```


### 11. Money Spent on Shipping Based on Order_Priority

Insert this syntax and Execute afterwards:

```SQL 

select  ship_mode,
order_priority,
COUNT(ORDER_ID) as [Order Count],
sum (Shipping_cost) as [Total Shipping Cost],
avg (Shipping_cost) as [Average shipping Cost]
From [dbo].[KMS Sql Case Study]
where Ship_mode in ('Express Air','Delivery Truck')
group by ship_mode, order_priority
order by ship_mode, order_priority

```

Then, execute by calling the table:

```SQL

select * from [dbo].[Order_Status]

```

<img src="Opinion on Shipping Cost.png" />


#### Explanation

The company didn't spend shipping cost based in order priority. This is because irrespective of the priority placed on the product, delivery truck was used the more. This is because products are urgently demanded for by the customers, and economical for both customers and the company as shown in the value it returned in the query.
