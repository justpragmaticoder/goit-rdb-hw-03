--- 1 TASK START ---

SELECT * FROM products;

SELECT name, phone FROM shippers;

--- 1 TASK END ---

--- 2 TASK START ---

SELECT
    ROUND(AVG(price), 2) AS average_price,
    MAX(price) AS maximum_price,
    MIN(price) AS minimum_price
FROM products;

--- 2 TASK END ---

--- 3 TASK START ---

SELECT DISTINCT category_id, price
    FROM products
    ORDER BY price DESC LIMIT 10;

--- 3 TASK END ---

--- 4 TASK START ---

SELECT COUNT(*) AS product_count
    FROM products
    WHERE price BETWEEN 20 AND 100;

--- 4 TASK END ---

--- 5 TASK START ---

SELECT
    supplier_id,
    COUNT(*) AS product_count,
    ROUND(AVG(price), 2) AS average_price
FROM products
GROUP BY supplier_id;

--- 5 TASK END ---