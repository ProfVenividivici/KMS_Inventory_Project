create database KMS_db

-----Altering Specific Columns on Tables----

alter table [dbo].[KMS Sql Case Study]
alter column sales decimal (10,2)

alter table [dbo].[KMS Sql Case Study]
alter column Discount decimal (10,2)

alter table [dbo].[KMS Sql Case Study]
alter column profit decimal (10,2)

select * from [dbo].[KMS Sql Case Study]

alter table [dbo].[KMS Sql Case Study]
alter column unit_price decimal (10,2)

alter table [dbo].[KMS Sql Case Study]
alter column shipping_cost decimal (10,2)

select * from [dbo].[KMS Sql Case Study]

---1. Which Product Category had the highest sales-
select top 1 product_category, sum(sales) as Highest_Sales
from [dbo].[KMS Sql Case Study]
group by product_category

---2. Top 3 Highest Regions in Terms of Sales---
select top 3 Region, sum (sales) as Top_3_Regions
from [dbo].[KMS Sql Case Study]
group by region
order by Top_3_Regions desc


---2. Top 3 Lowest Regions in Terms of Sales---
select top 3 Region, sum (sales) as Bottom_3_Regions
from [dbo].[KMS Sql Case Study]
group by region
order by Bottom_3_Regions asc

select * from [dbo].[KMS Sql Case Study]

---3. Total Sales of Apliances in Ontario---
select sum(sales) as [Total Appliance Sales in Ontario]
from [dbo].[KMS Sql Case Study]
where Product_Sub_Category = 'appliances' and region = 'ontario'


---4. Advice to Increase Revenue from Bottom 10---
Select top 10 customer_name, sum (sales)as [Lowest Customer Sales], sum (profit) as [Total Profit],
sum (shipping_cost) as [Total Shipping Cost], sum (Order_quantity) as [Total Quantity]
from [dbo].[KMS Sql Case Study]
group by customer_name
order by [Lowest Customer Sales] asc

---5. Shipping Method with most Shipping Cost---
select top 1 ship_mode, sum (shipping_cost) as [Most Shipping Cost]
from [dbo].[KMS Sql Case Study]
group by ship_mode
order by [Most Shipping Cost] desc

select * from [dbo].[KMS Sql Case Study]

---CASE SCENERIO 2--
---6. Most Valuable Customers and Preferred Products or Services---
select top 10 Customer_name, Product_sub_category,Product_name, sum (profit) as [Most Valuable Customers and Preferred Products]
from [dbo].[KMS Sql Case Study]
group by Customer_name, Product_sub_category,Product_name
order by [Most Valuable Customers and Preferred Products] desc

---7. Small Business Customer with Highest Sales---
select top 1 Customer_name, sum(sales) as [Small Business Customer with Highest Sales]
from [dbo].[KMS Sql Case Study]
where customer_segment = 'Small Business'
group by Customer_name
order by [Small Business Customer with Highest Sales] desc

-----8. Most Order By Corporate Customer (2009-2012)---
select top 1 customer_name, customer_segment, count (order_quantity) as [Most Order By Corporate Customer]
from [dbo].[KMS Sql Case Study]
where customer_segment = 'corporate' and order_date >= '2009-01-01' and order_date <= '2012-12-31'
group by customer_name, customer_segment
order by [Most Order By Corporate Customer] desc

select * from [dbo].[KMS Sql Case Study]

----9. Most Profitable Consumer Customer----
select top 1 Customer_name, sum(profit) as [Most Profitable Consumer Customer]
from [dbo].[KMS Sql Case Study]
where customer_segment = 'consumer'
group by Customer_name
order by [Most Profitable Consumer Customer] desc

-------------------------------------------------------
select * from [dbo].[KMS Sql Case Study]
select * from [dbo].[Order_Status]


---Join Tables---
Create view [KMS Table View]
AS
SELECT [dbo].[KMS Sql Case Study].Order_ID,
[dbo].[KMS Sql Case Study].Sales,
 [dbo].[KMS Sql Case Study].Customer_Name,
[dbo].[KMS Sql Case Study].Customer_Segment,
[dbo].[Order_Status].[Status]
FROM [dbo].[KMS Sql Case Study]
FULL OUTER JOIN[dbo].[Order_Status]
ON [dbo].[Order_Status].Order_ID = [dbo].[KMS Sql Case Study].Order_ID

select * from [dbo].[KMS Table View]

----10. Customer with Retuned items and Segment---
select top 1 Customer_name, count(customer_segment) as [Customer With Returned Items],
from [KMS Table View],
where 'Status' = 'Returned'
group by Customer_name
order by [Customer With Returned Items] desc


---11. Money Spent on Shipping Based on Order_Priority---
select  ship_mode,
order_priority,
COUNT(ORDER_ID) as [Order Count],
sum (Shipping_cost) as [Total Shipping Cost],
avg (Shipping_cost) as [Average shipping Cost]
From [dbo].[KMS Sql Case Study]
where Ship_mode in ('Express Air','Delivery Truck')
group by ship_mode, order_priority
order by ship_mode, order_priority

select * from [dbo].[Order_Status]
