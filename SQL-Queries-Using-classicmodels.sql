use classicmodels;
SELECT customerName, phone, state from customers
WHERE state IN ("CA", "AZ", "OR", "NV")
ORDER BY state, contactLastName;

select country from customers
WHERE country NOT IN ("USA");
select * from products;

select productCode, SUM(buyPrice * quantityInStock) AS InventoryValue
FROM products
group by productCode
HAVING SUM(buyPrice * quantityInStock) > 100000
ORDER BY InventoryValue DESC;

SELECT productCode, productName, SUM(quantityOrdered * MSRP) as Revenue
FROM products
JOIN orderdetails USING (productCode)
GROUP BY productCode
HAVING SUM(quantityOrdered * MSRP) > 10000
ORDER BY Revenue DESC;

SELECT productName from products
WHERE productName IN ('%Triumph%', '%Ducati%');

SELECT productName FROM products
WHERE productName LIKE '%Triumph%' OR productName LIKE '%Ducati%';

