select *  from amazon;

-- creating new column for converting varchar columns to num columns
ALTER TABLE amazon ADD actual_price_num NUMBER;
ALTER TABLE amazon ADD discounted_price_num NUMBER;

UPDATE amazon
SET actual_price_num = TO_NUMBER(REPLACE(REPLACE(actual_price, '₹', ''), ',', ''))
WHERE REGEXP_LIKE(actual_price, '^[0-9₹,\.]+$');

UPDATE amazon
SET discounted_price_num = TO_NUMBER(REPLACE(REPLACE(discounted_price, '₹', ''), ',', ''))
WHERE REGEXP_LIKE(discounted_price, '^[0-9₹,\.]+$');

SELECT actual_price, actual_price_num, discounted_price, discounted_price_num
FROM amazon
WHERE ROWNUM <= 10;
--
-- seperating first word using regex to get seperate brand name column for ease --
ALTER TABLE amazon ADD (brand VARCHAR2(100));
UPDATE amazon
SET brand = REGEXP_SUBSTR(product_name, '^[^ ]+');
SELECT product_name, brand
FROM amazon
WHERE ROWNUM <= 20;
--

-- Top 10 Product by Product Rating --
SELECT brand, rating, RATING_COUNT, actual_price_num
FROM amazon
WHERE RATING >= 4.5 
AND RATING_COUNT >= 5000
ORDER BY rating DESC, RATING_COUNT DESC
FETCH FIRST 10 ROWS ONLY;

-- Products with highest discount %
SELECT PRODUCT_NAME,
       actual_price_num,
       discounted_price_num,
       ROUND(((actual_price_num - discounted_price_num) * 100) / actual_price_num, 2) AS discount_pct
FROM amazon
WHERE actual_price_num > 0 
  AND discounted_price_num IS NOT NULL
ORDER BY discount_pct DESC
FETCH FIRST 10 ROWS ONLY;

-- Highest Price vs Lowest Price of product range
SELECT 
    MAX(actual_price_num) AS max_price,
    MIN(actual_price_num) AS min_price
FROM amazon
WHERE actual_price_num IS NOT NULL;

-- Top 10 Expensive product which has highest rating
SELECT product_name, actual_price_num, rating, 'High Price' AS flag
FROM amazon
WHERE actual_price_num > 2000
UNION
SELECT product_name, actual_price_num, rating, 'High Rating' AS flag
FROM amazon
WHERE rating >= 4.5
FETCH FIRST 10 ROWS ONLY;

-- Brand with highest rating and rating count on their products
SELECT brand, 
       SUM(rating_count) AS total_ratings, 
       ROUND(AVG(rating),2) AS avg_rating
FROM amazon
WHERE rating IS NOT NULL AND rating_count IS NOT NULL
GROUP BY brand
ORDER BY total_ratings DESC
FETCH FIRST 10 ROWS ONLY;

-- Category with most rating count, note rating count act as seudo sales column as dataset dont have sales column
SELECT CATEGORY, 
       SUM(rating_count) AS total_ratings, 
       ROUND(AVG(rating),2) AS avg_rating
FROM amazon
WHERE rating IS NOT NULL AND rating_count IS NOT NULL
GROUP BY CATEGORY
ORDER BY total_ratings DESC
FETCH FIRST 10 ROWS ONLY;

-- Most expensive vs cheapest products in Electronics,Headphones Category
SELECT 
    MAX(actual_price_num) AS max_price,
    MIN(actual_price_num) AS min_price
FROM amazon
WHERE actual_price_num IS NOT NULL
  AND CATEGORY LIKE '%Electronics|Headphones%';

-- Most Expensive vs Cheapest products in Top 1 Brand in Amazon according to rating and rating count
SELECT product_name, brand, actual_price_num, rating, rating_count
FROM amazon
WHERE brand = (
    SELECT brand
    FROM amazon
    WHERE rating IS NOT NULL 
      AND rating_count IS NOT NULL
    GROUP BY brand
    ORDER BY SUM(rating_count) DESC
    FETCH FIRST 1 ROW ONLY
)
AND actual_price_num IS NOT NULL
AND rating IS NOT NULL
AND rating_count IS NOT NULL
AND (actual_price_num = (
        SELECT MAX(actual_price_num) 
        FROM amazon 
        WHERE brand = (
            SELECT brand
            FROM amazon
            WHERE rating IS NOT NULL 
              AND rating_count IS NOT NULL
            GROUP BY brand
            ORDER BY SUM(rating_count) DESC
            FETCH FIRST 1 ROW ONLY
        )
    )
 OR actual_price_num = (
        SELECT MIN(actual_price_num) 
        FROM amazon 
        WHERE brand = (
            SELECT brand
            FROM amazon
            WHERE rating IS NOT NULL 
              AND rating_count IS NOT NULL
            GROUP BY brand
            ORDER BY SUM(rating_count) DESC
            FETCH FIRST 1 ROW ONLY
        )
    ))
ORDER BY actual_price_num DESC;

