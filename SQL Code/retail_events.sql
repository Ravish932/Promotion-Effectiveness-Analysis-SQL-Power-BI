CREATE DATABASE retail_events_db
USE retail_events_db

/* Q1) Provide a list of products with a base price greater than 500 and 
 that are featured in promo type of ‘BOGOF’ (Buy One Get One Free) */
 

SELECT DISTINCT p.product_name AS Product_Name,
e.base_price AS Base_Price,
promo_type AS Promotype 
FROM dim_products p 
JOIN fact_events e 
ON p.product_code = e.product_code
WHERE base_price > 500 AND promo_type = 'BOGOF'



/* Q2) Generate a report listing cities and their respective store counts, 
stored by descending order of store presence, to optimize retail operation. */


SELECT city, 
count(store_id) AS Store_Count
FROM dim_stores
GROUP BY city
ORDER BY Store_Count DESC



/* Q3) Generate a report that displays each campaign’s total revenue before and
after promotion, helping assess the financial impact of promotional campaigns. */



SELECT 
    c.campaign_name,

    CONCAT(
        CAST(ROUND(SUM(e.base_price * e.quantity_sold_before_promo) / 1000000.0, 2) AS DECIMAL(10,2)),
        'M'
    ) AS Total_Revenue_Before_Promotion,

    CONCAT(
        CAST(
            ROUND(
                SUM(
                    CASE
                        WHEN e.promo_type = 'BOGOF' 
                            THEN (e.base_price * 0.5) * (e.quantity_sold_after_promo * 2)
                        WHEN e.promo_type = '50% OFF' 
                            THEN (e.base_price * 0.5) * e.quantity_sold_after_promo
                        WHEN e.promo_type = '25% OFF' 
                            THEN (e.base_price * 0.75) * e.quantity_sold_after_promo
                        WHEN e.promo_type = '33% OFF' 
                            THEN (e.base_price * 0.67) * e.quantity_sold_after_promo
                        WHEN e.promo_type = '500 Cashback' 
                            THEN (e.base_price - 500) * e.quantity_sold_after_promo
                    END
                ) / 1000000.0, 
            2
            ) AS DECIMAL(10,2)
        ),
        'M'
    ) AS Total_Revenue_After_Promo

FROM fact_events e
JOIN dim_campaigns c
    ON e.campaign_id = c.campaign_id
GROUP BY c.campaign_name;




/* Q4) Generate a report calculating ISU% for each category during the Diwali Campaign, along with rankings.
This will help assess category-wise success and impact of the campaigns on Incremental Sales. */


WITH Diwali_Campaign_Sale AS (
    SELECT 
        p.category,
        ROUND(
            SUM(
                (CASE 
                    WHEN promo_type = 'BOGOF' THEN quantity_sold_after_promo * 2
                    ELSE quantity_sold_after_promo
                 END
                - quantity_sold_before_promo
                ) * 100
            ) 
            / SUM(quantity_sold_before_promo), 
        2) AS ISU_Percentage
    FROM fact_events e
    JOIN dim_products p
        ON e.product_code = p.product_code 
    JOIN dim_campaigns c
        ON e.campaign_id = c.campaign_id 
    WHERE c.campaign_name = 'Diwali'
    GROUP BY p.category
)

SELECT 
    category,
    ISU_Percentage AS [ISU%],
    ROW_NUMBER() OVER (ORDER BY ISU_Percentage DESC) AS rank_order
FROM Diwali_Campaign_Sale;



/* Q5) Generate a report listing the Top 5 products by IR% across all campaigns,providing
product name, category, and IR%. This assists in identifying successful products for optimization */ 
 
SELECT 
    TOP 5 p.product_name,
    p.category,
    ROUND(
        (
            SUM(
                CASE
                    WHEN e.promo_type = 'BOGOF' THEN e.base_price * 0.5 * (e.quantity_sold_after_promo * 2)
                    WHEN e.promo_type = '500 Cashback' THEN (e.base_price - 500) * e.quantity_sold_after_promo
                    WHEN e.promo_type = '50% OFF' THEN e.base_price * 0.5 * e.quantity_sold_after_promo
                    WHEN e.promo_type = '33% OFF' THEN e.base_price * 0.67 * e.quantity_sold_after_promo
                    WHEN e.promo_type = '25% OFF' THEN e.base_price * 0.75 * e.quantity_sold_after_promo
                    ELSE 0
                END
            ) 
            - SUM(e.base_price * e.quantity_sold_before_promo)
        ) 
        / SUM(e.base_price * e.quantity_sold_before_promo) * 100
    , 2) AS IR_Percentage
FROM fact_events e
JOIN dim_products p 
    ON e.product_code = p.product_code
GROUP BY 
    p.product_name, 
    p.category
ORDER BY 
    IR_Percentage DESC;



