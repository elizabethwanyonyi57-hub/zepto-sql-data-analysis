CREATE database sql_project;
USE sql_project;

DROP TABLE IF EXISTS Zepto;
CREATE TABLE  zepto(
sku_id serial PRIMARY KEY,
category VARCHAR(120),
name VARCHAR (150) NOT NULL,
mrp NUMERIC (8,2),
discountpercent NUMERIC (5,2),
discountSellingPrice NUMERIC (8,2),
weightInGrams INTEGER,
availablequantity INTEGER,
outofstock INTEGER,
quantity INTEGER
);


-- data exploration
SELECT * FROM Zepto;
-- count of rows
SELECT COUNT(*) FROM Zepto;

-- sample data
SELECT * FROM ZEPTO
LIMIT 10;

--
SELECT * FROM Zepto
WHERE NAME IS NULL
or
category IS NULL
or
mrp IS NULL
or
discountpercent IS NULL
or
discountSellingPrice IS NULL
or
weightInGrams IS NULL
or
availablequantity IS NULL
or
outofstock IS NULL
or
quantity IS NULL;

--  different product categories
SELECT DISTINCT category
FROM Zepto
ORDER BY category;

-- products in stock vs out of stock
SELECT outofstock, COUNT(sku_id)
FROM Zepto
GROUP BY outofstock;

-- product names present multiple times
SELECT name,COUNT(sku_id) AS "Number of sku's"
FROM Zepto
GROUP BY name
HAVING COUNT(sku_id) >1
ORDER BY COUNT(sku_id) DESC;

-- data cleaning
-- products with price = 0
SELECT * FROM Zepto
WHERE mrp=0 OR discountSellingPrice =0;

DELETE FROM Zepto
WHERE mrp = 0
LIMIT 100000;

-- convert paise to rupees
UPDATE Zepto
SET mrp=mrp/100.0,
discountSellingPrice = discountSellingPrice/100.0;
SELECT
  mrp,
  mrp / 100.0 AS new_mrp,
  discountSellingPrice,
  discountSellingPrice / 100.0 AS new_discount_price
FROM Zepto
LIMIT 10;




UPDATE Zepto
SET mrp = mrp / 100.0,
    discountSellingPrice = discountSellingPrice / 100.0
WHERE mrp > 100
LIMIT 100000;

SELECT mrp,discountSellingPrice FROM Zepto;

-- data analysis
-- 1. Find the top 10 best value products based on discount percentage
SELECT DISTINCT name,mrp,discountPercent
FROM Zepto
ORDER  BY discountPercent DESC
LIMIT 10;

-- 2. What are the products with high mrp but out of stock
SELECT DISTINCT name,mrp
FROM Zepto
WHERE outofstock = 1 and mrp >300
ORDER BY mrp DESC;

-- 3.  Calculate estimated revenue for each category
SELECT category,
SUM(discountSellingPrice * availableQuantity) AS total_revenue
FROM zepto
GROUP BY category
ORDER BY total_revenue;

-- 4. Find all products where mrp is greater than 500 and discount is less than 10%
SELECT DISTINCT name, mrp, discountPercent
FROM zepto
WHERE mrp > 500 AND discountPercent < 10
ORDER BY mrp DESC, discountPercent DESC;

-- 5. Identify the top 5 categories offering the highest average discount percentage.
SELECT category,
ROUND(AVG(discountPercent),2) AS avg_discount
FROM zepto
GROUP BY category
ORDER BY avg_discount DESC
LIMIT 5;

-- 6. Find the price per gram for products above 100g and sort by best value.
SELECT DISTINCT name, weightInGrams, discountSellingPrice,
ROUND(discountSellingPrice/weightInGrams,2) AS price_per_gram
FROM zepto
WHERE weightInGrams >= 100
ORDER BY price_per_gram;

-- 7.Group the products into categories like Low, Medium, Bulk.
SELECT DISTINCT name, weightInGrams,
CASE WHEN weightInGrams < 1000 THEN 'Low'
	WHEN weightInGrams < 5000 THEN 'Medium'
	ELSE 'Bulk'
	END AS weight_category
FROM zepto;

-- 8.What is the Total Inventory Weight Per Category
SELECT category,
SUM(weightInGrams * availableQuantity) AS total_weight
FROM zepto
GROUP BY category
ORDER BY total_weight;






