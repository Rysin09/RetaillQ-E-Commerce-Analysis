

-- Performance Analysis

-- Average Sales For Each Year
With Yearly_product_sales as
(Select
Year(a.order_date) as Order_year, b.product_name, Sum(a.sales_amount) as Current_Sales
from
[gold].[fact_sales] a Left Join [gold].[dim_products] b
on a.product_key = b.product_key
where order_date is not null
Group By Year(a.order_date), b.product_name)
Select Order_year, product_name, Current_Sales,
AVG(Current_Sales) Over (Partition by product_name) as avg_sales
from Yearly_product_sales
Order By product_name, Order_year

-- Comparison with Average Sales
With Yearly_product_sales as
(Select
Year(a.order_date) as Order_year, b.product_name, Sum(a.sales_amount) as Current_Sales
from
[gold].[fact_sales] a Left Join [gold].[dim_products] b
on a.product_key = b.product_key
where order_date is not null
Group By Year(a.order_date), b.product_name)
Select Order_year, product_name, Current_Sales,
AVG(Current_Sales) Over (Partition by product_name) as avg_sales,
Current_sales - AVG(Current_Sales) Over (Partition by product_name) as Difference_avg,
CASE When Current_sales - AVG(Current_Sales) Over (Partition by product_name) > 0 Then 'Above Average'
	 When Current_sales - AVG(Current_Sales) Over (Partition by product_name) < 0 Then 'Below Average'
	 Else 'Average'
END avg_change
from Yearly_product_sales
Order By product_name, Order_year

/* ============================================================
   Yearly Product-wise Quantity Analysis
   - Calculates total quantity sold per product per year
   - Compares with product’s average quantity across years
   - Shows Above/Below Average status
   - Tracks Year-over-Year (YoY) quantity changes
   ============================================================ */

WITH Yearly_product_sales AS(
    SELECT YEAR(a.order_date) AS Order_year,
           b.product_name,
           SUM(a.sales_amount) AS Current_Sales
    FROM [gold].[fact_sales] a
    LEFT JOIN [gold].[dim_products] b ON a.product_key = b.product_key
    WHERE a.order_date IS NOT NULL
    GROUP BY YEAR(a.order_date), b.product_name
)
SELECT Order_year, product_name, Current_Sales,
       AVG(Current_Sales) OVER (PARTITION BY product_name) AS avg_sales,
       Current_Sales - AVG(Current_Sales) OVER (PARTITION BY product_name) AS Difference_avg,
       CASE WHEN Current_Sales - AVG(Current_Sales) OVER (PARTITION BY product_name) > 0 THEN 'Above Average'
            WHEN Current_Sales - AVG(Current_Sales) OVER (PARTITION BY product_name) < 0 THEN 'Below Average'
            ELSE 'Average' END AS avg_change,
       LAG(Current_Sales) OVER (PARTITION BY product_name ORDER BY Order_year) AS pre_year_sales,
       Current_Sales - LAG(Current_Sales) OVER (PARTITION BY product_name ORDER BY Order_year) AS Prev_year_diff,
       CASE WHEN Current_Sales - LAG(Current_Sales) OVER (PARTITION BY product_name ORDER BY Order_year) > 0 THEN 'Increased'
            WHEN Current_Sales - LAG(Current_Sales) OVER (PARTITION BY product_name ORDER BY Order_year) < 0 THEN 'Decreased'
            ELSE 'No Change' END AS py_change
FROM Yearly_product_sales
ORDER BY product_name, Order_year;


/* ============================================================
   Yearly Product-wise Customer Analysis
   - Calculates number of distinct customers per product per year
   - Compares with product’s average customers across years
   - Shows Above/Below Average status
   - Tracks Year-over-Year (YoY) customer changes
   ============================================================ */

WITH Yearly_product_sales AS(
    SELECT YEAR(a.order_date) AS Order_year,
           b.product_name,
           COUNT(DISTINCT a.customer_key) AS Total_customers
    FROM [gold].[fact_sales] a
    LEFT JOIN [gold].[dim_products] b ON a.product_key = b.product_key
    WHERE a.order_date IS NOT NULL
    GROUP BY YEAR(a.order_date), b.product_name
)
SELECT Order_year, product_name, Total_customers,
       AVG(Total_customers) OVER (PARTITION BY product_name) AS avg_Cust_Count,
       Total_customers - AVG(Total_customers) OVER (PARTITION BY product_name) AS Difference_avg,
       CASE WHEN Total_customers - AVG(Total_customers) OVER (PARTITION BY product_name) > 0 THEN 'Above Average'
            WHEN Total_customers - AVG(Total_customers) OVER (PARTITION BY product_name) < 0 THEN 'Below Average'
            ELSE 'Average' END AS avg_change,
       LAG(Total_customers) OVER (PARTITION BY product_name ORDER BY Order_year) AS pre_year_sales,
       Total_customers - LAG(Total_customers) OVER (PARTITION BY product_name ORDER BY Order_year) AS Prev_year_diff,
       CASE WHEN Total_customers - LAG(Total_customers) OVER (PARTITION BY product_name ORDER BY Order_year) > 0 THEN 'Increased'
            WHEN Total_customers - LAG(Total_customers) OVER (PARTITION BY product_name ORDER BY Order_year) < 0 THEN 'Decreased'
            ELSE 'No Change' END AS py_change
FROM Yearly_product_sales
ORDER BY product_name, Order_year;

/* ============================================================
   Yearly Product-wise Sales Amount Analysis
   - Calculates total sales amount per product per year
   - Compares with product’s average sales across years
   - Shows Above/Below Average status
   - Tracks Year-over-Year (YoY) sales growth/decline
   ============================================================ */

WITH Yearly_product_sales AS (
    SELECT YEAR(a.order_date) AS Order_year,
           b.product_name,
           SUM(a.quantity) AS Total_quantity
    FROM [gold].[fact_sales] a
    LEFT JOIN [gold].[dim_products] b ON a.product_key = b.product_key
    WHERE a.order_date IS NOT NULL
    GROUP BY YEAR(a.order_date), b.product_name
)
SELECT Order_year, product_name, Total_quantity,
       AVG(Total_quantity) OVER (PARTITION BY product_name) AS avg_quantity,
       Total_quantity - AVG(Total_quantity) OVER (PARTITION BY product_name) AS Difference_avg,
       CASE WHEN Total_quantity - AVG(Total_quantity) OVER (PARTITION BY product_name) > 0 THEN 'Above Average'
            WHEN Total_quantity - AVG(Total_quantity) OVER (PARTITION BY product_name) < 0 THEN 'Below Average'
            ELSE 'Average' END AS avg_change,
       LAG(Total_quantity) OVER (PARTITION BY product_name ORDER BY Order_year) AS pre_year_quantity,
       Total_quantity - LAG(Total_quantity) OVER (PARTITION BY product_name ORDER BY Order_year) AS Prev_year_diff,
       CASE WHEN Total_quantity - LAG(Total_quantity) OVER (PARTITION BY product_name ORDER BY Order_year) > 0 THEN 'Increased'
            WHEN Total_quantity - LAG(Total_quantity) OVER (PARTITION BY product_name ORDER BY Order_year) < 0 THEN 'Decreased'
            ELSE 'No Change' END AS py_change
FROM Yearly_product_sales
ORDER BY product_name, Order_year;

