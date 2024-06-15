create database Adventure;

use adventure_work;

#1.Union of Fact Internet sales and Fact internet sales new
create view Sales as (select *

from fact_internet_sales_new union all select * from factinternetsales);

select * from Sales;

#2.Lookup the productname from the Product sheet to Sales sheet.
select Sales.*,dp.EnglishProductName from Sales
inner join dimproduct as dp
on Sales.productkey=dp.productkey;

#3.Lookup the Customerfullname from the Customer and Unit Price from Product sheet to Sales sheet.

select concat(dc.FirstName,' ',LastName)as FullName,sum(SalesAmount) as TotalSales  from Sales
inner join dimcustomer as dc
on Sales.customerkey=dc.customerkey
group by FirstName,LastName;

#KPI'S

#Total Sales
select 
sum(SalesAmount) as Total_Sales
from Sales;

#Total Profit
select
sum(salesamount)-sum(totalproductcost) as Total_Profit
from Sales;

#Total Customer
select
count(customerkey)
from dimcustomer;

#Total Orders
select
count(Orderquantity)
from Sales;

#Total Product
select
count(productkey)
from dimproduct;





