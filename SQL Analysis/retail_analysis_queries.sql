SELECT * 
FROM sale_data
LIMIT 10;

SELECT 
SUM(Sales) AS Total_Sales,
SUM(Profit) AS Total_Profit,
SUM(Quantity) AS Total_Quantity
FROM sale_data;

select region , sum(sales)
from sale_data
group by region
order by  sum(sales) desc
;

select Category, sum(profit)
from sale_data
group by Category
;

select "Sub-Category" , sum(sales), sum(profit)
from	sale_data
group by 'Sub-Category' 
ORDER BY sum(profit) DESC;

SELECT 
`Sub-Category`,
SUM(Sales) AS Total_Sales,
SUM(Profit) AS Total_Profit
FROM sale_data
GROUP BY `Sub-Category`
ORDER BY Total_Profit DESC;

Select discount, sum(profit), count(Discount)
from sale_data
group by Discount
order by Discount desc
;

select
round(sum(profit) / Sum(sales),2)*100  as Profit_margin
from sale_data
;

select (sub-category)
from sale_data;

SELECT 
'Sub-Category',
SUM(Profit) AS Total_Profit
FROM sales_data
GROUP BY 'Sub-Category'
ORDER BY Total_Profit DESC
LIMIT 10;

select region, round(sum(profit),2) as Total_profit, round(sum(profit) / Sum(sales),2)*100  as Profit_margin
from sale_data
group by Region
order by Total_profit desc ;

SELECT 
Region,
SUM(Sales) AS Total_Sales,
SUM(Profit) AS Total_Profit,
ROUND((SUM(Profit)/SUM(Sales))*100,2) AS Profit_Margin
FROM sale_data
GROUP BY Region
ORDER BY Profit_Margin DESC;


select region, `sub-category`, round(sum(Sales),2) as Total_sale
from sale_data
group by Region, `sub-category`
order by  region, Total_sale desc
;

select `sub-category`, round(sum(profit),2) as 	 profit
from sale_data
group by `sub-category`
having profit < 0
order by Profit asc;

select `sub-category`,
 Round(sum(Sales),2) as Total_sale, 
 round(sum(Profit),2) as Total_profit
from sale_data
group by `Sub-Category`
order by  total_profit asc ,  Total_sale desc;

SELECT 
`Sub-Category`,
SUM(Sales) AS Total_Sales,
SUM(Profit) AS Total_Profit,
ROUND((SUM(Profit)/SUM(Sales))*100,2) AS Profit_Margin
FROM sale_data
GROUP BY `Sub-Category`
ORDER BY Profit_Margin;


SELECT 
`Sub-Category`,
SUM(Sales) AS Total_Sales, RANK() OVER (ORDER BY SUM(Sales) DESC) AS Sales_Rank
FROM sale_data
GROUP BY `Sub-Category`;



SELECT 
Region,
`Sub-Category`,
SUM(Sales) AS Sales,
SUM(SUM(Sales)) OVER (ORDER BY SUM(Sales) DESC) AS Running_Total
FROM sale_data
GROUP BY Region, `Sub-Category`;

SELECT *
FROM (
SELECT 
Region,
`Sub-Category`,
SUM(Sales) AS Total_Sales,
RANK() OVER(PARTITION BY Region ORDER BY SUM(Sales) DESC) AS Rank_in_Region
FROM sale_data
GROUP BY Region, `Sub-Category`
) ranked_data
WHERE Rank_in_Region = 1;

