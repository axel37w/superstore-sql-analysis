-- 1. Sales by region
SELECT Region, SUM(Sales) FROM train
GROUP BY Region
ORDER BY SUM(Sales) DESC;


-- 2. Top 10 customers by total purchases
SELECT `Customer Name`, SUM(Sales) FROM train
GROUP BY `Customer Name`
ORDER BY SUM(Sales) DESC
LIMIT 10;


-- 3. Most popular product categories
SELECT Category, Count(*) FROM train
GROUP BY Category
ORDER BY Count(*) DESC;


-- 4. States with average order value above 300
SELECT State, AVG(Sales) FROM train
GROUP BY State
HAVING AVG(Sales)>300
ORDER BY AVG(Sales) DESC;


-- 5. Customers spending above average
SELECT `Customer Name`, SUM(Sales) FROM train
GROUP BY `Customer Name`
HAVING SUM(Sales) > (SELECT AVG(customer_total) FROM (SELECT SUM(Sales) AS customer_total FROM train GROUP BY `Customer Name`) AS customer_totals)
ORDER BY SUM(Sales) DESC;