
-- ============================================================
-- Product Cost Segmentation
-- ============================================================

WITH Product_Segments AS (
    SELECT
        product_key,
        product_name,
        cost,
        CASE 
            WHEN cost < 100 THEN 'Below 100'
            WHEN cost BETWEEN 100 AND 500 THEN '100-500'
            WHEN cost BETWEEN 500 AND 1000 THEN '500-1000'
            ELSE 'Above 1000'
        END AS Cost_range
    FROM [gold].[dim_products]
)
SELECT
    Cost_Range,
    COUNT(product_key) AS Total_Products
FROM Product_Segments
GROUP BY Cost_range
ORDER BY Total_Products DESC;



-- ============================================================
-- Customer Segmentation: VIP, Regular, New
-- Criteria: Based on Total Spending & Lifespan in Months
-- ============================================================

WITH Customer_Spending AS (
    SELECT
        a.customer_key,
        SUM(b.sales_amount) AS Total_Spending,
        MIN(order_date) AS First_Order,
        MAX(order_date) AS Last_Order,
        DATEDIFF(month, MIN(order_date), MAX(order_date)) AS Lifespan_Months
    FROM [gold].[dim_customers] a
    LEFT JOIN [gold].[fact_sales] b
        ON a.customer_key = b.customer_key
    GROUP BY a.customer_key
)

SELECT
    Customer_Segment,
    COUNT(customer_key) AS Total_Customers
FROM (
    SELECT
        customer_key,
        Total_Spending,
        Lifespan_Months,
        CASE 
            WHEN Lifespan_Months > 12 AND Total_Spending > 5000 THEN 'VIP'
            WHEN Lifespan_Months > 12 AND Total_Spending <= 5000 THEN 'Regular'
            ELSE 'New'
        END AS Customer_Segment
    FROM Customer_Spending
) t
GROUP BY Customer_Segment
ORDER BY Total_Customers DESC;