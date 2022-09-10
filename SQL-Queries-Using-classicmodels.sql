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
SELECT * FROM payments
WHERE amount < 1000;

SELECT * from payments
WHERE paymentDate < now();

SELECT * from payments;
WHERE paymentDate > DATE_SUB(curdate(),INTERVAL );

SELECT * FROM payments
WHERE paymentDate = '2004-10-19';

insert  into offices(officeCode,city,phone,addressLine1,addressLine2,state,country,postalCode,territory) 
values 

('8','Phoenix','+1 602 319 4882','1005 Camelback Road','Suite 300','AZ','USA','85015','NA'),

('9','Orlando','+1 407 832 0825','1556 University Boulevard','Suite 102','FL','USA','32820','NA'),

('10','Sault Ste. Marie','+1 905 632 3000','523 East Ashmun Avenue','Suite 5A','MI','USA','49783','NA');
SELECT * FROM offices;

SELECT sum(amount) AS " Total Payments",
round(avg(amount, 0)) AS "Average Payment"
FROM payments; 

SELECT city, lastName, firstName, officeCode FROM employees
JOIN offices USING (officeCode) 
WHERE officeCode IN (2,4, 5)
ORDER BY officeCode;

SELECT * FROM orders
ORDER BY shippedDate DESC;

SELECT 
COUNT (*) as TOTALCustomers,
SUM(CASE WHEN orderNumber > 1 THEN 1 ELSE 0 END) AS RepeatCustomers,
SUM(CASE WHEN orderNumber > 1 THEN 1 ELSE 0 END)
/COUNT(*) AS %RepeatCustomers
FROM customers
JOIN orders USING (customerNumber)
JOIN orderdetails USING (orderNumber);
SELECT COUNT (productName) FROM products;

SELECT productName
FROM products
GROUP BY productName
ORDER BY count(*) DESC;



SELECT 
    productVendor, 
    COUNT(*)
FROM
    products
GROUP BY productVendor
ORDER BY COUNT(*) DESC;
/*
This should return 4 - three Ducati and one Triumph */

SELECT productName from products 
WHERE productName IN ('%Triumph%', '%Ducati%');
# adding a column

ALTER TABLE products
ADD COLUMN weight INT;
SELECT * FROM products
LIMIT 5;
# show column names 
SHOW columns from products;
#drop column
use classicmodels;

ALTER TABLE products
DROP COLUMN weight;
select * from products;
# insert into
INSERT INTO products (productCode, productName, productLine, productScale, ProductVendor, productDescription, quantityInStock, buyPrice, MSRP)
VALUES (13, "2007 BMW 335i", 'Classic Cars','1:10', 'Second Gear Diecast', 'Official BMW insignia, Pirelli tires, dual exhaust, white with red and blue trim on the hood, leather interior, functioning steering column', 8932, 24.71, 80.00);

--  updating new table from existing, create new table with alias then insert.
CREATE TABLE offices_2014 AS (
SELECT * FROM offices
WHERE state = 'CA');


INSERT INTO offices_2014 (officeCode, city, phone, addressLine1, addressLine2, state, country, postalCode, territory)
SELECT * FROM offices
WHERE state='CA';
select * from offices_2014;


/* Data Analysis - Lesson 3 JOIN, CASE WHEN, COALESCE, NULLIF, LEAST/GREATEST */
use sakila;
SELECT * FROM actor AS a
INNER JOIN film_actor AS fa
USING (actor_id)
WHERE actor_id = 5
ORDER BY 1
LIMIT 10;

CREATE VIEW payment_overview AS
SELECT payment_date,
(SELECT SUM(amount) FROM payment p) AS SUM_X
FROM payment;
SELECT * FROM payment_overview;

-- finding those customers who don't have emails

SELECT * FROM customer 
JOIN payment USING  (customer_id)
WHERE email IS NOT NULL
ORDER BY customer_id;

SELECT * FROM customer 
JOIN address USING (address_id)
WHERE address IS NULL
ORDER BY customer_id;

SELECT staff_id, first_name, last_name, location FROM staff
JOIN address USING (address_id)
WHERE location IS NOT NULL;

SELECT * FROM film
JOIN (
SELECT * FROM film_category WHERE film_id = 1) DD -- every derived table must have an alias
ON sakila.film_id = sakila.film_id; -- error on foreign key
/* these joins are all horizontal - now we move on to vertical joins. using two separate queries for
two separate tables, you can assemble two queries together into one using UNION. */

(SELECT first_name, email FROM customer)
UNION
(SELECT first_name, email FROM staff)
ORDER BY 1;

/* There are some caveats to using UNION. First, UNION requires the subqueries have 
the same name columns and data types for each column. 
Second, UNION may not technically return all rows. */

