--Total revenue:
SELECT 
	SUM(total_price) 
AS 
	Total_Revenue FROM pizza_sales_converted;

--Total orders:
SELECT 
	COUNT(DISTINCT(order_id)) 
AS 
	Total_Orders 
FROM 
	pizza_sales_converted;

--Total pizzas sold:
SELECT 
	SUM(quantity) 
AS 
	Total_pizza_sold 
FROM 
	pizza_sales_converted;

--Average order value:
SELECT 
	(SUM(total_price) / COUNT(DISTINCT order_id)) 
AS 
	Avg_order_Value 
FROM 
	pizza_sales_converted;

--Average Pizzas per order:
SELECT 
	ROUND(CAST(SUM(quantity) AS FLOAT) / CAST(COUNT(DISTINCT order_id) AS FLOAT),2)
AS 
	Avg_Pizzas_per_order
FROM 
	pizza_sales_converted;

--Total Orders by month:
SELECT 
	DATENAME(MM, order_date) AS order_month,
	COUNT(DISTINCT(order_id)) AS total_orders
FROM 
	pizza_sales_converted
GROUP BY 
	DATENAME(MM, order_date)
ORDER BY 
	total_orders DESC

--Revenue of Orders by month:
SELECT 
	DATENAME(MM, order_date) AS order_month,
	ROUND(SUM(total_price),2) AS Total_Revenue
FROM 
	pizza_sales_converted
GROUP BY 
	DATENAME(MM, order_date)
ORDER BY 
	Total_Revenue DESC

--Total Pizza orders per Weekday:
SELECT 
	DATENAME(W, order_date) AS order_day,
COUNT(DISTINCT(order_id)) AS total_orders
FROM 
	pizza_sales_converted
GROUP BY 
	DATENAME(W, order_date)
ORDER BY 
	total_orders DESC;

--Total Pizza orders per Hour:
SELECT 
	DATENAME(hh, order_time) AS order_time,
COUNT(DISTINCT(order_id)) AS total_orders
FROM 
	pizza_sales_converted
GROUP BY 
	DATENAME(hh, order_time)
ORDER BY 
	total_orders DESC;

--Total Orders per pizza category:
SELECT 
	pizza_category AS category,
	COUNT(DISTINCT(order_id)) AS total_orders
FROM 
	pizza_sales_converted
GROUP BY 
	pizza_category
ORDER BY 
	total_orders DESC

--Quantity of pizzas sold per category:
SELECT 
	pizza_category AS Category,
	SUM(quantity) AS Total_quantity_sold
FROM 
	pizza_sales_converted
GROUP BY 
	pizza_category
ORDER BY 
	Total_quantity_sold DESC

--Pizza popularity by size:
SELECT
	pizza_size AS Pizza_Size,
	COUNT(quantity) AS Quantity
FROM
	pizza_sales_converted
GROUP BY
	Pizza_Size
ORDER BY 
	Quantity DESC

--Pizza popularity by Revenue
SELECT 
	pizza_category, 
	CAST(SUM(total_price) AS DECIMAL(10,2)) as Total_Revenue,
	CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) from pizza_sales_converted) AS DECIMAL(10,2)) AS Percentage
FROM 
	pizza_sales_converted
GROUP BY 
	pizza_category

--Top 5 Pizzas by Revenue
SELECT 
	Top 5 
	pizza_name, 
	SUM(total_price) AS Total_Revenue
FROM 
	pizza_sales_converted
GROUP BY 
	pizza_name
ORDER BY 
	Total_Revenue DESC

--Bottom 5 Pizzas by Revenue
SELECT 
	Top 5 
	pizza_name, 
	ROUND(SUM(total_price),2) AS Total_Revenue
FROM 
	pizza_sales_converted
GROUP BY 
	pizza_name
ORDER BY 
	Total_Revenue ASC
	
--Top 5 Pizzas by Quantity
SELECT 
	Top 5 
	pizza_name, 
	SUM(quantity) AS Quantity
FROM 
	pizza_sales_converted
GROUP BY 
	pizza_name
ORDER BY 
	Quantity DESC

--Bottom 5 Pizzas by Quantity
SELECT 
	Top 5 
	pizza_name, 
	SUM(quantity) AS Quantity
FROM 
	pizza_sales_converted
GROUP BY 
	pizza_name
ORDER BY 
	Quantity ASC

--Top 5 Pizzas by Total Orders
SELECT 
	Top 5 
	pizza_name, 
	SUM(DISTINCT(order_id)) AS Total_orders
FROM 
	pizza_sales_converted
GROUP BY 
	pizza_name
ORDER BY 
	Total_orders DESC

--Bottom 5 Pizzas by Total Orders
SELECT 
	Top 5 
	pizza_name, 
	SUM(DISTINCT(order_id)) AS Total_orders
FROM 
	pizza_sales_converted
GROUP BY 
	pizza_name
ORDER BY 
	Total_orders ASC