-- ─────────────────────────────────────────
-- CREATE DATABASE & USE IT
-- ─────────────────────────────────────────
CREATE DATABASE IF NOT EXISTS Zepto_SQL_data_analysis;
USE Zepto_SQL_data_analysis;

-- ─────────────────────────────────────────
-- CREATE TABLE
-- ─────────────────────────────────────────
DROP TABLE IF EXISTS zepto;
CREATE TABLE zepto (
    sku_id                 INT AUTO_INCREMENT PRIMARY KEY,  -- SERIAL → INT AUTO_INCREMENT
    category               VARCHAR(120),
    name                   VARCHAR(150) NOT NULL,
    mrp                    DECIMAL(8,2),                    -- NUMERIC → DECIMAL
    discountPercent        DECIMAL(5,2),
    availableQuantity      INTEGER,
    discountedSellingPrice DECIMAL(8,2),
    weightInGms            INTEGER,
    outOfStock             VARCHAR(10),                     -- VARCHAR for CSV import (TRUE/FALSE)
    quantity               INTEGER
);

-- ─────────────────────────────────────────
-- AFTER IMPORTING CSV, FIX outOfStock COLUMN
-- ─────────────────────────────────────────
SET SQL_SAFE_UPDATES = 0;

ALTER TABLE zepto ADD COLUMN outOfStock_fixed TINYINT(1);

UPDATE zepto
SET outOfStock_fixed = CASE
    WHEN outOfStock = 'True'  THEN 1
    WHEN outOfStock = 'False' THEN 0
END;

ALTER TABLE zepto DROP COLUMN outOfStock;
ALTER TABLE zepto RENAME COLUMN outOfStock_fixed TO outOfStock;

SET SQL_SAFE_UPDATES = 1;

-- ─────────────────────────────────────────
-- DATA EXPLORATION
-- ─────────────────────────────────────────

-- Count of rows
SELECT COUNT(*) FROM zepto;

-- Sample data
SELECT * FROM zepto LIMIT 10;

-- Null values
SELECT * FROM zepto
WHERE name IS NULL
   OR category IS NULL
   OR mrp IS NULL
   OR discountPercent IS NULL
   OR discountedSellingPrice IS NULL
   OR weightInGms IS NULL
   OR availableQuantity IS NULL
   OR outOfStock IS NULL
   OR quantity IS NULL;

-- Different product categories
SELECT DISTINCT category FROM zepto ORDER BY category;

-- Products in stock vs out of stock
SELECT outOfStock, COUNT(sku_id)
FROM zepto
GROUP BY outOfStock;

-- Product names present multiple times
SELECT name, COUNT(sku_id) AS "Number of SKUs"
FROM zepto
GROUP BY name
HAVING COUNT(sku_id) > 1
ORDER BY COUNT(sku_id) DESC;

-- ─────────────────────────────────────────
-- DATA CLEANING
-- ─────────────────────────────────────────

-- Products with price = 0
SELECT * FROM zepto
WHERE mrp = 0 OR discountedSellingPrice = 0;

SET SQL_SAFE_UPDATES = 0;

DELETE FROM zepto WHERE mrp = 0;

-- Convert paise to rupees
UPDATE zepto
SET mrp = mrp / 100.0,
    discountedSellingPrice = discountedSellingPrice / 100.0;

SET SQL_SAFE_UPDATES = 1;

SELECT mrp, discountedSellingPrice FROM zepto;

-- ─────────────────────────────────────────
-- DATA ANALYSIS
-- ─────────────────────────────────────────

-- Q1. Top 10 best-value products by discount %
SELECT DISTINCT name, mrp, discountPercent
FROM zepto
ORDER BY discountPercent DESC
LIMIT 10;

-- Q2. High MRP products that are out of stock
SELECT DISTINCT name, mrp
FROM zepto
WHERE outOfStock = 1 AND mrp > 300
ORDER BY mrp DESC;

-- Q3. Estimated revenue per category
SELECT category,
       SUM(discountedSellingPrice * availableQuantity) AS total_revenue
FROM zepto
GROUP BY category
ORDER BY total_revenue;

-- Q4. Products where MRP > ₹500 and discount < 10%
SELECT DISTINCT name, mrp, discountPercent
FROM zepto
WHERE mrp > 500 AND discountPercent < 10
ORDER BY mrp DESC, discountPercent DESC;

-- Q5. Top 5 categories by highest average discount
SELECT category,
       ROUND(AVG(discountPercent), 2) AS avg_discount
FROM zepto
GROUP BY category
ORDER BY avg_discount DESC
LIMIT 5;

-- Q6. Price per gram for products above 100g
SELECT DISTINCT name, weightInGms, discountedSellingPrice,
       ROUND(discountedSellingPrice / weightInGms, 2) AS price_per_gram
FROM zepto
WHERE weightInGms >= 100
ORDER BY price_per_gram;

-- Q7. Weight category grouping
SELECT DISTINCT name, weightInGms,
       CASE
           WHEN weightInGms < 1000 THEN 'Low'
           WHEN weightInGms < 5000 THEN 'Medium'
           ELSE 'Bulk'
       END AS weight_category
FROM zepto;

-- Q8. Total inventory weight per category
SELECT category,
       SUM(weightInGms * availableQuantity) AS total_weight
FROM zepto
GROUP BY category
ORDER BY total_weight;