SELECT postal_code FROM address
WHERE postal_code IS NOT NULL;

/*  Say The Shores Resort & Casino's Marketing Dept is planning to send out free play coupons 
to customers known as "Neighbor Faves" who live within a 30-minute drive on weekdays 
in order to boost traffic on the gaming floor. They plan to offer weekend hotel discounts to 
those who live more than an hour away as "Travel VIPs". All others will be 
"Standard Customers" */

SELECT *,
CASE WHEN postal_code='35200' THEN 'Neighbor Faves'
WHEN postal_code = '42399' THEN 'Travel VIPs'
ELSE 'Standard Cutomer' END
AS customer_type
FROM address;
/* The following will create a query that will map various values in a column to other 
values. The head of sales has an idea to try and create specialized regional sales teams that 
can sell to customers in specific regions.*/
SELECT country_id, country, 
CASE WHEN country in ('Afghanistan', 'Algeria', 'Bahrain', 'Azerbaijan', 
'Iran', 'Iraq', 'Israel') THEN 'MiddleEast'
WHEN country in ('Germany', 'France', 'Italy', 'Greece', 'Netherland', 
'Romania', 'Poland') THEN 'Western Europe'
WHEN country in ('Peru', 'Brazil', 'Colombia') THEN 'South America' -- keep going with when statements
ELSE 'Other' END as region
FROM sakila.country;

/* COALESCE can be sued to replace NULL values with a standard value. 
COALESCE allows you to list any number of columns and values, and if the first value 
in the list is NULL, it will try to fit it in with the second value. 
COALESCE will keep continuing down the list of values until it hits a non-NULL value. 
If all values in the COALESCE function are NULL then the function returns NULL.
 Let's say a marketing team would like a list of first and last names and phone 
 numbers of all customers. However, for customers with no phone, they'd like the 
 table to write the value 'NO PHONE.'   */
 
 SELECT first_name, last_name, address, location, COALESCE (location, 'NO LOCATION') as location
 FROM customer
 JOIN address USING (address_id);

/* LEAST/GREATEST takes any number of values and returns the least or greatest of the values. */
SELECT product_id, model, year, product_type, LEAST (600.00, msrp) as msrp,
FROM product
WHERE product_type = 'Classic Car';

SELECT DISTINCT name as language FROM language;
-- where is the error in DISTINCT ON

SELECT DISTINCT ON(first_name) * FROM staff ORDER BY store_id;


-- Lesson 4 Aggregate Functions

SELECT count(staff_id) FROM staff;
SELECT count(actor_id) FROM actor;

-- why is there an error in this one 
SELECT COUNT (DISTINCT store_id) FROM staff;
use classicmodels;
SELECT COUNT(productName) FROM products;
SELECT COUNT(*) FROM customers WHERE state = 'CA';

SELECT COUNT(*)/2 FROM customers;
-- postgre sql only?

SELECT SUM(MSRP):: FLOAT/COUNT(*) AS avg_msrp FROM products;
SELECT AVG(MSRP) AS avg_msrp FROM products;

SELECT MIN(MSRP), MAX(MSRP), AVG(MSRP) FROM products;

SELECT state, COUNT(*) FROM customers GROUP BY state ORDER BY state;
-- but if you'd rather order by the counts themselves, largest to smallest (remember it defaults to ascending):

SELECT state, COUNT(*) FROM customers GROUP BY state ORDER BY COUNT(*) DESC;

-- or maybe count a subset of the data, such as total number of male customers. or productLine 
SELECT * FROM products;
SELECT productName, MSRP COUNT(*) FROM products WHERE productLine = 'Motorcycles' GROUP BY productName ORDER BY productName;

use sakila;
SELECT count(address_id), district FROM sakila.address
GROUP BY district
ORDER BY count(address_id) DESC;
SELECT sakila.customer.customer_id,sakila.customer.first_name, sakila.customer.last_name, COUNT(rental_id) FROM sakila.rental
INNER JOIN sakila.customer USING (customer_id)
GROUP BY sakila.customer.customer_id;

SELECT customer_id, sum(amount) AS TotalRentalAmount FROM sakila.payment
GROUP BY customer_id;

SELECT customer_id, sum(amount) AS Total, count(rental_id) AS NoOfRentals FROM sakila.payment
GROUP BY customer_id
HAVING count(rental_id) > 40;

/* Above, we include a new keyword HAVING. This word was included in SQL because the 
WHERE statement does not work when using an aggregate function (i.e., sum, count, max,
 min, etc.). HAVING works the same way as WHERE because it defines a condition. 
 The only difference is the condition is an aggregate function.

The query being run above shows the customer_id of each customer who has rented over
 40 rentals and the total amount they have spent on rentals.*/

